SELECT COUNT(Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Manager, Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT player.Country FROM player WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT Customers.customer_id, Customers.country, Customers.customer_last_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.country, Customers.customer_last_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(DISTINCT Order_Items.order_item_id) >= 3
SELECT Customers.customer_id, Customers.customer_last_name, Customers.country FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.customer_last_name, Customers.country HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(DISTINCT Order_Items.order_item_id) >= 3
