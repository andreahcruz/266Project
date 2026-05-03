SELECT COUNT(DISTINCT Name) FROM club
SELECT COUNT(DISTINCT Name) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manager != 'Nike'
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player WHERE Country = 'Nike')
SELECT Name FROM club ORDER BY Wins_count ASC
SELECT Name FROM club WHERE Club_ID IN ( SELECT Club_ID FROM player GROUP BY Club_ID ORDER BY COUNT(Club_ID) ASC )
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Club_ID) > 1
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Club_ID) > 1
SELECT DISTINCT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Club_ID) > 1
SELECT DISTINCT Name FROM player WHERE Club_ID IN (SELECT Club_ID FROM club GROUP BY Club_ID HAVING COUNT(Club_ID) > 1)
SELECT COUNT(DISTINCT Name) FROM player
SELECT COUNT(DISTINCT Name) FROM player
SELECT COUNT(DISTINCT Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT Customer_Payment_Methods.customer_id) FROM Customer_Payment_Methods INNER JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Order_Items.order_id) FROM Order_Items
SELECT COUNT(DISTINCT Order_Items.order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT customer_id) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT Order_Items.order_item_id) FROM Order_Items WHERE Order_Items.order_item_status_code = 'shipped'
SELECT COUNT(*) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(Products.product_price) FROM Products
SELECT COUNT(DISTINCT channel.Name) FROM channel INNER JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID INNER JOIN director ON director_admin.Channel_ID = director.Director_ID
SELECT channel.Name FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID JOIN director ON director_admin.Channel_ID = director.Director_ID ORDER BY director.Age DESC
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT COUNT(City_channel_ID) FROM city_channel_radio WHERE Is_online = 'radio'
SELECT radio.Transmitter FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.DESCRIBITIVE_ATTRIBUTE_9 LIKE '%erp kw%' ORDER BY city_channel_radio.DESCRIBITIVE_ATTRIBUTE_9 ASC
SELECT city_channel.City FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel_radio.Is_online != 'ABC'
SELECT AVG(city_channel_radio.Is_online) FROM city_channel_radio INNER JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT Is_online FROM city_channel_radio WHERE City_channel_ID IN (SELECT ID FROM city_channel GROUP BY ID HAVING COUNT(ID) > 3)
SELECT driver.Citizenship FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Name = 'citizenship' AND vehicle.Model = 'United States'
SELECT driver.Citizenship FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'United States'
SELECT COUNT(DISTINCT vehicle.Vehicle_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'driver' AND driver.Citizenship = 'NASCAR'
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'NASCAR'
SELECT AVG(Power) FROM vehicle WHERE Builder = 'vehicles'
SELECT AVG(vehicle.Power) FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID
SELECT Citizenship FROM driver WHERE Name = 'drivers' ORDER BY Citizenship ASC
SELECT COUNT(DISTINCT Exam_ID) FROM Questions_in_Exams
SELECT COUNT(DISTINCT Exams.Exam_ID) FROM Exams INNER JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Questions_in_Exams.Exam_Name FROM Questions_in_Exams INNER JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID ORDER BY Questions_in_Exams.Exam_Name ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Student_ID WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Exam_ID WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers WHERE Exam_ID = 1
SELECT COUNT(DISTINCT Student_Answers.Student_Answer_Text) FROM Student_Answers INNER JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT First_Name FROM Students WHERE Middle_Name != 'M'
SELECT First_Name FROM Students WHERE Middle_Name != 'M'
SELECT Questions.Type_of_Question_Code FROM Questions INNER JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text FROM Students INNER JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text FROM Students INNER JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT COUNT(product_id) FROM Products
SELECT COUNT(product_id) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT Products.product_price FROM Products WHERE Products.product_type_code = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware Type'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Products.product_price DESC
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_name) >= 2
SELECT DISTINCT Products.product_type_code FROM Products GROUP BY Products.product_type_code HAVING COUNT(Products.product_type_code) >= 2
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT DISTINCT customer_phone FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(Customer_Orders.order_id) FROM Customer_Orders INNER JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT club.DESCRIPITIVE_ATTRIBUTE_2, player.DESCRIPITIVE_ATTRIBUTE_9 FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.DESCRIPITIVE_ATTRIBUTE_9 IN ('Manager', 'Captain')
SELECT club.DESCRIPITIVE_ATTRIBUTE_2, player.DESCRIPITIVE_ATTRIBUTE_9 FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.DESCRIPITIVE_ATTRIBUTE_9 IN ('Manager', 'Captain')
SELECT Name FROM club WHERE Club_ID = ( SELECT Club_ID FROM player ORDER BY Events_number DESC LIMIT 1 )
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.DESCRIPITIVE_ATTRIBUTE_2, player.DESCRIPITIVE_ATTRIBUTE_9 FROM club INNER JOIN player ON club.Club_ID = player.Club_ID
SELECT club.DESCRIPITIVE_ATTRIBUTE_2, player.DESCRIPITIVE_ATTRIBUTE_8 FROM club INNER JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Events_number) > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Country = 'Sam Allardyce'
SELECT Name FROM club WHERE Manager LIKE '%Sam Allardyce%'
SELECT DISTINCT club.Name, COUNT(player.Player_ID) FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT player.Name, COUNT(player.Name) FROM player INNER JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name
SELECT player.Earnings FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Manager FROM club WHERE Name = 'Australia' OR Name = 'Zimbabwe'
SELECT Products.product_id, Orders.order_status_code, COUNT(Order_Items.product_id) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id, Orders.order_status_code
SELECT Products.product_id, COUNT(Order_Items.product_id) AS product_count, Orders.order_status_code, Orders.order_id FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id, Orders.order_status_code, Orders.order_id
SELECT Orders.order_status_code, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Orders.order_status_code, Orders.date_order_placed HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id HAVING COUNT(Order_Items.product_id) >= 2
SELECT Customers.gender_code, COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Order_Items.product_id, COUNT(Order_Items.product_id) FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Order_Items.product_id
SELECT Customer_Payment_Methods.payment_method_code, '', '', Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods INNER JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id
SELECT gender_code, customer_first_name, customer_last_name, customer_middle_initial FROM Customers
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices INNER JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Shipments.order_id = Orders.order_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id JOIN Orders ON Order_Items.product_id = Orders.order_id WHERE Orders.order_status_code = 'ordered' AND Shipments.shipment_tracking_number = 'shipped'
SELECT customer_first_name, customer_last_name FROM Customers WHERE login_name LIKE '+12%'
SELECT Customers.customer_first_name, Customers.customer_last_name FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.order_status_code LIKE '+12%'
SELECT product_name FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.product_name LIKE '%Dell%'
SELECT Order_Items.order_item_status_code, Orders.date_order_placed FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT Order_Items.order_item_status_code, Orders.date_order_placed FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT customer_first_name, email_address, address_line_1 FROM Customers WHERE town_city = 'USA'
SELECT Customers.customer_first_name, Customers.email_address, Customers.address_line_1 FROM Customers
SELECT Products.product_id, Products.DESCRIBITIVE_ATTRIBUTE_3 FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.product_price * 3 < ( SELECT MAX(product_price) FROM Products )
SELECT Products.product_id, Products.product_name FROM Products WHERE Products.product_id IN ( SELECT Products.product_id FROM Products GROUP BY Products.product_id HAVING COUNT(Products.product_id) > 3 )
SELECT Shipments.shipment_date, Shipments.shipment_id FROM Shipments JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Shipments.shipment_id HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Invoices.invoice_status_code, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_status_code HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Shipment_Items.order_item_id, Shipments.shipment_date FROM Shipments INNER JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT order_id, shipment_date FROM Shipments
SELECT program.Title FROM program INNER JOIN director ON program.Director_ID = director.Director_ID ORDER BY director.Age LIMIT 1
SELECT COUNT(DISTINCT channel.Channel_ID) FROM channel INNER JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID WHERE channel.Analogue_terrestrial_channel LIKE '%bbc%'
SELECT channel.Name FROM program AS program INNER JOIN channel AS channel ON program.Channel_ID = channel.Channel_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Digital_terrestrial_channel FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID GROUP BY channel.Channel_ID HAVING COUNT(director_admin.Director_ID) > 1
SELECT director.Name, COUNT(director_admin.Director_ID) FROM director_admin JOIN channel ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID GROUP BY director.Name
SELECT channel.Name FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Next_show_name FROM tv_show
SELECT city_channel_radio.Is_online FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.RnaG_MHz > 150 OR radio.RnaG_MHz < 30
SELECT radio.RnaG_MHz FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_2, COUNT(city_channel_radio.City_channel_ID) FROM city_channel INNER JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel.DESCRIPITIVE_ATTRIBUTE_2
SELECT city_channel_radio.Is_online, city_channel_tv_show.Is_online FROM city_channel_radio JOIN city_channel_tv_show ON city_channel_radio.City_channel_ID = city_channel_tv_show.City_channel_ID WHERE city_channel_radio.Is_online = 'city' ORDER BY city_channel_tv_show.Is_online ASC
SELECT radio.Transmitter, radio.Radio_MHz FROM city_channel_radio INNER JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel_tv_show.Is_online) FROM city_channel_tv_show INNER JOIN city_channel ON city_channel_tv_show.City_channel_ID = city_channel.ID INNER JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID INNER JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE city_channel_tv_show.Is_free = 'city' GROUP BY radio.Transmitter
SELECT MAX(vehicle.Top_Speed), AVG(vehicle.Top_Speed) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Zhuzhou'
SELECT MAX(vehicle.Top_Speed) AS max_power, AVG(vehicle.Top_Speed) AS avg_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Zhuzhou'
SELECT vehicle.Power, vehicle.Top_Speed FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'year' AND driver.Citizenship = '1996' AND vehicle.Build_Year = 'top speed'
SELECT vehicle.Power, vehicle.Top_Speed FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year LIKE '1996%'
SELECT driver.Name, driver.Citizenship, driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID
SELECT driver.Name, driver.Citizenship, driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID
SELECT COUNT(DISTINCT driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT vehicle.Vehicle_ID) FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE (vehicle.Top_Speed > 100 OR vehicle.Power > 150)
SELECT driver.Name, driver.Citizenship, driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE (vehicle.Top_Speed + vehicle.Power) > 100 OR vehicle.Power > 150
SELECT driver.Name, vehicle.Top_Speed FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship LIKE '%DJ%'
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams WHERE Exams.Subject_Code != 'Database'
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams WHERE Exams.Subject_Code != 'Database'
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(Valid_Answer_Text) DESC
SELECT Student_Answer_Text FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID JOIN Valid_Answers ON Students.First_Name = Valid_Answers.Valid_Answer_ID GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Assessments INNER JOIN Student_Answers ON Student_Answers.Student_ID = Student_Assessments.Student_Answer_ID
SELECT Student_Assessments.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers INNER JOIN Students ON Student_Answers.Student_ID = Students.Student_ID INNER JOIN Student_Assessments ON Students.First_Name = Student_Assessments.Student_Answer_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID WHERE Students.Student_Address LIKE '%@%' ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.First_Name, Student_Answers.Date_of_Answer FROM Student_Assessments JOIN Students ON Students.Student_ID = Student_Answers.Student_ID JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID JOIN Student_Assessments ON Student_Assessments.Student_Answer_ID = Students.First_Name ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.First_Name HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT DISTINCT Student_Assessments.First_Name FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Student_Answer_ID = Student_Answers.Exam_ID GROUP BY Student_Assessments.First_Name HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT First_Name, COUNT(*) FROM Students GROUP BY First_Name
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY COUNT(player.Events_number) DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Events_number) DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Events_number) DESC
SELECT Name FROM club GROUP BY Name ORDER BY COUNT(Name) DESC LIMIT 1
SELECT Name FROM player GROUP BY Name ORDER BY COUNT(Name) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name, player.Earnings FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 INTERSECT SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings < 1100000
SELECT DISTINCT Orders.order_status_code, Orders.date_order_placed FROM Orders WHERE Orders.date_order_placed IN (SELECT Orders.date_order_placed FROM Orders GROUP BY Orders.date_order_placed ORDER BY COUNT(Orders.order_status_code) ASC LIMIT 1) OR EXISTS (SELECT 1 FROM Order_Items WHERE Order_Items.order_id = Orders.order_id GROUP BY Order_Items.order_id HAVING COUNT(Order_Items.order_id) > 1)
SELECT MIN(Orders.date_order_placed) AS EarliestOrderDate, Orders.date_order_placed AS OrderDate FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.date_order_placed HAVING COUNT(Orders.order_id) > 1
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products WHERE Products.product_id IN (SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(product_id) < 2)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods INNER JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(Customer_Payment_Methods.customer_id) DESC LIMIT 1
SELECT Customers.gender_code, COUNT(Products.product_id) FROM Products INNER JOIN Customers ON Products.parent_product_id = Customers.customer_first_name GROUP BY Customers.gender_code
SELECT Products.product_name, COUNT(*) FROM Products GROUP BY Products.product_name
SELECT Shipments.shipment_tracking_number, Products.product_name FROM Shipments INNER JOIN Products ON Shipments.order_id = Products.product_id
SELECT Products.product_name, Shipments.shipment_date FROM Shipments INNER JOIN Products ON Shipments.order_id = Products.product_id
SELECT Products.product_name, Orders.order_status_code FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Orders.date_order_placed LIKE '%SHIPPED%'
SELECT product_name, product_color FROM Products WHERE product_id IN (SELECT order_id FROM Shipments WHERE shipment_date > '2020-01-01 00:00:00')
SELECT Orders.order_status_code FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_tracking_number = 'NOT SHIPPED'
SELECT Orders.order_status_code FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_date < ( SELECT MIN(invoice_date) FROM Invoices WHERE invoice_number = Shipments.invoice_number )
SELECT Order_Items.product_id, Orders.order_status_code, SUM(Shipments.shipment_tracking_number) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Order_Items.product_id, Orders.order_status_code
SELECT Order_Items.order_item_id, Orders.order_status_code, SUM(Shipments.shipment_tracking_number) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Order_Items.order_item_id, Orders.order_status_code
SELECT Products.product_name, T2.product_name FROM Products INNER JOIN Products AS T2 ON Products.product_id = T2.product_id
SELECT Products.product_name, T2.product_name FROM Products INNER JOIN Products AS T2 ON Products.product_id = T2.product_id
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id WHERE Customer_Payment_Methods.payment_method_code LIKE '%payment method%' AND Customers.customer_last_name LIKE '%at least 2%'
SELECT Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Customer_Payment_Methods ON Order_Items.product_id = Customer_Payment_Methods.customer_id WHERE Order_Items.order_item_status_code = '2'
SELECT order_item_status_code FROM Order_Items WHERE order_id = (SELECT order_id FROM Orders GROUP BY order_id ORDER BY COUNT(order_id) ASC LIMIT 1)
SELECT order_item_status_code FROM Order_Items WHERE order_id IN (SELECT order_id FROM Orders GROUP BY order_id ORDER BY COUNT(order_id) ASC LIMIT 1)
SELECT channel.Name FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID JOIN director ON director_admin.Channel_ID = director.Director_ID WHERE director.Age > (SELECT AVG(Age) FROM director)
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title != 'Hank Baskett'
SELECT Is_online FROM city_channel_radio GROUP BY Is_online ORDER BY COUNT(Is_online) DESC LIMIT 1
SELECT radio.Transmitter, city_channel.DESCRIPITIVE_ATTRIBUTE_4 FROM city_channel JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.DESCRIPATIVE_ATTRIBUTE_4 DESC
SELECT DISTINCT city_channel.City FROM city_channel LEFT JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID LEFT JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Transmitter IS NULL
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT COUNT(vehicle.Vehicle_ID), driver.Driver_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY COUNT(vehicle.Vehicle_ID) DESC LIMIT 1
SELECT driver.Driver_ID, COUNT(vehicle_driver.Driver_ID) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Vehicle_ID GROUP BY driver.Driver_ID ORDER BY COUNT(vehicle_driver.Driver_ID) DESC LIMIT 1
SELECT driver.Driver_ID FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID ORDER BY vehicle.Top_Speed LIMIT 1
SELECT driver.Driver_ID FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID ORDER BY vehicle.Top_Speed ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID LEFT JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Vehicle_ID IS NULL
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed = 0
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 1 OR vehicle.Model = 'Ziyang'
SELECT driver.Driver_ID, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'driver' AND vehicle_driver.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle GROUP BY Vehicle_ID HAVING COUNT(Vehicle_ID) = 2) OR driver.Name = 'builder' AND driver.Citizenship = 'Ziyang'
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Power = ( SELECT MAX(Power) FROM vehicle )
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Power = (SELECT MAX(vehicle.Power) FROM vehicle)
SELECT driver.Name, driver.Racing_Series FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT First_Name FROM Students WHERE Student_ID = (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID ORDER BY COUNT(Student_ID) ASC LIMIT 1)
SELECT Student_Answer_Text FROM Student_Assessments WHERE Valid_Answer_ID = (SELECT Valid_Answer_ID FROM Student_Assessments GROUP BY Valid_Answer_ID ORDER BY COUNT(Valid_Answer_ID) ASC LIMIT 1)
SELECT Valid_Answer_Text FROM Valid_Answers WHERE Valid_Answer_ID IN (SELECT Valid_Answer_ID FROM Student_Assessments WHERE Student_Answer_Text IS NOT NULL GROUP BY Valid_Answer_ID ORDER BY COUNT(Student_Answer_Text) DESC LIMIT 1)
SELECT Valid_Answer_Text FROM Valid_Answers WHERE Valid_Answer_ID IN (SELECT Valid_Answer_ID FROM Student_Assessments GROUP BY Valid_Answer_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments INNER JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Exam_ID WHERE Student_Answers.Student_ID IS NULL
SELECT First_Name FROM Student_Assessments LEFT JOIN Students ON Students.Student_ID = Student_Assessments.Valid_Answer_ID WHERE Students.Student_ID IS NULL
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID WHERE Valid_Answers.Valid_Answer_Text IN ('Normal', 'Absent')
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID WHERE Student_Assessments.Satisfactory_YN = 'Normal' AND Student_Assessments.Assessment = 'Absent'
SELECT product_type_code FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_price = ( SELECT MAX(product_price) FROM Products WHERE product_name = 'Clothes' )
SELECT Products.product_type_code, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_quantity = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT Products.product_id, Products.DESCRIPITIVE_ATTRIBUTE_3 FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Products.product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(customer_phone) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(address_id) DESC LIMIT 1
SELECT Customers.customer_name FROM Customers GROUP BY Customers.customer_name ORDER BY COUNT(Customers.customer_name) ASC LIMIT 1
SELECT Customers.customer_name FROM Customers WHERE Customers.customer_phone = ( SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) ASC LIMIT 1
SELECT Order_Items.order_item_id FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Order_Items.order_item_id ORDER BY COUNT(Order_Items.order_item_id) DESC LIMIT 1
SELECT Order_Items.order_item_id FROM Order_Items INNER JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Order_Items.order_item_id ORDER BY COUNT(Order_Items.order_item_id) DESC LIMIT 1
SELECT Products.product_type_code FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_id IS NULL
SELECT Products.product_type_code FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id GROUP BY Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name HAVING COUNT(Shipment_Items.shipment_id) > 2 AND COUNT(Shipments.shipment_id) > 2
SELECT Customers.customer_id, Customers.DESCRIPITIVE_ATTRIBUTE_2, Customers.DESCRIPITIVE_ATTRIBUTE_3 FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Customers.customer_id HAVING COUNT(Orders.order_id) > 2 AND COUNT(Shipments.shipment_id) >= 3
SELECT gender_code, customer_first_name, login_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT gender_code, customer_first_name, login_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_size FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id LEFT JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.DESCRIPITIVE_ATTRIBUTE_3, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id, Products.DESCRIPITIVE_ATTRIBUTE_3, Products.product_price ORDER BY COUNT(Order_Items.order_id) DESC
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN (SELECT product_id, COUNT(*) as count FROM Products GROUP BY product_id ORDER BY count DESC LIMIT 1) AS T2 ON Products.product_id = T2.product_id
SELECT Products.product_id, SUM(Products.product_price * Orders.order_status_code) AS sum FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id ORDER BY sum ASC
SELECT Orders.order_status_code, Orders.date_order_placed, Order_Items.product_id, Order_Items.order_id, Order_Items.order_item_status_code, Orders.order_id FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id ORDER BY Order_Items.order_item_status_code ASC
SELECT DISTINCT Products.product_name, Products.product_price, Products.gender_code FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_first_name = 'Female'
SELECT Customers.gender_code, Customers.customer_first_name, Products.product_price FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_last_name = 'Female'
SELECT Products.product_name, Products.product_price FROM Products WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT Products.product_price, Products.product_size FROM Products WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(*) FROM Products WHERE product_price = 0
SELECT COUNT(*) FROM Order_Items WHERE product_id NOT IN (SELECT order_item_id FROM Order_Items)
SELECT COUNT(*) FROM Customer_Payment_Methods WHERE customer_id NOT IN (SELECT customer_id FROM Customers WHERE email_address != '')
SELECT COUNT(*) FROM Customer_Payment_Methods WHERE customer_id NOT IN (SELECT customer_id FROM Customers WHERE customer_middle_initial IS NOT NULL)
SELECT Customers.gender_code, Customers.email_address, Customers.address_line_1 FROM Customers JOIN (SELECT gender_code, COUNT(*) as count FROM Customers GROUP BY gender_code ORDER BY count LIMIT 1) AS T2 ON Customers.gender_code = T2.gender_code
SELECT Customers.gender_code, Customers.email_address, Customers.address_line_1 FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_status_code IN ( SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_id) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT channel.Name FROM channel INNER JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID GROUP BY channel.Name ORDER BY COUNT(director_admin.Director_ID) DESC LIMIT 1
SELECT channel.Name, director.Age FROM program JOIN director ON program.Director_ID = director.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY channel.Name ORDER BY COUNT(director_admin.Director_ID) DESC LIMIT 1
SELECT COUNT(channel.Channel_ID) FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID JOIN director ON director_admin.Channel_ID = director.Director_ID WHERE director.Age = 0
SELECT channel.Name, channel.Digital_terrestrial_channel FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID GROUP BY channel.Name ORDER BY COUNT(program.Channel_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID WHERE program.Title LIKE '%Director%' AND director.Age < 40 AND director.Age > 60
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 2 OR vehicle.Builder = 'Jeff Gordon'
SELECT driver.Driver_ID, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE (SELECT COUNT(*) FROM vehicle_driver AS T4 JOIN vehicle AS T5 ON T4.Vehicle_ID = T5.Vehicle_ID WHERE T5.Model = 'Jeff Gordon') > 1 OR vehicle.Model = 'Jeff Gordon'
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Products.product_type_code FROM Products WHERE Products.product_price > ( SELECT AVG(Products.product_price) FROM Products WHERE Products.product_name = 'Hardware' )
SELECT Products.product_type_code FROM Products JOIN ( SELECT product_name, AVG(product_price) AS avg_price FROM Products WHERE product_name = 'Hardware' GROUP BY product_name ) AS T2 ON Products.product_name = T2.product_name WHERE Products.product_price > T2.avg_price
SELECT Customer_Orders.order_status_code, Customer_Orders.order_status_code AS name, Customer_Orders.order_status_code AS phone, Customer_Orders.order_status_code AS email FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id JOIN Customers ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(Order_Items.product_id) DESC LIMIT 1
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id ORDER BY Order_Items.product_id DESC LIMIT 1
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id LEFT JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_id IS NULL
SELECT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity > '6' OR Order_Items.product_id > '3'
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity > '6' OR Order_Items.product_id > '3'
SELECT region.Name FROM building INNER JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Name ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT region.Name, region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Name ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT Services.Service_Details, COUNT(Customer_Interactions.Customer_Interaction_ID) AS total_services FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_Details ORDER BY total_services DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details, COUNT(Customer_Interactions.Customer_Interaction_ID) AS total_services FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_ID ORDER BY total_services DESC LIMIT 1
SELECT Services.Service_Details FROM Services INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID INNER JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID GROUP BY Services.Service_Details ORDER BY COUNT(Customer_Interactions.Customer_Interaction_ID) DESC LIMIT 1
SELECT Services.Service_Details, COUNT(Customer_Interactions.Customer_Interaction_ID) AS total_services FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_Details ORDER BY total_services DESC LIMIT 1
SELECT Customer_Interactions.Status_Code, Customer_Interactions.Services_and_Channels_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Channel_ID = Customers.Customer_ID JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customer_Interactions AS T4_2 ON Services.Service_ID = T4_2.Service_ID JOIN Customers AS T2_2 ON T4_2.Customer_ID = T2_2.Customer_ID GROUP BY Customer_Interactions.Status_Code ORDER BY COUNT(Customer_Interactions.Status_Code) ASC LIMIT 1
SELECT DISTINCT Services.Service_Details, Customers.Customer_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Interactions.Status_Code = (SELECT Status_Code FROM Customer_Interactions GROUP BY Status_Code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT DISTINCT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' OR Customers.Customer_Details = 'good'
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' OR Customers_and_Services.Customers_and_Services_Details = 'good'
SELECT DISTINCT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'bad' AND Services.Service_Details = 'Hardy Kutch'
SELECT Discount.name, Discount.name, Renting_history.total_hours FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Discount ON Vehicles.id = Discount.id JOIN Customers ON Renting_history.customer_id = Customers.id WHERE Customers.name LIKE '%2013%' OR Customers.name LIKE '%2014%'
SELECT Discount.name, Discount.name, Renting_history.total_hours FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Discount ON Vehicles.id = Discount.id JOIN Customers ON Renting_history.customer_id = Customers.id WHERE Vehicles.name = 'Model Year' AND Vehicles.Combined_fuel_economy_rate IN (2013, 2014)
SELECT Discount.name, Discount.membership_credit FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Customers ON Renting_history.customer_id = Customers.id GROUP BY Discount.name, Discount.membership_credit ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name, Discount.membership_credit FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Customers ON Renting_history.customer_id = Customers.id GROUP BY Discount.name, Discount.membership_credit ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Renting_history INNER JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Renting_history INNER JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Students.student_id, Classes.DESCRIPITIVE_ATTRIBUTE_7 FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Detention ON Students.student_id = Detention.student_id WHERE (Students_Addresses.address_id IS NOT NULL OR Students_Addresses.address_type_code IS NOT NULL OR Students_Addresses.student_id IS NOT NULL) AND (Detention.detention_type_code IS NULL OR Detention.student_id IS NULL)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id WHERE (Classes.teacher_id IS NOT NULL AND Classes.teacher_id != 0) OR (Classes.teacher_id IS NULL OR Classes.teacher_id = 0)
SELECT Students.bio_data FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.DESCRIBITIVE_ATTRIBUTE_9 LIKE '%data%' AND Students.student_id NOT IN (SELECT Students.student_id FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id WHERE Achievements.other_details LIKE 'net%')
SELECT DISTINCT Students.bio_data FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.DESCRIBITIVE_ATTRIBUTE_9 LIKE '%data%' AND Classes.DESCRIBITIVE_ATTRIBUTE_9 NOT LIKE 'net%'
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(Students_Addresses.student_address_id) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(Students_Addresses.student_address_id) >= 2
SELECT Students.bio_data, Students.student_id FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id GROUP BY Students.student_id ORDER BY COUNT(Achievements.student_id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_id FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id GROUP BY Students.student_id ORDER BY COUNT(Achievements.student_id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(behaviour_monitoring_details) DESC LIMIT 1) AND Behaviour_Monitoring.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(behaviour_monitoring_details) DESC LIMIT 1 OFFSET 1)
SELECT Students.bio_data, Students.student_details, Student_Events.other_details FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(behaviour_monitoring_details) DESC LIMIT 1 ) AND Students.student_id IN ( SELECT Student_Loans.student_id FROM Student_Loans GROUP BY Student_Loans.student_id HAVING COUNT(Student_Loans.student_id) = 3 )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE (Behaviour_Monitoring.behaviour_monitoring_details, Student_Events.other_details, Student_Loans.other_details) IN (SELECT Behaviour_Monitoring.behaviour_monitoring_details, Student_Events.other_details, Student_Loans.other_details FROM Behaviour_Monitoring JOIN Student_Events ON Behaviour_Monitoring.behaviour_monitoring_id = Student_Events.event_type_code JOIN Student_Loans ON Behaviour_Monitoring.behaviour_monitoring_id = Student_Loans.student_id GROUP BY Behaviour_Monitoring.behaviour_monitoring_id HAVING COUNT(DISTINCT Behaviour_Monitoring.behaviour_monitoring_details) = 1 AND COUNT(DISTINCT Student_Events.other_details) = 1 AND COUNT(DISTINCT Student_Loans.other_details) = 1)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(behaviour_monitoring_details) DESC LIMIT 1 )
SELECT COUNT(Student_Events.event_id), Ref_Achievement_Type.achievement_type_description, Ref_Event_Types.event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code JOIN Ref_Achievement_Type ON Ref_Event_Types.event_type_description = Ref_Achievement_Type.achievement_type_description GROUP BY Ref_Achievement_Type.achievement_type_description ORDER BY COUNT(Student_Events.event_id) DESC LIMIT 1
SELECT Ref_Event_Types.event_type_description, COUNT(Student_Events.event_id) AS number_of_students, Ref_Achievement_Type.achievement_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code JOIN Ref_Achievement_Type ON Ref_Event_Types.event_type_description = Ref_Achievement_Type.achievement_type_description GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(Student_Events.event_id) DESC LIMIT 1
SELECT COUNT(Students.student_id) FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.student_loan_id NOT IN (SELECT student_loan_id FROM Student_Loans WHERE other_details = 'achievement')
SELECT COUNT(Students.student_id) FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id JOIN Ref_Achievement_Type ON Ref_Achievement_Type.achievement_type_description = 'teacher' WHERE Student_Loans.student_loan_id NOT IN (SELECT Achievements.achievement_id FROM Achievements WHERE Achievements.achievement_details = 'achievement')
SELECT Ref_Detention_Type.detention_type_description, Ref_Achievement_Type.achievement_type_description FROM Ref_Achievement_Type JOIN Detention ON Ref_Achievement_Type.achievement_type_code = Detention.detention_type_code JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Ref_Detention_Type.detention_type_description ORDER BY COUNT(Ref_Detention_Type.detention_type_description) ASC LIMIT 1
SELECT Ref_Achievement_Type.achievement_type_description, Ref_Event_Types.event_type_description FROM Ref_Event_Types JOIN Ref_Achievement_Type ON Ref_Event_Types.event_type_code = Ref_Achievement_Type.achievement_type_code JOIN Detention ON Detention.detention_type_code = Ref_Achievement_Type.achievement_type_code GROUP BY Ref_Achievement_Type.achievement_type_description ORDER BY COUNT(Ref_Achievement_Type.achievement_type_description) ASC LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Students.bio_data, Students.student_details, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id JOIN Student_Loans ON Students.student_id = Student_Loans.student_id ORDER BY Student_Loans.date_of_loan LIMIT 1
SELECT Ref_Address_Types.address_type_description, Ref_Address_Types.address_type_code FROM Ref_Address_Types JOIN Students_Addresses ON Ref_Address_Types.address_type_code = Students_Addresses.address_type_code GROUP BY Ref_Address_Types.address_type_description ORDER BY COUNT(Ref_Address_Types.address_type_description) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_description, Ref_Achievement_Type.achievement_type_description FROM Ref_Achievement_Type INNER JOIN Ref_Address_Types ON Ref_Achievement_Type.achievement_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_description ORDER BY COUNT(Ref_Address_Types.address_type_description) DESC LIMIT 1
