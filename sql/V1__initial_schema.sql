CREATE TABLE Branch (
  branchNo varchar(255) NOT NULL,
  street varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  postcode varchar(255) DEFAULT NULL,
  PRIMARY KEY (branchNo)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Branch (branchNo, street, city, postcode)
VALUES 
  ('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
  ('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
  ('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
  ('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
  ('B002', '56 Clover Dr', 'London', 'NW10 6EU');

CREATE TABLE Staff (
  staffNo varchar(255) NOT NULL,
  fName varchar(255) DEFAULT NULL,
  lName varchar(255) DEFAULT NULL,
  position varchar(255) DEFAULT NULL,
  sex varchar(255) DEFAULT NULL,
  DOB varchar(255) DEFAULT NULL,
  salary int(11) DEFAULT NULL,
  branchNo varchar(255) DEFAULT NULL,
  PRIMARY KEY (staffNo),
  FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES 
  ('SL21', 'John', 'White', 'Manager', 'M', '1-Oct-45', 30000, 'B005'),
  ('SG37', 'Ann', 'Beech', 'Assistant', 'F', '10-Nov-60', 12000, 'B003'),
  ('SG14', 'David', 'Ford', 'Supervisor', 'M', '24-Mar-58', 18000, 'B003'),
  ('SA9', 'Mary', 'Howe', 'Assistant', 'F', '19-Feb-70', 9000, 'B007'),
  ('SG5', 'Susan', 'Brand', 'Manager', 'F', '3-Jun-40', 24000, 'B003'),
  ('SL41', 'Julie', 'Lee', 'Assistant', 'F', '13-Jun-65', 9000, 'B005');

CREATE TABLE Client (
  clientNo varchar(255) NOT NULL,
  fName varchar(255) DEFAULT NULL,
  lName varchar(255) DEFAULT NULL,
  telNo varchar(255) DEFAULT NULL,
  prefType varchar(255) DEFAULT NULL,
  maxRent int(11) DEFAULT NULL,
  eMail varchar(255) DEFAULT NULL,
  PRIMARY KEY (clientNo)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Client (clientNo, fName, lName, telNo, prefType, maxRent, eMail)
VALUES 
  ('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com'),
  ('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com'),
  ('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750, 'mritchie01@yahoo.co.uk'),
  ('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.co.uk');

CREATE TABLE PrivateOwner (
  ownerNo varchar(255) NOT NULL,
  fName varchar(255) DEFAULT NULL,
  lName varchar(255) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  telNo varchar(255) DEFAULT NULL,
  eMail varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  PRIMARY KEY (ownerNo)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO PrivateOwner (ownerNo, fName, lName, address, telNo, eMail, password)
VALUES 
  ('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212', 'jkeogh@lhh.com', '********'),
  ('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419', 'cfarrel@gmail.com', '********'),
  ('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728', 'tinam@hotmail.com', '********'),
  ('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025', 'tony.shaw@ark.com', '********');

CREATE TABLE PropertyForRent (
  propertyNo varchar(255) NOT NULL,
  street varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  postcode varchar(255) DEFAULT NULL,
  propertyType varchar(255) DEFAULT NULL,
  rooms int(11) DEFAULT NULL,
  rent int(11) DEFAULT NULL,
  ownerNo varchar(255) DEFAULT NULL,
  staffNo varchar(255) DEFAULT NULL,
  branchNo varchar(255) DEFAULT NULL,
  PRIMARY KEY (propertyNo),
  FOREIGN KEY (ownerNo) REFERENCES PrivateOwner(ownerNo),
  FOREIGN KEY (staffNo) REFERENCES Staff(staffNo),
  FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO PropertyForRent (propertyNo, street, city, postcode, propertyType, rooms, rent, ownerNo, staffNo, branchNo)
VALUES 
  ('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007'),
  ('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87', 'SL41', 'B005'),
  ('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', NULL, 'B003'),
  ('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003'),
  ('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003'),
  ('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');

CREATE TABLE Viewing (
  clientNo varchar(255) NOT NULL,
  propertyNo varchar(255) NOT NULL,
  viewDate varchar(255) DEFAULT NULL,
  viewingComment varchar(255) DEFAULT NULL,
  PRIMARY KEY (clientNo, propertyNo),
  FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
  FOREIGN KEY (propertyNo) REFERENCES PropertyForRent(propertyNo)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Viewing (clientNo, propertyNo, viewDate, viewingComment)
VALUES 
  ('CR56', 'PA14', '24-May-13', 'too small'),
  ('CR76', 'PG4', '20-Apr-13', 'too remote'),
  ('CR56', 'PG4', '26-May-13', NULL),
  ('CR62', 'PA14', '14-May-13', 'no dining room'),
  ('CR56', 'PG36', '28-Apr-13', NULL);

CREATE TABLE Registration (
  clientNo varchar(255) NOT NULL,
  branchNo varchar(255) NOT NULL,
  staffNo varchar(255) DEFAULT NULL,
  dateJoined varchar(255) DEFAULT NULL,
  PRIMARY KEY (clientNo, branchNo),
  FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
  FOREIGN KEY (branchNo) REFERENCES Branch(branchNo),
  FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Registration (clientNo, branchNo, staffNo, dateJoined)
VALUES 
  ('CR76', 'B005', 'SL41', '2-Jan-13'),
  ('CR56', 'B003', 'SG37', '11-Apr-12'),
  ('CR74', 'B003', 'SG37', '16-Nov-11'),
  ('CR62', 'B007', 'SA9', '7-Mar-12');
