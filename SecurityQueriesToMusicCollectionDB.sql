
----------------- GRANT OLEGKORSH TO DATABASE --------------------
CREATE LOGIN OlegKorsh
WITH PASSWORD = '46+24*23JsguwgE';

CREATE USER OlegKorsh
FOR LOGIN OlegKorsh
GO
GRANT CONNECT OlegKorsh TO MusicCollection;

----------------- DENY OLEGSEB TO ALTER DATABASE --------------------
CREATE LOGIN OlegSeb
WITH PASSWORD = '567Herke+*-jsif';

CREATE USER OlegSeb
FOR LOGIN OlegSeb
GO
DENY ALTER OlegSeb TO MusicCollection;

----------------- GRANT DMYTRO TO CONNECT TO DATABASE --------------------
CREATE LOGIN Dmytro
WITH PASSWORD = 'w4ryh#erjgoG1';

CREATE USER Dmytro
FOR LOGIN Dmytro
GO
GRANT CONNECT Dmytro TO Albums;

----------------- GRANT BORIS, DIANA, MYKOLA, IRINA TO CONNECT TO DATABASE --------------------
CREATE LOGIN Boris
WITH PASSWORD = 'w4567g#erj78ioG1';
CREATE USER Boris
FOR LOGIN Boris
GO
GRANT CONNECT Boris TO Styles;

CREATE LOGIN Diana
WITH PASSWORD = 'wet45323w4etgoG1';
CREATE USER Diana
FOR LOGIN Diana
GO
GRANT CONNECT Diana TO Styles;

CREATE LOGIN Mykola
WITH PASSWORD = 'w4ey456etgoG1';
CREATE USER Mykola
FOR LOGIN Mykola
GO
GRANT CONNECT Mykola TO Styles;

CREATE LOGIN Irina
WITH PASSWORD = 'w4ryfewjgoG1';
CREATE USER Irina
FOR LOGIN Irina
GO
GRANT CONNECT Irina TO Styles;