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
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) > 1
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
SELECT DISTINCT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2
SELECT DISTINCT c.Name FROM club AS c JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT Manufacturer, COUNT(*) AS club_count FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) AS club_count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) AS number_of_products FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) AS product_count FROM Orders AS o LEFT JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Player_ID IS NULL
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON c.Club_ID = p.Club_ID WHERE p.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING MAX(Earnings) > 1400000 AND MIN(Earnings) < 1100000
SELECT DISTINCT o.date_order_placed FROM Orders o LEFT JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING o.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(oi.order_item_id) > 1
SELECT DISTINCT o.date_order_placed FROM Orders o LEFT JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING o.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(oi.order_item_id) > 1
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products AS p LEFT JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price, p.product_color HAVING COUNT(DISTINCT oi.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT c.gender_code, COUNT(oi.product_id) AS number_of_products FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.gender_code
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name FROM Customers AS c LEFT JOIN Orders AS o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products AS p LEFT JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price, p.product_color HAVING COUNT(oi.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price HAVING COUNT(*) = ( SELECT MAX(product_order_count) FROM ( SELECT COUNT(*) AS product_order_count FROM Order_Items GROUP BY product_id ) )
SELECT oi.order_id, SUM(p.product_price) AS sum FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id GROUP BY oi.order_id ORDER BY sum ASC LIMIT 1
SELECT o.order_id, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id WHERE c.gender_code = 'Female'
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Customers c JOIN Orders o ON o.customer_id = c.customer_id JOIN Order_Items oi ON oi.order_id = o.order_id JOIN Products p ON p.product_id = oi.product_id WHERE c.gender_code = 'Female'
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(*) AS unsold_product_count FROM Products WHERE product_id NOT IN ( SELECT DISTINCT product_id FROM Order_Items WHERE product_id IS NOT NULL )
SELECT COUNT(*) AS number_of_products_not_ordered FROM Products WHERE product_id NOT IN ( SELECT DISTINCT product_id FROM Order_Items WHERE product_id IS NOT NULL )
SELECT COUNT(*) AS customer_count FROM Customers c LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id WHERE cpm.customer_id IS NULL
