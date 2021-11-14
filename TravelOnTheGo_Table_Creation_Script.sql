--  Database Creation Script 
create schema TravelOnTheGo;

-- User TravelOnTheGo Schema
use TravelOnTheGo;

-- PASSENGER Table Creation Script 
CREATE TABLE PASSENGER
(Passenger_name varchar(30),
Category varchar(10),
Gender varchar(1),
Boarding_City varchar(30),
Destination_City varchar(30),
Distance int,
Bus_Type varchar(10)
);

-- Normalized into 2 distinct tables 
CREATE TABLE PRICE
(
Bus_Type_ID int,
Price int,
foreign key(Bus_Type_ID) references distance(Bus_Type_ID)
);

CREATE TABLE DISTANCE
(Bus_Type_ID int primary key,
Bus_Type varchar(10),
Distance int
);