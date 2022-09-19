
------------ EDWARD HOPPER AUDITORY LECTURES ------------
SELECT LR.[Name] AS [Auditory name]
FROM LectureRooms AS LR
JOIN Schedules AS S ON S.LectureRoomID = LR.ID 
JOIN Lectures AS L ON L.ID = S.LectureID
JOIN Teachers AS T ON T.ID = L.TeacherID
WHERE T.[Name] = 'Edward' AND T.Surname = 'Hopper';

------------ ASSISTANS IN F505 GROUP ------------
SELECT T.Surname AS [Assistant surname]
FROM Teachers AS T
JOIN Assistans AS A ON A.TeacherID = T.ID
JOIN Curators AS C ON C.TeacherID = T.ID
JOIN GroupsCurators AS GC ON GC.CuratorID = C.ID
JOIN Groups AS G ON GC.GroupID = G.ID
WHERE G.[Name] = 'F505';

------------ ALEX CHARMACK IN GROUP 5 YEAR ------------
SELECT S.[Name] AS [Alex Charmack subjects]
FROM Subjects AS S
JOIN Lectures AS L ON L.SubjectTD = S.ID
JOIN Teachers AS T ON L.TeacherID = T.ID
JOIN GroupsLectures AS GL ON GL.LectureID = L.ID
JOIN Groups AS G ON GL.GroupID = G.ID
WHERE G.[Year] = 5 AND T.[Name] = 'Alex' AND T.Surname = 'Charmack';

------------ TEACHERS RELAXING ON MONDAYS ------------
SELECT T.Surname
FROM Teachers AS T
JOIN Lectures AS L ON L.TeacherID = T.ID
JOIN Schedules AS S ON S.LectureID = L.ID
WHERE S.DayOfWeek != 1;

------------ AUDITORIES WITHOUT WEDNESDAYS ------------
SELECT LR.[Name], Building
FROM LectureRooms AS LR
JOIN Schedules AS S ON S.LectureRoomID = LR.ID
JOIN Lectures AS L ON S.LectureID = L.ID
WHERE DayOfWeek != 3 AND Week != 2 AND L.ID != 3
GROUP BY LR.[Name], Building;

------------ COMPUTER SCIENCE BUT NOT SOFTWARE DEVELOPMENT ------------
SELECT T.[Name] + ' ' + T.Surname AS [Teacher full name]
FROM Teachers AS T
JOIN Curators AS C ON C.TeacherID = T.ID
JOIN GroupsCurators AS GC ON GC.CuratorID = C.ID
JOIN Groups AS G ON GC.GroupID = G.ID
JOIN Departments AS D ON G.DepartmentID = D.ID
JOIN Faculties AS F ON D.FacultyID = F.ID
WHERE F.[Name] = 'Computer Science' AND D.[Name] != 'Software Development';

------------ BUILDINGS EXISTS EVERYWHERE ------------
SELECT D.Building
FROM Departments AS D
WHERE EXISTS (SELECT D.Building 
              FROM Departments AS D
              JOIN Faculties AS F ON F.ID = D.FacultyID
              JOIN Groups AS G ON G.DepartmentID = D.ID
              JOIN GroupsLectures AS GL ON GL.GroupID = G.ID
              JOIN Lectures AS L ON GL.LectureID = L.ID
              JOIN Schedules AS S ON S.LectureID = L.ID
              JOIN LectureRooms AS LR ON S.LectureRoomID = LR.ID);

------------ DEANS HEADS TEACHERS CURATORS ASSISTANS ------------
SELECT T.[Name] + ' ' + T.Surname AS [Teacher full name]
FROM Teachers AS T
JOIN Deans AS D ON D.TeacherID = T.ID
UNION ALL
SELECT T.[Name] + ' ' + T.Surname AS [Teacher full name]
FROM Teachers AS T
JOIN Heads AS H ON H.TeacherID = T.ID
UNION ALL
SELECT T.[Name] + ' ' + T.Surname AS [Teacher full name]
FROM Teachers AS T
UNION ALL
SELECT T.[Name] + ' ' + T.Surname AS [Teacher full name]
FROM Teachers AS T
JOIN Curators AS C ON C.TeacherID = T.ID
UNION ALL
SELECT T.[Name] + ' ' + T.Surname AS [Teacher full name]
FROM Teachers AS T
JOIN Assistans AS A ON A.TeacherID = T.ID
GROUP BY T.[Name] + ' ' + T.Surname;

------------ D123 AND T24 AUDITORIES ------------
SELECT DISTINCT S.DayOfWeek
FROM Schedules AS S
JOIN LectureRooms AS LR ON S.LectureRoomID = LR.ID
WHERE LR.[Name] = 'D123' AND LR.[Name] = 'T24';