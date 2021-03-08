DROP TABLE PriceChange;
DROP TABLE Meat_Product;
DROP TABLE Meat_Company;
DROP TABLE Employee;
DROP TABLE P_Associates;
DROP TABLE Purchase;
DROP TABLE Customer;
DROP TABLE S_Associates;
DROP TABLE Shopping_Bag;
DROP TABLE Product;
DROP TABLE Account;

CREATE TABLE Account (
AccountID DECIMAL(12) NOT NULL PRIMARY KEY,
Username VARCHAR(64) NOT NULL,
Password VARCHAR(64) NOT NULL,
FirstName VARCHAR(64) NOT NULL,
LastName VARCHAR(64) NOT NULL,
Address VARCHAR(255) NOT NULL,
Phone DECIMAL(38) NOT NULL,
Email VARCHAR(128) NOT NULL,
AccountType VARCHAR(12) NOT NULL);

CREATE TABLE Employee (
AccountID DECIMAL(12) NOT NULL PRIMARY KEY,
StartDate DATE NOT NULL,
Salary DECIMAL(12,2) NOT NULL,
Position VARCHAR(64) NOT NULL,
FOREIGN KEY (AccountID) REFERENCES Account(AccountID));

CREATE TABLE Meat_Company (
MeatComID DECIMAL(12) NOT NULL PRIMARY KEY,
AccountID DECIMAL(12) NOT NULL,
MeatComName VARCHAR(255) NOT NULL,
MeatComContact VARCHAR(64) NOT NULL,
MeatComAddress VARCHAR(255) NOT NULL,
MeatComPhone DECIMAL(38) NOT NULL,
MeatComEmail VARCHAR(255) NOT NULL,
FOREIGN KEY (AccountID) REFERENCES Account(AccountID));

CREATE TABLE Meat_Product (
MeatPartID DECIMAL(12) NOT NULL PRIMARY KEY,
MeatComID DECIMAL(12) NOT NULL,
MeatName VARCHAR(64) NOT NULL,
MeatPrice DECIMAL(7,2) NULL,
MeatDate DATE NULL,
MeatWeight VARCHAR(64) NULL,
FOREIGN KEY (MeatComID) REFERENCES Meat_Company(MeatComID));

CREATE TABLE PriceChange (
PriceChangeID DECIMAL(12) NOT NULL PRIMARY KEY,
MeatComID DECIMAL(12) NOT NULL,
MeatPartID DECIMAL(12) NOT NULL,
OldPrice DECIMAL(10,2) NOT NULL,
NewPrice DECIMAL(10,2) NOT NULL,
ChangeDate DATE NOT NULL,
FOREIGN KEY (MeatComID) REFERENCES Meat_Company(MeatComID),
FOREIGN KEY (MeatPartID) REFERENCES Meat_Product(MeatPartID))

CREATE TABLE Customer (
AccountID DECIMAL(12) NOT NULL PRIMARY KEY,
MemberSince DATE NOT NULL,
MembershipSpending DECIMAL(12,2) NOT NULL,
MembershipStatus VARCHAR(64) NOT NULL,
FOREIGN KEY (AccountID) REFERENCES Account(AccountID));

CREATE TABLE Purchase (
PurchaseID DECIMAL(12) NOT NULL PRIMARY KEY,
AccountID DECIMAL(12) NOT NULL,
PurchaseDate DATE NOT NULL,
PurchasePrice DECIMAL(10) NOT NULL,
PurchaseSummary VARCHAR(1024) NOT NULL,
FOREIGN KEY (AccountID) REFERENCES Account(AccountID));

CREATE TABLE Product (
ProductID DECIMAL(12) NOT NULL PRIMARY KEY,
ProductName VARCHAR(128) NOT NULL,
ProductPrice DECIMAL(6) NOT NULL,
ProductExpDate DATE NOT NULL,
ProductDescription VARCHAR(1024) NOT NULL)

CREATE TABLE P_Associates (
ProductID DECIMAL(12) NOT NULL,
PurchaseID DECIMAL(12) NOT NULL,
FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID));

