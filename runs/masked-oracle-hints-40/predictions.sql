SELECT COUNT(Club_ID) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Manufacturer FROM club ORDER BY club.Manufacturer ASC
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.Manufacturer FROM club JOIN player ON player.Club_ID = club.Club_ID ORDER BY player.Wins_count
SELECT club.Manufacturer FROM club JOIN player ON player.Club_ID = club.Club_ID ORDER BY player.Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT player.Country FROM club AS club JOIN player ON player.Club_ID = club.Club_ID WHERE club.Manufacturer > 1200000
SELECT club.Manager , club.Captain FROM club
SELECT club.Manager, club.Captain FROM club INNER JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Manufacturer FROM club JOIN player ON player.Club_ID = club.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Manufacturer, player.Name FROM player AS club JOIN club AS player ON club.Club_ID = player.Club_ID
SELECT club.Manufacturer, club.Club_ID FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2
SELECT player.Events_number FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT Name FROM club WHERE Captain = 'Sam Allardyce'
SELECT player.Country FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Wins_count DESC LIMIT 1
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT club.Manufacturer FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID GROUP BY player.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer ORDER BY COUNT(club.Manufacturer) DESC LIMIT 1
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer ORDER BY COUNT(club.Manufacturer) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID = 0
SELECT club.Manufacturer FROM club WHERE club.Earnings = 0
SELECT player.Country FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT player.Country FROM player WHERE player.Earnings > 1400000 INTERSECT SELECT player.Country FROM player WHERE player.Earnings < 1100000
SELECT Products.product_id , Products.product_color , Products.product_size FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Order_Items.product_id = Products.product_id GROUP BY Products.product_id HAVING COUNT(Order_Items.product_id) > 2
SELECT Products.product_id , Products.product_color , Products.product_size FROM Products AS Products JOIN Orders AS Orders ON Orders.customer_id = Products.product_id JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.product_id > 2 AND Order_Items.product_id >= 3
SELECT Customers.customer_last_name , Customers.customer_first_name , Customers.gender_code FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Products.product_id, Products.product_color, Products.product_price, Products.product_name FROM Products INNER JOIN Order_Items ON Order_Items.product_id = Products.product_id INNER JOIN Orders ON Orders.order_id = Order_Items.order_id WHERE Orders.customer_id < 2
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products AS Products INNER JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_name ORDER BY COUNT(Products.product_name) DESC LIMIT 1
SELECT Products.product_id , Products.product_color , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id ORDER BY count(*) DESC LIMIT 1
SELECT Orders.order_id , SUM(Products.product_price) FROM Products AS Products JOIN Order_Items AS Orders ON Products.product_id = Orders.product_id JOIN Shipments AS Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id ORDER BY Order_Items.product_id LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
