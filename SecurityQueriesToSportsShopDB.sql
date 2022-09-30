
--------------- BAN MARK FROM SELLERS ----------------
CREATE LOGIN Mark
WITH PASSWORD = '!w2435Gs90-';

CREATE USER Mark
FOR LOGIN Mark
GO
DENY CONNECT Mark TO Sellers;

--------------- GRANT DAVID SELLERS INFORMATION ----------------
CREATE LOGIN David
WITH PASSWORD = '34+@werRtgsE';

CREATE USER David
FOR LOGIN David
GO
GRANT CONNECT David TO Sellers;

--------------- GRANT OLGA ALL SPORTS SHOP INFORMATION ----------------
CREATE LOGIN Olga
WITH PASSWORD = '456+24*23TruwgE';

CREATE USER Olga
FOR LOGIN Olga
GO
GRANT CONNECT Olga TO SportsShop;

--------------- GRANT KONSTANTYN SELLERS INFORMATION ----------------
CREATE LOGIN Konstantyn
WITH PASSWORD = '954eThred*';

CREATE USER Konstantyn
FOR LOGIN Konstantyn
GO
GRANT CONNECT Konstantyn TO Sellers, Goods;