CREATE TABLE Shopping_Bag (
ShoppingID DECIMAL(12) NOT NULL PRIMARY KEY,
AccountID DECIMAL(12) NOT NULL,
ShopBagSummary VARCHAR(1024) NOT NULL,
ShopBagPrice DECIMAL(10) NOT NULL,
FOREIGN KEY (AccountID) REFERENCES Account(AccountID));

CREATE TABLE S_Associates (
ProductID DECIMAL(12) NOT NULL,
ShoppingID DECIMAL(12) NOT NULL,
FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
FOREIGN KEY (ShoppingID) REFERENCES Shopping_Bag(ShoppingID));

--Adding Indexes
CREATE UNIQUE INDEX EmployeeAccountIDx
ON Employee(AccountID);

CREATE INDEX Meat_CompanyAccountIDx
ON Meat_Company(AccountID);

CREATE INDEX Meat_ProductMeatComIDx
ON Meat_Product(MeatComID);

CREATE UNIQUE INDEX CustomerAccountIDx
ON Customer(AccountID);

CREATE INDEX PurchaseAccountIDx
ON Purchase(AccountID);

CREATE UNIQUE INDEX Shopping_BagAccountIDx
ON Shopping_Bag(AccountID);

CREATE INDEX P_AssociatesProductIDx
ON P_Associates(ProductID);

CREATE INDEX P_AssociatesPurchaseIDx
ON P_Associates(PurchaseID);

CREATE INDEX S_AssociatesProductIDx
ON S_Associates(ProductID);

CREATE INDEX S_AssociatesShoppingIDx
ON S_Associates(ShoppingID);

CREATE INDEX Meat_Product_MeatNamex
ON Meat_Product(MeatName);

CREATE UNIQUE INDEX MeatCom_MeatComNameIDx
ON Meat_Company(MeatComName);

CREATE UNIQUE INDEX CustLNx
ON Customer(MembershipStatus);

CREATE UNIQUE INDEX EmpLNx
ON Employee(Position);

DROP PROCEDURE AddMeat_Company;
DROP PROCEDURE AddEmployee;
DROP PROCEDURE AddAccount;
DROP PROCEDURE AddMeat_Product;
GO

CREATE PROCEDURE AddAccount @AccountID DECIMAL(12), @Username VARCHAR(64), @Password VARCHAR(64),
				@FirstName VARCHAR(64), @LastName VARCHAR(64), @Address VARCHAR(255), @Phone DECIMAL(38),
				@Email VARCHAR(128), @AccountType VARCHAR(12)
AS
BEGIN
	INSERT INTO Account(AccountID, Username, Password, FirstName, LastName, Address, Phone, Email, AccountType)
	VALUES (@AccountID, @UserName, @Password, @FirstName, @LastName, @Address, @Phone, @Email, @AccountType);
END;
GO

BEGIN TRANSACTION AddAccount;
EXECUTE AddAccount 1, 'joshyoon', 'XDFH', 'Joshua', 'Yoon', '234 Lake Street', '3124535467', 'jyoon@xdfm.com', 'Employee';
EXECUTE AddAccount 2, 'CharlMac', 'FDSF', 'Charlie', 'Macdon', '1249 Londsdale Street', '3124212355', 'chMac@xdfm.com','Customer';
EXECUTE AddAccount 3, 'KatJac', 'DFDF', 'Katie', 'Jacqualine', '910 Bakers Street', '3125112324', 'kaJacq@xdfm.com', 'Employee';
EXECUTE AddAccount 4, 'HyunBi', 'DFDFG', 'Hyun', 'Byun', '101 Randolph Street', '3124689773', 'hyunBy@xdfm.com', 'Customer';
EXECUTE AddAccount 5, 'RobyMad', 'DTRRTH', 'Robyn', 'Madison', '3425 West Nord Ave', '3121239458', 'RobyMad@xdfm.com', 'Employee';
EXECUTE AddAccount 6, 'JamLee', 'RTY', 'James', 'Lee', '3154 East Vestage Street', '31224236436', 'JameLee@xdfm.com', 'Customer';
EXECUTE AddAccount 7, 'JereDe', 'WERDY', 'Jeremiah', 'Dem', '19 North Ave', '3123634546', 'jerelee@xdfm.com', 'Customer';
EXECUTE AddAccount 8, 'VeroGon', 'TYYU', 'Veronica', 'Gonza', '623 Vacon Street', '3124235222', 'verogon@xdfm.com', 'Employee';
EXECUTE AddAccount 9, 'DavBe', 'RTYFGH', 'David', 'Beywh', '12934 North Hubbard Street', '3123768998', 'davbey@xdfm.com', 'Customer';
EXECUTE AddAccount 10, 'AaroSte', 'RTDFG', 'Aaron', 'Stephson', '8542 South Michigan Ave', '3124231231', 'AaronSte@xdfm.com' ,'Employee';
COMMIT TRANSACTION AddAccount;

