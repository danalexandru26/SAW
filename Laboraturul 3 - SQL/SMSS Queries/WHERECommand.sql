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

--where can be restrained by certain conditions that are unlike classical operators: between, like, in

SELECT * FROM shipyard WHERE shipName in ('ISS Titan', 'ISS Voyager');

SELECT * FROM shipyard WHERE marines BETWEEN 10 AND 30; 

--Query to select a ship whose name ends in the 'an' suffix

SELECT * FROM shipyard WHERE shipName LIKE '%an';

--Query to select a ship whose name starts with the 'ne' prefix;

SELECT * FROM shipyard	WHERE shipname LIKE 'ISS Ne%';

--A combination of column selecting queries and compound where statements

SELECT shipName, shipType, shipClass, fuelCapacity FROM shipyard WHERE serviceCrew + marines BETWEEN 100 and 250;
