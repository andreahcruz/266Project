SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club
SELECT club.Name FROM club WHERE club.Name IS NOT NULL ORDER BY club.Name ASC
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manager != "Nike"
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings ASC
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY COUNT(player.Name) ASC
SELECT DISTINCT Name FROM club WHERE Sponsor > 1200000
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manufacturer > 1200000
SELECT player.Name, player.Country FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings = 1 OR player.Events_number = 1
SELECT player.Name, player.Country FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings = 1 OR player.Events_number = 1
SELECT player.Name FROM player WHERE player.Earnings = ( SELECT MAX(Earnings) FROM player )
SELECT player.Name FROM player WHERE player.Earnings = ( SELECT MAX(Earnings) FROM player )
SELECT club.Name, player.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Manager FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2
SELECT player.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID GROUP BY player.Name HAVING count(*) > 2
SELECT club.Name , club.Manager FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Name = "Sam Allardyce"
SELECT Name FROM club WHERE Manager = 'Sam Allardyce'
SELECT Name FROM player WHERE Earnings > 2 ORDER BY Earnings DESC LIMIT 1
SELECT player.Name FROM player WHERE player.Earnings > 2 GROUP BY player.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY AVG(Earnings) DESC
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID GROUP BY player.Name ORDER BY AVG(player.Earnings) DESC
SELECT player.Name FROM player GROUP BY player.Name ORDER BY COUNT(player.Name) DESC LIMIT 1
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY COUNT(player.Name) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings = 0
SELECT Name FROM player WHERE Earnings > 1400000 INTERSECT SELECT Name FROM player WHERE Earnings < 1100000
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE club.Name = 'over 1400000' INTERSECT SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE club.Name = 'below 1100000'
SELECT Products.product_id, Products.parent_product_id, Products.product_name FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Order_Items.order_id > 2 AND Order_Items.product_id > 2
SELECT Products.product_id, Products.product_name, Products.product_color FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.product_id = ( SELECT product_id FROM Order_Items GROUP BY product_id HAVING count(*) > 2 ) AND Order_Items.order_id = ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING count(*) >= 3 )
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_middle_initial FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id WHERE Shipment_Items.shipment_id IS NULL
SELECT Order_Items.product_id, Customers.gender_code, Customers.customer_first_name FROM Order_Items JOIN Customers ON Order_Items.order_id = Orders.order_id JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Order_Items.product_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id ORDER BY COUNT(Order_Items.product_id) DESC LIMIT 1 )
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id ORDER BY count(*) DESC LIMIT 1
SELECT Shipment_Items.shipment_id , Shipment_Items.order_item_id FROM Shipment_Items JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Shipment_Items.shipment_id ORDER BY sum(Shipment_Items.order_item_id) LIMIT 1
SELECT Order_Items.product_id, Order_Items.order_item_status_code FROM Orders AS Orders JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id ORDER BY Order_Items.order_item_status_code ASC LIMIT 1
SELECT DISTINCT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers INNER JOIN Order_Items ON Customers.customer_id = Order_Items.product_id INNER JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_color = 'Female'
