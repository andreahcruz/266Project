SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Manager != 'Nike'
