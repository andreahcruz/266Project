SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Name NOT IN (SELECT club.Name FROM club WHERE club.Manager = 'Nike')
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player WHERE Name = 'Nike')
SELECT club.Name, COUNT(player.Player_ID) AS wins_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY wins_count ASC
SELECT club.Name, COUNT(player.Player_ID) AS win_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY win_count ASC
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING count(DISTINCT player.Player_ID) > 1
SELECT Name FROM player GROUP BY Name HAVING COUNT(DISTINCT Club_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT Name) FROM club
SELECT COUNT(DISTINCT Name) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Shipments
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT order_id) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Director_ID) FROM director
SELECT DISTINCT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID ORDER BY program.Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Transmitter FROM radio WHERE Lyric_FM_MHz != 'ABC'
SELECT AVG(CAST(Is_online AS REAL)) FROM city_channel_radio
SELECT City FROM city_channel GROUP BY City HAVING COUNT(DISTINCT ID) > 3
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'United States'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'United States'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Model = 'NASCAR'
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Power) FROM vehicle
SELECT Citizenship FROM driver ORDER BY Citizenship ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT count(*) FROM Questions_in_Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Student_Answers.Exam_ID = Valid_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Student_Assessments ON Student_Assessments.Valid_Answer_ID = Student_Answers.Exam_ID WHERE Student_Assessments.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT COUNT(DISTINCT Satisfactory_YN) FROM Student_Assessments
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE First_Name != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Question_ID FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_ID HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.* FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware type"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(DISTINCT customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT customer_name FROM Customers
SELECT DISTINCT customer_phone FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name FROM player ORDER BY player.Events_number DESC LIMIT 1
SELECT Name FROM player WHERE Events_number = (SELECT MAX(Events_number) FROM player)
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = 'Sam Allardyce'
SELECT club.Name, count(*) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT club.Name, COUNT(DISTINCT player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code, COUNT(Shipments.shipment_id) FROM Order_Items JOIN Shipments ON Order_Items.order_item_id = Shipments.order_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code HAVING COUNT(Shipments.shipment_id) > 0
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) AS product_count FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Order_Items.order_item_id, Orders.date_order_placed FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Orders.date_order_placed HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(*) >= 2
SELECT Customers.gender_code, COUNT(Order_Items.order_item_id) FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.gender_code
SELECT Orders.customer_id, COUNT(*) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.customer_id
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT gender_code, customer_first_name, customer_last_name, login_name FROM Customers
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Orders.order_status_code FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id WHERE Shipments.shipment_tracking_number IS NOT NULL AND Orders.order_status_code IS NOT NULL
SELECT Shipments.shipment_tracking_number, Orders.order_status_code FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id WHERE Shipments.shipment_tracking_number IS NOT NULL
SELECT customer_first_name, customer_last_name FROM Customers WHERE login_name LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE customer_middle_initial LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT order_item_status_code, shipment_date FROM Order_Items JOIN Shipments ON Order_Items.order_item_id = Shipments.order_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_date FROM Order_Items JOIN Shipments ON Shipments.order_id = Order_Items.product_id
SELECT email_address, address_line_1, town_city FROM Customers WHERE customer_first_name = 'USA'
SELECT email_address, address_line_1, town_city FROM Customers WHERE customer_first_name = 'United States'
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_name HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_name HAVING COUNT(*) > 3
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(DISTINCT Order_Items.order_item_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Orders.order_id, Orders.date_order_placed FROM Orders
SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM director_admin ORDER BY Director_ID LIMIT 1)
SELECT count(*) FROM channel WHERE Analogue_terrestrial_channel LIKE '%bbc%' OR Digital_terrestrial_channel LIKE '%bbc%' OR Internet LIKE '%bbc%'
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(*) > 1 )
SELECT channel.Name, COUNT(program.Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT tv_show_name, COUNT(*) FROM tv_show GROUP BY tv_show_name
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT radio.Transmitter, radio.Radio_MHz FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT radio.Transmitter, COUNT(city_channel_radio.City_channel_ID) AS city_channels_count FROM radio JOIN city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Transmitter
SELECT MAX(Top_Speed), AVG(Top_Speed) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Top_Speed) as max_power, AVG(Top_Speed) as avg_power FROM vehicle WHERE Model = 'Zhuzhou'
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Build_Year = "1996"
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT vehicle.Build_Year, driver.Name, driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year, driver.Name, driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Name, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model, COUNT(DISTINCT driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Model
SELECT driver.Name, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code != "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Satisfactory_YN, COUNT(*) as count FROM Student_Assessments GROUP BY Satisfactory_YN ORDER BY count DESC
SELECT Assessment, COUNT(*) as frequency FROM Student_Assessments GROUP BY Assessment ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Students ON Student_Answers.Student_ID = Students.Student_ID JOIN Student_Assessments ON Questions_in_Exams.Question_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Students ON Student_Answers.Student_ID = Students.Student_ID JOIN Student_Assessments ON Questions_in_Exams.Question_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT DISTINCT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Events_number) DESC
SELECT club.Name, AVG(player.Earnings) as avg_earnings FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY avg_earnings DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM player GROUP BY Name ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 1400000 OR player.Events_number < 1100000
SELECT club.Name FROM club WHERE club.Club_ID IN ( SELECT Club_ID FROM player WHERE Events_number > 1400000 ) AND club.Club_ID IN ( SELECT Club_ID FROM player WHERE Events_number < 1100000 )
SELECT DISTINCT Orders.date_order_placed FROM Orders WHERE Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR Orders.order_id IN ( SELECT Shipments.order_id FROM Shipments GROUP BY Shipments.order_id HAVING COUNT(*) > 1 )
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) UNION SELECT Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Shipment_Items.shipment_id) > 1
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id HAVING COUNT(DISTINCT Shipment_Items.shipment_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.gender_code, COUNT(t1.product_id) AS number_of_products FROM Products JOIN Customers ON t1.parent_product_id = t2.customer_id GROUP BY t2.gender_code
SELECT product_name, COUNT(*) FROM Products GROUP BY product_name
SELECT Products.product_name, Invoices.invoice_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT DISTINCT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipment_Items.order_item_id = Order_Items.order_item_id ORDER BY Shipments.shipment_date
SELECT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_tracking_number = 'shipped'
SELECT DISTINCT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT Shipments.shipment_tracking_number FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id WHERE Shipments.shipment_tracking_number != 'shipped'
SELECT Orders.order_status_code FROM Orders WHERE Orders.order_id NOT IN (SELECT Shipments.order_id FROM Shipments WHERE Shipments.shipment_tracking_number = 'shipped')
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price) as total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Order_Items.order_item_id, Orders.date_order_placed, SUM(Products.product_price) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Order_Items.order_item_id, Orders.date_order_placed
SELECT product_name, product_color FROM Products
SELECT product_name, product_color FROM Products
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 )
SELECT DISTINCT Orders.date_order_placed FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Customers.customer_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(DISTINCT Order_Items.order_item_id) >= 2 )
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT channel.Name FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program ) AND channel.Channel_ID IN ( SELECT director_admin.Channel_ID FROM director_admin WHERE director_admin.Director_ID IN ( SELECT director.Director_ID FROM director WHERE director.Age > ( SELECT AVG(T2_avg.Age) FROM director AS T2_avg ) ) )
SELECT channel.Channel_ID, channel.Name FROM channel WHERE channel.Channel_ID NOT IN (SELECT program.Channel_ID FROM program WHERE program.Title = 'Hank Baskett')
SELECT City, COUNT(*) as count FROM city_channel WHERE Station_name = 'city' GROUP BY City ORDER BY count DESC LIMIT 1
SELECT radio.Transmitter, radio.Radio_MHz, city_channel.Owned_Since FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT radio.Transmitter FROM radio WHERE radio.Radio_ID NOT IN ( SELECT city_channel_radio.Radio_ID FROM city_channel_radio )
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT MAX(vehicle_count) AS max_vehicles, Driver_ID AS driver_id FROM (SELECT driver.Driver_ID, COUNT(vehicle_driver.Driver_ID) AS vehicle_count FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID) WHERE vehicle_count = (SELECT MAX(vehicle_count) FROM (SELECT COUNT(vehicle_driver.Driver_ID) AS vehicle_count FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID))
SELECT driver.Driver_ID, count(*) as vehicle_count FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT vehicle_driver.Driver_ID FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver)
SELECT Citizenship FROM driver WHERE Driver_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT t1.Vehicle_ID, t1.Model FROM vehicle t1 WHERE t1.Vehicle_ID IN ( SELECT t3.Vehicle_ID FROM vehicle_driver t3 GROUP BY t3.Vehicle_ID HAVING COUNT(DISTINCT t3.Driver_ID) = 2 ) OR t1.Builder = 'Ziyang'
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE Vehicle_ID IN ( SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID HAVING COUNT(DISTINCT driver.Driver_ID) = 2 ) OR vehicle.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Name, driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) ASC LIMIT 1
SELECT Student_Answer_Text, COUNT(*) as frequency_count FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY frequency_count ASC LIMIT 1
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT DISTINCT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Normal' AND Student_Answers.Exam_ID IN ( SELECT Exam_ID FROM Student_Answers WHERE Student_Answer_Text = 'Absent' )
SELECT DISTINCT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Normal' AND Student_Answers.Exam_ID IN ( SELECT Exam_ID FROM Student_Answers WHERE Student_Answer_Text = 'Absent' )
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_price = (SELECT MAX(product_price) FROM Products WHERE product_name = 'Clothes')
SELECT Products.product_id, Products.product_type_code FROM Products WHERE Products.product_name = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT Products.product_id, Products.product_type_code FROM Products WHERE Products.product_name = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers GROUP BY customer_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers WHERE customer_name = (SELECT customer_name FROM Customers GROUP BY customer_name ORDER BY COUNT(*) ASC LIMIT 1)
SELECT payment_method_code FROM Customers WHERE customer_name IN (SELECT customer_name FROM Customers GROUP BY customer_name ORDER BY COUNT(*) ASC LIMIT 1)
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_item_id FROM Order_Items GROUP BY order_item_id ORDER BY count(*) DESC LIMIT 1
SELECT Order_Items.order_quantity FROM Order_Items GROUP BY Order_Items.order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products EXCEPT SELECT Products.product_type_code FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id
SELECT product_type_code FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT DISTINCT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id, Customers.gender_code, Customers.customer_first_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT DISTINCT Products.product_id, Customers.gender_code, Customers.customer_first_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Products.product_id, Customers.gender_code, Customers.customer_first_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT gender_code, customer_first_name, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id HAVING COUNT(Order_Items.order_item_id) < 2
SELECT Products.product_id, Products.product_name, Products.product_price, COUNT(*) as frequency FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price ORDER BY frequency DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id, SUM(Products.product_price) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Order_Items.product_id, SUM(CAST(Order_Items.order_item_status_code AS REAL)) as total_cost FROM Order_Items GROUP BY Order_Items.product_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.parent_product_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_id) FROM Products WHERE product_price = 0 OR product_price IS NULL
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT gender_code, address_line_1, town_city FROM Customers WHERE email_address = ( SELECT email_address FROM Customers GROUP BY email_address ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT gender_code, address_line_1, town_city FROM Customers WHERE email_address = ( SELECT email_address FROM Customers GROUP BY email_address ORDER BY COUNT(customer_id) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_size, product_description, product_color FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT channel.Name, COUNT(*) as program_count FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name ORDER BY program_count DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel WHERE channel.Channel_ID = ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT channel.Channel_ID) FROM channel WHERE channel.Channel_ID NOT IN (SELECT DISTINCT program.Channel_ID FROM program)
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel WHERE channel.Channel_ID = ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID ORDER BY COUNT(DISTINCT program.Director_ID) DESC LIMIT 1 )
SELECT DISTINCT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program WHERE program.Start_Year > 60 ) AND channel.Channel_ID IN ( SELECT program.Channel_ID FROM program WHERE program.Start_Year < 40 )
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT driver.Driver_ID) > 2 ) OR driver.Name = 'Jeff Gordon'
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon' OR vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT driver.Driver_ID) > 2 )
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT DISTINCT Vehicle_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT DISTINCT Vehicle_ID FROM vehicle_driver)
SELECT product_type_code FROM Products WHERE product_name = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'hardware')
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware')
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers WHERE Customers.customer_id = (SELECT Customer_Orders.customer_id FROM Customer_Orders GROUP BY Customer_Orders.customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Orders)
SELECT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders WHERE order_id IN ( SELECT order_id FROM Order_Items WHERE CAST(order_quantity AS INTEGER) > 6 ) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3 )
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity > 6 OR Customer_Orders.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3 )
SELECT region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY building.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Capital FROM region WHERE region.Region_ID = (SELECT region.Region_ID FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Analytical_Layer.* FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID GROUP BY Analytical_Layer.Analytical_ID ORDER BY COUNT(Analytical_Layer.Analytical_ID) DESC LIMIT 1
SELECT Services.* FROM Services WHERE Services.Service_ID = (SELECT Customer_Interactions.Service_ID FROM Customer_Interactions GROUP BY Customer_Interactions.Service_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customer_Interactions.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details, COUNT(DISTINCT Customer_Interactions.Customer_ID) as service_types_count FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY service_types_count DESC LIMIT 1
SELECT Analytical_Layer.Analytical_ID, Analytical_Layer.Customers_and_Services_ID, Analytical_Layer.Pattern_Recognition, Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer WHERE Analytical_Layer.Customers_and_Services_ID IN ( SELECT Customers_and_Services.Customers_and_Services_ID FROM Customers_and_Services GROUP BY Customers_and_Services.Customers_and_Services_ID HAVING COUNT(*) = ( SELECT COUNT(*) FROM Customers_and_Services GROUP BY Customers_and_Services.Customers_and_Services_ID ORDER BY COUNT(*) ASC LIMIT 1 ) )
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services WHERE Services.Service_ID IN ( SELECT Customer_Interactions.Service_ID FROM Customer_Interactions WHERE Customer_Interactions.Customer_ID = ( SELECT Customers.Customer_ID FROM Customers GROUP BY Customers.Customer_ID ORDER BY COUNT(*) ASC LIMIT 1 ) )
SELECT DISTINCT Customers.Customer_Details FROM Customers WHERE Customers.Customer_ID IN ( SELECT Customer_Interactions.Customer_ID FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = "Hardy Kutch" ) UNION SELECT DISTINCT Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = "good"
SELECT DISTINCT Customers_and_Services.Customers_and_Services_ID, Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT DISTINCT Customers_and_Services.Customers_and_Services_ID, Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Customer_Interactions ON Customers_and_Services.Customers_and_Services_ID = Customer_Interactions.Channel_ID WHERE Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers INNER JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID INNER JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Customers.name, Discount.name, Vehicles.Cost_per_25_miles FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Customers.name, Discount.name, Vehicles.Cost_per_25_miles FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Customers.name, Customers.membership_credit FROM Customers WHERE Customers.id = ( SELECT Renting_history.customer_id FROM Renting_history GROUP BY Renting_history.customer_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Customers.name, Customers.membership_credit FROM Customers WHERE Customers.id = ( SELECT Renting_history.customer_id FROM Renting_history GROUP BY Renting_history.customer_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Discount WHERE Discount.id = ( SELECT Renting_history.discount_id FROM Renting_history GROUP BY Renting_history.discount_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id IN ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2 ) OR Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.student_id HAVING COUNT(*) < 2 )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE student_id IN ( SELECT Students.student_id FROM Students LEFT JOIN Transcripts ON Students.student_id = Transcripts.student_id GROUP BY Students.student_id HAVING COUNT(Transcripts.transcript_id) >= 2 ) OR student_id IN ( SELECT Students.student_id FROM Students LEFT JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id GROUP BY Students.student_id HAVING COUNT(Behaviour_Monitoring.behaviour_monitoring_id) < 2 )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes WHERE Classes.class_details LIKE '%data%' ) AND Students.student_id NOT IN ( SELECT Classes.student_id FROM Classes WHERE Classes.class_details LIKE 'net%' )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes WHERE Classes.class_details LIKE '%data%' ) AND Students.student_id NOT IN ( SELECT Classes.student_id FROM Classes WHERE Classes.class_details LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Students.student_id IN ( SELECT Students_Addresses.student_id FROM Students_Addresses GROUP BY Students_Addresses.student_id HAVING COUNT(*) >= 2 )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id WHERE Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) >= 2 )
SELECT Students.student_id, Students.bio_data, COUNT(Classes.class_id) as course_count FROM Students LEFT JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id, Students.bio_data ORDER BY course_count DESC LIMIT 1
SELECT Students.student_id, Students.bio_data, COUNT(Classes.class_id) as course_count FROM Students JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id, Students.bio_data ORDER BY course_count DESC LIMIT 1
SELECT Students.student_id, Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_id, Behaviour_Monitoring.behaviour_monitoring_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = ( SELECT COUNT(*) as cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY cnt DESC LIMIT 1 ) ) AND Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id WHERE Achievements.achievement_details = 'behaviour monitoring' AND Achievements.other_details IN ( SELECT Achievements.other_details FROM Achievements WHERE Achievements.achievement_details = 'behaviour monitoring' GROUP BY Achievements.other_details HAVING COUNT(*) = 3 ) AND Achievements.other_details IN ( SELECT Achievements.other_details FROM Achievements WHERE Achievements.achievement_details = 'behaviour monitoring' GROUP BY Achievements.other_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(DISTINCT Detention.other_details) = 1 AND Detention.other_details = ( SELECT T9_inner.other_details FROM Detention AS T9_inner GROUP BY T9_inner.other_details ORDER BY COUNT(*) DESC LIMIT 1 ) )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT Detention.student_id) AS number, Ref_Achievement_Type.achievement_type_code AS event_type, Ref_Achievement_Type.achievement_type_description AS description FROM Detention JOIN Ref_Achievement_Type ON Detention.detention_type_code = Ref_Achievement_Type.achievement_type_code WHERE Ref_Achievement_Type.achievement_type_code = (SELECT Detention.detention_type_code FROM Detention GROUP BY Detention.detention_type_code ORDER BY COUNT(*) DESC LIMIT 1) GROUP BY Ref_Achievement_Type.achievement_type_code, Ref_Achievement_Type.achievement_type_description
SELECT COUNT(student_id) as number_of_students, Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Ref_Detention_Type.detention_type_code ORDER BY COUNT(student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Students_Addresses.address_id) FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id LEFT JOIN Achievements ON Students.student_id = Achievements.student_id WHERE Achievements.achievement_id IS NULL
SELECT COUNT(DISTINCT Achievements.student_id) FROM Achievements WHERE Achievements.student_id IN ( SELECT Classes.student_id FROM Classes WHERE Classes.teacher_id NOT IN ( SELECT DISTINCT Classes.teacher_id FROM Classes ) )
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type WHERE Ref_Detention_Type.detention_type_code = (SELECT Detention.detention_type_code FROM Detention GROUP BY Detention.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type WHERE Ref_Detention_Type.detention_type_code IN (SELECT Detention.detention_type_code FROM Detention GROUP BY Detention.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id WHERE Students_Addresses.address_id = ( SELECT Students_Addresses.address_id FROM Students_Addresses ORDER BY Students_Addresses.date_from ASC LIMIT 1 )
SELECT DISTINCT Students.* FROM Students WHERE student_id IN (SELECT address_id FROM Students_Addresses WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE date_of_loan = (SELECT MIN(date_of_loan) FROM Student_Loans)))
SELECT achievement_type_code, achievement_type_description FROM Ref_Achievement_Type WHERE achievement_type_code IN (SELECT achievement_type_code FROM Achievements GROUP BY achievement_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types JOIN Students_Addresses ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
