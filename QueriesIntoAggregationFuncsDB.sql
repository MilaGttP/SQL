
--------- TEACHERS OF SOFTWARE DEVELOPMENT DEPARTMENT ---------
SELECT COUNT(*) AS [Number of teachers]
FROM Teachers AS T, Lectures AS L, GroupsLectures AS GL, Groups AS G, Departments AS D
WHERE G.DepartmentID = D.ID AND GL.GroupID = G.ID AND GL.LectureID = L.ID AND L.TeacherID = T.ID AND D.[Name] = 'Software Development';

--------- DAVE MCQUEEN`S LECTURES ---------
SELECT COUNT(*) AS [Number of Dave`s lectures]
FROM Lectures AS L, Teachers AS T
WHERE L.TeacherID = T.ID AND T.[Name] = 'Dave' AND T.Surname = 'McQueen';

--------- LECTURES IN D201 AUDITORY ---------
SELECT COUNT(*) AS [Number of lectures in B103]
FROM Lectures AS L
WHERE L.LectureRoom = 'B103';

--------- AUDITORIES AND LECTURES ---------
SELECT LectureRoom, COUNT(*) AS [Number of lessons]
FROM Lectures
GROUP BY LectureRoom;

--------- STUDENTS ON JACK UNDERHILL`S LECTURES ---------
SELECT COUNT(*) AS [Groups quantity]
FROM GROUPS AS G, GroupsLectures AS GL, Lectures AS L, Teachers AS T
WHERE GL.GroupID = G.ID AND GL.LectureID = L.ID AND L.TeacherID = T.ID AND T.[Name] = 'Jack' AND T.Surname = 'Underhill';

--------- AVERAGE SALARY OF TECHERS ON COMPUTER SCIENCE ---------
SELECT AVG(Salary) AS [Average salary]
FROM Teachers AS T, Lectures AS L, GroupsLectures AS GL, Groups AS G, Departments AS D, Faculties AS F
WHERE D.FacultyID = F.ID AND G.DepartmentID = D.ID AND GL.GroupID = G.ID AND GL.LectureID = L.ID AND L.TeacherID = T.ID AND F.Name = 'Computer Science';

--------- AVERAGE FINANCING OF DEPARTMENTS ---------
SELECT AVG(Financing) AS [Department`s financing]
FROM Departments;

--------- TEACHERS AND LECTURES ---------
SELECT [Name] + ' ' + Surname AS [Full name], COUNT(*) AS [Lectures quantity]
FROM Teachers AS T, Lectures AS L
WHERE L.TeacherID = T.ID
GROUP BY [Name] + ' ' + Surname;

--------- WEEKS LECTURES ---------
SELECT DayOfWeek, COUNT(*) AS [Lectures quantity]
FROM GroupsLectures AS GL, Lectures AS L
WHERE GL.LectureID = L.ID
GROUP BY DayOfWeek;

--------- AUDITORIES AND FACULTY LECTURES ---------
SELECT LectureRoom, COUNT(*) AS [Departments quantity]
FROM Lectures AS L, Departments AS D, Groups AS G, GroupsLectures AS GL
WHERE G.DepartmentID = D.ID AND GL.GroupID = G.ID AND GL.LectureID = L.ID
GROUP BY LectureRoom;

--------- AUDITORIES AND FACULTY LECTURES ---------
SELECT F.[Name] AS [Faculty name], COUNT(*) AS [Subject quantity]
FROM Faculties AS F, Subjects AS S, Departments AS D, Groups AS G, GroupsLectures AS GL, Lectures AS L
WHERE D.FacultyID = F.ID AND G.DepartmentID = D.ID AND GL.GroupID = G.ID AND GL.LectureID = L.ID AND L.SubjectID = S.ID
GROUP BY F.[Name];

--------- LECTURES QUANTITY FOR TEACHER - AUDITORY ---------
SELECT T.[Name] + ' ' + Surname AS [Full name], LectureRoom, COUNT(*) AS [Lectures quantity]
FROM Teachers AS T, Lectures AS L
WHERE L.TeacherID = T.ID
GROUP BY T.[Name] + ' ' + Surname, LectureRoom;