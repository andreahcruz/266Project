SELECT COUNT(Club_ID) FROM club;
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC;
SELECT Name FROM club ORDER BY Name ASC;
SELECT Manager, Captain FROM club;
SELECT Manager, Captain FROM club;
SELECT Name FROM club WHERE Manufacturer != 'Nike';
SELECT Name FROM club WHERE Manufacturer != 'Nike';
SELECT Name FROM player ORDER BY Wins_count ASC;
SELECT Name FROM player ORDER BY Wins_count ASC;
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1;
SELECT Name FROM player WHERE Earnings IS NOT NULL ORDER BY Earnings DESC LIMIT 1;
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000;
SELECT Country FROM player WHERE Earnings > 1200000 GROUP BY Country
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1;
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 GROUP BY T2.Country ORDER BY MAX(T1.Earnings) DESC LIMIT 1;
SELECT p.Name, c.Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID;
SELECT p.Name, c.Name AS Club_Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID;
SELECT Name FROM club WHERE Club_ID IN ( SELECT Club_ID FROM player GROUP BY Club_ID HAVING Wins_count > 2 )
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2;
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce';
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce';
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c INNER JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY avg_earnings DESC;
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY avg_earnings DESC;
SELECT Manufacturer, COUNT(Club_ID) as Club_Count FROM club GROUP BY Manufacturer ORDER BY Club_Count DESC;
SELECT Manufacturer, COUNT(Club_ID) as count FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) as count FROM club GROUP BY Manufacturer ORDER BY count DESC LIMIT 1
SELECT Manufacturer, COUNT(*) as count FROM club GROUP BY Manufacturer ORDER BY count DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Club_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1
SELECT Country FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY Country HAVING COUNT(player.Player_ID) > 1 ORDER BY Country;
SELECT Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Player_ID IS NULL;
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player );
SELECT CASE WHEN Earnings > 1400000 THEN 'High Earnings' WHEN Earnings < 1100000 THEN 'Low Earnings' END AS Earnings_Group, Country FROM player GROUP BY Earnings_Group, Country ORDER BY Earnings_Group;
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 INTERSECT SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe';
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe';
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(DISTINCT OI.order_item_id) >= 3
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(DISTINCT OI.order_item_id) >= 3
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS num_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT O.order_id, O.order_status_code, COUNT(OI.order_item_id) AS num_products FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code
SELECT date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY date_order_placed HAVING COUNT(*) > 1 OR date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
SELECT MIN(date_order_placed) AS earliest_order_date, date_order_placed FROM Orders WHERE order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL;
SELECT C.customer_first_name, C.customer_last_name, C.customer_middle_initial FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL;
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products P LEFT JOIN Order_Items OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(OI.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_id) < 2
