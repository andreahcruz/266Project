SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT DISTINCT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) AS club_count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT t1.order_id, t1.order_status_code, COUNT(t2.product_id) AS product_count FROM Orders AS t1 JOIN Order_Items AS t2 ON t1.order_id = t2.order_id GROUP BY t1.order_id, t1.order_status_code
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) AS product_count FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT c.Name FROM club AS c JOIN player AS p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY AVG(p.Earnings) DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player WHERE Club_ID IS NOT NULL )
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON c.Club_ID = p.Club_ID WHERE p.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 UNION SELECT Country FROM player WHERE Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING SUM(CASE WHEN Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT O.date_order_placed FROM Orders AS O LEFT JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.date_order_placed HAVING O.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(OI.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.date_order_placed HAVING COUNT(*) > 1
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id, T1.product_name, T1.product_price, T1.product_color HAVING COUNT(DISTINCT T2.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT c.gender_code, COUNT(oi.product_id) AS number_of_products FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY c.gender_code
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers AS C JOIN Orders AS O ON C.customer_id = O.customer_id JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY C.customer_id, C.customer_first_name, C.customer_last_name HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(OI.order_item_id) >= 3
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id, T1.customer_first_name, T1.customer_last_name HAVING COUNT(DISTINCT T2.order_id) > 2 AND COUNT(T3.order_item_id) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders )
SELECT customer_first_name, customer_last_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders )
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id, P.product_name, P.product_price, P.product_color HAVING COUNT(*) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Order_Items AS oi JOIN Products AS p ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price HAVING COUNT(*) = ( SELECT MAX(product_count) FROM ( SELECT COUNT(*) AS product_count FROM Order_Items GROUP BY product_id ) )
SELECT T1.order_id, SUM(T3.product_price) AS total_price FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY total_price ASC LIMIT 1
SELECT T1.order_id, SUM(T3.product_price) AS total_cost FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT T4.product_name, T4.product_price, T4.product_description FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id JOIN Products AS T4 ON T3.product_id = T4.product_id WHERE T1.gender_code = 'Female'
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id JOIN Products AS p ON oi.product_id = p.product_id WHERE c.gender_code = 'Female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT COUNT(*) FROM Customers AS C LEFT JOIN Customer_Payment_Methods AS CPM ON C.customer_id = CPM.customer_id WHERE CPM.customer_id IS NULL
