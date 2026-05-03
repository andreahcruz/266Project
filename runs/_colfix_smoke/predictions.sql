SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Captain FROM club ORDER BY Captain ASC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name != 'Nike'
SELECT DISTINCT club.Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL OR player.Name != 'Nike' GROUP BY club.Club_ID HAVING COUNT(CASE WHEN player.Name = 'Nike' THEN 1 END) = 0
SELECT Earnings FROM player ORDER BY Wins_count ASC
SELECT Earnings FROM player ORDER BY Wins_count ASC
