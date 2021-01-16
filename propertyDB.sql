create database PropertyWroclaw;
use PropertyWroclaw;
create table RealEstates (
Property_ID bigint auto_increment key,
nr_plot varchar(100),
Map int,
Street varchar(255),
Area numeric(15, 4)
);
alter table RealEstates 
add (
KW varchar(255),
Parking varchar(255)
);
alter table RealEstates
drop column KW;
alter table RealEstates
MODIFY nr_plot varchar(255);
alter table RealEstates
modify nr_plot varchar(200) NOT NULL;
ALTER TABLE RealEstates
add check ( Area<=0.05);
alter table RealEstates
add ( 
time_add date );
use propertywroclaw;
alter table RealEstates
drop column Property_ID;
alter table realestates
add Property_ID bigint auto_increment Primary key;
insert into realestates (nr_plot)
values(23);
insert into realestates (nr_plot, Map, Street, Parking, time_add)
values ('3', 12, 'Legnicka', '3', '2021-01-02');
insert into realestates (nr_plot, Map, Street, Parking, time_add)
values ('4/1', 2, 'Pulaskiego', '3', '2021-01-03');
alter table RealEstates
MODIFY Area varchar(255);
alter table RealEstates
drop column Area;
insert into realestates (nr_plot, Map, Street, Area, Parking, time_add)
values ('3', 12, 'Legnicka', '0.4356' '3', '2021-01-02');
alter table Realestates
add column price decimal(15, 2);
UPDATE Realestates
SET Price = '2340000'
WHERE Property_ID = 1;
select * from realestates;
UPDATE Realestates
set Price = 1000000
where Property_id between 2 and 4;
select * from realestates;
UPDATE REALESTATES 
SET Map = '23', Street = 'Brodnicka', Parking = '2', time_add = '2021-01-07'
WHERE Property_ID = '1';
SELECT * FROM REALESTATES;

create table flat (
ID_flat integer primary key,
Street varchar(255),
Nr_flat integer,
Nr_lok integer,
nr_plot varchar(200),
Loc_size integer);
alter table flat
modify ID_flat int AUTO_INCREMENT;

insert into flat (Street, Nr_flat, Nr_lok, nr_plot, loc_size)
values ('Legnicka', 36, 2, '236', 35);
insert into flat (Street, Nr_flat, Nr_lok, nr_plot, loc_size)
values ('Legnicka', 234, 10, '26/5', 45.8);
insert into flat (Street, Nr_flat, Nr_lok, nr_plot, loc_size)
values ('Brodnicka', 16, null, '223/15', 98.2);
insert into flat (Street, Nr_flat, Nr_lok, nr_plot, loc_size)
values ('Legnicka', 7, 9, '78/16', 56.5);
insert into flat (Street, Nr_flat, Nr_lok, nr_plot, loc_size)
values ('Pulaskiego', 6, 12, '1/23', 50.3);
insert into flat (Street, Nr_flat, Nr_lok, nr_plot, loc_size)
values ('Kosmiczna', 12, 3, '6/12', 66.34);
insert into flat (Street, Nr_flat, Nr_lok, nr_plot, loc_size)
values ('Legnicka', 23, 3, '26/5', 35.2);
select * from realestates;
select * from flat;

SELECT REALESTATES.NR_PLOT, FLAT.NR_FLAT, FLAT.LOC_SIZE
FROM FLAT
INNER JOIN REALESTATES
ON FLAT.STREET = REALESTATES.STREET;

SELECT REALESTATES.PRICE, REALESTATES.NR_PLOT, FLAT.STREET, FLAT.NR_FLAT
FROM FLAT
INNER JOIN REALESTATES
ON FLAT.NR_LOK = REALESTATES.MAP;
SELECT REALESTATES.PRICE, REALESTATES.NR_PLOT, FLAT.STREET, FLAT.NR_FLAT
FROM FLAT
LEFT JOIN REALESTATES
ON FLAT.sTREET = REALESTATES.STREET;
SELECT FLAT.ID_FLAT, REALESTATES.NR_PLOT
FROM FLAT
RIGHT JOIN REALESTATES ON FLAT.STREET = REALESTATES.STREET;
SELECT FLAT.ID_FLAT, REALESTATES.NR_PLOT
FROM FLAT
LEFT JOIN REALESTATES ON FLAT.STREET = REALESTATES.STREET;

SELECT STREET FROM REALESTATES
UNION
SELECT STREET FROM FLAT
ORDER BY STREET;

select distinct street from flat
where street like '%_a' and 'loc_size' < 50;

SELECT MAX(Price) AS LargestPrice
FROM realestates;
SELECT SUM(loc_size)
FROM Flat;
SELECT AVG(Price)
FROM realestates;
SELECT AVG(Loc_size)
FROM flat;
SELECT street FROM flat
UNION
SELECT street FROM realestates
ORDER BY street;