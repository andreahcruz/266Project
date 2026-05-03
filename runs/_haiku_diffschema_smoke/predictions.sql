SELECT COUNT(Club_ID) FROM club
SELECT count(*) FROM club
SELECT club.Manager, club.Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT club.Sponsor FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Sponsor FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT DISTINCT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Customers.customer_id IN ( SELECT Orders.customer_id FROM Orders GROUP BY Orders.customer_id HAVING COUNT(*) > 2 ) AND Customers.customer_id IN ( SELECT Orders.customer_id FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.customer_id HAVING SUM(Order_Items.order_item_status_code) >= 3 OR COUNT(Order_Items.order_item_id) >= 3 )
SELECT DISTINCT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Customers.customer_id IN ( SELECT Orders.customer_id FROM Orders GROUP BY Orders.customer_id HAVING COUNT(DISTINCT Orders.order_id) > 2 ) AND Customers.customer_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(*) >= 3 )
