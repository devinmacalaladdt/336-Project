CREATE DATABASE IF NOT EXISTS `AirlineFlight`;
USE `AirlineFlight`;

CREATE TABLE Flight
	(Flight INTEGER,
	Departure_time TIME,
	Days_of_operation CHAR(20),
	Arrival_time TIME,
	2letterID CHAR(2),
	3letterID CHAR(3)
	);



CREATE TABLE Airport
	(3letterID CHAR(3)
	);


CREATE TABLE Airline
	(2letterID CHAR(2)
	);



CREATE TABLE Aircraft
	(Identifier INTEGER,
	Maximum_capacity INTEGER,
	2letterID CHAR(2)
	);


CREATE TABLE Seat
	(Seat INTEGER,
	Meal_ordered CHAR(20),
	Flight INTEGER
	);


CREATE TABLE Ticket
	(Unique_number INTEGER,
	Fare DECIMAL,
	Booking_fee DECIMAL,
	Date_of_purchase DATE
	);


CREATE TABLE Reservation
	(Unique_number INTEGER,
	Name CHAR(30)
	);


CREATE TABLE account
	(accountname CHAR(30),
	 password CHAR(30)
	 
	);


CREATE TABLE Domestic
	(Flight INTEGER
	);




CREATE TABLE International
	(Flight INTEGER
	);




CREATE TABLE RoundTrip
	(Unique_number INTEGER
	);




CREATE TABLE Oneway
	(Unique_number INTEGER
	);


