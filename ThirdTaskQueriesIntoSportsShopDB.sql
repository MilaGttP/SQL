
---------- ADDING NEW CUSTOMER ----------
CREATE TRIGGER AddingCustomer
ON Customers
FOR UPDATE, INSERT
AS
BEGIN
   DECLARE @newSurname NVARCHAR(MAX)
   DECLARE @oldSurname NVARCHAR(MAX)
   DECLARE @SpecialTable TABLE ( [Name] NVARCHAR(MAX), Surname NVARCHAR(MAX) )
   SELECT @newSurname FROM INSERTED
   SELECT @oldSurname FROM Customers
   IF (@newSurname = @oldSurname)
   BEGIN
    INSERT @SpecialTable
    SELECT [Name], Surname FROM Customers
    GROUP BY [Name], Surname
   END
END

---------- DELETING CUSTOMER ----------
CREATE TRIGGER DeletingCustomer
ON Customers
AFTER DELETE
AS
INSERT INTO GoodsArchive(1, CustomerID, 1)

---------- ADDING SELLER ----------
CREATE TRIGGER AddingSeller
ON Sellers
INSTEAD OF UPDATE, INSERT
AS
BEGIN
   DECLARE @CustomerID INT
   SELECT @CustomerID FROM Customers
   IF EXISTS (SELECT * FROM INSERTED WHERE ID = @CustomerID)   
   BEGIN
    RAISERROR('You cannot add a seller who are a customer!', 0, 1)
    ROLLBACK TRANSACTION  
   END
END

---------- ADDING CUSTOMER ----------
CREATE TRIGGER AddingCustomer
ON Customers
INSTEAD OF UPDATE, INSERT
AS
BEGIN
   DECLARE @SellerID INT
   SELECT @SellerID FROM Sellers
   IF EXISTS (SELECT * FROM INSERTED WHERE ID = @SellerID)   
   BEGIN
    RAISERROR('You cannot add a customer who are a seller!', 0, 1)
    ROLLBACK TRANSACTION  
   END
END

---------- BAN SOME INFORMATION ----------
CREATE TRIGGER BanSomeInformation
ON Goods
FOR INSERT, UPDATE
AS 
BEGIN
   DECLARE @goodsName NVARCHAR(MAX)
   SELECT @goodsName FROM Goods
   WHERE [Name] = 'Rollerskates' OR [Name] = 'Bicycles'
   IF EXISTS (SELECT * FROM INSERTED WHERE [Name] = @goodsName)   
   BEGIN
    RAISERROR('You cannot add information about this items!', 0, 1)
    ROLLBACK TRANSACTION  
   END
END