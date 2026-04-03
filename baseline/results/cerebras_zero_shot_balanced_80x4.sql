SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Wins_count ASC
SELECT DISTINCT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Country HAVING COUNT(T1.Player_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipments
SELECT COUNT(DISTINCT T1.product_id) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(T2.product_price) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id
SELECT AVG(T1.product_price) FROM Products T1 JOIN Order_Items T2 ON T1.product_id = T2.product_id
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT T1.Title FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID JOIN channel AS T3 ON T1.Channel_ID = T3.Channel_ID ORDER BY T1.Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT COUNT(*) FROM radio
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID ORDER BY T1.ERP_kW ASC
SELECT T1.Station_name FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID WHERE T1.Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) > 3
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT COUNT(DISTINCT Exam_ID) FROM Exams
SELECT COUNT(DISTINCT Exam_ID) FROM Exams
SELECT DISTINCT T1.Subject_Code FROM Exams AS T1 ORDER BY T1.Subject_Code ASC
SELECT DISTINCT T1.Subject_Code FROM Exams AS T1 JOIN Questions_in_Exams AS T2 ON T1.Exam_ID = T2.Exam_ID
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Comments AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID WHERE T2.Comments = 'Normal'
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Comments AS T2 ON T1.Comments = T2.Comments WHERE T2.Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT T1.Last_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T1.Gender_MFU != 'M'
SELECT T1.Last_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T1.Gender_MFU != 'M'
SELECT DISTINCT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T2.Question_ID) >= 3
SELECT T1.Type_of_Question_Code FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T2.Question_ID) >= 3
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Students.Email_Adress, Students.Cell_Mobile_Phone, Students.Home_Phone FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Students.Email_Adress, Students.Cell_Mobile_Phone, Students.Home_Phone FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(DISTINCT product_id) FROM Order_Items
SELECT T2.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Customer_Orders AS T3 ON T2.order_id = T3.order_id WHERE T1.product_name = 'Monitor'
SELECT T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name = 'Monitor'
SELECT AVG(T2.product_price) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Customer_Orders AS T3 ON T2.order_id = T3.order_id WHERE T1.product_type_code = 'Clothes'
SELECT AVG(T2.product_price) FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T2.product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_name ORDER BY AVG(T2.order_quantity) DESC, T1.product_price DESC
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_name ORDER BY SUM(T2.order_quantity * T1.product_price) DESC
SELECT T1.product_type_code FROM Products AS T1 GROUP BY T1.product_type_code HAVING COUNT(T1.product_id) >= 2
SELECT T1.product_type_code FROM Products AS T1 JOIN (SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2) AS T2 ON T1.product_type_code = T2.product_type_code
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT T1.Manager, T1.Captain FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Manager, T1.Captain FROM club AS T1
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name, T2.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT T2.Earnings FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Country IN ('Australia', 'Zimbabwe')
SELECT SUM(Earnings) FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT COUNT(DISTINCT T1.order_item_id) AS num_products, T2.order_status_code, T2.order_id FROM Order_Items T1 JOIN Orders T2 ON T1.order_id = T2.order_id
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) >= 2
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) >= 2
SELECT T1.gender_code, COUNT(T3.order_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id INNER JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code, COUNT(T3.order_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.invoice_status_code, T1.invoice_date, T3.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.invoice_status_code, T1.invoice_date, T3.shipment_date FROM Invoices AS T1 LEFT JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number LEFT JOIN Shipment_Items AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.order_item_status_code, T3.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.order_item_status_code, T3.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.login_name, T1.login_password FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id WHERE T1.phone_number LIKE '+12%'
SELECT T1.login_name, T1.login_password FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id WHERE T1.phone_number LIKE '+12%'
SELECT T1.product_size FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name LIKE '%Dell%'
SELECT T1.product_size FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name LIKE '%Dell%'
SELECT T1.order_status_code, T1.date_order_placed FROM Orders AS T1
SELECT T1.order_status_code, T1.date_order_placed FROM Orders AS T1
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_item_id) > 3
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_item_id) > 3
SELECT T1.invoice_date, T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT T1.invoice_date, T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT T1.shipment_tracking_number, T1.shipment_date FROM Shipments AS T1 JOIN Shipment_Items AS T2 ON T1.shipment_id = T2.shipment_id
SELECT T1.shipment_tracking_number, T1.shipment_date FROM Shipments AS T1
SELECT Name FROM director WHERE Age = ( SELECT MAX(Age) FROM director )
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program WHERE Start_Year = ( SELECT MAX(Start_Year) FROM program )
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(T2.Program_ID) > 1
SELECT T1.Name, COUNT(T3.Program_ID) FROM channel AS T1 INNER JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID INNER JOIN program AS T3 ON T1.Channel_ID = T3.Channel_ID GROUP BY T1.Name
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID WHERE T1.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID WHERE T1.ERP_kW > 150 OR T1.ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = ( SELECT MAX(ERP_kW) FROM radio )
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT T1.City, T1.Station_name FROM city_channel AS T1 JOIN city_channel_radio AS T2 ON T1.ID = T2.City_channel_ID ORDER BY T1.Station_name ASC
SELECT T1.Transmitter, T3.City FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID
SELECT T1.Transmitter, COUNT(T3.City_channel_ID) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID GROUP BY T1.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(T1.Power), AVG(T1.Power) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT T1.Top_Speed, T1.Power FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT T1.Driver_ID) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Build_Year = '2012'
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE Build_Year = '2012'
SELECT Model FROM vehicle WHERE Total_Production > '100' OR Top_Speed > 150
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Total_Production > '100' OR T1.Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT T1.Model, T1.Build_Year FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Model LIKE '%DJ%'
SELECT Racing_Series, COUNT(*) FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(*) FROM driver GROUP BY Racing_Series
SELECT T1.Exam_Name, T1.Exam_Date FROM Exams AS T1 JOIN Questions_in_Exams AS T2 ON T1.Exam_ID = T2.Exam_ID JOIN Questions AS T3 ON T2.Question_ID = T3.Question_ID WHERE T3.Subject_Code != 'Database'
SELECT T1.Exam_Date, T1.Exam_Name FROM Exams AS T1 JOIN Questions_in_Exams AS T2 ON T1.Exam_ID = T2.Exam_ID JOIN Questions AS T3 ON T2.Question_ID = T3.Question_ID WHERE T3.Subject_Code != 'Database'
SELECT T1.Type_of_Question_Code, COUNT(*) FROM Questions AS T1 INNER JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code
SELECT T1.Type_of_Question_Code, COUNT(*) FROM Questions AS T1 JOIN Questions_in_Exams AS T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Student_Answer_Text FROM Student_Answers JOIN Valid_Answers ON Student_Answers.Student_Answer_ID = Student_Assessments.Student_Answer_ID JOIN Questions ON Valid_Answers.Question_ID = Questions.Question_ID GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.Email_Adress, T3.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID JOIN Student_Answers AS T3 ON T1.Student_ID = T3.Student_ID ORDER BY T3.Date_of_Answer DESC
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.First_Name HAVING COUNT(T2.Student_ID) >= 2
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.First_Name HAVING COUNT(T2.Student_ID) >= 2
SELECT T1.Gender_MFU, COUNT(T1.Student_ID) FROM Students AS T1 GROUP BY T1.Gender_MFU
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Wins_count < T2.Wins_count JOIN club ON T2.Club_ID = club.Club_ID WHERE T1.Wins_count > 2 AND T2.Wins_count = (SELECT MAX(Wins_count) FROM player WHERE Wins_count > 2)
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT T1.Name, AVG(T2.Earnings) FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 OR T1.Earnings < 1100000
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Country = T2.Country JOIN club AS T3 ON T1.Club_ID = T3.Club_ID WHERE T1.Earnings > 1400000 AND T2.Earnings < 1100000
SELECT DISTINCT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T1.date_order_placed IN (SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.date_order_placed HAVING COUNT(T2.order_item_id) > 1)
SELECT MIN(T1.date_order_placed) AS earliest_order_date, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) > 1
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.payment_method_code FROM Customer_Payment_Methods AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY COUNT(T1.customer_id) DESC LIMIT 1
SELECT T1.payment_method_code FROM Customer_Payment_Methods AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.payment_method_code ORDER BY COUNT(T1.customer_id) DESC LIMIT 1
SELECT T1.gender_code, COUNT(T3.order_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code, COUNT(T3.product_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id INNER JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT T1.product_name, T3.shipment_date FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.product_name, T3.shipment_date FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.product_name, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.product_name, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number WHERE T2.shipment_id IS NULL
SELECT DISTINCT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number WHERE T2.shipment_id IS NULL
SELECT T1.order_id, T1.date_order_placed, SUM(T3.product_price) AS total_cost FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id, T1.date_order_placed
SELECT O.order_id, O.date_order_placed, SUM(P.product_price) FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id
SELECT T1.customer_first_name, T3.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T4 ON T2.order_id = T4.order_id JOIN Products AS T3 ON T4.product_id = T3.product_id
SELECT T1.customer_first_name, T3.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T2.customer_id = T3.customer_id GROUP BY T1.order_id HAVING COUNT(DISTINCT T3.payment_method_code) >= 2
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T2.customer_id = T3.customer_id GROUP BY T1.order_id HAVING COUNT(T3.payment_method_code) >= 2
SELECT order_status_code FROM Orders WHERE order_status_code NOT IN ( SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT order_status_code FROM Orders WHERE order_status_code IN (SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1)
SELECT Name FROM director WHERE Age > ( SELECT AVG(Age) FROM director )
SELECT c.Channel_ID, c.Name FROM channel c WHERE c.Channel_ID NOT IN (SELECT da.Channel_ID FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Name = 'Hank Baskett')
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Transmitter, T3.Station_name FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID ORDER BY T1.ERP_kW DESC
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000) AND T1.Power > 6000
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Power > 6000 ORDER BY T1.Top_Speed DESC LIMIT 1
SELECT MAX(T1.Total_Production) , T2.Driver_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID
SELECT Driver_ID, COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Vehicle_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID ORDER BY COUNT(T2.Driver_ID) ASC LIMIT 1
SELECT T1.Vehicle_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID ORDER BY COUNT(T2.Driver_ID) ASC LIMIT 1
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T1.Model FROM vehicle AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Vehicle_ID IS NULL
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 WHERE T1.Vehicle_ID IN (SELECT T2.Vehicle_ID FROM vehicle_driver AS T2 GROUP BY T2.Vehicle_ID HAVING COUNT(T2.Vehicle_ID) >= 2) OR T1.Builder = 'Ziyang'
SELECT DISTINCT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING COUNT(Driver_ID) = 2) OR T1.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle AS T1 INNER JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE (T1.Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle ))
SELECT COUNT(*) FROM vehicle AS T1 INNER JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle )
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T2.Exam_Date FROM Exams AS T2 JOIN Questions_in_Exams AS T1 ON T2.Exam_ID = T1.Exam_ID WHERE T2.Subject_Code LIKE '%data%' ORDER BY T2.Exam_Date DESC
SELECT T2.Exam_Date FROM Exams AS T1 JOIN Questions_in_Exams AS T2 ON T1.Exam_ID = T2.Exam_ID JOIN Questions AS T3 ON T2.Question_ID = T3.Question_ID WHERE T1.Subject_Code LIKE '%data%' ORDER BY T2.Exam_Date DESC
SELECT T1.Assessment FROM Student_Assessments AS T1 JOIN Student_Answers AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID GROUP BY T1.Assessment ORDER BY COUNT(T1.Assessment) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments ORDER BY COUNT(Student_Answer_ID) ASC LIMIT 1
SELECT T1.Valid_Answer_Text FROM Valid_Answers AS T1 JOIN ( SELECT Question_ID, COUNT(*) as cnt FROM Valid_Answers GROUP BY Question_ID ORDER BY cnt DESC LIMIT 1 ) AS T2 ON T1.Question_ID = T2.Question_ID
SELECT T1.Valid_Answer_Text FROM Valid_Answers AS T1 JOIN ( SELECT Question_ID, Valid_Answer_Text, COUNT(*) as count FROM Valid_Answers GROUP BY Question_ID, Valid_Answer_Text ORDER BY count DESC LIMIT 1 ) AS T2 ON T1.Question_ID = T2.Question_ID AND T1.Valid_Answer_Text = T2.Valid_Answer_Text
SELECT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_ID IS NULL
SELECT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_ID IS NULL
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID WHERE T2.Comments = 'Normal' AND T1.Student_Answer_Text IN (SELECT Student_Answer_Text FROM Student_Answers AS T3 JOIN Student_Assessments AS T4 ON T3.Student_Answer_ID = T4.Student_Answer_ID WHERE T4.Comments = 'Absent')
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Comments AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING T1.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING T1.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Clothes' ORDER BY T1.product_price DESC LIMIT 1
SELECT T2.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Customer_Orders AS T3 ON T2.order_id = T3.order_id WHERE T1.product_type_code = 'Clothes' ORDER BY T1.product_price DESC LIMIT 1
SELECT T1.product_id, T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Customer_Orders AS T3 ON T2.order_id = T3.order_id WHERE T1.product_type_code = 'Hardware' ORDER BY T1.product_price ASC LIMIT 1
SELECT T1.product_id, T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' ORDER BY T1.product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.customer_name FROM Customers AS T1 JOIN ( SELECT payment_method_code, COUNT(*) as count FROM Customers GROUP BY payment_method_code ORDER BY count LIMIT 1 ) AS T2 ON T1.payment_method_code = T2.payment_method_code
SELECT T1.customer_name FROM Customers AS T1 JOIN (SELECT payment_method_code, COUNT(*) as count FROM Customers GROUP BY payment_method_code ORDER BY count LIMIT 1) AS T2 ON T1.payment_method_code = T2.payment_method_code
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) DESC LIMIT 1
SELECT T1.product_name FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT OI.order_item_id) > 2 AND COUNT(DISTINCT O.order_id) > 2
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT OI.order_item_id) > 2 AND COUNT(DISTINCT OI.order_id) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(T2.order_item_id) DESC LIMIT 1
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(T2.order_item_id) DESC
SELECT T1.order_id, SUM(T3.product_price) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY SUM(T3.product_price) ASC LIMIT 1
SELECT T1.order_id, SUM(T3.product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY T1.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'F'
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'F'
SELECT T1.product_price, T1.product_size FROM Products AS T1 JOIN ( SELECT product_id, AVG(product_price) AS avg_price FROM Products GROUP BY product_id ) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_price > T2.avg_price
SELECT T1.product_price, T1.product_size FROM Products AS T1 JOIN (SELECT product_id, AVG(product_price) AS avg_price FROM Products GROUP BY product_id) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_price > T2.avg_price
SELECT COUNT(DISTINCT T1.product_id) FROM Products T1 LEFT JOIN Order_Items T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT COUNT(DISTINCT T1.product_id) FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT T1.email_address, T1.town_city, T1.county FROM Customers AS T1 JOIN (SELECT gender_code, COUNT(*) as count FROM Customers GROUP BY gender_code ORDER BY count LIMIT 1) AS T2 ON T1.gender_code = T2.gender_code
SELECT T1.email_address, T1.town_city, T1.county FROM Customers AS T1 JOIN (SELECT gender_code, COUNT(order_id) AS order_count FROM Orders GROUP BY gender_code ORDER BY order_count LIMIT 1) AS T2 ON T1.gender_code = T2.gender_code
SELECT T1.product_color, T1.product_description, T1.product_size FROM Products AS T1 JOIN ( SELECT product_id, MAX(product_price) AS max_price FROM Products GROUP BY product_id ) AS T2 ON T1.product_id = T2.product_id WHERE T1.product_price < T2.max_price
SELECT T1.product_color, T1.product_description, T1.product_size FROM Products AS T1 WHERE T1.product_price < ( SELECT MAX(product_price) FROM Products )
SELECT T1.Name FROM director AS T1 INNER JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(T2.Program_ID) DESC LIMIT 1
SELECT T1.Name, T1.Age FROM director AS T1 JOIN director_admin AS T2 ON T1.Director_ID = T2.Director_ID JOIN program AS T3 ON T2.Director_ID = T3.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(T3.Program_ID) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.Channel_ID) FROM channel AS T1 LEFT JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID WHERE T2.Program_ID IS NULL
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID ORDER BY COUNT(DISTINCT T2.Director_ID) DESC LIMIT 1
SELECT T1.Name FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID JOIN director AS T3 ON T2.Director_ID = T3.Director_ID JOIN director_admin AS T4 ON T1.Channel_ID = T4.Channel_ID JOIN director AS T5 ON T4.Director_ID = T5.Director_ID WHERE T5.Age < 40 AND T3.Age > 60
SELECT DISTINCT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon') OR T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING COUNT(Driver_ID) > 2)
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon') OR T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING COUNT(Driver_ID) > 2)
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' AND T1.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' AND T1.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email FROM Customers AS T1 JOIN (SELECT customer_id, COUNT(*) as order_count FROM Customer_Orders GROUP BY customer_id ORDER BY order_count DESC LIMIT 1) AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id JOIN ( SELECT customer_id, COUNT(*) as order_count FROM Customer_Orders GROUP BY customer_id ) AS T3 ON T1.customer_id = T3.customer_id WHERE T3.order_count = ( SELECT MAX(order_count) FROM ( SELECT customer_id, COUNT(*) as order_count FROM Customer_Orders GROUP BY customer_id ) )
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers T1 LEFT JOIN Customer_Orders T2 ON T1.customer_id = T2.customer_id WHERE T2.order_id IS NULL
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers T1 LEFT JOIN Customer_Orders T2 ON T1.customer_id = T2.customer_id WHERE T2.order_id IS NULL
SELECT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_quantity > '6' OR T2.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3)
SELECT T1.order_id, T1.order_date FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_quantity > '6' OR T2.order_item_id > 3
SELECT T2.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(T2.Building_ID) DESC LIMIT 1
SELECT T2.Name, T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T2.Region_ID ORDER BY COUNT(T1.Building_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Customers_and_Services_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1 ) AS T3 ON T2.Service_ID = T3.Service_ID
SELECT DISTINCT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T2.Service_ID = T3.Service_ID JOIN ( SELECT Service_ID, COUNT(*) as cnt FROM Customers_and_Services GROUP BY Service_ID ) AS T4 ON T3.Service_ID = T4.Service_ID WHERE T4.cnt = ( SELECT MIN(cnt) FROM ( SELECT Service_ID, COUNT(*) as cnt FROM Customers_and_Services GROUP BY Service_ID ) )
SELECT DISTINCT T1.Service_ID, T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' OR EXISTS (SELECT 1 FROM Customer_Interactions AS T4 JOIN Channels AS T5 ON T4.Channel_ID = T5.Channel_ID WHERE T4.Status_Code = 'good' AND T4.Service_ID = T1.Service_ID)
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' OR EXISTS (SELECT 1 FROM Customer_Interactions AS T4 JOIN Services AS T5 ON T4.Service_ID = T5.Service_ID WHERE T4.Status_Code = 'good' AND T5.Service_ID = T2.Service_ID)
SELECT T1.Service_ID FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID JOIN Customer_Interactions AS T4 ON T3.Customer_ID = T4.Customer_ID AND T1.Service_ID = T4.Service_ID WHERE T3.Customer_Details = 'Hardy Kutch' AND T4.Status_Code = 'bad'
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customer_Interactions AS T3 ON T2.Customer_ID = T3.Customer_ID AND T1.Service_ID = T3.Service_ID WHERE T3.Status_Code = 'bad' AND T2.Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT T1.name, T1.Type_of_powertrain, T1.Annual_fuel_cost FROM Vehicles AS T1 JOIN Vehicles AS T2 ON T1.id = T2.id WHERE T2.Model_year = 2013 AND T1.Model_year = 2014
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T1.bio_data, T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.class_id) >= 2 INTERSECT SELECT T1.bio_data, T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.detention_id) < 2
SELECT T1.student_id, T1.bio_data FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id JOIN ( SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(detention_id) < 2 ) AS T3 ON T1.student_id = T3.student_id GROUP BY T1.student_id HAVING COUNT(T2.class_id) >= 2
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details NOT LIKE 'net%'
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details NOT LIKE 'net%'
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN Achievements AS T3 ON T2.student_id = T3.student_id GROUP BY T1.student_id HAVING COUNT(T3.achievement_id) >= 2
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN Achievements AS T3 ON T2.student_id = T3.student_id GROUP BY T1.student_id HAVING COUNT(T3.achievement_id) >= 2
SELECT T2.teacher_details, T2.teacher_id FROM Classes JOIN Teachers AS T2 ON Classes.teacher_id = T2.teacher_id GROUP BY T2.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.teacher_details, T1.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(T2.class_id) DESC LIMIT 1
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id JOIN Ref_Event_Types AS T3 ON T2.behaviour_monitoring_details = T3.event_type_code WHERE T3.event_type_description = (SELECT T4.event_type_description FROM Ref_Event_Types AS T4 JOIN Behaviour_Monitoring AS T5 ON T4.event_type_code = T5.behaviour_monitoring_details GROUP BY T4.event_type_description ORDER BY COUNT(*) DESC LIMIT 1) AND T2.behaviour_monitoring_details IN (SELECT T6.behaviour_monitoring_details FROM Behaviour_Monitoring AS T6 GROUP BY T6.behaviour_monitoring_details HAVING COUNT(*) = 3)
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id JOIN Ref_Event_Types AS T3 ON T2.behaviour_monitoring_details = T3.event_type_code WHERE T3.event_type_description = ( SELECT T4.event_type_description FROM Ref_Event_Types AS T4 JOIN Behaviour_Monitoring AS T5 ON T4.event_type_code = T5.behaviour_monitoring_details GROUP BY T4.event_type_description ORDER BY COUNT(*) DESC LIMIT 1 ) AND T2.behaviour_monitoring_details IN ( SELECT T6.behaviour_monitoring_details FROM Behaviour_Monitoring AS T6 GROUP BY T6.behaviour_monitoring_details HAVING COUNT(*) = 3 )
SELECT T1.student_id, T1.bio_data, T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id WHERE T2.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id WHERE T2.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT COUNT(T1.student_id), T2.event_type_description, T2.event_type_code FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T2.event_type_code ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT T1.event_type_description, T1.event_type_code, COUNT(T2.student_id) FROM Ref_Event_Types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Students AS T3 ON T2.student_id = T3.student_id WHERE T3.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Students AS T3 ON T2.student_id = T3.student_id WHERE T3.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT T1.detention_type_code, T1.detention_type_description FROM Ref_Detention_Type AS T1 JOIN (SELECT detention_type_code, COUNT(*) as count FROM Detention GROUP BY detention_type_code) AS T2 ON T1.detention_type_code = T2.detention_type_code ORDER BY T2.count LIMIT 1
SELECT T1.detention_type_description FROM Ref_Detention_Type AS T1 JOIN (SELECT detention_type_code, COUNT(*) as count FROM Detention GROUP BY detention_type_code ORDER BY count LIMIT 1) AS T2 ON T1.detention_type_code = T2.detention_type_code
SELECT S.bio_data, S.student_details FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id WHERE T2.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id = T3.student_id WHERE T3.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id = T3.student_id WHERE T3.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT T1.address_type_code, T1.address_type_description FROM Ref_Address_Types AS T1 JOIN (SELECT address_type_code, COUNT(*) as count FROM Students_Addresses GROUP BY address_type_code ORDER BY count DESC LIMIT 1) AS T2 ON T1.address_type_code = T2.address_type_code
SELECT T1.address_type_code, T1.address_type_description FROM Ref_Address_Types AS T1 JOIN Students_Addresses AS T2 ON T1.address_type_code = T2.address_type_code GROUP BY T1.address_type_code ORDER BY COUNT(T2.student_id) DESC LIMIT 1
