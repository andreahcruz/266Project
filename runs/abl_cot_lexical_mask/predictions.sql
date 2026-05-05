SELECT COUNT(Club_ID) FROM club
SELECT COUNT(*) FROM club WHERE Name LIKE '%club%'
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manager != 'Nike'
SELECT Name FROM player WHERE Country != 'Nike'
SELECT club.Name, SUM(player.Earnings) FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY SUM(player.Earnings) ASC
SELECT club.DESCRIPITIVE_ATTRIBUTE_2, COUNT(player.Events_number) AS wins FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.DESCRIPITIVE_ATTRIBUTE_2 ORDER BY COUNT(player.Events_number) ASC
SELECT DISTINCT player.DESCRIPITIVE_ATTRIBUTE_9 FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manager > 1200000
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 1200000
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.DESCRIPITIVE_ATTRIBUTE_2 HAVING COUNT(club.Club_ID) > 1
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.DESCRIPITIVE_ATTRIBUTE_2 HAVING COUNT(player.Club_ID) > 1
SELECT Name FROM player GROUP BY Name HAVING COUNT(Player_ID) > 1
SELECT Name FROM player GROUP BY Name HAVING COUNT(Player_ID) > 1
SELECT COUNT(DISTINCT Name) FROM club
SELECT COUNT(DISTINCT Name) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT gender_code) FROM Customers
SELECT COUNT(Shipments.shipment_id) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT COUNT(DISTINCT Orders.DESCRIPITIVE_ATTRIBUTE_3) AS distinct_status_codes FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id JOIN Order_Items AS T2_2 ON Shipment_Items.order_item_id = T2_2.order_item_id WHERE Order_Items.DESRIPTIVE_ATTRIBUTE_8 = 'shipped'
SELECT COUNT(*) FROM Shipments WHERE shipment_tracking_number IS NOT NULL
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Name) FROM channel
SELECT channel.Name, program.Start_Year FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID ORDER BY program.Start_Year DESC
SELECT channel.DESCRIPITIVE_ATTRIBUTE_2 FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT COUNT(*) FROM city_channel_radio WHERE Is_online = 'radio'
SELECT city_channel_radio.Is_online FROM city_channel_radio WHERE Radio_ID IN (SELECT Radio_ID FROM radio WHERE Transmitter = 'transmitter' OR Radio_MHz = 'transmitter' OR 2FM_MHz = 'transmitter' OR RnaG_MHz = 'transmitter' OR ERP_kW = 'transmitter') ORDER BY city_channel_radio.Is_online ASC
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_2 FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID WHERE city_channel_tv_show.DESCRIPATIVE_ATTRIBUTE_11 != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio
SELECT Is_online, COUNT(*) as count FROM city_channel_radio GROUP BY Is_online HAVING COUNT(*) > 3 ORDER BY count DESC
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'driver' AND driver.DESCRIPITIVE_ATTRIBUTE_9 = 'citizenship from the United States'
SELECT COUNT(driver.Driver_ID) FROM driver WHERE Citizenship = 'NASCAR'
SELECT COUNT(driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Total_Production = 'NASCAR'
SELECT AVG(CAST(REPLACE(SUBSTR(Total_Production, INSTR(Total_Production, ' ') + 1), ',', '') AS REAL)) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver WHERE Name LIKE '%driver%' ORDER BY Name ASC
SELECT COUNT(*) FROM Questions_in_Exams
SELECT COUNT(*) FROM Questions_in_Exams
SELECT DISTINCT Exams.Subject_Code FROM Exams ORDER BY Exams.Subject_Code ASC
SELECT DISTINCT Exams.Subject_Code FROM Exams ORDER BY Exams.Subject_Code ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Student_Answer_ID WHERE Student_Answers.Comments = 'Normal'
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Student_Answer_ID WHERE Student_Answers.Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT First_Name FROM Students
SELECT Student_Assessments.Student_Answer_Text FROM Student_Answers JOIN Student_Assessments ON Student_Answers.Valid_Answer_ID = Student_Assessments.Student_Answer_ID WHERE Student_Answers.First_Name != 'M'
SELECT Questions_in_Exams.Type_of_Question_Code, COUNT(Questions_in_Exams.Exam_ID) FROM Questions_in_Exams GROUP BY Questions_in_Exams.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT Question_ID FROM Questions_in_Exams GROUP BY Question_ID HAVING COUNT(Question_ID) >= 3
SELECT Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Student_Answer_Text FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID
SELECT Student_Answers.Exam_ID, Student_Answers.Question_ID, Student_Answers.Student_ID, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT COUNT(*) FROM Customers
SELECT COUNT(payment_method_code) FROM Customers
SELECT COUNT(product_id) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT AVG(Products.product_price) FROM Products WHERE Products.product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code LIKE '%hardware type%'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2, Order_Items.order_quantity, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Products.product_price DESC
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(product_id) >= 2
SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(product_id) >= 2
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) FROM Customer_Orders INNER JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Manager' OR player.Country = 'Captain'
SELECT Name FROM club WHERE Name IN ('Manager', 'Captain')
SELECT club.DESCRIPITIVE_ATTRIBUTE_2, SUM(player.Wins_count) AS total_earnings FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.DESCRIPITIVE_ATTRIBUTE_2 ORDER BY total_earnings DESC
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT player.DESCRIBITIVE_ATTRIBUTE_8, club.DESCRIBITIVE_ATTRIBUTE_2 FROM player INNER JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, player.Country, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT Name FROM player GROUP BY Name HAVING COUNT(Earnings) > 2
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Events_number) > 2
SELECT club.Name FROM club WHERE club.Name IN (SELECT player.Name FROM player WHERE player.Country = 'Sam Allardyce')
SELECT 1
SELECT club.DESCRIPITIVE_ATTRIBUTE_2, COUNT(player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.DESCRIPITIVE_ATTRIBUTE_2
SELECT player.DESRIPTIVE_ATTRIBUTE_8, COUNT(player.DESRIPTIVE_ATTRIBUTE_8) AS COUNT FROM player GROUP BY player.DESRIPTIVE_ATTRIBUTE_8
SELECT club.Club_ID, SUM(player.Earnings) FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.DESCRIPITIVE_ATTRIBUTE_2 IN ('Australia', 'Zimbabwe') GROUP BY club.Club_ID
SELECT 1
SELECT 1
SELECT Orders.order_id AS order_id, COUNT(Order_Items.order_item_id) AS num_products, Orders.DESCRIBATIVE_ATTRIBUTE_9 AS order_status FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id
SELECT Products.product_id, Orders.date_order_placed FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id, Orders.date_order_placed HAVING COUNT(Order_Items.order_item_status_code) >= 2
SELECT Orders.order_id, Orders.date_order_placed FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Order_Items.order_item_status_code) >= 2
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2, COUNT(Order_Items.order_item_id) AS orders_count FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Customers.DESCRIPITIVE_ATTRIBUTE_2
SELECT Orders.DESCRIPITIVE_ATTRIBUTE_3, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.DESCRIPITIVE_ATTRIBUTE_3
SELECT Customers.gender_code AS first_name, Customers.customer_first_name AS middle_initial, Customers.customer_last_name AS last_name, Customer_Payment_Methods.payment_method_code AS payment_methods FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code AS first_name, Customers.customer_first_name AS middle_initial, Customers.login_name AS last_name, Customer_Payment_Methods.payment_method_code AS payment_method FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Orders.DESCRIPITIVE_ATTRIBUTE_6, Orders.date_order_placed, Shipments.shipment_tracking_number, Shipments.shipment_date FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Invoices.invoice_number = Shipments.invoice_number
SELECT Shipments.shipment_id AS invoice_id, Shipments.shipment_tracking_number AS status, Shipments.shipment_date AS date, Shipments.shipment_date AS shipment_date FROM Shipments LEFT JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id ORDER BY Shipments.shipment_id
SELECT Order_Items.order_item_status_code, Order_Items.product_id, Shipments.shipment_tracking_number, Shipments.shipment_date FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id ORDER BY Order_Items.order_item_id
SELECT Orders.order_id, Order_Items.DESCRIBITIVE_ATTRIBUTE_8, Shipments.shipment_tracking_number FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id INNER JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT login_password FROM Customers WHERE customer_first_name LIKE '+12%' OR customer_last_name LIKE '+12%'
SELECT customer_first_name, customer_middle_initial FROM Customers WHERE customer_first_name LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Order_Items.order_item_status_code FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name LIKE '%Dell%' ORDER BY Order_Items.order_item_status_code
SELECT Order_Items.DESCRIPITIVE_ATTRIBUTE_8, Orders.date_order_placed FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id ORDER BY Order_Items.DESCRIPITIVE_ATTRIBUTE_8
SELECT Order_Items.order_item_status_code, Orders.date_order_placed FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT customer_first_name, email_address, address_line_1, county FROM Customers WHERE county LIKE '%USA%'
SELECT customer_first_name, email_address, address_line_1 FROM Customers WHERE town_city = 'United States'
SELECT product_id, product_name FROM Products WHERE product_price > 3
SELECT product_id, product_name FROM Products WHERE product_id IN (SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(product_price) > 3)
SELECT Invoices.invoice_status_code, Shipments.shipment_id FROM Shipments JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Shipments.shipment_id HAVING COUNT(Shipments.shipment_id) >= 2 ORDER BY Invoices.invoice_date LIMIT 10
SELECT Invoices.invoice_status_code, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_status_code, Invoices.invoice_date HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Shipment_Items.order_item_id, Shipments.shipment_date FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id ORDER BY Shipments.shipment_date
SELECT order_id, shipment_date FROM Shipments
SELECT channel.Name FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT COUNT(channel.Channel_ID) FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = program.Director_ID WHERE channel.Name LIKE '%bbc%'
SELECT channel.DESCRIPITIVE_ATTRIBUTE_2 FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.DESCRIPATIVE_ATTRIBUTE_2, channel.Analogue_terrestrial_channel FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID GROUP BY channel.Channel_ID HAVING COUNT(program.Program_ID) > 1
SELECT director.DESCRIPITIVE_ATTRIBUTE_7, COUNT(program.Channel_ID) FROM director JOIN program ON director.Director_ID = program.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID GROUP BY director.DESCRIPITIVE_ATTRIBUTE_7 ORDER BY COUNT(program.Channel_ID) DESC
SELECT 1
SELECT Is_free, Is_online FROM city_channel_tv_show
SELECT radio.* FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.DESCRIBITIVE_ATTRIBUTE_9 > 150 OR city_channel_radio.DESCRIBITIVE_ATTRIBUTE_9 < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_2, COUNT(city_channel_radio.City_channel_ID) AS count FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel.DESCRIPITIVE_ATTRIBUTE_2 HAVING COUNT(city_channel_radio.City_channel_ID) > 0 ORDER BY COUNT(city_channel_radio.City_channel_ID) DESC
SELECT city_channel_radio.Radio_ID, city_channel_tv_show.DESCRIPITIVE_ATTRIBUTE_11 FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID JOIN city_channel_tv_show ON city_channel_tv_show.City_channel_ID = city_channel.ID WHERE city_channel_radio.Radio_ID IS NOT NULL GROUP BY city_channel_radio.Radio_ID ORDER BY city_channel_tv_show.DESCRIPITIVE_ATTRIBUTE_11 ASC
SELECT city_channel_radio.Is_online, radio.Transmitter FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT city_channel.City, COUNT(radio.Radio_ID) AS city_channels FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY city_channel.City ORDER BY city_channels DESC
SELECT 1
SELECT MAX(vehicle.Top_Speed) AS max_power, AVG(vehicle.Top_Speed) AS avg_power FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.DESCRIPITIVE_ATTRIBUTE_9 = 'Zhuzhou'
SELECT Model, MAX(Top_Speed) AS top_speed, MAX(Power) AS power FROM vehicle WHERE Build_Year = '1996' GROUP BY Model ORDER BY top_speed DESC, power DESC LIMIT 1
SELECT MAX(Top_Speed) AS top_speed, MAX(Power) AS top_power FROM vehicle WHERE Build_Year = '1996' ORDER BY MAX(Top_Speed) DESC, MAX(Power) DESC LIMIT 1
SELECT vehicle.Top_Speed AS build_year, vehicle.Builder AS model_name, driver.Citizenship AS builder FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Top_Speed, vehicle.Builder, driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT driver.Name) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT driver.DESCRIPITIVE_ATTRIBUTE_9, vehicle.Top_Speed, vehicle.Power FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT vehicle.Model, vehicle.Top_Speed FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Builder, vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder LIKE '%DJ%'
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) AS num_drivers FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name ORDER BY driver.Name
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name
SELECT Subject_Code, Exam_Date FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date, Subject_Code FROM Exams WHERE Subject_Code != 'Database'
SELECT Questions.DESCRIPITIVE_ATTRIBUTE_2, COUNT(Questions_in_Exams.Exam_ID) AS COUNT FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.DESCRIPITIVE_ATTRIBUTE_2 ORDER BY COUNT DESC
SELECT Type_of_Question_Code, COUNT(*) AS COUNT FROM Questions GROUP BY Type_of_Question_Code ORDER BY COUNT DESC
SELECT Students.First_Name, COUNT(Student_Answers.Student_Answer_Text) AS count FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Students.First_Name ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.DESCRIBITIVE_ATTRIBUTE_2, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID JOIN Student_Assessments ON Students.Student_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.First_Name HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.DESCRIPITIVE_ATTRIBUTE_2 HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2, COUNT(Student_Answers.Student_Answer_ID) FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.DESCRIPITIVE_ATTRIBUTE_2
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 GROUP BY club.Name ORDER BY SUM(player.Events_number) DESC LIMIT 1
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.DESCRIPITIVE_ATTRIBUTE_2 HAVING SUM(player.Events_number) > 2 ORDER BY SUM(player.Events_number) DESC LIMIT 1
SELECT club.Name, AVG(player.Earnings) AS average_earnings FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY AVG(player.Earnings) DESC
SELECT 1
SELECT Name AS manufacturer, COUNT(*) AS count FROM player GROUP BY Name ORDER BY count DESC LIMIT 1
SELECT Name, COUNT(*) as count FROM player GROUP BY Name ORDER BY count DESC LIMIT 1
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL
SELECT club.Name, player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT Name FROM club WHERE Club_ID IN ( SELECT Club_ID FROM player WHERE Events_number > 1400000 ) INTERSECT SELECT Name FROM club WHERE Club_ID IN ( SELECT Club_ID FROM player WHERE Events_number < 1100000 )
SELECT Orders.order_status_code, Orders.date_order_placed FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.date_order_placed HAVING COUNT(Order_Items.order_item_id) > 1 OR Orders.date_order_placed IN ( SELECT date_order_placed FROM Orders GROUP BY date_order_placed ORDER BY MIN(date_order_placed) LIMIT 1 ) ORDER BY Orders.date_order_placed
SELECT MIN(Orders.date_order_placed) AS earliest_order_date, Order_Items.order_item_status_code AS order_description, Order_Items.date_order_placed AS order_date FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Order_Items.order_item_status_code, Order_Items.date_order_placed HAVING COUNT(Order_Items.order_item_status_code) > 1 UNION SELECT Shipments.order_item_status_code AS order_description, Shipments.shipment_date AS order_date FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT product_id, product_name, product_price, product_color FROM Products WHERE product_id IN ( SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(product_id) < 2 ) ORDER BY product_name
SELECT payment_method_code, COUNT(*) as count FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) DESC LIMIT 1
SELECT Customers.gender_code, COUNT(Products.product_id) FROM Products INNER JOIN Customers ON Products.product_name = Customers.gender_code GROUP BY Customers.gender_code ORDER BY COUNT(Products.product_id) DESC
SELECT product_name AS Gender, COUNT(*) AS ProductCount FROM Products GROUP BY product_name ORDER BY ProductCount DESC
SELECT Products.product_size, Shipments.shipment_tracking_number FROM Products INNER JOIN Shipments ON Products.product_id = Shipments.shipment_id ORDER BY Shipments.shipment_tracking_number
SELECT Products.product_name, Shipments.shipment_date FROM Shipments JOIN Products ON Shipments.order_id = Products.product_id GROUP BY Products.product_name, Shipments.shipment_date ORDER BY Products.product_name, Shipments.shipment_date
SELECT Products.DESCRIBITIVE_ATTRIBUTE_3, Products.DESCRIBITIVE_ATTRIBUTE_3 AS color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.date_order_placed IS NOT NULL ORDER BY Orders.date_order_placed
SELECT Products.product_name, Products.product_color FROM Products JOIN Shipments ON Products.product_id = Shipments.order_id OR Products.product_id = Shipments.invoice_number
SELECT Shipments.shipment_tracking_number FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Shipments.invoice_number = Order_Items.order_item_id WHERE Order_Items.order_id IS NULL
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Orders.order_status_code = 'not shipped'
SELECT Order_Items.order_item_status_code AS order_id, Orders.order_status_code AS date, SUM(Shipments.shipment_tracking_number) AS total_cost FROM Shipments INNER JOIN Orders ON Shipments.order_id = Orders.order_id INNER JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Order_Items.order_item_status_code, Orders.order_status_code
SELECT Order_Items.order_item_id AS id, Orders.date_order_placed AS date, SUM(Shipments.shipment_tracking_number) AS total_amount_paid FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Order_Items.order_item_id = Shipments.order_id GROUP BY Order_Items.order_item_id ORDER BY Orders.date_order_placed
SELECT Products.DESCRIBITIVE_ATTRIBUTE_3, Products.product_size FROM Products
SELECT Products.product_name, Products.product_size, Products.product_color FROM Products
SELECT Customers.gender_code, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2 ) ORDER BY Customer_Payment_Methods.payment_method_code
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Orders.order_id HAVING COUNT(Customer_Payment_Methods.customer_id) >= 2
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(order_item_status_code) ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(order_item_status_code) ASC LIMIT 1
SELECT 1
SELECT channel.Channel_ID, channel.DESCRIPITIVE_ATTRIBUTE_2 FROM channel WHERE channel.Channel_ID NOT IN ( SELECT program.Channel_ID FROM program WHERE program.DESCRIPITIVE_ATTRIBUTE_11 = 'Hank Baskett' )
SELECT city_channel_radio.Is_online, COUNT(*) as count FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel.City = 'city channels' GROUP BY city_channel_radio.Is_online ORDER BY count DESC
SELECT radio.Transmitter, city_channel.DESCRIPITIVE_ATTRIBUTE_2 FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.DESCRIPITIVE_ATTRIBUTE_4 DESC
SELECT DISTINCT city_channel_radio.Is_online FROM city_channel_radio LEFT JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Transmitter IS NULL
SELECT vehicle.Builder FROM vehicle WHERE vehicle.Power > 6000 ORDER BY CAST(REPLACE(REPLACE(vehicle.Total_Production, 'mph', ''), ',', '') AS REAL) DESC LIMIT 1
SELECT driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT driver.Driver_ID, COUNT(vehicle.Vehicle_ID) AS count FROM (SELECT driver.Driver_ID, COUNT(vehicle.Vehicle_ID) AS count FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Driver_ID ORDER BY count DESC LIMIT 1) AS subquery
SELECT driver.Driver_ID, COUNT(vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY COUNT(vehicle_driver.Vehicle_ID) DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle GROUP BY Builder ORDER BY COUNT(Builder) ASC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(vehicle.Top_Speed) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Total_Production > 5000
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL ORDER BY driver.Name LIMIT 1
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT driver.Driver_ID, driver.DESCRIBTIVE_ATTRIBUTE_9 FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 1 OR driver.DESCRIBTIVE_ATTRIBUTE_9 = 'Ziyang' GROUP BY driver.Driver_ID, driver.DESCRIBTIVE_ATTRIBUTE_9
SELECT vehicle.Vehicle_ID, vehicle.Builder FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Ziyang' OR driver.Name IS NULL GROUP BY vehicle.Vehicle_ID, vehicle.Builder HAVING COUNT(driver.Name) = 2 ORDER BY vehicle.Vehicle_ID
SELECT SUM(count) FROM ( SELECT Builder, COUNT(*) AS count FROM vehicle WHERE Build_Year = 'top speed' GROUP BY Builder HAVING MAX(Total_Production) = (SELECT MAX(Total_Production) FROM vehicle WHERE Build_Year = 'top speed') ) AS subquery
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Answers.First_Name, COUNT(Student_Answers.First_Name) AS count FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Student_Answers.First_Name ORDER BY count ASC LIMIT 1
SELECT Student_Answer_ID, COUNT(Student_Answer_ID) AS frequency_count FROM Student_Assessments GROUP BY Student_Answer_ID ORDER BY COUNT(Student_Answer_ID) ASC LIMIT 1
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY count DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC LIMIT 1
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 FROM Students WHERE Students.Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT Students.DESCRIPATIVE_ATTRIBUTE_2 FROM Students LEFT JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID WHERE Student_Answers.Student_ID IS NULL
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Valid_Answer_ID = Student_Answers.Student_ID WHERE Student_Answers.Comments = 'Normal' AND Student_Answers.Student_Answer_Text = 'Absent'
SELECT Student_Answers.Comments FROM Student_Answers JOIN Valid_Answers ON Student_Answers.Student_ID = Valid_Answers.Valid_Answer_ID WHERE Valid_Answers.Valid_Answer_Text IN ('Normal', 'Absent')
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name, MAX(product_price) FROM Products WHERE product_name = 'Clothes' GROUP BY product_name ORDER BY MAX(product_price) DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_price = (SELECT MAX(product_price) FROM Products)
SELECT Products.product_id, Products.DESCRIBITIVE_ATTRIBUTE_3 FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_quantity = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
