
----------- PAIRS: TEACHERS AND GROUPS ----------
SELECT T.Name AS [Teacher`s Name], G.Name AS [Group`s Name] 
FROM Groups AS G, Teachers AS T, Lectures AS L, GroupsLectures AS GL
WHERE T.ID = L.TeacherID AND L.ID = GL.LectureID AND GL.GroupID = GL.ID
GROUP BY T.Name, G.Name;

----------- DEPARTMENT FINANCING > FACULTY FINANCING ----------
SELECT F.[Name] AS [Faculty`s Name]
FROM Faculties AS F, Departments AS D
WHERE F.ID = D.FacultyID AND D.Financing > F.Financing;

----------- CURATORS AND THEIR GROUPS ----------
SELECT C.Surname AS [Curator`s Surname], G.[Name] AS [Group`s Name]
FROM Curators AS C, Groups AS G, GroupsCurators AS GC
WHERE C.ID = GC.CuratorID AND G.ID = GC.GroupID;

----------- TEACHERS IN GROUP P107 ----------
SELECT T.[Name] + ' ' + T.Surname AS [Teacher`s Full Name]
FROM Groups AS G, Teachers AS T, Lectures AS L, GroupsLectures AS GL
WHERE T.ID = L.TeacherID AND L.ID = GL.LectureID AND GL.GroupID = G.ID AND G.[Name] = 'P107';

----------- TEACHERS AND FACULTIES ----------
SELECT T.Surname, F.[Name]
FROM Groups AS G, Teachers AS T, Lectures AS L, GroupsLectures AS GL, Faculties AS F, Departments AS D
WHERE T.ID = L.TeacherID AND L.ID = GL.LectureID AND GL.GroupID = G.ID AND G.DepartmentID = D.ID AND D.FacultyID = F.ID;

----------- FACULTIES AND GROUPS ----------
SELECT D.[Name] AS [Department`s Name], G.[Name] AS [Group`s Name]
FROM Departments AS D, Groups AS G
WHERE G.DepartmentID = D.ID;

----------- SAMANTHA ADAMS`S SUBJECTS ----------
SELECT S.[Name] AS [Subject`s Name]
FROM Subjects AS S, Lectures AS L, Teachers AS T
WHERE T.ID = L.TeacherID AND L.SubjectID = S.ID AND T.[Name] = 'Samantha' AND T.Surname = 'Adams';

----------- DATABASE THEORY DEPARTMENTS ----------
SELECT D.[Name] AS [Department`s Name]
FROM Departments AS D, Groups AS G, GroupsLectures AS GL, Lectures AS L, Subjects AS S
WHERE S.ID = L.SubjectID AND GL.LectureID = L.ID AND GL.GroupID = G.ID AND G.DepartmentID = D.ID AND S.[Name] = 'Database Theory';

----------- GROUPS COMPUTER SCIENCE ----------
SELECT G.[Name] AS [Group`s Name]
FROM Groups AS G, Departments AS D, Faculties AS F
WHERE D.FacultyID = F.ID AND G.DepartmentID = D.ID AND F.[Name] = 'Computer Science';

----------- GROUPS 5 YEAR AND THEIR FACULTIES ----------
SELECT G.[Name] AS [Group`s Name], F.[Name] AS [Faculty`s Name]
FROM Groups AS G, Departments AS D, Faculties AS F
WHERE D.FacultyID = F.ID AND G.DepartmentID = D.ID AND G.[Year] = 5;

----------- LECTURES IN B103 ROOM ----------
SELECT T.[Name] + ' ' + T.Surname AS [Teacher`s Full Name], S.[Name] AS [Subject`s Name], G.[Name] AS [Group`s Name]
FROM Teachers AS T, Groups AS G, GroupsLectures AS GL, Lectures AS L, Subjects AS S
WHERE L.SubjectID = S.ID AND L.TeacherID = T.ID AND GL.GroupID = G.ID AND GL.LectureID = L.ID AND L.LectureRoom = 'B103';