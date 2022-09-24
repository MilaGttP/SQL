
---------- ADDING GOODS ----------
CREATE TRIGGER GoodsAdding
ON Goods  
FOR INSERT, UPDATE
AS
UPDATE Goods
SET Goods.Quantity = (SELECT Quantity FROM INSERTED)
WHERE ID = (SELECT ID FROM INSERTED);

---------- DISMISSAL OF AN EMPLOYEE ----------
CREATE TRIGGER EmployeeDismissal
ON Sellers
AFTER DELETE
AS
INSERT INTO WorkersArchive(SellerID)

---------- NEW SELLERS IF MORE THAN 6 ----------
CREATE TRIGGER AddingSeller
ON Sellers
FOR UPDATE, INSERT
AS
BEGIN
   DECLARE @counting INT
   SELECT @counting = COUNT(*) FROM Sellers
   IF (@counting > 6)
   BEGIN
    RAISERROR('Quantity of sellers is more than 6', 0, 1)
    ROLLBACK TRANSACTION  
   END
END