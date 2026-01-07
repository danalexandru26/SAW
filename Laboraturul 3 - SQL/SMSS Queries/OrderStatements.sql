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

--Order by statements (increasing ordering criterion is the default)

--Strong increasing ordering

SELECT * FROM shipyard ORDER BY serviceCrew;

--Strong decreasing ordering

SELECT * FROM shipyard ORDER BY marines DESC;

--Strong specified increasing ordering

SELECT * FROM shipyard order by fuelCapacity ASC;