SELECT COUNT(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name
SELECT T1.Name FROM club AS T1 WHERE T1.Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT T1.Country FROM player AS T1 WHERE T1.Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Country HAVING COUNT(T1.Country) > 1
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Country HAVING COUNT(T1.Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
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
SELECT AVG(T1.product_price) FROM Products AS T1
SELECT COUNT(Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID ORDER BY T1.ERP_kW ASC
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT T1.Affiliation FROM city_channel AS T1 GROUP BY T1.Affiliation HAVING COUNT(T1.ID) > 3
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T1.Citizenship = 'United States'
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT count(*) FROM driver WHERE Racing_Series = "NASCAR"
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model IN (SELECT Model FROM vehicle WHERE Racing_Series = 'NASCAR')
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
SELECT Name FROM driver ORDER BY Name ASC
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = "Normal"
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Comments FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT T1.Last_Name FROM Students AS T1 WHERE T1.Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T2.Exam_ID) >= 3
SELECT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T1.Question_ID) >= 3
SELECT Student_ID, First_Name, Middle_Name, Last_Name, Gender_MFU, Student_Address, Email_Adress, Cell_Mobile_Phone FROM Students
SELECT T1.Student_ID, T1.First_Name, T1.Middle_Name, T1.Last_Name, T1.Gender_MFU, T1.Student_Address, T1.Email_Adress, T1.Cell_Mobile_Phone FROM Students AS T1
SELECT COUNT(*) FROM Addresses
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(product_id) FROM Products
SELECT COUNT(product_id) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT T1.product_name FROM Products AS T1 ORDER BY T1.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_type_code) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.Manager, T1.Captain FROM club AS T1
SELECT T1.Manager, T1.Captain FROM club AS T1
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T2.Earnings DESC LIMIT 1
SELECT T1.Name , T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name, T2.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Club_ID HAVING COUNT(T2.Wins_count) > 2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Club_ID HAVING COUNT(T2.Wins_count) > 2
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Manager = "Sam Allardyce"
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = "Sam Allardyce"
SELECT T1.Manufacturer, count(*) FROM club AS T1 GROUP BY T1.Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT T1.Earnings FROM player AS T1 WHERE T1.Country = "Australia" OR T1.Country = "Zimbabwe"
SELECT T1.order_id, T1.order_status_code, count(*) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id
SELECT COUNT(T2.product_id), T1.order_status_code, T1.order_id FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) >= 2
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING count(*) >= 2
SELECT T1.gender_code , count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_id, T2.gender, COUNT(T1.order_id) FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.gender
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 INNER JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.order_item_status_code, T3.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.order_item_status_code, T2.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipments AS T2 ON T1.order_id = T2.order_id JOIN Shipment_Items AS T3 ON T2.shipment_id = T3.shipment_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT T1.customer_first_name , T1.customer_last_name , T1.login_password FROM Customers AS T1 WHERE T1.phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT T1.product_size FROM Products AS T1 WHERE T1.product_name LIKE "%Dell%"
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code , date_order_placed FROM Orders
SELECT address_line_1 , town_city , county FROM Customers WHERE county = "USA"
SELECT address_line_1, town_city, county FROM Customers
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_item_id) > 3
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Products AS T2 ON T1.product_id = T2.parent_product_id GROUP BY T1.product_id HAVING count(*) > 3
SELECT T1.invoice_date , T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT T1.invoice_number, T1.invoice_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director WHERE Age = ( SELECT MAX(Age) FROM director )
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT T1.Title FROM program AS T1 WHERE T1.Start_Year = ( SELECT MAX(Start_Year) FROM program )
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(T2.Program_ID) > 1
SELECT T1.Name, COUNT(T2.Program_ID) FROM channel AS T1 INNER JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Name
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID WHERE T2.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT T1.Transmitter FROM radio AS T1 WHERE T1.ERP_kW > 150 OR T1.ERP_kW < 30
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID ORDER BY T1.ERP_kW DESC LIMIT 1
SELECT DISTINCT Affiliation , COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT T1.City, T1.Station_name FROM city_channel AS T1 ORDER BY T1.Station_name ASC
SELECT T1.Transmitter, T3.City FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID
SELECT T1.Transmitter , COUNT(T2.City_channel_ID) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID GROUP BY T1.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(T1.Power), AVG(T1.Power) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T1.Builder = 'Zhuzhou'
SELECT T1.Top_Speed , T1.Power FROM vehicle AS T1 WHERE T1.Build_Year = "1996"
SELECT T1.Top_Speed , T1.Power FROM vehicle AS T1 WHERE T1.Build_Year = "1996"
SELECT T1.Build_Year , T1.Model , T1.Builder FROM vehicle AS T1
SELECT T1.Build_Year , T1.Model , T1.Builder FROM vehicle AS T1
SELECT COUNT(DISTINCT T1.Driver_ID) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Build_Year = "2012"
SELECT COUNT(DISTINCT T1.Driver_ID) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Build_Year = '2012'
SELECT T1.Model FROM vehicle AS T1 WHERE T1.Total_Production > '100' OR T1.Top_Speed > '150'
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Total_Production > 100 OR T1.Top_Speed > 150
SELECT T1.Model, T1.Build_Year FROM vehicle AS T1 WHERE T1.Model LIKE '%DJ%'
SELECT T1.Model , T1.Build_Year FROM vehicle AS T1 WHERE T1.Model LIKE "%DJ%"
SELECT Racing_Series, COUNT(*) FROM driver GROUP BY Racing_Series
SELECT COUNT(*) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Racing_Series
SELECT Exam_Name , Exam_Date FROM Exams WHERE Subject_Code != "Database"
SELECT T1.Exam_Date, T1.Exam_Name FROM Exams AS T1 WHERE T1.Subject_Code != "Database"
SELECT T1.Type_of_Question_Code , COUNT(*) FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code
SELECT Type_of_Question_Code , COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.First_Name , T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.Email_Adress , T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.First_Name HAVING COUNT(*) >= 2
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T2.Student_ID HAVING COUNT(*) >= 2
SELECT Gender_MFU , COUNT(*) FROM Students GROUP BY Gender_MFU
