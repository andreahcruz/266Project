SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Name FROM club WHERE club.Name LIKE 'club%' ORDER BY club.Name
SELECT club.Name FROM club WHERE club.Name != "Nike"
SELECT club.Name FROM club WHERE club.Name NOT IN ( SELECT player.Country FROM player WHERE player.Country = 'Nike' )
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club ORDER BY player.Events_number
SELECT club.Name FROM club WHERE club.Name IN ( SELECT club.Name FROM club GROUP BY club.Name ORDER BY COUNT(*) ASC )
SELECT DISTINCT club.Name FROM club WHERE club.Events_number > 1200000
SELECT player.Name FROM player WHERE player.Earnings > 1200000
SELECT club.Name , club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE player.Country = 'captain' OR player.Country = 'manager'
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Manager' OR player.Country = 'Captain'
SELECT club.Name FROM club WHERE club.Earnings = ( SELECT MAX(Earnings) FROM club )
SELECT club.Name FROM club WHERE club.Earnings = ( SELECT MAX(Earnings) FROM player )
SELECT club.Name, player.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID
SELECT club.Name, player.Country FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 GROUP BY club.Name
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID GROUP BY club.Name HAVING count(*) > 2
SELECT club.Name , club.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Country = "Sam Allardyce"
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Country = 'Sam Allardyce'
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT player.Name FROM player WHERE player.Club_ID IN ( SELECT player.Club_ID FROM player GROUP BY player.Club_ID HAVING count(*) > 2 ORDER BY count(*) DESC LIMIT 1 )
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Events_number) DESC
SELECT club.Name FROM club AS club INNER JOIN player AS player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Events_number) DESC
SELECT player.Name FROM player GROUP BY player.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club GROUP BY Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name FROM club WHERE club.Name NOT IN (SELECT player.Name FROM player)
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Events_number > 1400000 INTERSECT SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Events_number < 1100000
SELECT club.Name FROM club WHERE EXISTS (SELECT 1 FROM player WHERE player.Events_number > 1400000 AND player.Club_ID = club.Club_ID) AND EXISTS (SELECT 1 FROM player WHERE player.Events_number < 1100000 AND player.Club_ID = club.Club_ID)
SELECT Products.product_id , Products.product_name , Products.product_size FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Shipment_Items.shipment_id IN (SELECT Shipments.shipment_id FROM Shipments AS Shipments JOIN Orders AS Orders ON Shipments.order_id = Orders.order_id JOIN Customers AS Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code > 2) AND Shipment_Items.shipment_id IN (SELECT Shipments.shipment_id FROM Shipments AS Shipments JOIN Orders AS Orders ON Shipments.order_id = Orders.order_id JOIN Customers AS Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_last_name > 2)
SELECT Products.product_id , Products.product_name , Products.product_size FROM Products AS Products JOIN Order_Items AS Customers ON Products.product_id = Customers.product_id JOIN Shipment_Items AS Customer_Payment_Methods ON Customer_Payment_Methods.shipment_id = Customers.order_id WHERE Customer_Payment_Methods.order_item_id > 2 AND Customers.order_id > 2
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT gender_code , customer_first_name , customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products WHERE Products.product_id NOT IN (SELECT Shipment_Items.order_item_id FROM Shipment_Items GROUP BY Shipment_Items.order_item_id HAVING COUNT(Shipment_Items.order_item_id) >= 2)
SELECT Products.product_id , Customers.gender_code , Customers.customer_first_name FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Customers AS Customers ON Order_Items.order_id = Customers.customer_id GROUP BY Products.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Shipment_Items.shipment_id , SUM(Products.product_price * Products.product_name) FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id GROUP BY Shipment_Items.shipment_id ORDER BY SUM(Products.product_price * Products.product_name) ASC LIMIT 1
SELECT Orders.order_status_code, Orders.date_order_placed FROM Orders INNER JOIN Order_Items ON Order_Items.order_id = Orders.order_id ORDER BY Order_Items.product_id LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Customers ON Order_Items.order_id = Customers.customer_id WHERE Customers.gender_code = 'Female'