GO

CREATE PROCEDURE AddEmployee @AccountID DECIMAL(12), @StartDate DATE, @Salary DECIMAL(12), @Position VARCHAR(64)
AS
BEGIN
	INSERT INTO Employee(AccountID, StartDate, Salary, Position)
	VALUES (@AccountID, @StartDate, @Salary, @Position);
END;
GO

BEGIN TRANSACTION AddEmployee;
EXECUTE AddEmployee 1, '2002-03-23', '50000', 'Accountant';
EXECUTE AddEmployee 3, '2005-02-02', '45000', 'Marketing Advisor';
EXECUTE AddEmployee 5, '2008-10-29', '55000', 'Project Manager';
EXECUTE AddEmployee 8, '2015-07-14', '40000', 'Designer';
EXECUTE AddEmployee 10, '2018-05-05', '48000', 'Consultant';
COMMIT TRANSACTION AddEmployee;

GO

CREATE PROCEDURE AddMeat_Company @MeatComID DECIMAL(12), @AccountID DECIMAL(12), @MeatComName VARCHAR(255), 
				@MeatComContact VARCHAR(64), @MeatComAddress VARCHAR(255), @MeatComPhone DECIMAL(38), @MeatComEmail VARCHAR(255)
AS
BEGIN
	INSERT INTO Meat_Company(MeatComID, AccountID, MeatComName, MeatComContact,MeatComAddress, MeatComPhone, MeatComEmail)
	VALUES (@MeatComID, @AccountID, @MeatComName, @MeatComContact,@MeatComAddress, @MeatComPhone, @MeatComEmail);
END;
GO

BEGIN TRANSACTION AddMeat_Company;
EXECUTE AddMeat_Company 101, 1, 'Hunters Meat Packaging', 'Hunter Stephen', '1242 South Melview, Houston, Texas', '6124342523', 
								'Hunters@MeatPackage.com';
EXECUTE AddMeat_Company 102, 1, 'Cow Packaging', 'George Nath', '423 Belborne Street, Melbourne Australia', '9124345222', 
								'GeorgeNa@CowPack.com';
EXECUTE AddMeat_Company 103, 3, 'Pig/Cow Packaging', 'Toby Dov', '3428 Cetiry Street, Chicago, IL', '342352343', 
								'TobyDova@PCPack.com';
EXECUTE AddMeat_Company 104, 3, 'Pow Pack', 'David Marlow', '323 Washington Blvd, Houston, Texas', '6231245623',
								'DavMarlow@powPack.com';
EXECUTE AddMeat_Company 105, 5, 'Traditional Meats', 'Carlos Devalis', '2343 Madison Street, Surrey, B.C. Canada', '6044345222', 
								'CarlosDev@Tmeats.com';
EXECUTE AddMeat_Company 106, 5, 'M Meats', 'Martha Dane', '12034 South Park Ave, OH', '423563453',
								'MarDane@MMeats.com';
COMMIT TRANSACTION AddMeat_Company;

GO

CREATE PROCEDURE AddMeat_Product @MeatPartID DECIMAL(12), @MeatComID DECIMAL(12), @MeatName VARCHAR(64), @MeatPrice DECIMAL(7,2),
								@MeatDate DATE, @MeatWeight VARCHAR(64)
AS
BEGIN
	INSERT INTO Meat_Product(MeatPartID, MeatComID, MeatName, MeatPrice, MeatDate, MeatWeight)
	VALUES (@MeatPartID, @MeatComID, @MeatName, @MeatPrice,	@MeatDate, @MeatWeight);
END;
GO

