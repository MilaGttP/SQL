
--------- LONGEST BARBER WORK -------------
CREATE PROCEDURE LongestBarberWork
@name NVARCHAR(MAX) OUTPUT,
@surname NVARCHAR(MAX) OUTPUT,
@workingTime INT OUTPUT,
@maxWork INT
AS
SELECT @name = B.[Name], @surname = B.[Surname], @workingTime = B.WorkingTime FROM Barbers AS B
HAVING  @maxWork = MAX(@workingTime)
ORDER BY B.[Name]
GO
DECLARE @newName NVARCHAR(MAX), @newSurname NVARCHAR(MAX), @workingTime INT, @maxWork INT
EXEC LongestBarberWork @newName OUTPUT, @newSurname OUTPUT, @workingTime OUTPUT, @maxWork
SELECT @newName + ' ' + @newSurname AS [FullName]

--------- MAX OF CUSTOMERS -------------
CREATE FUNCTION MaxOfCustomers()
RETURNS @MaxCustomersBarber TABLE (FullName NVARCHAR(MAX) NOT NULL, ClientCount INT NOT NULL)
AS
BEGIN
DECLARE @tmpTable TABLE (FullName NVARCHAR(MAX) NOT NULL, Counting INT NOT NULL)
INSERT @tmpTable
SELECT B.[Name] + ' ' + B.Surname AS [FullName], COUNT(C.BarberID) AS Counting
FROM Barbers AS B, Clients AS C
WHERE C.BarberID = B.ID
GROUP BY B.[Name], B.Surname
INSERT @MaxCustomersBarber
SELECT tT.FullName AS [FullName], ClientCount = MAX(tT.Counting)
FROM @tmpTable AS tT
GROUP BY FullName
RETURN
END;
GO
SELECT MAX(ClientCount) FROM MaxOfCustomers() AS [Max customers];

--------- MAX OF VISITINGS -------------
CREATE FUNCTION MaxOfVisitings()
RETURNS @TMPClient TABLE ([Name] NVARCHAR(MAX) NOT NULL, MaxVisitings INT NOT NULL)
AS
BEGIN
DECLARE @tmpTable TABLE (ClientID INT NOT NULL, FeedBackID INT NOT NULL, Counting INT NOT NULL)
INSERT @tmpTable
SELECT C.ID AS ClientID, COUNT(F.ID) AS Counting, F.ID AS FeedBackID
FROM Clients AS C, Feedbacks AS F
WHERE F.ClientID = C.ID
GROUP BY C.ID, F.ID
INSERT @TMPClient
SELECT C.[Name] AS [Name], MaxVisitings = MAX(tT.Counting)
FROM Clients AS C, @tmpTable AS tT, FeedBacks AS F
WHERE tT.ClientID = C.ID AND F.ClientID = C.ID
GROUP BY C.[Name]
RETURN
END;
GO
SELECT MAX(MaxVisitings) FROM MaxOfVisitings() AS [Max visitings];

--------- MAX OF MONEY -------------
CREATE FUNCTION MaxMoney()
RETURNS @TMPClient TABLE ([Name] NVARCHAR(MAX) NOT NULL, MaxMoney INT NOT NULL)
AS
BEGIN
DECLARE @tmpTable TABLE (ClientID INT NOT NULL, ServicesID INT NOT NULL, ClientServiceID INT NOT NULL, Counting INT NOT NULL)
INSERT @tmpTable
SELECT C.ID AS ClientID, COUNT(S.ID) AS Counting, S.ID AS ServicesID, CS.ID AS ClientServiceID
FROM Clients AS C, Services AS S, ClientServices AS CS
WHERE CS.ClientID = C.ID AND CS.ServiceID = S.ID
GROUP BY C.ID, S.ID, CS.ID
INSERT @TMPClient
SELECT C.[Name] AS [Name], MaxMoney = MAX(tT.Counting)
FROM Clients AS C, @tmpTable AS tT
GROUP BY C.[Name]
RETURN
END;
GO
SELECT MAX(MaxMoney) FROM MaxMoney() AS [Max money];

--------- THE LONGEST SERVICE -------------
CREATE FUNCTION LongestService()
RETURNS @TMPService TABLE ([Name] NVARCHAR(MAX) NOT NULL, [Time] INT NOT NULL)
AS
BEGIN
INSERT @TMPService
SELECT S.[Name] AS [Name], [Time] = MAX(S.[Time])
FROM Services AS S
GROUP BY S.[Name]
RETURN
END;
GO
SELECT MAX([Time]) FROM LongestService() AS [Longest service];