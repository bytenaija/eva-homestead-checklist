# EVA Homestead Checklist v0.1

Mobile-friendly Cloudflare Workers + D1 checklist for Deployment Alpha and Bravo.

## Features
- Persistent online checklist
- Not located → Located → Bundled → Loaded → Delivered
- Critical/Should take/Bravo priorities
- Search and subsystem/status/priority filters
- Progress dashboard and critical-item warning
- Add new items
- Seeded Alpha and Bravo asset lists

## Run locally
```bash
npm install
npm run db:migrate:local
npm run dev
```

## Deploy
```bash
npx wrangler login
npm run db:create
```
Copy the returned D1 database ID into `wrangler.jsonc`, then:
```bash
npm run db:migrate:remote
npm run deploy
```

In Cloudflare Workers & Pages, attach `checklist.evaincanada.com` under Domains & Routes. Protect it using Cloudflare Zero Trust Access.

## Push to GitHub
```bash
git clone https://github.com/bytenaija/eva-homestead-checklist.git
cd eva-homestead-checklist
# copy the extracted files into this directory
git add .
git commit -m "Build EVA Homestead Checklist v0.1"
git push origin main
```
