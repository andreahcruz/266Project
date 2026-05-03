SELECT COUNT(club.Club_ID) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Wins_count ASC
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Wins_count ASC
SELECT DISTINCT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1200000
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Captain > 1200000
SELECT club.Manager , club.Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT club.Name FROM club WHERE club.Earnings = ( SELECT MAX(Earnings) FROM club )
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name, player.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID
SELECT club.Name, player.Club_ID FROM player AS club JOIN club AS player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT club.Name , club.Name FROM club WHERE club.Manager = 'Sam Allardyce'
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE club.Captain = 'Sam Allardyce'
SELECT club.Country FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Country FROM player AS player JOIN club AS club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 GROUP BY player.Club_ID ORDER BY player.Wins_count DESC LIMIT 1
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club WHERE club.Club_ID NOT IN (SELECT player.Club_ID FROM player)
SELECT club.Name FROM player AS club WHERE club.Events_number = 0
SELECT player.Country FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 INTERSECT SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings < 1100000
SELECT Products.product_id , Products.product_name , Customers.gender_code FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IN (SELECT Orders.order_id FROM Orders GROUP BY Orders.order_id HAVING COUNT(Orders.order_id) > 2) AND Order_Items.order_id IN (SELECT Orders.order_id FROM Orders GROUP BY Orders.order_id HAVING COUNT(Orders.order_id) > 2)
SELECT Products.product_id , Products.product_name , Products.product_color FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_status_code > 2 AND Orders.date_order_placed > '2022-01-01' AND Order_Items.order_id > 3
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_name FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.date_order_placed = '0000-00-00' GROUP BY Products.product_id HAVING count(*) < 2
SELECT Products.product_id , Customers.DESCRIPITIVE_ATTRIBUTE_8 , Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Products.product_id ORDER BY COUNT(Orders.order_id) DESC LIMIT 1
SELECT Products.product_id , Products.DESCRIBITIVE_ATTRIBUTE_3 , Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id , SUM(Products.product_price) FROM Products AS Products JOIN Order_Items AS Orders ON Products.product_id = Orders.order_id JOIN Shipments AS T3_1 ON Orders.product_id = T3_1.invoice_number GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Orders.order_id, SUM(Order_Items.order_item_status_code) AS total_cost FROM Orders AS Orders JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id ORDER BY SUM(Order_Items.order_item_status_code) ASC LIMIT 1
SELECT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Orders.order_id = Order_Items.order_id JOIN Customers ON Customers.customer_id = Orders.customer_id WHERE Customers.gender_code = 'female'
