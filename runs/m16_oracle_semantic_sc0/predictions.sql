SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Name NOT IN (SELECT club.Name FROM club WHERE club.Manager = 'Nike')
SELECT DISTINCT club.Name FROM club WHERE club.Club_ID NOT IN ( SELECT DISTINCT player.Club_ID FROM player WHERE player.Name = 'Nike' )
SELECT club.Name, COUNT(player.Player_ID) AS wins_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY wins_count ASC
SELECT club.Name, COUNT(player.Player_ID) AS win_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY win_count ASC
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING count(DISTINCT player.Player_ID) > 1
SELECT Name FROM player GROUP BY Name HAVING COUNT(DISTINCT Club_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT Name) FROM club
SELECT COUNT(DISTINCT Name) FROM player
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Shipments
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT shipment_id) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Director_ID) FROM director
SELECT DISTINCT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID ORDER BY program.Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Transmitter FROM radio WHERE Lyric_FM_MHz != 'ABC'
SELECT AVG(CAST(city_channel_radio.Is_online AS REAL)) FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT City FROM city_channel GROUP BY City HAVING COUNT(DISTINCT ID) > 3
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT driver.Name FROM driver WHERE driver.Racing_Series = 'United States'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Total_Production) FROM vehicle WHERE Builder = 'top speed'
SELECT Name FROM driver ORDER BY Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Student_Assessments
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Valid_Answer_ID = Student_Answers.Student_ID WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Satisfactory_YN) FROM Student_Assessments
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE First_Name != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Question_ID FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_ID HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(*) FROM Customers
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
SELECT COUNT(DISTINCT customer_id) FROM Customers
SELECT DISTINCT customer_name FROM Customers
SELECT DISTINCT customer_name FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT Name, Name, Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = 'Sam Allardyce'
SELECT Name, count(*) FROM player GROUP BY Name
SELECT Name, COUNT(DISTINCT Club_ID) FROM player GROUP BY Name
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code, COUNT(Shipment_Items.shipment_id) AS product_count FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code HAVING COUNT(Shipment_Items.shipment_id) > 0
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) AS product_count FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(DISTINCT Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Customers.gender_code, COUNT(Order_Items.order_item_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Customers.gender_code
SELECT Orders.customer_id, COUNT(*) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.customer_id
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT gender_code, customer_first_name, customer_last_name, login_name FROM Customers
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Shipment_Items.shipment_id FROM Shipments LEFT JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipment_Items.shipment_id FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Shipments.shipment_tracking_number, Order_Items.order_item_status_code FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Order_Items.order_item_id = Shipment_Items.order_item_id
SELECT customer_first_name, customer_last_name FROM Customers WHERE login_name LIKE '+12%'
SELECT Customers.customer_first_name, Customers.login_password FROM Customers WHERE Customers.customer_middle_initial LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT order_item_status_code, shipment_date FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT email_address, address_line_1, town_city FROM Customers WHERE customer_first_name = 'USA'
SELECT email_address, address_line_1, town_city FROM Customers WHERE customer_first_name = 'United States'
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_name HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_name HAVING COUNT(*) > 3
SELECT Shipments.shipment_date, Shipments.shipment_id FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(DISTINCT Order_Items.order_item_id) >= 2
SELECT Shipment_Items.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments
SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM director_admin ORDER BY Director_ID LIMIT 1)
SELECT count(*) FROM channel WHERE Analogue_terrestrial_channel LIKE '%bbc%' OR Digital_terrestrial_channel LIKE '%bbc%' OR Internet LIKE '%bbc%'
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(*) > 1 )
SELECT director.Name, COUNT(*) as program_count FROM director LEFT JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID, director.Name
SELECT channel.Name FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID WHERE director.Name = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Next_show_name FROM tv_show
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT Next_show_name, COUNT(*) FROM tv_show GROUP BY Next_show_name
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT radio.Transmitter, radio.Radio_MHz FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel_tv_show.City_channel_ID) AS city_channels_count FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID LEFT JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(Top_Speed), AVG(Top_Speed) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Top_Speed) as max_power, AVG(Top_Speed) as avg_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year LIKE '%1996%'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT Model, Top_Speed FROM vehicle WHERE Model LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Name, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT driver.Driver_ID, driver.Name, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code != "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Satisfactory_YN, COUNT(*) as count FROM Student_Assessments GROUP BY Satisfactory_YN ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Student_Assessments.Student_Answer_ID, Student_Answers.Date_of_Answer FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Student_Assessments ON Questions_in_Exams.Question_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT First_Name FROM Students WHERE Student_ID IN ( SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2 )
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2 ORDER BY player.Wins_count DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Events_number) DESC
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club LEFT JOIN player ON player.Club_ID = club.Club_ID WHERE player.Player_ID IS NULL
SELECT t1.Name FROM club AS t1 LEFT JOIN player AS t2 ON t1.Club_ID = t2.Club_ID WHERE t2.Player_ID IS NULL
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Manager FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Manager HAVING SUM(CASE WHEN player.Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(Order_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT t2.order_id FROM Shipment_Items AS t4 JOIN Order_Items AS t2 ON t4.order_item_id = t2.order_item_id GROUP BY t2.order_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(DISTINCT Shipment_Items.shipment_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.customer_first_name AS gender, COUNT(*) AS number_of_products FROM Products AS t1 JOIN Customers AS t2 ON t1.product_id = t2.customer_id GROUP BY t2.customer_first_name
SELECT product_size, COUNT(*) AS product_count FROM Products GROUP BY product_size
SELECT Products.product_name, Shipments.shipment_date FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT DISTINCT t1.product_name, t4.shipment_date FROM Products AS t1 JOIN Order_Items AS t3 ON t3.product_id = t1.product_id JOIN Shipment_Items AS t5 ON t5.order_item_id = t3.order_item_id JOIN Shipments AS t4 ON t4.shipment_id = t5.shipment_id
SELECT Products.product_name, Shipments.shipment_tracking_number FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Shipments.shipment_tracking_number IS NOT NULL
SELECT DISTINCT Products.product_name, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_tracking_number != 'shipped' OR Shipments.shipment_tracking_number IS NULL
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_date IS NULL
SELECT Shipments.shipment_id AS order_id, Shipments.shipment_date AS date, SUM(Products.product_price) AS total_cost FROM Shipments JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Shipments.shipment_id, Shipments.shipment_date
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price) AS total_amount_paid FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT product_color, product_name FROM Products
SELECT product_name, product_color FROM Products
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 ) AS PM ON PM.customer_id = Orders.customer_id
SELECT DISTINCT t4.date_order_placed FROM Orders AS t4 JOIN ( SELECT t4.customer_id FROM Orders AS t4 JOIN Order_Items AS t5 ON t5.order_id = t4.order_id GROUP BY t4.customer_id HAVING COUNT(DISTINCT t5.order_item_id) >= 2 ) AS pm ON pm.customer_id = t4.customer_id
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year > ( SELECT AVG(T3_2.Start_Year) FROM program AS T3_2 )
SELECT channel.Channel_ID, channel.Name FROM channel WHERE channel.Name <> 'Hank Baskett'
SELECT city_channel.Affiliation FROM city_channel JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY city_channel.Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.Transmitter, t2.Radio_MHz FROM city_channel AS t1 JOIN city_channel_radio AS t3 ON t3.City_channel_ID = t1.ID JOIN radio AS t2 ON t3.Radio_ID = t2.Radio_ID ORDER BY t1.Owned_Since DESC
SELECT DISTINCT radio.RnaG_MHz FROM radio LEFT JOIN city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE city_channel_radio.Radio_ID IS NULL
SELECT driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT t3.Driver_ID AS Driver_ID, COUNT(DISTINCT t3.Vehicle_ID) AS vehicle_count FROM vehicle_driver AS t3 GROUP BY t3.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, COUNT(DISTINCT vehicle_driver.Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT driver.Citizenship FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT driver.Citizenship FROM driver WHERE driver.Driver_ID NOT IN ( SELECT vehicle_driver.Driver_ID FROM vehicle_driver )
SELECT t2.Driver_ID, t2.Name FROM driver AS t2 JOIN vehicle_driver AS t3 ON t3.Driver_ID = t2.Driver_ID JOIN vehicle AS t1 ON t3.Vehicle_ID = t1.Vehicle_ID GROUP BY t2.Driver_ID, t2.Name HAVING COUNT(DISTINCT t1.Vehicle_ID) = 2 OR MAX(CASE WHEN t1.Model = 'Ziyang' THEN 1 ELSE 0 END) = 1
SELECT driver.Driver_ID, driver.Name FROM driver LEFT JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name HAVING COUNT(DISTINCT vehicle_driver.Vehicle_ID) = 2 OR MAX(CASE WHEN driver.Citizenship = 'Ziyang' THEN 1 ELSE 0 END) = 1
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT DISTINCT vehicle.Model, vehicle.Builder FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'DJ1'
SELECT Exam_Date FROM Exams WHERE lower(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE LOWER(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Student_Answer_Text FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Student_Assessments.Assessment FROM Student_Assessments WHERE Student_Assessments.Student_Answer_ID IN ( SELECT Student_Answer_ID FROM Student_Answers WHERE Student_Answer_Text IN ('Normal', 'Absent') GROUP BY Student_Answer_ID HAVING COUNT(DISTINCT Student_Answer_Text) = 2 )
SELECT Valid_Answer_Text FROM Valid_Answers WHERE Valid_Answer_ID IN ( SELECT Valid_Answer_ID FROM Student_Assessments WHERE Assessment IN ('Normal', 'Absent') GROUP BY Valid_Answer_ID HAVING COUNT(DISTINCT Assessment) = 2 )
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_name = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers WHERE customer_name IN ( SELECT customer_name FROM Customers GROUP BY customer_name HAVING COUNT(DISTINCT payment_method_code) = ( SELECT MIN(customer_count) FROM ( SELECT COUNT(DISTINCT payment_method_code) AS customer_count FROM Customers GROUP BY customer_name ) ) )
SELECT payment_method_code FROM Customers WHERE customer_phone IN ( SELECT customer_phone FROM Customers GROUP BY customer_phone HAVING COUNT(*) = ( SELECT MIN(method_count) FROM ( SELECT COUNT(*) AS method_count FROM Customers GROUP BY customer_phone ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Order_Items.order_item_id FROM Order_Items GROUP BY Order_Items.order_item_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_id NOT IN ( SELECT Order_Items.product_id FROM Order_Items )
SELECT t1.product_type_code FROM Products AS t1 LEFT JOIN Order_Items AS t3 ON t3.product_id = t1.product_id WHERE t3.product_id IS NULL
SELECT t2.customer_id AS id, t2.gender_code AS first_name, t2.customer_first_name AS last_name FROM Customers AS t2 JOIN Orders AS t4 ON t4.customer_id = t2.customer_id JOIN Shipments AS t6 ON t6.order_id = t4.order_id GROUP BY t2.customer_id, t2.gender_code, t2.customer_first_name HAVING COUNT(DISTINCT t4.order_id) > 2 AND COUNT(DISTINCT t6.shipment_id) >= 3
SELECT Products.product_id, Products.product_name AS first_name, Products.product_color AS last_name FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_color HAVING COUNT(DISTINCT Order_Items.order_item_id) > 2 AND COUNT(DISTINCT Shipment_Items.shipment_id) >= 3
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders WHERE customer_id IS NOT NULL )
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id AS id, Products.product_name AS name, Products.product_price AS price, Products.product_color AS color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(Shipment_Items.shipment_id) < 2
SELECT t1.product_id AS id, t1.product_name AS product_name, t1.product_price AS price FROM Order_Items AS t5 JOIN Products AS t1 ON t5.product_id = t1.product_id GROUP BY t1.product_id, t1.product_name, t1.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(order_count) FROM ( SELECT COUNT(*) AS order_count FROM Order_Items JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Order_Items.product_id ) )
SELECT Orders.order_id, SUM(Products.product_price) AS sum_product_prices FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Order_Items.order_item_id, MIN(Order_Items.product_id) AS total_cost FROM Order_Items
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE product_price IS NULL OR product_price = 0
SELECT COUNT(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT county, address_line_1, town_city FROM Customers WHERE email_address IN ( SELECT email_address FROM Customers GROUP BY email_address HAVING COUNT(*) = ( SELECT MIN(gender_count) FROM ( SELECT COUNT(*) AS gender_count FROM Customers GROUP BY email_address ) ) )
SELECT t1.address_line_1, t1.gender_code, t1.email_address FROM Customers AS t1 WHERE t1.town_city = ( SELECT t1g.town_city FROM Customers AS t1g JOIN Orders AS t2g ON t2g.customer_id = t1g.customer_id GROUP BY t1g.town_city ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT channel.Name FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID GROUP BY program.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.Name, t2.Age FROM director_admin JOIN channel ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID GROUP BY director_admin.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM channel AS c LEFT JOIN program AS p ON p.Channel_ID = c.Channel_ID WHERE p.Program_ID IS NULL
SELECT channel.Name, channel.Internet FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet ORDER BY COUNT(DISTINCT program.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name HAVING SUM(CASE WHEN program.Start_Year < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN program.Start_Year > 60 THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS d LEFT JOIN vehicle_driver AS dv ON d.Driver_ID = dv.Driver_ID WHERE dv.Vehicle_ID IS NULL
SELECT product_type_code FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'hardware' ) AND product_name = 'hardware'
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT t1.customer_id AS customer_id, t1.customer_name AS name, t1.customer_phone AS phone, t1.customer_email AS email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id GROUP BY t1.customer_id, t1.customer_name, t1.customer_phone, t1.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.customer_id AS id, t1.customer_name AS name, t1.customer_phone AS phone, t1.customer_email AS email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id GROUP BY t1.customer_id, t1.customer_name, t1.customer_phone, t1.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS Customers LEFT JOIN Customer_Orders AS Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Orders AS o ON o.customer_id = c.customer_id WHERE o.order_id IS NULL
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING SUM(CASE WHEN CAST(Order_Items.order_quantity AS REAL) > 6 THEN 1 ELSE 0 END) > 0 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id WHERE CAST(Order_Items.order_quantity AS REAL) > 6 OR Customer_Orders.order_id IN ( SELECT T3b.order_id FROM Order_Items AS T3b GROUP BY T3b.order_id HAVING COUNT(DISTINCT T3b.product_id) > 3 )
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Capital, region.Area FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Capital, region.Area ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.* FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.Service_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers_and_Services.Service_ID ORDER BY COUNT(DISTINCT Customers_and_Services.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers_and_Services.Customer_ID IN ( SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Customer_ID ) ) )
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers_and_Services.Customer_ID IN ( SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Customer_ID ) ) )
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID WHERE Analytical_Layer.Analytical_Layer_Type_Code = 'good'
SELECT DISTINCT Customers.* FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' OR Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Customers.Customer_Details FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT DISTINCT t4.Customer_Interaction_ID, t4.Channel_ID, t4.Customer_ID, t4.Service_ID, t4.Status_Code, t4.Services_and_Channels_Details FROM Customer_Interactions AS t4 JOIN Services AS t1 ON t4.Service_ID = t1.Service_ID WHERE t1.Service_Details = 'Hardy Kutch' AND t4.Status_Code = 'bad'
SELECT Vehicles.name, Discount.name, Vehicles.Cost_per_25_miles FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Discount ON Renting_history.discount_id = Discount.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name AS name, Vehicles.Type_of_powertrain AS powertrain_type, Vehicles.Cost_per_25_miles AS yearly_fuel_cost FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name AS name, Vehicles.Model_year AS model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.student_details, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Student_Events.student_id FROM Student_Events GROUP BY Student_Events.student_id HAVING COUNT(*) >= 2 ) AND Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) < 2 )
SELECT Teachers.teacher_details AS biographical_data, Students.student_id AS student_id FROM Students JOIN Teachers ON Teachers.teacher_id = Students.student_id LEFT JOIN Classes ON Classes.student_id = Students.student_id LEFT JOIN Student_Loans ON Student_Loans.student_id = Students.student_id GROUP BY Students.student_id, Teachers.teacher_details HAVING COUNT(DISTINCT Classes.class_id) >= 2 OR COUNT(DISTINCT Student_Loans.student_loan_id) < 2
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Detention ON Detention.student_id = Students.student_id WHERE LOWER(Detention.other_details) LIKE '%data%' AND Students.student_id NOT IN ( SELECT T4b.student_id FROM Detention AS T4b WHERE LOWER(T4b.other_details) LIKE 'net%' )
SELECT DISTINCT t1.* FROM Students AS t1 JOIN Achievements AS t4 ON t4.student_id = t1.student_id WHERE lower(t4.other_details) LIKE '%data%' AND t1.student_id NOT IN ( SELECT t4b.student_id FROM Achievements AS t4b WHERE lower(t4b.other_details) LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS A ON Student_Loans.student_id = A.student_id
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS A ON Student_Loans.student_id = A.student_id
SELECT t1.bio_data AS detail, t1.student_id AS id FROM Students AS t1 JOIN Transcripts AS t2 ON t2.student_id = t1.student_id GROUP BY t1.student_id, t1.bio_data ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data FROM Students JOIN Classes ON Classes.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data ORDER BY COUNT(DISTINCT Classes.teacher_id) DESC LIMIT 1
SELECT DISTINCT t1.student_id, t1.bio_data, t1.student_details, t7.achievement_id, t7.achievement_type_code, t7.date_achievement, t7.achievement_details, t7.other_details FROM Students AS t1 JOIN Achievements AS t7 ON t7.student_id = t1.student_id WHERE t1.student_id IN ( SELECT student_id FROM Achievements WHERE achievement_details = ( SELECT achievement_details FROM Achievements GROUP BY achievement_details ORDER BY COUNT(*) DESC LIMIT 1 ) ) AND t1.student_id IN ( SELECT student_id FROM Achievements WHERE achievement_details IN ( SELECT achievement_details FROM Achievements GROUP BY achievement_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details)) ) AND Behaviour_Monitoring.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 ) ) GROUP BY Students.student_id, Behaviour_Monitoring.behaviour_monitoring_details
SELECT Students.* FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id GROUP BY Students.student_id HAVING COUNT(DISTINCT Transcripts.transcript_details) = 1 AND MAX(Transcripts.transcript_details) = ( SELECT T2b.transcript_details FROM Transcripts AS T2b GROUP BY T2b.transcript_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.transcript_details = ( SELECT T2b.transcript_details FROM Transcripts AS T2b GROUP BY T2b.transcript_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS number, Student_Events.event_type_code AS event_type, Ref_Event_Types.event_type_description AS description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Student_Events.student_id) AS number_of_students, Student_Events.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY number_of_students DESC LIMIT 1
SELECT COUNT(DISTINCT Achievements.student_id) FROM Achievements JOIN Students_Addresses ON Students_Addresses.student_id = Achievements.student_id LEFT JOIN Student_Loans ON Student_Loans.student_id = Students_Addresses.student_id WHERE Student_Loans.student_loan_id IS NULL
SELECT COUNT(DISTINCT t6.student_id) FROM Achievements AS t6 JOIN Students AS s ON t6.student_id = s.student_id WHERE EXISTS ( SELECT 1 FROM Classes AS t5 WHERE t5.student_id = s.student_id ) AND NOT EXISTS ( SELECT 1 FROM Student_Loans AS t4 WHERE t4.student_id = s.student_id )
SELECT t4.detention_type_code AS type_code, t4.detention_type_description AS description FROM Detention AS t5 JOIN Ref_Detention_Type AS t4 ON t5.detention_type_code = t4.detention_type_code GROUP BY t4.detention_type_code, t4.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT t4.detention_type_code, t4.detention_type_description FROM Ref_Detention_Type AS t4 JOIN Detention AS t5 ON t5.detention_type_code = t4.detention_type_code GROUP BY t4.detention_type_code, t4.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Students.* FROM Student_Loans JOIN Students_Addresses ON Students_Addresses.student_id = Student_Loans.student_id JOIN Students ON Students.student_id = Students_Addresses.student_id WHERE Student_Loans.date_of_loan = (SELECT MIN(date_of_loan) FROM Student_Loans)
SELECT DISTINCT t1.* FROM Students AS t1 JOIN Students_Addresses AS t7 ON t7.student_id = t1.student_id WHERE t7.address_id IN ( SELECT t7s.address_id FROM Students_Addresses AS t7s JOIN Student_Events AS t3 ON t3.student_id = t7s.student_id WHERE t3.event_date = (SELECT MIN(event_date) FROM Student_Events) )
SELECT t10.achievement_type_code, t4.achievement_type_description FROM Achievements AS t10 JOIN Ref_Achievement_Type AS t4 ON t10.achievement_type_code = t4.achievement_type_code GROUP BY t10.achievement_type_code, t4.achievement_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Addresses.address_id, Addresses.address_details FROM Students_Addresses JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id GROUP BY Addresses.address_id, Addresses.address_details ORDER BY COUNT(*) DESC LIMIT 1