BEGIN TRANSACTION AddMeat_Product;
EXECUTE AddMeat_Product 1001, 101, 'Brisket', '3.50', '10/15/2020', '250';
EXECUTE AddMeat_Product 1002, 102, 'Tenderloin', '2.50', '10/14/2020', '300';
EXECUTE AddMeat_Product 1003, 103, 'Rib-eye', '5.50', '10/13/2020', '150';
EXECUTE AddMeat_Product 1004, 104, 'Flank', '2.25', '10/15/2020', '400';
EXECUTE AddMeat_Product 1005, 105, 'Brisket', '4.25', '10/12/2020', '200';
EXECUTE AddMeat_Product 1006, 106, 'Tenderloin', '2.75', '10/14/2020', '100';
EXECUTE AddMeat_Product 1007, 103, 'Brisket', '4.50', '10/10/2020', '250';
EXECUTE AddMeat_Product 1008, 104, 'Tenderloin', '5.25', '10/12/2020', '50';
EXECUTE AddMeat_Product 1009, 105, 'Rib-eye', '6.50', '10/11/2020', '100';
EXECUTE AddMeat_Product 1010, 101, 'Flank', '2.50', '10/07/2020', '100';
EXECUTE AddMeat_Product 1011, 106, 'Rib-eye', '4.50', '10/06/2020', '200';
COMMIT TRANSACTION AddMeat_Company;

GO 

CREATE TRIGGER PriceChangeTrg
ON Meat_Product
AFTER UPDATE
AS
BEGIN
	DECLARE @OldPrice DECIMAL(10,2) = (SELECT MeatPrice FROM DELETED);
	DECLARE @NewPrice DECIMAL(10,2) = (SELECT MeatPrice FROM INSERTED);

	IF (@OldPrice <> @NewPrice)
		INSERT INTO PriceChange(PriceChangeID, MeatComID, MeatPartID, OldPrice, NewPrice, ChangeDate)
		VALUES (ISNULL((SELECT MAX(PriceChangeID)+1 FROM PriceChange), 1),
				(SELECT MeatComID FROM INSERTED),
				(SELECT MeatPartID FROM INSERTED),
				@OldPrice,
				@NewPrice,
				GETDATE());
END;
GO

UPDATE Meat_Product
SET	   MeatPrice = 3.75
WHERE  MeatPartID = 1001

UPDATE Meat_Product
SET	   MeatPrice = 4.00
WHERE  MeatPartID = 1002

UPDATE Meat_Product
SET	   MeatPrice = 5.75
WHERE  MeatPartID = 1003

UPDATE Meat_Product
SET    MeatPrice = 5.00
WHERE  MeatPartID = 1005

UPDATE Meat_Product
SET    MeatPrice = 3.50
WHERE  MeatPartID = 1006

SELECT *
FROM PriceChange

--THIS QUERY ANSWERS THIS QUESTION:
--LIST MANY EMPLOYEES WHO HAVE SALARY MORE THAN 45000 AND THEIR NAMES.

SELECT FirstName, Salary
FROM Account
JOIN Employee ON Account.AccountID = Employee.AccountID
WHERE Salary > 45000
ORDER BY Salary DESC;

--THIS QUERY ANSWERS THIS QUESTION:
--LIST OF MEAT PRODUCT AND COMPANY THAT HAD THE RAISES IN PRICE MORE THAN .50 PER POUND. 

SELECT MeatComName, NewPrice-OldPrice as ChangeInPrice
FROM Meat_Company
JOIN PriceChange ON Meat_Company.MeatComID = PriceChange.MeatComID
WHERE NewPrice-OldPrice > 0.50
ORDER BY NewPrice-OldPrice DESC

--THIS QUERY ANSWERS THIS QUESTION:
--LIST OF Employee name, Meat Company Name, contact name, and type of meat, price, and total price sold per meat company.
SELECT FirstName as EmployeeName, MeatComName, MeatComContact, MeatName, MeatPrice, 
					FORMAT(MeatPrice * MeatWeight, '$.00') as TotalPrice
FROM Account
JOIN Meat_Company ON Account.AccountID = Meat_Company.AccountID
JOIN Meat_Product ON Meat_Product.MeatComID = Meat_Company.MeatComID
ORDER BY MeatName DESC


