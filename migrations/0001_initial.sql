PRAGMA foreign_keys = ON;
CREATE TABLE deployments (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,slug TEXT NOT NULL UNIQUE);
CREATE TABLE subsystems (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,slug TEXT NOT NULL UNIQUE,emoji TEXT NOT NULL,sort_order INTEGER NOT NULL);
CREATE TABLE items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  deployment_id INTEGER NOT NULL REFERENCES deployments(id),
  subsystem_id INTEGER NOT NULL REFERENCES subsystems(id),
  name TEXT NOT NULL,
  quantity REAL NOT NULL DEFAULT 1,
  unit TEXT NOT NULL DEFAULT 'item',
  priority TEXT NOT NULL DEFAULT 'should_take',
  status TEXT NOT NULL DEFAULT 'not_located',
  notes TEXT NOT NULL DEFAULT '',
  sort_order INTEGER NOT NULL DEFAULT 0,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO deployments(name,slug) VALUES ('Deployment Alpha','alpha'),('Deployment Bravo','bravo');
INSERT INTO subsystems(name,slug,emoji,sort_order) VALUES
('Shelter & Family Camp','shelter','⛺',10),('Water','water','💧',20),('Power','power','🔋',30),('Security & Communications','security','🛡️',40),('Sanitation','sanitation','🚻',50),('Construction','construction','🔨',60),('Forestry & Lumber','forestry','🌲',70),('Food & Kitchen','food','🍲',80),('Operations & Content','operations','🎥',90),('Vehicles & Mobility','vehicles','🚚',100),('Health & Safety','safety','🩹',110);

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'16 ft VEVOR bell tent',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Bell-tent footprint / groundsheet',1,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Bell-tent stakes, guy lines and mallet',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Kitchen tent',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Outhouse tent',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Air mattresses',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'4-inch memory-foam topper',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Family bedding, pillows and blankets',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Portable air conditioner',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Fans',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Camp chairs',1,'should_take',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Folding tables',1,'should_take',120 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Diesel heater and safe exhaust components',1,'critical',130 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='shelter';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Initial potable drinking water',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'1,000 L VEVOR water bladders',4,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'10 ft gutters',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Gutter hangers, end caps and adapters',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Downspout and fittings',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Leaf Eater rain head',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Hoses, fittings and hose clamps',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'VEVOR gravity water filter',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'ZeroWater 23-cup filter',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Water disinfection supplies',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Buckets and water containers',1,'critical',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Shower bag',1,'critical',120 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='water';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'235 W solar panels',10,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'100 W solar panels',8,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'51.2 V battery bank (800 Ah total)',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'10 kW all-in-one inverter/charger',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Bluetti Elite 200 V2',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Bluetti AC70',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Solar cable and MC4 connectors',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Battery cables, lugs and busbars',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'DC breakers, fuses and disconnects',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'AC distribution and GFCI protection',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Extension cords and power strips',1,'critical',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Electrical tools and multimeter',1,'critical',120 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Starlink kit',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Router, switches and access points',1,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Network cables and PoE adapters',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Security cameras and mounts',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'164 ft Starline electric fence',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'VEVOR 2/3/5 J fence energizer',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Dedicated 12 V lithium battery',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Victron 12 V battery charger',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'10 ft grounding rods',3,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Ground clamps and cable',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Electric-fence tester',1,'critical',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Locks, hasps and security cable',1,'critical',120 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Headlamps and flashlights',1,'critical',130 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Sun-Mar composting toilet',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='sanitation';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Composting medium and toilet supplies',1,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='sanitation';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Toilet paper and sealed storage',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='sanitation';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Handwashing station',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='sanitation';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Soap, sanitizer and cleaning supplies',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='sanitation';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Animal-resistant waste storage',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='sanitation';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Towels and hygiene supplies',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='sanitation';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Baker scaffold with safety cage',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Scaffold outriggers',1,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Extension ladder',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Framing nailer',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'3-1/8 inch framing nails',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'2-1/8 inch nails',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Structural screws',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Deck screws',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Circular saw',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Reciprocating saw',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Jobsite table saw',1,'should_take',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Drills and impact drivers',1,'critical',120 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Cordless tool chargers',1,'critical',130 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Hand and layout tools',1,'critical',140 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'10 × 10 shed tarp roof',1,'critical',150 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Shed door hardware, hasp and lock',1,'critical',160 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Primary chainsaw',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Backup chainsaw',1,'should_take',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Primary brush cutter',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Backup brush cutter',1,'should_take',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'SuperHandy electric capstan winch',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'10,000 lb ratchet straps',6,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Timber jack',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Logging chains and shackles',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Chainsaw sharpening tools',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Spare chains and maintenance parts',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Fuel cans',1,'critical',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Bar and chain oil',1,'critical',120 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Two-cycle oil',1,'critical',130 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Sawmill pickup plan',1,'critical',140 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'12 V portable refrigerator',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Camp cooking stove and fuel',1,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Cookware and utensils',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Animal-resistant food-storage bins',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Three-month staple-food stockpile',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'High-protein shelf-stable foods',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Nigerian Indomie',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Rice, oil, spices and seasonings',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Family travel food and arrival-day meals',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Fishing gear',1,'should_take',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='food';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Laptop and charger',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Desktop computer and peripherals',1,'should_take',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'External drives and backup storage',1,'should_take',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Sony ZV-E10 II camera kit',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Primary drone kit',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Camera and drone batteries',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'SD cards and card readers',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Device chargers',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Tripod and audio equipment',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Xbox, TV and controllers',1,'should_take',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Packing labels, markers and coloured tape',1,'critical',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Printed emergency contacts',1,'critical',120 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='operations';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Trailer readiness inspection',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Truck payload-door sticker recorded',1,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Trailer spare tire and jack',1,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Wheel chocks',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Trailer electrical adapter and spare fuses',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Quad',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Quad keys and maintenance kit',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Jasion e-bike and charger',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Vehicle documents and insurance',1,'critical',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Load weighed or verified before departure',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='vehicles';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Prescription medications and Ozempic supplies',1,'critical',10 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'First-aid kit',1,'critical',20 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Fire extinguishers',2,'critical',30 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Smoke and carbon-monoxide alarms',1,'critical',40 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Chainsaw chaps',1,'critical',50 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Forestry helmet and hearing protection',1,'critical',60 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Work gloves and safety glasses',1,'critical',70 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Bear-safe food protocol',1,'critical',80 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Emergency weather radio / backup phone',1,'should_take',90 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Sunscreen, insect repellent and tick tools',1,'critical',100 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Emergency evacuation plan',1,'critical',110 FROM deployments d,subsystems s WHERE d.slug='alpha' AND s.slug='safety';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Remaining 235 W solar panels',11,'bravo',10 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'12 kW all-in-one inverter/charger',1,'bravo',20 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='power';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Second Baker scaffold',1,'bravo',30 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'10 × 44 greenhouse',1,'bravo',40 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Planer',1,'bravo',50 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Jointer',1,'bravo',60 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='construction';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Remaining chainsaws',3,'bravo',70 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Remaining brush cutters',1,'bravo',80 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'5,000+ ft polywire and insulators',1,'bravo',90 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='security';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'Sap evaporator pan',1,'bravo',100 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='forestry';

INSERT INTO items(deployment_id,subsystem_id,name,quantity,priority,sort_order) SELECT d.id,s.id,'70 lb vise',1,'bravo',110 FROM deployments d,subsystems s WHERE d.slug='bravo' AND s.slug='construction';
