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

ALTER TABLE shipyard ADD CONSTRAINT crew_count CHECK (marines + serviceCrew < 5000);

--Table populating queries

INSERT INTO shipyard VALUES('ISS Amon', 'military', 'destroyer', 5000, 2500, 8000, 150000, 150, 45, 1456.2, 10, 500, 90000, 10);

INSERT INTO shipyard VALUES('ISS Nebula', 'military', 'frigate', 5000, 2500, 8000, 150000, 150, 45, 1456.2, 10, 500, 90000, 10);

INSERT INTO shipyard 
VALUES('ISS Voyager', 'civilian', 'explorer', 3000, 1200, 4000, 80000, 50, 20, 300.5, 4, 120, 60000, 5);

INSERT INTO shipyard 
VALUES('ISS Titan', 'military', 'battleship', 8000, 4000, 12000, 250000, 300, 200, 2500.0, 20, 600, 120000, 15);

INSERT INTO shipyard 
VALUES('ISS Horizon', 'civilian', 'cargo', 2000, 1000, 15000, 50000, 25, 0, 50.0, 2, 80, 20000, 2);

INSERT INTO shipyard 
VALUES('ISS Horizon 2', 'civilian', 'cargo', 1000, 1000, 15000, 50000, 25, 0, 50.0, 2, 80, 20000, 2);

INSERT INTO shipyard 
VALUES('ISS Valiant', 'military', 'cruiser', 6000, 3000, 10000, 180000, 200, 100, 1800.0, 12, 400, 100000, 12);

INSERT INTO shipyard 
VALUES('ISS Serenity', 'civilian', 'passenger', 2500, 1200, 5000, 90000, 80, 0, 75.0, 3, 100, 50000, 3);

--Aggregate functions are used to return a single value computed from a view of our table. This view can contain all entries or certain restrained subsets.

--MIN and MAX


SELECT MIN(hullStrength) AS minimum_hull_rating FROM shipyard;

SELECT MIN(hullStrength) AS minimum_hull_rating FROM shipyard WHERE shipType = 'civilian';

SELECT MIN(hullStrength) AS minimum_hull_rating FROM shipyard WHERE shipType = 'military';

--Group by will group all entries of a selected attribute. The aggregate function will then return a minimum for all the entries grouped by the selected column.

SELECT MIN(hullStrength) AS minimum_hull_rating, shipClass FROM shipyard WHERE shipType = 'civilian' GROUP BY shipClass;

--If entries are grouped by more than one column, this compound group of columns can be though of as an unicity domain. Only the entries that
--have the same values for all the grouped columns will be compared by the aggregator function. This inherently means grouping by unique keys will print
--all the table entries.

SELECT MIN(hullStrength) AS minimum_hull_rating, shipName, shipClass, shieldStrength FROM shipyard WHERE shipType = 'civilian' GROUP BY shipName, shipClass, shieldStrength;

SELECT MIN(hullStrength) AS minimum_hull_rating, shipName, shipClass, shieldStrength FROM shipyard GROUP BY shipName, shipClass, shieldStrength;

SELECT MAX(serviceCrew) AS service_crew, shipType FROM shipyard GROUP BY shipType;

SELECT MIN(serviceCrew) AS service_crew, shipType FROM shipyard WHERE marines <= 10 GROUP BY shipType;