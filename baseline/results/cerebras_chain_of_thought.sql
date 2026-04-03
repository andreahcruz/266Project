SELECT COUNT(Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC;
SELECT Name FROM club ORDER BY Name ASC;
SELECT Name FROM club WHERE Manufacturer != 'Nike';
SELECT Name FROM club WHERE Manufacturer != 'Nike';
SELECT Name FROM player ORDER BY Wins_count ASC;
SELECT Name FROM player ORDER BY Wins_count ASC;
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000;
SELECT Country FROM player WHERE Earnings > 1200000 GROUP BY Country
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1;
SELECT Manufacturer, COUNT(DISTINCT Club_ID) as count FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Club_ID) > 1 ORDER BY count DESC
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1;
SELECT Country FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY Country HAVING COUNT(player.Player_ID) > 1 ORDER BY Country;
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT Manager, Captain FROM club;
SELECT Manager, Captain FROM club;
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1;
SELECT Name FROM player WHERE Earnings IS NOT NULL ORDER BY Earnings DESC LIMIT 1;
SELECT p.Name, c.Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID;
SELECT p.Name, c.Name AS Club_Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID;
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID HAVING COUNT(CASE WHEN p.Wins_count > 2 THEN 1 END) > 0;
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce';
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce';
SELECT Manufacturer, COUNT(Club_ID) as Club_Count FROM club GROUP BY Manufacturer ORDER BY Club_Count DESC;
SELECT Manufacturer, COUNT(Club_ID) as count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe';
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe';
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS num_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT O.order_id, O.order_status_code, COUNT(OI.order_item_id) AS num_products FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1;
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 GROUP BY T2.Country ORDER BY MAX(T1.Earnings) DESC LIMIT 1;
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c INNER JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY avg_earnings DESC;
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY avg_earnings DESC;
SELECT Manufacturer, COUNT(*) as count FROM club GROUP BY Manufacturer ORDER BY count DESC LIMIT 1
SELECT Manufacturer, COUNT(*) as count FROM club GROUP BY Manufacturer ORDER BY count DESC LIMIT 1
SELECT Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL;
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player );
SELECT CASE WHEN Earnings > 1400000 THEN 'High Earnings' WHEN Earnings < 1100000 THEN 'Low Earnings' END AS Earnings_Group, Country FROM player GROUP BY Earnings_Group, Country ORDER BY Earnings_Group;
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 INTERSECT SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings < 1100000
SELECT date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY date_order_placed HAVING COUNT(*) > 1 OR date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
SELECT MIN(date_order_placed) AS earliest_order_date, date_order_placed FROM Orders WHERE order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1;
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT C.gender_code, COUNT(OI.order_item_id) AS num_products FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.gender_code ORDER BY C.gender_code
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_ItemsOI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(DISTINCT OI.order_item_id) >= 3
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(DISTINCT OI.order_item_id) >= 3
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL;
SELECT C.customer_first_name, C.customer_last_name, C.customer_middle_initial FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL;
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id GROUP BY p.product_id ORDER BY COUNT(p.product_id) DESC LIMIT 1;
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN ( SELECT product_id, COUNT(*) as order_count FROM Order_Items GROUP BY product_id ORDER BY order_count DESC ) o ON p.product_id = o.product_id ORDER BY o.order_count DESC
SELECT o.order_id, SUM(p.product_price) AS sum_of_product_prices FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id JOIN Orders o ON oi.order_id = o.order_id GROUP BY o.order_id ORDER BY sum_of_product_prices ASC LIMIT 1;
SELECT order_id, SUM(product_price) AS total_cost FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY order_id ORDER BY total_cost ASC LIMIT 1;
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'F';
SELECT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'F'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);
SELECT COUNT(DISTINCT T1.product_id) FROM Products T1 LEFT JOIN Order_Items T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL;
SELECT COUNT(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items ) AND product_id NOT IN ( SELECT parent_product_id FROM Products WHERE parent_product_id IS NOT NULL AND product_id IN ( SELECT product_id FROM Order_Items ) )
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.payment_method_code IS NULL;
