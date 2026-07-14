interface Env { DB: D1Database; ASSETS: Fetcher }

type Status = "not_located" | "located" | "bundled" | "loaded" | "delivered";
const statuses = new Set<Status>(["not_located","located","bundled","loaded","delivered"]);

const json = (data: unknown, init: ResponseInit = {}) => {
  const headers = new Headers(init.headers);
  headers.set("content-type", "application/json; charset=utf-8");
  headers.set("cache-control", "no-store");
  return new Response(JSON.stringify(data), { ...init, headers });
};
const fail = (message: string, status = 400) => json({ error: message }, { status });

async function listItems(request: Request, env: Env) {
  const url = new URL(request.url);
  const deployment = url.searchParams.get("deployment") || "alpha";
  const clauses = ["d.slug = ?"];
  const params: unknown[] = [deployment];
  for (const [key, column] of [["subsystem","s.slug"],["priority","i.priority"],["status","i.status"]] as const) {
    const value = url.searchParams.get(key);
    if (value) { clauses.push(`${column} = ?`); params.push(value); }
  }
  const search = url.searchParams.get("search")?.trim();
  if (search) {
    const q = `%${search}%`;
    clauses.push("(i.name LIKE ? OR i.notes LIKE ? OR s.name LIKE ?)");
    params.push(q, q, q);
  }
  const result = await env.DB.prepare(`
    SELECT i.*, s.name subsystem_name, s.slug subsystem_slug, s.emoji subsystem_emoji, d.slug deployment
    FROM items i JOIN subsystems s ON s.id=i.subsystem_id JOIN deployments d ON d.id=i.deployment_id
    WHERE ${clauses.join(" AND ")} ORDER BY s.sort_order, i.sort_order, i.name
  `).bind(...params).all();
  return json({ items: result.results });
}

async function getSummary(request: Request, env: Env) {
  const deployment = new URL(request.url).searchParams.get("deployment") || "alpha";
  const totals = await env.DB.prepare(`
    SELECT COUNT(*) total,
      SUM(status='delivered') delivered,
      SUM(status='loaded') loaded,
      SUM(status IN ('bundled','loaded','delivered')) bundled_or_better,
      SUM(priority='critical') critical_total,
      SUM(priority='critical' AND status='delivered') critical_delivered,
      SUM(priority='critical' AND status IN ('not_located','located')) critical_unbundled
    FROM items i JOIN deployments d ON d.id=i.deployment_id WHERE d.slug=?
  `).bind(deployment).first();
  return json({ totals });
}

async function createItem(request: Request, env: Env) {
  const body = await request.json<Record<string, unknown>>();
  const name = String(body.name || "").trim();
  const subsystem = String(body.subsystem || "");
  const deployment = String(body.deployment || "alpha");
  const priority = String(body.priority || "should_take");
  const quantity = Number(body.quantity || 1);
  const unit = String(body.unit || "item").trim();
  const notes = String(body.notes || "").trim();
  if (!name || !subsystem) return fail("Name and subsystem are required.");
  const rel = await env.DB.prepare(`SELECT s.id subsystem_id,d.id deployment_id FROM subsystems s,deployments d WHERE s.slug=? AND d.slug=?`).bind(subsystem,deployment).first<{subsystem_id:number;deployment_id:number}>();
  if (!rel) return fail("Unknown subsystem or deployment.");
  const item = await env.DB.prepare(`INSERT INTO items (deployment_id,subsystem_id,name,quantity,unit,priority,notes,sort_order) VALUES (?,?,?,?,?,?,?,999) RETURNING *`).bind(rel.deployment_id,rel.subsystem_id,name,quantity,unit,priority,notes).first();
  return json({ item }, { status: 201 });
}

async function updateItem(request: Request, env: Env, id: number) {
  const body = await request.json<Record<string, unknown>>();
  const status = String(body.status || "") as Status;
  if (!statuses.has(status)) return fail("Invalid status.");
  const item = await env.DB.prepare(`UPDATE items SET status=?,updated_at=CURRENT_TIMESTAMP WHERE id=? RETURNING *`).bind(status,id).first();
  return item ? json({ item }) : fail("Item not found.",404);
}

export default {
  async fetch(request: Request, env: Env) {
    const url = new URL(request.url);
    try {
      if (url.pathname === "/api/items" && request.method === "GET") return listItems(request,env);
      if (url.pathname === "/api/items" && request.method === "POST") return createItem(request,env);
      if (url.pathname === "/api/summary" && request.method === "GET") return getSummary(request,env);
      const match = url.pathname.match(/^\/api\/items\/(\d+)$/);
      if (match && request.method === "PATCH") return updateItem(request,env,Number(match[1]));
      if (url.pathname.startsWith("/api/")) return fail("Not found.",404);
      return env.ASSETS.fetch(request);
    } catch (error) {
      console.error(error);
      return fail("Unexpected server error.",500);
    }
  }
} satisfies ExportedHandler<Env>;
