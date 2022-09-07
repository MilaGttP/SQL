
--------- REVERSE SHOWING ----------
SELECT * FROM Departments ORDER BY ID DESC;

--------- GROUPS AND RATING SHOWING ----------
SELECT [Name] AS [Group Name], Rating AS [Group Rating] FROM Groups;

--------- TEACHERS AND THEIR SALARIES ---------- 
UPDATE Teachers
SET Salary = (Salary / Premium) * 100, Premium = (Premium / Salary) * 100
SELECT Surname, Salary AS [Percent of salary to premium], Premium AS [Percent of premium to salary] FROM Teachers;

/*SELECT Surname, Salary AS [Percent of salary to premium], Premium AS [Percent of premium to salary] FROM Teachers
WHERE SALARY Salary = ((Salary / Premium) * 100) AND (Premium = (Premium / Salary) * 100); - first version (wrong) */ 

--------- DEANS AND FACULTIES ----------
SELECT 'The dean of faculty ' + [Name] + ' is ' + CONVERT(nvarchar(100), Dean) FROM Faculties;

--------- PROFESSORS AND SALARIES ----------
SELECT Surname FROM Teachers
WHERE IsProfessor = 1 AND Salary > 1050;

--------- DEPARTMENTS AND FINANCING ----------
SELECT [Name] FROM Departments
WHERE Financing < 11000 OR Financing > 25000;

--------- ALL FACULTIES BESIDE COMPUTER SCIENCE ----------
SELECT [Name] FROM Faculties
WHERE [Name] != 'Computer Science';

--------- SURNAMES AND POSITIONS IN`T PROFESSORS ----------
SELECT Surname, Position FROM Teachers
WHERE IsProfessor = 0;

--------- ASISSTANS BETWEEN ----------
SELECT Surname, Position, Salary, Premium FROM Teachers
WHERE IsAssistant = 1 AND Premium BETWEEN 160 AND 550;

--------- JUST ASISSTANS ----------
SELECT Surname, Salary FROM Teachers
WHERE IsAssistant = 1;

--------- EMPLOYMENT DATE BEFORE 01.01.2000 ----------
SELECT Surname, Position FROM Teachers
WHERE EmploymentDate < '01.01.2000';

--------- DEPARTMENTS NAMES ----------
SELECT [Name] AS [Name of Department] FROM Departments
WHERE ID BETWEEN 1 AND 3 ORDER BY [Name] ASC;

--------- ASSISTANT SALARY AND PREMIUM ----------
SELECT [Surname] FROM Teachers
WHERE IsAssistant = 1 AND Salary + Premium <= 1200;

--------- FIVETH COURSE ----------
SELECT [Name] FROM Groups
WHERE [Year] = 5 AND Rating BETWEEN 2 AND 4;

--------- ASSISTANTS AND THEIR PREMIUMS ----------
SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND Salary < 550 OR IsAssistant = 1 AND Premium < 200;