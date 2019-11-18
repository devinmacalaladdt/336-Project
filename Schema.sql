CREATE DATABASE IF NOT EXISTS `AirlineFlight`;
USE `AirlineFlight`;



CREATE TABLE IF NOT EXISTS account (
  accountname varchar(50) NOT NULL DEFAULT '' ,
  pass varchar(50) NOT NULL DEFAULT '',
  firstname varchar(50),
  lastname varchar(50),
  PRIMARY KEY (accountname)
);


CREATE TABLE IF NOT EXISTS Flight
	(Flight INTEGER,
	Departure_time TIME,
	Days_of_operation CHAR(20),
	Arrival_time TIME,
	2letterID CHAR(2),
	3letterID CHAR(3),
	PRIMARY KEY (Flight),
	FOREIGN KEY (2letterID) REFERENCES Airline
	);


CREATE TABLE IF NOT EXISTS Airline
	(2letterID CHAR(2),
    PRIMARY KEY (2letterID)
	);

CREATE TABLE IF NOT EXISTS Airport
	(3letterID CHAR(3),
    PRIMARY KEY (3letterID)
	);



CREATE TABLE IF NOT EXISTS Aircraft
	(Identifier INTEGER,
	Maximum_capacity INTEGER,
	2letterID CHAR(2),
	PRIMARY KEY (Identifier),
	FOREIGN KEY (2letterID) REFERENCES Airline
	);




CREATE TABLE IF NOT EXISTS Seat
	(Seat INTEGER,
	Meal_ordered CHAR(20),
	Flight INTEGER,
	PRIMARY KEY (Seat),
	FOREIGN KEY (Flight) REFERENCES Flight
	);



CREATE TABLE IF NOT EXISTS Ticket
	(Unique_number INTEGER,
	Fare DECIMAL,
	Booking_fee DECIMAL,
	Date_of_purchase DATE,
	PRIMARY KEY (Unique_number)
	);


CREATE TABLE IF NOT EXISTS Reservation
	(Unique_number INTEGER,
	Name CHAR(30),
	PRIMARY KEY (Unique_number),
	PRIMARY KEY (Name)
	);




CREATE TABLE IF NOT EXISTS Domestic
	(Flight INTEGER,
	FOREIGN KEY (Flight) REFERENCES Flight
	);




CREATE TABLE IF NOT EXISTS International
	(Flight INTEGER,
	FOREIGN KEY (Flight) REFERENCES Flight
	);




CREATE TABLE IF NOT EXISTS RoundTrip
	(Unique_number INTEGER,
	FOREIGN KEY (Unique_number) REFERENCES Ticket
	);




CREATE TABLE IF NOT EXISTS Oneway
	(Unique_number INTEGER,
	FOREIGN KEY (Unique_number) REFERENCES Ticket
	);


CREATE TABLE IF NOT EXISTS Operates
	(2letterID CHAR(2),
	3letterID CHAR(3),
    number_of INTEGER,
    FOREIGN KEY (2letterID) REFERENCES Airline,
    FOREIGN KEY (3letterID) REFERENCES Airport
	);
    
CREATE TABLE IF NOT EXISTS Owns
	(2letterID CHAR(2),
	Identifier INTEGER,
    quantity INTEGER,
FOREIGN KEY (2letterID) REFERENCES Airline,
FOREIGN KEY (3letterID) REFERENCES Airport
	);
    
CREATE TABLE IF NOT EXISTS Operates2
	(2letterID CHAR(2),
	Identifier INTEGER,
    Flight INTEGER,
FOREIGN KEY (Identifier) REFERENCES Aircraft,
FOREIGN KEY (3letterID) REFERENCES Airport,
FOREIGN KEY (Flight) REFERENCES Flight
	);

CREATE TABLE IF NOT EXISTS Destination
	(3letterID CHAR(2),
    Flight INTEGER,
	FOREIGN KEY (3letterID) REFERENCES Airport,
	FOREIGN KEY (Flight) REFERENCES Flight
	);

CREATE TABLE IF NOT EXISTS Departure
	(3letterID CHAR(2),
    Flight INTEGER,
FOREIGN KEY (3letterID) REFERENCES Airport,
	FOREIGN KEY (Flight) REFERENCES Flight
	);

CREATE TABLE IF NOT EXISTS Associated
	(Unique_number INTEGER,
    Flight INTEGER,
    Seat INTEGER,
	FOREIGN KEY (Unique_number) REFERENCES Ticket,
	FOREIGN KEY (Flight) REFERENCES Flight,
	FOREIGN KEY (Seat) REFERENCES Seat
	);

CREATE TABLE IF NOT EXISTS Has
	(Unique_number INTEGER,
	FOREIGN KEY (Unique_number) REFERENCES Ticket
	);
    
    
CREATE TABLE IF NOT EXISTS ReservationPortfolio
	(Name CHAR(30),
	FOREIGN KEY (Name) REFERENCES account
	);
    


