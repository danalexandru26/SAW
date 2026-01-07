use SQL_Tutorials;

IF OBJECT_ID('dbo.shipyard', 'U') is not null DROP TABLE shipyard;

CREATE TABLE shipyard (
	shipName varchar(30) not null primary key,
	shipType varchar(30) not null default 'civilian',
	shipClass varchar(30) not null,
	hullStrength int,
	shieldStrength int not null,
	cargoCapacity float,
	fuelCapacity float,
	serviceCrew int not null,
	marines int default 0,
	weaponryOutput float,
	hardpoints int,
	travelSpeed float not null,
	thrust float not null,
	hyperspeed float not null check (hyperspeed <= 100)
);

--Query is not conditional to any constraint

SELECT * FROM shipyard;

--Query selects a specific column

SELECT shipName FROM shipyard;

--Query selects a composition of multiple columns

SELECT shipName, shipType, shipClass FROM shipyard;

--Query is conditional to service crew count

SELECT * FROM shipyard WHERE serviceCrew >= 150;

--Query is conditional to total crew count

SELECT * FROM shipyard WHERE (serviceCrew + marines) >= 200;

--Query is conditinal to ship category

--military ships

SELECT * FROM shipyard WHERE shipType = 'military';

--civilian ships

SELECT * FROM shipyard WHERE shipType = 'civilian';

--select distinct ship classes

SELECT DISTINCT shipClass FROM shipyard;