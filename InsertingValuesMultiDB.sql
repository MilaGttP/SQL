
INSERT INTO Subjects VALUES
('Math'),
('Programming'),
('English'),
('Database Theory')

INSERT INTO Teachers VALUES
('Kirilo', 1900, 'Romanenko'),
('Angelina', 2300, 'Klekot'),
('Irina', 1600, 'Sergienko'),
('Samantha', 2350, 'Adams')

INSERT INTO Lectures VALUES
('B103', 2, 1),
('N786', 1, 3),
('W132', 3, 4),
('U371', 4, 2)

INSERT INTO Faculties VALUES
(10000, 'Computer Science'),
(7000, 'Logistic Manager')

INSERT INTO Departments VALUES
(100000, 'IT', 1),
(80000, 'Management', 2)

INSERT INTO Groups VALUES
('P107', 5, 1),
('H109', 5, 2),
('F129', 2, 1),
('D241', 3, 1)

INSERT INTO Curators VALUES
('Roman', 'Grigorenko'),
('Elizaveta', 'Symchyk'),
('Victor', 'Stepanenko'),
('Dmytro', 'Hodiuk')

INSERT INTO GroupsCurators VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 4)

INSERT INTO GroupsLectures VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 4)