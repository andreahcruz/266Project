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
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT count(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT count(DISTINCT order_item_status_code) FROM Order_Items
SELECT DISTINCT order_item_status_code FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipments
SELECT COUNT(DISTINCT T1.product_id) FROM Order_Items AS T1 JOIN Shipments AS T2 ON T1.order_id = T2.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(T1.product_price) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id
SELECT AVG(T1.product_price) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT T1.Title FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID ORDER BY T1.Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID ORDER BY T1.ERP_kW ASC
SELECT T1.Station_name FROM city_channel AS T1 WHERE T1.Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT T1.Affiliation FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID GROUP BY T1.Affiliation HAVING COUNT(T1.ID) > 3
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T1.Citizenship = 'United States'
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT count(*) FROM driver WHERE Racing_Series = "NASCAR"
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
SELECT Name FROM driver ORDER BY Name ASC
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT T1.Subject_Code FROM Exams AS T1
SELECT DISTINCT T1.Subject_Code FROM Exams AS T1
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Comments AS T2 ON T1.Comments = T2.Comments
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Comments AS T2 ON T1.Comments = T2.Comments
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT T1.Last_Name FROM Students AS T1 WHERE T1.Gender_MFU != "M"
SELECT T1.Last_Name FROM Students AS T1 WHERE T1.Gender_MFU != "M"
SELECT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T2.Exam_ID) >= 3
SELECT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T2.Question_ID) >= 3
SELECT Student_ID, First_Name, Middle_Name, Last_Name, Gender_MFU, Student_Address, Email_Adress, Cell_Mobile_Phone FROM Students
SELECT T1.Student_ID, T1.First_Name, T1.Middle_Name, T1.Last_Name, T1.Gender_MFU, T1.Student_Address, T1.Email_Adress, T1.Cell_Mobile_Phone FROM Students AS T1
SELECT COUNT(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT T2.product_price FROM Order_Items AS T1 INNER JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T2.product_name = 'Monitor'
SELECT T1.product_price FROM Products AS T1 WHERE T1.product_name = 'Monitor'
SELECT AVG(T2.product_price) FROM Products AS T1 INNER JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Clothes'
SELECT AVG(T2.product_price) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT T1.product_name FROM Products AS T1 ORDER BY T1.product_price DESC
SELECT T1.product_name FROM Products AS T1 ORDER BY T1.product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
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
SELECT T1.order_id , T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) >= 2
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING count(*) >= 2
SELECT T1.gender_code , count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.gender_code, count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.customer_first_name , T1.customer_middle_initial , T1.customer_last_name , T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 LEFT JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.order_item_status_code, T3.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.order_item_status_code, T3.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.login_name , T1.login_password FROM Customers AS T1 INNER JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.phone_number LIKE '+12%'
SELECT T1.customer_first_name , T1.customer_last_name , T2.login_password FROM Customers AS T1 JOIN Customer_Payment_Methods AS T3 ON T1.customer_id = T3.customer_id WHERE T1.phone_number LIKE '+12%'
SELECT T2.product_size FROM Products AS T1 INNER JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name LIKE '%Dell%'
SELECT T1.product_size FROM Products AS T1 WHERE T1.product_name LIKE '%Dell%'
SELECT T1.order_status_code , T1.date_order_placed FROM Orders AS T1
SELECT T2.order_status_code , T2.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.address_line_1 , T1.town_city , T1.county FROM Customers AS T1 WHERE T1.town_city = "USA"
SELECT T1.address_line_1, T1.town_city, T1.county FROM Customers AS T1 WHERE T1.county = 'United States'
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) > 3
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING count(*) > 3
SELECT T1.invoice_date , T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT T1.invoice_date , T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT T1.shipment_tracking_number , T1.shipment_date FROM Shipments AS T1
SELECT T1.Name FROM director AS T1 JOIN director_admin AS T2 ON T1.Director_ID = T2.Director_ID WHERE T1.Age = ( SELECT MAX(T1.Age) FROM director AS T1 )
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT T1.Title FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID WHERE T1.Start_Year = ( SELECT MAX(Start_Year) FROM program )
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(T2.Program_ID) > 1
SELECT T1.Name, COUNT(T2.Program_ID) FROM channel AS T1 INNER JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Name
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID WHERE T2.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT T1.Transmitter FROM radio AS T1 WHERE T1.ERP_kW > 150 OR T1.ERP_kW < 30
SELECT T1.Transmitter FROM radio AS T1 ORDER BY T1.ERP_kW DESC LIMIT 1
SELECT DISTINCT Affiliation , COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT T1.City, T1.Station_name FROM city_channel AS T1 ORDER BY T1.Station_name ASC
SELECT T1.Transmitter, T3.City FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID
SELECT T1.Transmitter , COUNT(T3.City_channel_ID) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID GROUP BY T1.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(T1.Power), AVG(T1.Power) FROM vehicle AS T1 INNER JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Builder = 'Zhuzhou'
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
SELECT T1.Exam_Name , T1.Exam_Date FROM Exams AS T1 JOIN Questions_in_Exams AS T2 ON T1.Exam_ID = T2.Exam_ID JOIN Questions AS T3 ON T2.Question_ID = T3.Question_ID WHERE T3.Subject_Code != "Database"
SELECT T1.Exam_Date, T1.Exam_Name FROM Exams AS T1 WHERE T1.Subject_Code != "Database"
SELECT T1.Type_of_Question_Code , COUNT(*) FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code
SELECT T1.Type_of_Question_Code , COUNT(*) FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.First_Name , T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.Email_Adress , T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.Email_Adress , T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T2.Student_ID HAVING COUNT(*) >= 2
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T2.Student_ID HAVING COUNT(*) >= 2
SELECT Gender_MFU , COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Wins_count < T2.Wins_count WHERE T1.Wins_count > 2 AND T1.Earnings = T2.Earnings
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Name ORDER BY AVG(T2.Earnings) DESC
SELECT T1.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT T1.Country FROM player AS T1 WHERE T1.Earnings > 1400000 UNION SELECT T1.Country FROM player AS T1 WHERE T1.Earnings < 1100000
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 AND T2.Earnings < 1100000
SELECT DISTINCT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T1.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR T2.order_item_id != (SELECT order_item_id FROM Order_Items GROUP BY order_item_id HAVING COUNT(*) = 1)
SELECT MIN(date_order_placed) FROM Orders SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1)
SELECT T1.product_id , T1.product_name , T1.product_price , T1.product_color FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.payment_method_code ORDER BY COUNT(T2.payment_method_code) DESC LIMIT 1
SELECT T1.payment_method_code FROM Customer_Payment_Methods AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY COUNT(T1.customer_id) DESC LIMIT 1
SELECT T1.gender_code , COUNT(T3.product_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT T1.customer_first_name, T1.customer_last_name, COUNT(T3.product_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT T1.product_name, T3.shipment_date FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.product_name, T3.shipment_date FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.product_name , T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.product_name , T1.product_color FROM Products AS T1 JOIN Shipment_Items AS T2 ON T1.product_id = T2.order_item_id
SELECT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number WHERE T2.shipment_id IS NULL
SELECT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number WHERE T2.shipment_id IS NULL
SELECT O.order_id, O.date_order_placed, SUM(PI.product_price) FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS PI ON OI.product_id = PI.product_id GROUP BY O.order_id
SELECT O.order_id, O.date_order_placed, SUM(OP.product_price) FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id GROUP BY O.order_id
SELECT T1.customer_first_name , T3.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id
SELECT T1.customer_first_name , T2.product_name FROM Customers AS T1 JOIN Order_Items AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T2.customer_id = T3.customer_id GROUP BY T1.date_order_placed HAVING count(DISTINCT T3.payment_method_code) >= 2
SELECT T2.date_order_placed FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T1.customer_id = T3.customer_id GROUP BY T2.date_order_placed HAVING COUNT(T3.payment_method_code) >= 2
SELECT T2.order_status_code FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.order_status_code FROM Orders AS T1 JOIN ( SELECT order_status_code, COUNT(*) as count FROM Orders GROUP BY order_status_code ) AS T2 ON T1.order_status_code = T2.order_status_code ORDER BY T2.count ASC LIMIT 1
SELECT Name FROM director WHERE Age > ( SELECT AVG(Age) FROM director )
SELECT T1.Channel_ID , T1.Name FROM channel AS T1 LEFT JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID LEFT JOIN director AS T3 ON T2.Director_ID = T3.Director_ID WHERE T3.Name != 'Hank Baskett'
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Transmitter, T3.Station_name FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID ORDER BY T1.ERP_kW DESC
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000 )
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Power > 6000 ORDER BY T1.Top_Speed DESC LIMIT 1
SELECT COUNT(*) , Driver_ID FROM driver GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Driver_ID , count(*) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Vehicle_ID FROM vehicle_driver AS T1 GROUP BY T1.Vehicle_ID ORDER BY COUNT(T1.Vehicle_ID) ASC LIMIT 1
SELECT T1.Vehicle_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID ORDER BY COUNT(T2.Vehicle_ID) ASC LIMIT 1
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID GROUP BY T1.Vehicle_ID HAVING COUNT(T3.Driver_ID) > 1 UNION SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 WHERE T1.Builder = 'Ziyang'
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 WHERE T1.Builder = 'Ziyang' UNION SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID HAVING COUNT(DISTINCT T2.Driver_ID) = 2
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle )
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT T1.Name , T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T2.Exam_Date FROM Exams AS T2 INNER JOIN Questions_in_Exams AS T1 ON T2.Exam_ID = T1.Exam_ID WHERE T2.Subject_Code LIKE "%data%" ORDER BY T2.Exam_Date DESC
SELECT T2.Exam_Date FROM Exams AS T1 JOIN Questions_in_Exams AS T2 ON T1.Exam_ID = T2.Exam_ID WHERE T1.Subject_Code LIKE '%data%' ORDER BY T2.Exam_Date DESC
SELECT T1.Assessment FROM Student_Assessments AS T1 JOIN Student_Answers AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID GROUP BY T1.Assessment ORDER BY COUNT(T1.Assessment) ASC LIMIT 1
SELECT T1.Student_Answer_ID FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID GROUP BY T1.Student_Answer_ID ORDER BY count(*) ASC LIMIT 1
SELECT T1.Valid_Answer_Text FROM Valid_Answers AS T1 JOIN Questions AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers AS T1 JOIN Student_Answers AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_ID IS NULL
SELECT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_ID IS NULL
SELECT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID JOIN Student_Answers AS T3 ON T1.Student_ID = T3.Student_ID WHERE T1.Comments = 'Normal' AND T2.Comments = 'Absent' AND T3.Comments = 'Absent'
SELECT Student_Answer_Text FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID = T2.Student_ID WHERE T1.Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID = T2.Student_ID WHERE T1.Comments = 'Absent'
SELECT T1.product_name FROM Products AS T1 WHERE T1.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_id HAVING T1.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT T2.product_name FROM Products AS T1 INNER JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Clothes' ORDER BY T1.product_price DESC LIMIT 1
SELECT T3.product_name FROM Order_Items AS T1 JOIN Customer_Orders AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T1.product_id = T3.product_id WHERE T3.product_type_code = "Clothes" AND T3.product_price = (SELECT max(product_price) FROM Products WHERE product_type_code = "Clothes")
SELECT T1.product_id , T1.product_name FROM Products AS T1 WHERE T1.product_type_code = "Hardware" ORDER BY T1.product_price ASC LIMIT 1
SELECT T1.product_id, T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' ORDER BY T1.product_price ASC LIMIT 1
SELECT T1.product_type_code FROM Products AS T1 GROUP BY T1.product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.payment_method_code FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.payment_method_code ORDER BY COUNT(T2.payment_method_code) DESC LIMIT 1
SELECT T1.customer_name FROM Customers AS T1 INNER JOIN Customers AS T2 ON T1.payment_method_code = T2.payment_method_code GROUP BY T1.payment_method_code ORDER BY COUNT(T1.payment_method_code) ASC LIMIT 1
SELECT T1.customer_name FROM Customers AS T1 JOIN Customers AS T2 ON T1.payment_method_code = T2.payment_method_code GROUP BY T1.payment_method_code ORDER BY COUNT(T1.payment_method_code) ASC LIMIT 1
SELECT T1.product_type_code FROM Products AS T1 GROUP BY T1.product_type_code ORDER BY COUNT(T1.product_id) LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.order_status_code FROM Customer_Orders AS T1 GROUP BY T1.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.order_status_code FROM Customer_Orders AS T1 GROUP BY T1.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.product_name FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT T1.customer_id , T1.customer_first_name , T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id HAVING COUNT(T2.order_id) > 2 INTERSECT SELECT T1.customer_id FROM Customers AS T1 JOIN Order_Items AS T2 ON T1.customer_id = T2.order_id GROUP BY T1.customer_id HAVING COUNT(T2.order_item_id) >= 3
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id HAVING COUNT(T3.order_item_id) > 2 AND COUNT(DISTINCT T3.order_item_id) >= 3
SELECT customer_first_name , customer_middle_initial , customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name FROM Customers AS T1 WHERE T1.customer_id NOT IN (SELECT T2.customer_id FROM Orders AS T2)
SELECT T1.product_id , T1.product_name , T1.product_price , T1.product_color FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.product_id , T1.product_name , T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.product_id , T1.product_name , T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.order_id , SUM(T2.product_price) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id ORDER BY SUM(T2.product_price) ASC LIMIT 1
SELECT T1.order_id, SUM(T1.product_price) FROM Order_Items AS T1 INNER JOIN Products AS T2 ON T1.product_id = T2.product_id GROUP BY T1.order_id ORDER BY SUM(T1.product_price) ASC LIMIT 1
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'F'
SELECT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'F'
SELECT T1.product_price , T1.product_size FROM Products T1 JOIN ( SELECT product_id , AVG(product_price) AS avg_price FROM Products GROUP BY product_id ) T2 ON T1.product_id = T2.product_id WHERE T1.product_price > T2.avg_price
SELECT T1.product_price, T1.product_size FROM Products T1 WHERE T1.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(DISTINCT T1.product_id) FROM Products T1 LEFT JOIN Order_Items T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(T1.customer_id) FROM Customers AS T1 LEFT JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_id IS NULL
SELECT COUNT(T1.customer_id) FROM Customers AS T1 LEFT JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_id IS NULL
SELECT T1.email_address, T1.town_city, T1.county FROM Customers AS T1 JOIN Customers AS T2 ON T1.gender_code = T2.gender_code GROUP BY T1.gender_code ORDER BY COUNT(T1.gender_code) ASC LIMIT 1
SELECT T1.email_address, T1.town_city, T1.county FROM Customers AS T1 JOIN (SELECT gender_code, COUNT(*) as order_count FROM Orders GROUP BY gender_code) AS T2 ON T1.gender_code = T2.gender_code WHERE T2.order_count = (SELECT MIN(order_count) FROM (SELECT gender_code, COUNT(*) as order_count FROM Orders GROUP BY gender_code))
SELECT T1.product_color , T1.product_description , T1.product_size FROM Products AS T1 WHERE T1.product_price < ( SELECT MAX(product_price) FROM Products )
SELECT T1.product_color , T1.product_description , T1.product_size FROM Products AS T1 WHERE T1.product_price < (SELECT MAX(product_price) FROM Products)
SELECT T1.Name , count(*) FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name, T1.Age FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID JOIN director_admin AS T3 ON T1.Director_ID = T3.Director_ID JOIN channel AS T4 ON T3.Channel_ID = T4.Channel_ID GROUP BY T1.Director_ID ORDER BY COUNT(T2.Program_ID) DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID ORDER BY COUNT(T2.Director_ID) DESC LIMIT 1
SELECT T1.Name FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID JOIN director AS T3 ON T2.Director_ID = T3.Director_ID WHERE T3.Age < 40 AND T3.Age > 60
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon') OR T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING COUNT(DISTINCT Driver_ID) > 2)
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon') OR T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING count(*) > 2)
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(DISTINCT T1.Driver_ID) FROM driver AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Driver_ID IS NULL
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = "Hardware" AND T1.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = "Hardware" )
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' AND T1.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id ORDER BY COUNT(T2.order_id) DESC LIMIT 1
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_quantity > 6 OR T2.order_quantity > 3
SELECT T1.order_id , T1.order_date FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_quantity > '6' OR T2.order_item_id > '3'
SELECT T2.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T2.Region_ID ORDER BY COUNT(T2.Building_ID) DESC LIMIT 1
SELECT T1.Name, T2.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(T2.Building_ID) DESC LIMIT 1
SELECT T1.Customer_ID, T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Customers_and_Services_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Customers_and_Services_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY count(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T2.Customer_ID ORDER BY COUNT(T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T2.Service_ID = T3.Service_ID GROUP BY T2.Service_ID ORDER BY COUNT(T2.Service_ID) ASC LIMIT 1
SELECT DISTINCT T2.Customer_Details FROM Customers_and_Services AS T1 JOIN Customers AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T1.Service_ID = T3.Service_ID WHERE T1.Service_ID = (SELECT Service_ID FROM Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = "Hardy Kutch" UNION SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID = T2.Service_ID WHERE T2.Status_Code = "good"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID WHERE T2.Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch') INTERSECT SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID = T2.Service_ID WHERE T2.Status_Code = 'good'
SELECT T1.Service_ID, T2.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T3 ON T1.Service_ID = T3.Service_ID JOIN Customers AS T4 ON T3.Customer_ID = T4.Customer_ID JOIN Customer_Interactions AS T5 ON T4.Customer_ID = T5.Customer_ID WHERE T4.Customer_Details = 'Hardy Kutch' AND T5.Status_Code = 'bad'
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customer_Interactions AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Status_Code = "bad" AND T2.Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = "Hardy Kutch")
SELECT name , Type_of_powertrain , Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT T1.name , T1.Type_of_powertrain , T1.Annual_fuel_cost FROM Vehicles AS T1 WHERE T1.Model_year = 2013 OR T1.Model_year = 2014
SELECT T2.name, T2.Model_year FROM Vehicles AS T2 JOIN Renting_history AS T1 ON T2.id = T1.vehicles_id GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT T1.name FROM Discount AS T1 JOIN Renting_history AS T2 ON T1.id = T2.discount_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT T1.name FROM Discount AS T1 JOIN Renting_history AS T2 ON T1.id = T2.discount_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT T1.bio_data , T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING count(*) >= 2 INTERSECT SELECT T1.bio_data , T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING count(*) < 2
SELECT T1.bio_data , T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.class_id) >= 2 INTERSECT SELECT T1.bio_data , T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.detention_id) < 2
SELECT T2.teacher_details FROM Classes AS T1 JOIN Teachers AS T2 ON T1.teacher_id = T2.teacher_id JOIN Classes AS T3 ON T2.teacher_id = T3.teacher_id WHERE T1.class_details LIKE '%data%' AND T3.class_details NOT LIKE 'net%'
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details NOT LIKE 'net%'
SELECT T1.amount_of_loan , T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN Achievements AS T3 ON T2.student_id = T3.student_id GROUP BY T2.student_id HAVING Count(*) >= 2
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN Achievements AS T3 ON T2.student_id = T3.student_id GROUP BY T2.student_id HAVING COUNT(T3.achievement_id) >= 2
SELECT T2.teacher_details, T2.teacher_id FROM Classes AS T1 JOIN Teachers AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T2.teacher_id ORDER BY COUNT(T1.class_id) DESC LIMIT 1
SELECT T1.teacher_id , T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id JOIN (SELECT behaviour_monitoring_details, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1) AS T3 ON T2.behaviour_monitoring_details = T3.behaviour_monitoring_details JOIN (SELECT behaviour_monitoring_details, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 2 OFFSET 1) AS T4 ON T2.behaviour_monitoring_details = T4.behaviour_monitoring_details
SELECT T1.bio_data , T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 INTERSECT SELECT T1.bio_data , T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 3
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING count(DISTINCT T2.behaviour_monitoring_details) = (SELECT count(DISTINCT behaviour_monitoring_details) FROM Behaviour_Monitoring)
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(*) , T1.event_type_code , T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.event_type_code, T1.event_type_description, count(*) FROM Ref_Event_Types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(DISTINCT T2.teacher_id) FROM Students AS T1 LEFT JOIN Achievements AS T3 ON T1.student_id = T3.student_id LEFT JOIN Classes AS T2 ON T1.student_id = T2.student_id WHERE T3.achievement_id IS NULL
SELECT COUNT(DISTINCT T2.teacher_id) FROM Achievements AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id WHERE T1.achievement_type_code NOT IN (SELECT achievement_type_code FROM Achievements AS T3 GROUP BY T3.achievement_type_code HAVING COUNT(T3.achievement_id) > 0)
SELECT T1.detention_type_code, T1.detention_type_description FROM Ref_Detention_Type AS T1 WHERE (SELECT count(*) FROM Detention AS T2 WHERE T2.detention_type_code = T1.detention_type_code) = (SELECT min(count(*)) FROM Detention AS T3 GROUP BY T3.detention_type_code)
SELECT detention_type_code , detention_type_description FROM Ref_Detention_Type ORDER BY detention_type_code LIMIT 1
SELECT T1.bio_data , T1.student_details FROM Students AS T1 INNER JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id WHERE T2.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id WHERE T2.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT T2.teacher_details FROM Transcripts JOIN Classes ON Transcripts.student_id = Classes.student_id JOIN Teachers AS T2 ON Classes.teacher_id = T2.teacher_id ORDER BY Transcripts.date_of_transcript LIMIT 1
SELECT T2.teacher_details FROM Transcripts JOIN Classes ON Transcripts.student_id = Classes.student_id JOIN Teachers AS T2 ON Classes.teacher_id = T2.teacher_id ORDER BY Transcripts.date_of_transcript ASC LIMIT 1
SELECT T1.address_type_code , T1.address_type_description FROM Ref_Address_Types AS T1 INNER JOIN Students_Addresses AS T2 ON T1.address_type_code = T2.address_type_code GROUP BY T1.address_type_code ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT T1.address_type_code, T1.address_type_description FROM Ref_Address_Types AS T1 JOIN Students_Addresses AS T2 ON T1.address_type_code = T2.address_type_code GROUP BY T1.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
