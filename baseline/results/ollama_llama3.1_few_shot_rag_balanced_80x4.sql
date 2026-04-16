SELECT COUNT(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT T1.Name FROM club AS T1 WHERE T1.Manufacturer != 'Nike'
SELECT T1.Name FROM club AS T1 LEFT JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manufacturer != 'Nike' AND T2.Club_ID IS NULL
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Wins_count ASC
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1200000 GROUP BY T2.Country
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT T1.Country FROM player AS T1 GROUP BY T1.Country HAVING COUNT(T1.Player_ID) > 1
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Country HAVING COUNT(T1.Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT count(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT count(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipments
SELECT COUNT(*) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT T1.Transmitter FROM radio AS T1 INNER JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID ORDER BY T1.ERP_kW ASC
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(ID) > 3
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Citizenship = "United States"
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Citizenship = 'United States'
SELECT count(*) FROM driver WHERE Racing_Series = "NASCAR"
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
SELECT Name FROM driver ORDER BY Name ASC
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Name ORDER BY T1.Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = "Normal"
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = "Normal"
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT T1.Last_Name FROM Students AS T1 WHERE T1.Gender_MFU != "M"
SELECT T1.Last_Name FROM Students AS T1 WHERE T1.Gender_MFU != "M"
SELECT DISTINCT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T2.Exam_ID) >= 3
SELECT * FROM Students
SELECT T1.Student_ID, T1.First_Name, T1.Middle_Name, T1.Last_Name, T1.Gender_MFU, T1.Student_Address, T1.Email_Adress, T1.Cell_Mobile_Phone FROM Students AS T1
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT count(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT T1.product_name FROM Products AS T1 ORDER BY T1.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT T1.Manager, T1.Captain FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Name
SELECT T1.Manager, T1.Captain FROM club AS T1
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T2.Earnings DESC LIMIT 1
SELECT T2.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
