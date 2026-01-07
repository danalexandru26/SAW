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
VALUES('ISS Valiant', 'military', 'cruiser', 6000, 3000, 10000, 180000, 200, 100, 1800.0, 12, 400, 100000, 12);

INSERT INTO shipyard 
VALUES('ISS Serenity', 'civilian', 'passenger', 2500, 1200, 5000, 90000, 80, 0, 75.0, 3, 100, 50000, 3);

--NOT Statement - it negates whatever condition is written afterwards

--normal condition

SELECT * FROM shipyard WHERE serviceCrew+marines < 130;

--negated condition

SELECT * FROM shipyard WHERE NOT serviceCrew+marines < 130;

--it is purely equivalent to

SELECT * FROM shipyard WHERE serviceCrew+marines > 130;