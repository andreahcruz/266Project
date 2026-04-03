SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Country HAVING COUNT(T1.Player_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT T1.Manager, T1.Captain FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Manager, T1.Captain FROM club AS T1
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name, T2.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT T1.Earnings FROM player AS T1 WHERE T1.Country IN ('Australia', 'Zimbabwe')
SELECT SUM(Earnings) FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT COUNT(DISTINCT T1.order_item_id) AS num_products, T2.order_status_code, T2.order_id FROM Order_Items T1 JOIN Orders T2 ON T1.order_id = T2.order_id
SELECT T1.Country FROM player AS T1 WHERE T1.Wins_count > 2 ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Wins_count < T2.Wins_count JOIN club ON T2.Club_ID = club.Club_ID WHERE T1.Wins_count > 2 AND T2.Wins_count = (SELECT MAX(Wins_count) FROM player WHERE Wins_count > 2)
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT T1.Name, AVG(T2.Earnings) FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 OR T1.Earnings < 1100000
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Country = T2.Country JOIN club AS T3 ON T1.Club_ID = T3.Club_ID WHERE T1.Earnings > 1400000 AND T2.Earnings < 1100000
SELECT DISTINCT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T1.date_order_placed IN (SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.date_order_placed HAVING COUNT(T2.order_item_id) > 1)
SELECT MIN(T1.date_order_placed) AS earliest_order_date, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) > 1
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.payment_method_code FROM Customer_Payment_Methods AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY COUNT(T1.customer_id) DESC LIMIT 1
SELECT T1.payment_method_code FROM Customer_Payment_Methods AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY COUNT(T1.customer_id) DESC LIMIT 1
SELECT T1.gender_code, COUNT(T3.order_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT OI.order_item_id) > 2 AND COUNT(DISTINCT O.order_id) > 2
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT OI.order_item_id) > 2 AND COUNT(DISTINCT OI.order_id) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(T2.order_item_id) DESC LIMIT 1
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(T2.order_item_id) DESC
SELECT T1.order_id, SUM(T3.product_price) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY SUM(T3.product_price) ASC LIMIT 1
SELECT Orders.order_id, SUM(Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'F'
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'F'
SELECT T1.product_price, T1.product_size FROM Products AS T1 JOIN ( SELECT product_id, AVG(product_price) AS avg_price FROM Products GROUP BY product_id ) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_price > T2.avg_price
SELECT T1.product_price, T1.product_size FROM Products AS T1 JOIN (SELECT product_id, AVG(product_price) AS avg_price FROM Products GROUP BY product_id) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_price > T2.avg_price
SELECT COUNT(DISTINCT T1.product_id) FROM Products T1 LEFT JOIN Order_Items T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT COUNT(DISTINCT T1.product_id) FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
