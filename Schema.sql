CREATE DATABASE ProjPart3;
USE ProjPart3;

CREATE TABLE Flight
	(Flight INTEGER,
	Departure_time TIME,
	Days_of_operation CHAR(20),
	Arrival_time TIME,
	2letterID CHAR(2),
	3letterID CHAR(3)
	);

INSERT INTO Flight (Flight, Departure_time, Days_of_operation, Arrival_time, 2letterID, 3letterID)
VALUES (001, 140, "MTFS", 940, "AA", "JFK"); /* T=Tuesday,TH=Thursday, SU=Sunday ...
										   AA=American Airlines
					                       JFK=JFK Airport */
INSERT INTO Flight (Flight, Departure_time, Days_of_operation, Arrival_time, 2letterID, 3letterID)
VALUES (011,120, "MWTH",340,"DE","JFK"); /* DE=Delta */




CREATE TABLE Airport
	(3letterID CHAR(3)
	);

INSERT INTO Airport (3letterID)
VALUES ("JFK");





CREATE TABLE Airline
	(2letterID CHAR(2)
	);

INSERT INTO Airline (2letterID)
VALUES ("AA");
INSERT INTO Airline (2letterID)
VALUES ("DE");



CREATE TABLE Aircraft
	(Identifier INTEGER,
	Maximum_capacity INTEGER,
	2letterID CHAR(2)
	);

INSERT INTO Aircraft (Identifier, Maximum_capacity, 2letterID)
VALUES (12, 232, "AA");
INSERT INTO Aircraft (Identifier, Maximum_capacity, 2letterID)
VALUES (14, 412, "DE");





CREATE TABLE Seat
	(Seat INTEGER,
	Meal_ordered CHAR(20),
	Flight INTEGER
	);

INSERT INTO Seat (Seat, Meal_ordered, Flight)
VALUES (1, "Salad", 001);
INSERT INTO Seat (Seat, Meal_ordered, Flight)
VALUES (19, "Fish", 011);





CREATE TABLE Ticket
	(Unique_number INTEGER,
	Fare DECIMAL,
	Booking_fee DECIMAL,
	Date_of_purchase DATE
	);

INSERT INTO Ticket (Unique_number, Fare, Booking_fee, Date_of_Purchase)
VALUES (1, 350.00, 15.00, 07-28-2019);
INSERT INTO Ticket (Unique_number, Fare, Booking_fee, Date_of_Purchase)
VALUES (23, 750.00, 23.50, 12-13-2018);


CREATE TABLE Reservation
	(Unique_number INTEGER,
	Name CHAR(30)
	);

INSERT INTO Reservation (Unique_number, Name)
VALUES (1, "Bob Ross");

INSERT INTO Reservation (Unique_number, Name)
VALUES (2, "Joe Davis");






CREATE TABLE Account
	(Name CHAR(30)
	);

INSERT INTO Account (Name)
VALUES ("Bob Ross");
INSERT INTO Account (Name)
VALUES ("Joe Davis");







CREATE TABLE Domestic
	(Flight INTEGER
	);

INSERT INTO Domestic (Flight)
VALUES (001);



CREATE TABLE International
	(Flight INTEGER
	);

INSERT INTO Domestic (Flight)
VALUES (011);



CREATE TABLE RoundTrip
	(Unique_number INTEGER
	);

INSERT INTO RoundTrip (Unique_number)
VALUES (23);



CREATE TABLE Oneway
	(Unique_number INTEGER
	);

INSERT INTO Oneway (Unique_number)
VALUES (1);

SELECT * FROM Flight;