
-------- ADDING NEW ALBUM ----------
CREATE TRIGGER AddingAlbum
ON Playlists
INSTEAD OF UPDATE, INSERT
AS
BEGIN
   DECLARE @nameNew NVARCHAR(MAX)
   DECLARE @nameOld NVARCHAR(MAX)
   SELECT @nameNew = [Name] FROM INSERTED
   SELECT @nameOld = [Name] FROM Playlists
   IF (@nameNew = @nameOld)
   BEGIN
    RAISERROR('This album has already exists!', 0, 1)
    ROLLBACK TRANSACTION  
   END
END

-------- WITHOUT DELETING THE BEATLES SONGS ----------
CREATE TRIGGER WithoutDeletingBeatles
ON Songs
INSTEAD OF DELETE
AS
BEGIN
   DECLARE @nameNew NVARCHAR(MAX)
   DECLARE @nameOld NVARCHAR(MAX)
   SELECT @nameNew = [Name] FROM INSERTED
   SELECT @nameOld = S.[Name] FROM Songs AS S
   JOIN Albums AS A ON S.AlbumID = A.ID
   JOIN MusicGroups AS MG ON A.MusicGroupID = MG.ID
   WHERE MG.[Name] = 'The Beatles'
   IF (@nameNew = @nameOld)
   BEGIN
    RAISERROR('You cannot delete a song by The Beatles!', 0, 1)
    ROLLBACK TRANSACTION  
   END
END

-------- DELETING AND REPLACING TO ARCHIVE ----------
CREATE TRIGGER DeletingSong
ON Songs
AFTER DELETE
AS
INSERT INTO SongsArchive(SongID)

-------- WITHOUT ADDING DARK POWER POP SONGS ----------
CREATE TRIGGER WithoutAddingDarkPowerPop
ON Songs
INSTEAD OF UPDATE, INSERT
AS
BEGIN
   DECLARE @StyleID INT
   SELECT @StyleID FROM Styles
   WHERE [Name] = 'Dark Power Pop'
   IF EXISTS (SELECT * FROM INSERTED WHERE StyleID = @StyleID)   
   BEGIN
    RAISERROR('You cannot add a song in Dark Power Pop style', 0, 1)
    ROLLBACK TRANSACTION  
   END
END
