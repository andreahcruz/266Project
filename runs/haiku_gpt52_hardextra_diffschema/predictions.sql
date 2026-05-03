SELECT COUNT(Club_ID) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player WHERE Name = 'Nike')
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT DISTINCT player.Country FROM player WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 1200000
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING count(DISTINCT player.Name) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Captain) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Player_ID) > 1
SELECT player.Country FROM player GROUP BY player.Country HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT player.Country) FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.date_order_placed IS NOT NULL
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT COUNT(DISTINCT Order_Items.order_item_status_code) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.date_order_placed IS NOT NULL
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT count(*) FROM Shipments
SELECT COUNT(DISTINCT Products.product_id) FROM Products JOIN Shipments ON Products.product_id = Shipments.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Internet) FROM channel WHERE Analogue_terrestrial_channel = 'terrestrial'
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio WHERE Radio_MHz IS NOT NULL
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Station_name FROM city_channel WHERE City IS NOT NULL AND Affiliation != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Radio_MHz IS NOT NULL
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT City) > 3
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Citizenship = 'United States'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT count(DISTINCT vehicle_driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID ORDER BY driver.Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT count(*) FROM Exams WHERE Exam_Name IS NOT NULL
SELECT count(Exam_Name) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answers.Student_ID FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers WHERE Comments IS NOT NULL
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(address_id) FROM Addresses
SELECT count(address_id) FROM Addresses
SELECT COUNT(DISTINCT product_name) FROM Products
SELECT COUNT(DISTINCT product_name) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(product_name) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT club.Manager, club.Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT player.Name FROM player ORDER BY player.Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2 GROUP BY club.Club_ID, club.Name
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT club.Manufacturer, count(*) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, COUNT(Products.product_id) AS product_count, Orders.order_status_code, Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id LEFT JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.order_status_code, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT Orders.order_id, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Orders.order_id, Shipments.shipment_date HAVING COUNT(DISTINCT Shipments.invoice_number) >= 2
SELECT Customers.gender_code, COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Orders.order_status_code, COUNT(Orders.order_id) FROM Orders GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code, Customers.customer_middle_initial, Customers.customer_first_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices JOIN Orders ON Invoices.invoice_number = Orders.customer_id JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Orders.date_order_placed IS NOT NULL AND Shipments.shipment_id IS NOT NULL
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Invoices JOIN Orders ON Invoices.invoice_number = Shipments.invoice_number JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Invoices.invoice_date IS NOT NULL AND Shipments.shipment_id IS NOT NULL
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT Orders.order_status_code, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = "USA"
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'United States'
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(*) > 3
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Invoices.invoice_number, Invoices.invoice_date HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices WHERE Invoices.invoice_number IN ( SELECT Shipments.invoice_number FROM Shipments GROUP BY Shipments.invoice_number HAVING COUNT(*) >= 2 )
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Internet FROM channel WHERE Channel_ID IN (SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(program.Program_ID) > 1)
SELECT channel.Internet, COUNT(program.Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Internet
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Sub_tittle FROM tv_show
SELECT DISTINCT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT city_channel.City, city_channel.Station_name FROM city_channel ORDER BY city_channel.Station_name ASC
SELECT Transmitter, City FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel.City) AS city_count FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Builder FROM vehicle WHERE Build_Year = "1996"
SELECT Top_Speed, Power FROM vehicle WHERE Builder = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT DISTINCT driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Racing_Series HAVING SUM(vehicle.Power) > 100 OR MAX(vehicle.Top_Speed) > 150
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Model HAVING SUM(CAST(vehicle.Total_Production AS INTEGER)) > 100 OR MAX(vehicle.Top_Speed) > 150
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT Racing_Series, COUNT(DISTINCT Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY Racing_Series
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
