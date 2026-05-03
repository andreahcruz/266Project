SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Manager != 'Nike'
SELECT DISTINCT club.Name FROM club WHERE club.Club_ID NOT IN (SELECT player.Club_ID FROM player WHERE player.Name = 'Nike')
SELECT club.Name, COUNT(player.Player_ID) AS wins_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY wins_count ASC
SELECT club.Name, COUNT(player.Player_ID) AS win_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings = 1 GROUP BY club.Club_ID, club.Name ORDER BY win_count ASC
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING count(DISTINCT player.Player_ID) > 1
SELECT Name FROM player GROUP BY Name HAVING COUNT(DISTINCT Club_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(player.Player_ID) > 1
SELECT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manager HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT Manager) FROM club
SELECT COUNT(DISTINCT Captain) FROM club
SELECT COUNT(DISTINCT Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT Shipments.order_id) FROM Shipments WHERE Shipments.shipment_tracking_number = 'shipped'
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Name) FROM director WHERE Name LIKE '%digital%terrestrial%' OR Name LIKE '%terrestrial%digital%'
SELECT director.Name FROM director ORDER BY director.Age DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT radio.Transmitter FROM radio WHERE radio.Lyric_FM_MHz != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio
SELECT Affiliation FROM city_channel WHERE ID IN (SELECT ID FROM city_channel WHERE Station_name = 'city' GROUP BY Affiliation HAVING COUNT(DISTINCT ID) > 3) GROUP BY Affiliation
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'United States'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = 'United States'
SELECT count(DISTINCT vehicle.Vehicle_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Power) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Valid_Answers.Valid_Answer_Text FROM Valid_Answers JOIN Student_Assessments ON Valid_Answers.Valid_Answer_ID = Student_Assessments.Valid_Answer_ID WHERE Student_Assessments.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID WHERE Student_Assessments.Satisfactory_YN = 'Normal'
SELECT COUNT(DISTINCT Student_Answers.Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Question_Text FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_Text HAVING COUNT(*) >= 3
SELECT Questions.Question_ID FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_ID HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Student_Answer_ID, Student_Answers.Exam_ID, Student_Answers.Question_ID, Student_Answers.Student_ID, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text, Student_Assessments.Student_Answer_ID, Student_Assessments.Valid_Answer_ID, Student_Assessments.Student_Answer_Text, Student_Assessments.Satisfactory_YN, Student_Assessments.Assessment FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID LEFT JOIN Student_Assessments ON Student_Assessments.Student_Answer_ID = Students.Student_ID
SELECT COUNT(*) FROM Customers
SELECT COUNT(customer_number) FROM Customers
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_name = "hardware type"
SELECT COUNT(*) FROM Products WHERE product_name = 'Hardware'
SELECT Products.product_type_code FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Order_Items.order_item_id DESC
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products GROUP BY product_name HAVING count(*) >= 2
SELECT product_name FROM Products GROUP BY product_name HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT club.Name, club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name, club.Manager
SELECT club.Name, club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Wins_count DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT club.Name, count(distinct player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT club.Name, COUNT(player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT Wins_count FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Australia" OR club.Manager = "Zimbabwe"
SELECT player.Wins_count FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager IN ('Australia', 'Zimbabwe')
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code, COUNT(Shipment_Items.shipment_id) AS product_count FROM Order_Items LEFT JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code HAVING COUNT(Shipment_Items.shipment_id) > 0
SELECT Order_Items.order_item_id, COUNT(Shipment_Items.shipment_id) AS product_count, Order_Items.order_item_status_code AS status FROM Order_Items LEFT JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING count(Shipment_Items.order_item_id) >= 2
SELECT Customers.customer_first_name, COUNT(Order_Items.order_item_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_first_name
SELECT Orders.order_status_code, COUNT(*) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT gender_code, customer_first_name, customer_middle_initial, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Invoices.invoice_date FROM Shipments JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments WHERE Shipments.shipment_tracking_number IS NOT NULL
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments WHERE Shipments.shipment_tracking_number IN (SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_tracking_number IS NOT NULL) AND Shipments.shipment_date IS NOT NULL
SELECT customer_first_name, customer_last_name FROM Customers WHERE login_password LIKE '+12%'
SELECT Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE Customers.login_password LIKE '+12%'
SELECT product_price FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_price FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT Order_Items.order_item_status_code, Shipments.shipment_date FROM Order_Items JOIN Shipments ON Order_Items.order_item_id = Shipments.order_id
SELECT Order_Items.order_item_status_code, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'United States'
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(*) > 3
SELECT Shipments.shipment_date, Shipments.shipment_id FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID ORDER BY program.Start_Year ASC LIMIT 1
SELECT count(*) FROM director WHERE Name LIKE '%bbc%'
SELECT director.Name FROM director ORDER BY director.Age DESC LIMIT 1
SELECT director.Name, director.Age FROM director WHERE Director_ID IN (SELECT Director_ID FROM program GROUP BY Director_ID HAVING COUNT(*) > 1)
SELECT director.Name, COUNT(program.Program_ID) FROM director LEFT JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID, director.Name
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON director.Director_ID = program.Director_ID WHERE director.Name = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online = (SELECT MAX(Is_online) FROM city_channel_radio)
SELECT Sub_tittle, COUNT(*) FROM tv_show GROUP BY Sub_tittle
SELECT city_channel.Station_name, city_channel.City FROM city_channel ORDER BY city_channel.City ASC
SELECT radio.Transmitter, radio.Radio_MHz FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT radio.Transmitter, COUNT(city_channel_tv_show.City_channel_ID) AS city_channels_count FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel.ID = city_channel_radio.City_channel_ID JOIN city_channel_tv_show ON city_channel_tv_show.City_channel_ID = city_channel.ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Power = 1996
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Power = 1996
SELECT vehicle.Power, driver.Name, driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID
SELECT vehicle.Power, vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power = 2012
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed = 2012
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT vehicle.Model, vehicle.Power FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Name, driver.Citizenship FROM driver WHERE driver.Name LIKE '%DJ%'
SELECT driver.Name, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT driver.Name, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name != "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Exam_Name != "Database"
SELECT Question_Text, COUNT(*) FROM Questions GROUP BY Question_Text
SELECT Question_Text, COUNT(*) FROM Questions GROUP BY Question_Text
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Valid_Answer_Text, COUNT(*) as frequency FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.Student_Address, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(*) >= 2
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 ORDER BY player.Wins_count DESC LIMIT 1
SELECT club.Name, AVG(player.Wins_count) as avg_earnings FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY avg_earnings DESC
SELECT club.Name, AVG(player.Earnings) as avg_earnings FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY avg_earnings DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Name FROM club WHERE club.Club_ID IN ( SELECT player.Club_ID FROM player WHERE player.Earnings > 1400000 ) AND club.Club_ID IN ( SELECT player.Club_ID FROM player WHERE player.Earnings < 1100000 )
SELECT DISTINCT Orders.date_order_placed FROM Orders WHERE Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR Orders.order_id IN ( SELECT Shipments.order_id FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.order_id HAVING COUNT(Shipment_Items.order_item_id) > 1 )
SELECT DISTINCT Orders.date_order_placed FROM Orders WHERE Orders.date_order_placed = (SELECT MIN(Orders.date_order_placed) FROM Orders) UNION SELECT Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Shipment_Items.shipment_id) > 1
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products WHERE Products.product_id IN (SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(DISTINCT Order_Items.order_item_id) < 2)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.gender_code, COUNT(Products.product_id) AS number FROM Products JOIN Customers ON Products.parent_product_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT product_color, COUNT(*) FROM Products GROUP BY product_color
SELECT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_id IN (SELECT shipment_id FROM Shipment_Items)
SELECT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_tracking_number = 'shipped'
SELECT DISTINCT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_tracking_number != 'shipped'
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_tracking_number != 'shipped'
SELECT Shipments.shipment_id, Shipments.shipment_date, SUM(Shipment_Items.order_item_id) as total_cost FROM Shipments LEFT JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date
SELECT Orders.order_id, Orders.order_status_code, SUM(Order_Items.order_id) as total_amount_paid FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Products.product_color, Products.product_size FROM Products
SELECT product_name, product_color FROM Products
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Customers.customer_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2
SELECT Orders.date_order_placed FROM Orders WHERE Orders.customer_id IN ( SELECT Customers.customer_id FROM Customers WHERE ( SELECT COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) FROM Customer_Payment_Methods WHERE Customer_Payment_Methods.customer_id = Customers.customer_id ) >= 2 )
SELECT order_item_status_code, COUNT(*) as status_count FROM Order_Items GROUP BY order_item_status_code ORDER BY status_count ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT director.Name FROM director WHERE director.Age > (SELECT AVG(Age) FROM director)
SELECT director.Director_ID, director.Name FROM director WHERE director.Director_ID NOT IN (SELECT director.Director_ID FROM director JOIN program ON director.Director_ID = program.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE channel.Name = 'Hank Baskett')
SELECT city_channel.Affiliation, COUNT(*) as count FROM city_channel WHERE city_channel.Station_name = 'city' GROUP BY city_channel.Affiliation ORDER BY count DESC LIMIT 1
SELECT city_channel.City, radio.Transmitter, city_channel.Owned_Since FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT city_channel.City FROM city_channel WHERE city_channel.ID NOT IN ( SELECT city_channel_radio.City_channel_ID FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID )
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT driver.Driver_ID, COUNT(DISTINCT vehicle_driver.Vehicle_ID) AS vehicle_count FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT driver.Driver_ID, count(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(vehicle_driver.Driver_ID) ASC LIMIT 1
SELECT driver.Driver_ID FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY COUNT(vehicle_driver.Driver_ID) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN (SELECT DISTINCT vehicle_driver.Vehicle_ID FROM vehicle_driver)
SELECT Citizenship FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) >= 2) OR vehicle.Build_Year = 'Ziyang'
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN ( SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 ) OR vehicle.Build_Year = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) ASC LIMIT 1
SELECT Student_Answer_ID FROM Student_Assessments ORDER BY Valid_Answer_ID ASC LIMIT 1
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments GROUP BY Student_Assessments.Student_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID WHERE Student_Answers.Student_ID IS NULL
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Comments = 'Normal' AND EXISTS ( SELECT 1 FROM Student_Answers AS T2_2 WHERE T2_2.Student_Answer_Text = Student_Answers.Student_Answer_Text AND T2_2.Comments = 'Absent' )
SELECT DISTINCT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Normal' AND Student_Answers.Student_ID IN ( SELECT Student_ID FROM Student_Answers WHERE Student_Answer_Text = 'Absent' )
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_price = (SELECT MAX(product_price) FROM Products)
SELECT Products.product_id, Products.product_type_code FROM Products WHERE Products.product_name = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT Products.product_id, Products.product_type_code FROM Products WHERE Products.product_name = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT product_name FROM Products GROUP BY product_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_price FROM Products GROUP BY product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers WHERE customer_address = (SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(DISTINCT payment_method_code) ASC LIMIT 1)
SELECT payment_method_code FROM Customers WHERE customer_address = (SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(*) ASC LIMIT 1)
SELECT product_name FROM Products GROUP BY product_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_id FROM Products GROUP BY product_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products EXCEPT SELECT Products.product_type_code FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id
SELECT product_type_code FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT DISTINCT Products.product_id, Customers.gender_code, Customers.customer_first_name FROM Products JOIN Customers ON Products.product_id = Orders.customer_id JOIN Orders ON Products.product_id = Order_Items.product_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Products.product_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(DISTINCT Order_Items.order_item_id) > 2 ) AND Products.product_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(*) >= 3 )
SELECT DISTINCT Products.product_id, Products.product_color, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Products.product_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(DISTINCT Order_Items.order_item_id) > 2 ) AND Products.product_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING SUM(Order_Items.order_item_status_code) >= 3 OR COUNT(Order_Items.order_item_id) >= 3 )
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders)
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_size FROM Products WHERE Products.product_id NOT IN (SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(*) >= 2)
SELECT Products.product_id, Products.product_name, Products.product_size, COUNT(*) as frequency FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_name, Products.product_size ORDER BY frequency DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Shipments.shipment_id, SUM(Products.product_price) FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Shipments.shipment_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Order_Items.order_item_id, SUM(Order_Items.product_id) as total_cost FROM Order_Items GROUP BY Order_Items.order_item_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_id) FROM Products WHERE product_id NOT IN (SELECT DISTINCT parent_product_id FROM Products WHERE product_price > 0)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Payment_Methods)
SELECT town_city, address_line_1, county FROM Customers WHERE email_address = (SELECT email_address FROM Customers GROUP BY email_address ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Customers.town_city, Customers.county, Customers.address_line_1 FROM Customers WHERE Customers.email_address = ( SELECT Customers.email_address FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.email_address ORDER BY COUNT(Orders.order_id) ASC LIMIT 1 )
SELECT product_color, product_size, product_description FROM Products WHERE parent_product_id < (SELECT MAX(parent_product_id) FROM Products)
SELECT product_color, product_size, product_description FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT channel.Name, COUNT(program.Program_ID) AS program_count FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name ORDER BY program_count DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel WHERE channel.Channel_ID = (SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT COUNT(DISTINCT Director_ID) FROM director WHERE Director_ID NOT IN (SELECT DISTINCT Director_ID FROM program)
SELECT director.Name, director.Age FROM director WHERE director.Director_ID = ( SELECT director.Director_ID FROM director JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(DISTINCT program.Start_Year) DESC LIMIT 1 )
SELECT DISTINCT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE director.Director_ID IN ( SELECT program.Director_ID FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE channel.Internet < 40 ) ) AND director.Director_ID IN ( SELECT program.Director_ID FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE channel.Internet > 60 ) )
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 ) OR driver.Name = 'Jeff Gordon'
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 ) OR driver.Name = 'Jeff Gordon'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT DISTINCT Driver_ID FROM vehicle_driver)
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'hardware') AND product_name = 'hardware'
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware')
SELECT Customers.customer_id, Customers.customer_number, Customers.customer_name, Customers.customer_phone FROM Customers WHERE Customers.customer_id = (SELECT Customer_Orders.customer_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Customers.customer_id, Customers.customer_number, Customers.customer_name, Customers.customer_phone FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id ORDER BY count(Customer_Orders.order_id) DESC LIMIT 1
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Orders)
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_id > 6 OR Customer_Orders.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3)
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_id > 6 OR (SELECT COUNT(*) FROM Order_Items WHERE Order_Items.order_id = Customer_Orders.order_id) > 3
SELECT region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY building.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY building.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Analytical_Layer.* FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID AND Customers_and_Services.Service_ID = Customer_Interactions.Service_ID GROUP BY Analytical_Layer.Analytical_ID ORDER BY COUNT(Customer_Interactions.Customer_Interaction_ID) DESC LIMIT 1
SELECT Services.* FROM Services WHERE Service_ID = (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customers.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details, COUNT(DISTINCT Customers.Customer_ID) as service_count FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY service_count DESC LIMIT 1
SELECT Analytical_Layer.Analytical_ID, Analytical_Layer.Customers_and_Services_ID, Analytical_Layer.Pattern_Recognition, Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_ID = ( SELECT Customers_and_Services.Customer_ID FROM Customers_and_Services GROUP BY Customers_and_Services.Customer_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Analytical_Layer.Customers_and_Services_ID, Analytical_Layer.Pattern_Recognition, Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_ID = ( SELECT Customers.Customer_ID FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Customers.Customer_Details FROM Customers WHERE Customer_ID IN ( SELECT Customers_and_Services.Customer_ID FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = "Hardy Kutch" ) OR Customer_ID IN ( SELECT Customer_Interactions.Customer_ID FROM Customer_Interactions WHERE Customer_Interactions.Services_and_Channels_Details = "good" )
SELECT DISTINCT Customers_and_Services.Customers_and_Services_ID, Customers_and_Services.Customer_ID, Customers_and_Services.Service_ID, Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT DISTINCT Customers_and_Services.Customers_and_Services_ID, Customers_and_Services.Customer_ID, Customers_and_Services.Service_ID, Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID AND Customers_and_Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Analytical_Layer ON Customers_and_Services.Customers_and_Services_ID = Analytical_Layer.Analytical_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = 'Hardy Kutch' AND Analytical_Layer.Pattern_Recognition = 'bad'
SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers INNER JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID INNER JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID AND Services.Service_ID = Customer_Interactions.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT Customers.name, Discount.name, Discount.membership_credit FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Discount ON Renting_history.discount_id = Discount.id WHERE Customers.age IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Vehicles WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Customers.name, Customers.membership_credit FROM Customers WHERE Customers.id = (SELECT Renting_history.customer_id FROM Renting_history GROUP BY Renting_history.customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Discount.name, Vehicles.Model_year FROM Discount JOIN Vehicles ON Discount.id = Renting_history.discount_id JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Renting_history.vehicles_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id IN ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2 ) OR Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.student_id HAVING COUNT(*) < 2 )
SELECT Students.bio_data, Students.student_details, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2 ) OR Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) < 2 )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes WHERE Classes.class_details LIKE '%data%' ) AND Students.student_id NOT IN ( SELECT Classes.student_id FROM Classes WHERE Classes.class_details LIKE 'net%' )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Achievements.student_id FROM Achievements WHERE Achievements.achievement_details LIKE '%data%' ) AND Students.student_id NOT IN ( SELECT Achievements.student_id FROM Achievements WHERE Achievements.achievement_details LIKE 'net%' )
SELECT Achievements.achievement_details, Achievements.date_achievement FROM Achievements JOIN Students ON Achievements.student_id = Students.student_id WHERE Students.student_id IN ( SELECT Students_Addresses.student_id FROM Students_Addresses GROUP BY Students_Addresses.student_id HAVING COUNT(*) >= 2 )
SELECT Transcripts.student_id, Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Transcripts ON Students.student_id = Transcripts.student_id JOIN Achievements ON Students.student_id = Achievements.student_id GROUP BY Students.student_id, Transcripts.student_id, Student_Loans.date_of_loan HAVING COUNT(Achievements.achievement_id) >= 2
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id = ( SELECT Student_Events.student_id FROM Student_Events GROUP BY Student_Events.student_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id = ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_id, Students.bio_data, Students.student_details, Achievements.achievement_type_code, Achievements.date_achievement, Achievements.achievement_details, Achievements.other_details FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id WHERE Achievements.achievement_type_code = ( SELECT Achievements.achievement_type_code FROM Achievements GROUP BY Achievements.achievement_type_code ORDER BY COUNT(*) DESC LIMIT 1 ) AND Achievements.achievement_type_code IN ( SELECT Achievements.achievement_type_code FROM Achievements GROUP BY Achievements.achievement_type_code HAVING COUNT(*) = 3 )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id WHERE Achievements.achievement_type_code = 'behaviour monitoring' AND Achievements.other_details IN ( SELECT Achievements.other_details FROM Achievements WHERE Achievements.achievement_type_code = 'behaviour monitoring' GROUP BY Achievements.other_details HAVING COUNT(*) = 3 ) AND Achievements.other_details IN ( SELECT Achievements.other_details FROM Achievements WHERE Achievements.achievement_type_code = 'behaviour monitoring' GROUP BY Achievements.other_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(DISTINCT Achievements.achievement_type_code) = 1 AND Achievements.achievement_type_code = ( SELECT Achievements.achievement_type_code FROM Achievements GROUP BY Achievements.achievement_type_code ORDER BY COUNT(*) DESC LIMIT 1 ) )
SELECT Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Achievements.student_id FROM Achievements WHERE Achievements.achievement_details = ( SELECT Achievements.achievement_details FROM Achievements GROUP BY Achievements.achievement_details ORDER BY COUNT(*) DESC LIMIT 1 ) )
SELECT COUNT(DISTINCT Detention.student_id) AS number, Ref_Detention_Type.detention_type_code AS event_type, Ref_Detention_Type.detention_type_description AS description FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code WHERE Ref_Detention_Type.detention_type_code = (SELECT Ref_Detention_Type.detention_type_code FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Ref_Detention_Type.detention_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT COUNT(DISTINCT Achievements.student_id) as number_of_students, Ref_Achievement_Type.achievement_type_code as event_type_code, Ref_Achievement_Type.achievement_type_description as event_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code GROUP BY Ref_Achievement_Type.achievement_type_code, Ref_Achievement_Type.achievement_type_description ORDER BY COUNT(DISTINCT Achievements.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Student_Loans.student_id) FROM Student_Loans JOIN Students_Addresses ON Student_Loans.student_loan_id = Students_Addresses.address_id WHERE Students_Addresses.student_address_id NOT IN (SELECT student_address_id FROM Students_Addresses WHERE student_address_id IN (SELECT student_address_id FROM Achievements))
SELECT COUNT(DISTINCT Achievements.student_id) FROM Achievements WHERE Achievements.achievement_type_code NOT IN ( SELECT DISTINCT Achievements.achievement_type_code FROM Achievements JOIN Classes ON Achievements.student_id = Classes.student_id WHERE Classes.class_details IS NOT NULL )
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type WHERE detention_type_code = (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY count(*) ASC LIMIT 1)
SELECT detention_type_code, detention_type_description FROM Ref_Detention_Type WHERE detention_type_code IN (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) LIMIT 1)
SELECT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id WHERE Students_Addresses.date_from = (SELECT MIN(date_from) FROM Students_Addresses)
SELECT DISTINCT Students.* FROM Students WHERE student_id IN ( SELECT Achievements.student_id FROM Achievements WHERE Achievements.date_achievement = ( SELECT MIN(date_achievement) FROM Achievements ) )
SELECT achievement_type_code, achievement_type_description FROM Ref_Achievement_Type WHERE achievement_type_code = (SELECT achievement_type_code FROM Achievements GROUP BY achievement_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT address_type_code, address_type_description FROM Ref_Address_Types WHERE address_type_code = (SELECT address_type_code FROM Students_Addresses GROUP BY address_type_code ORDER BY COUNT(*) DESC LIMIT 1)
