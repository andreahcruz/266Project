SELECT COUNT(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name
SELECT T1.Name FROM club AS T1 WHERE T1.Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Country HAVING COUNT(T1.Country) > 1
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Country HAVING COUNT(T1.Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT T1.Manager, T1.Captain FROM club AS T1
SELECT T1.Manager , T1.Captain FROM club AS T1
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT T1.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT T1.Name, T2.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name , T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID HAVING SUM(T2.Wins_count) > 2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2 GROUP BY T1.Name
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Manager = "Sam Allardyce"
SELECT T2.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT Manufacturer, count(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT o.order_id , o.order_status_code , COUNT(DISTINCT oi.product_id) FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id
SELECT count(*) , T1.order_status_code , T1.order_id FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id
SELECT T2.Country FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2 ORDER BY T2.Earnings DESC LIMIT 1
SELECT T2.Country FROM player AS T1 INNER JOIN player AS T2 ON T1.Wins_count < T2.Wins_count WHERE T1.Wins_count > 2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT T1.Manufacturer FROM club AS T1 GROUP BY T1.Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Manufacturer FROM club AS T1 GROUP BY T1.Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 UNION SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings < 1100000
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 AND T2.Earnings < 1100000
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T1.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR T2.order_item_id > 1
SELECT T1.date_order_placed FROM Orders AS T1 WHERE T1.order_id IN ( SELECT T1.order_id FROM Order_Items AS T1 GROUP BY T1.order_id HAVING COUNT(*) > 1 )
SELECT T1.product_id , T1.product_name , T1.product_price , T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING count(*) < 2
SELECT T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.payment_method_code ORDER BY COUNT(T2.payment_method_code) DESC LIMIT 1
SELECT T1.payment_method_code FROM Customer_Payment_Methods AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY COUNT(T1.customer_id) DESC LIMIT 1
SELECT T1.gender_code, COUNT(T3.order_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id INNER JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id HAVING COUNT(T3.order_id) > 2 AND COUNT(DISTINCT T3.product_id) >= 3
SELECT T1.customer_id , T1.customer_first_name , T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.customer_id HAVING count(*) > 2 INTERSECT SELECT T1.customer_id FROM Customers AS T1 JOIN Order_Items AS T2 ON T1.customer_id = ( SELECT T3.customer_id FROM Orders AS T3 JOIN Order_Items AS T4 ON T3.order_id = T4.order_id GROUP BY T3.customer_id HAVING count(*) >= 3 )
SELECT T1.customer_first_name , T1.customer_middle_initial , T1.customer_last_name FROM Customers AS T1 WHERE T1.customer_id NOT IN (SELECT T2.customer_id FROM Orders AS T2)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(T2.order_item_id) DESC LIMIT 1
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(T2.order_id) DESC LIMIT 1
SELECT T1.order_id , SUM(T3.product_price) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY SUM(T3.product_price) ASC LIMIT 1
SELECT T1.order_id , SUM(T3.product_price) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY SUM(T3.product_price) ASC LIMIT 1
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'F'
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = "F"
SELECT T1.product_price , T1.product_size FROM Products AS T1 WHERE T1.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT T1.product_price, T1.product_size FROM Products AS T1 WHERE T1.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT count(DISTINCT product_name) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT count(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
