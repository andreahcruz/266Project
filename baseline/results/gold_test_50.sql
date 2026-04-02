SELECT count(*) FROM club	soccer_3
SELECT count(*) FROM club	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Wins_count  >  2	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Wins_count  >  2	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1	soccer_3
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	soccer_3
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	soccer_3
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000	soccer_3
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000	soccer_3
SELECT COUNT (DISTINCT Country) FROM player	soccer_3
SELECT COUNT (DISTINCT Country) FROM player	soccer_3
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"	soccer_3
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"	soccer_3
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3	e_commerce
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3	e_commerce
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id	e_commerce
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id	e_commerce
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1	e_commerce
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1	e_commerce
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id	e_commerce
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id	e_commerce
SELECT product_id ,  product_name ,  product_price ,  product_color FROM Products EXCEPT SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.product_id HAVING count(*)  >=  2	e_commerce
select t1.product_id ,  t1.product_name ,  t1.product_price ,  t1.product_color from products as t1 join order_items as t2 on t1.product_id  =  t2.product_id join orders as t3 on t2.order_id  =  t3.order_id group by t1.product_id having count(*) < 2	e_commerce
