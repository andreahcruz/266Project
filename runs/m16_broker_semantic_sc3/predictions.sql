SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Name NOT IN (SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Nike')
SELECT DISTINCT club.Name FROM club WHERE club.Club_ID NOT IN ( SELECT DISTINCT player.Club_ID FROM player WHERE player.Name = 'Nike' )
SELECT club.Name, COUNT(player.Player_ID) AS wins_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY wins_count ASC
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) AS win_count FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name ORDER BY win_count ASC
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING count(DISTINCT player.Player_ID) > 1
SELECT Name FROM player GROUP BY Name HAVING COUNT(DISTINCT Club_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT Name) FROM club
SELECT COUNT(DISTINCT Name) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT order_quantity) FROM Order_Items
SELECT COUNT(DISTINCT order_item_id) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Order_Items
SELECT COUNT(DISTINCT shipment_id) FROM Shipments WHERE shipment_tracking_number = 'shipped'
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Radio_ID) FROM city_channel_radio
SELECT DISTINCT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID ORDER BY program.Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Transmitter FROM radio WHERE Lyric_FM_MHz != 'ABC'
SELECT AVG(CAST(city_channel_radio.Is_online AS REAL)) FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT City FROM city_channel GROUP BY City HAVING COUNT(DISTINCT ID) > 3
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
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
SELECT student_details FROM Students WHERE bio_data != "M"
SELECT student_details FROM Students WHERE bio_data != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Question_ID FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_ID HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.*, Transcripts.*, Behaviour_Monitoring.*, Student_Events.*, Teachers.*, Student_Loans.*, Classes.*, Students_Addresses.*, Detention.*, Achievements.* FROM Students LEFT JOIN Transcripts ON Students.student_id = Transcripts.student_id LEFT JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id LEFT JOIN Student_Events ON Students.student_id = Student_Events.student_id LEFT JOIN Student_Loans ON Students.student_id = Student_Loans.student_id LEFT JOIN Classes ON Students.student_id = Classes.student_id LEFT JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id LEFT JOIN Detention ON Students.student_id = Detention.student_id LEFT JOIN Achievements ON Students.student_id = Achievements.student_id LEFT JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT vehicle.Top_Speed FROM vehicle WHERE vehicle.Model = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_name = "hardware type"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT parent_product_id FROM Products GROUP BY parent_product_id HAVING count(*) >= 2
SELECT driver.Driver_ID FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID HAVING COUNT(vehicle_driver.Vehicle_ID) >= 2
SELECT COUNT(DISTINCT customer_id) FROM Customers
SELECT COUNT(DISTINCT customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = 'Sam Allardyce'
SELECT driver.Name, count(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT Builder, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY Builder
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code, COUNT(Shipment_Items.shipment_id) AS product_count FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code HAVING COUNT(Shipment_Items.shipment_id) > 0
SELECT Customer_Orders.order_id, Customer_Orders.order_status_code, COUNT(Order_Items.order_item_id) AS product_count FROM Customer_Orders LEFT JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_status_code
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING COUNT(Order_Items.product_id) >= 2
SELECT Customers.customer_name, COUNT(Customer_Orders.order_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_name
SELECT Orders.customer_id, COUNT(*) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.customer_id
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT gender_code, customer_first_name, customer_last_name, login_name FROM Customers
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Shipment_Items.shipment_id FROM Shipments LEFT JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Order_Items.order_item_id, Order_Items.product_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT Order_Items.order_item_id, Order_Items.order_quantity FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Customer_Orders.order_status_code IN ('ordered', 'shipped')
SELECT customer_name, customer_address FROM Customers WHERE customer_phone LIKE '+12%'
SELECT customer_name, customer_address FROM Customers WHERE customer_phone LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT order_item_status_code, shipment_date FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Customers.customer_name, Customers.customer_address, Customers.customer_phone FROM Addresses JOIN Customers ON Addresses.address_id = Customers.customer_id WHERE Customers.customer_number = 'USA'
SELECT Customers.customer_name, Customers.customer_address, Customers.customer_phone FROM Customers JOIN Addresses ON Customers.customer_id = Addresses.address_id WHERE Customers.customer_phone = 'United States'
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_name HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_name HAVING COUNT(*) > 3
SELECT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id HAVING COUNT(Order_Items.order_item_id) >= 2
SELECT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id HAVING COUNT(Order_Items.order_item_id) >= 2
SELECT Customers.customer_id, Customer_Orders.order_date FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT Customers.customer_id, Customer_Orders.order_date FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM director_admin ORDER BY Director_ID LIMIT 1)
SELECT count(*) FROM channel WHERE Analogue_terrestrial_channel LIKE '%bbc%' OR Digital_terrestrial_channel LIKE '%bbc%' OR Internet LIKE '%bbc%'
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(*) > 1 )
SELECT director.Name, COUNT(*) as program_count FROM director LEFT JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID, director.Name
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title = 'Dracula'
SELECT t2.Name, t3.Start_Year FROM director JOIN program ON t2.Director_ID = t3.Director_ID
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT Next_show_name, COUNT(*) FROM tv_show GROUP BY Next_show_name
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT radio.Transmitter, radio.Radio_MHz FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT radio.Transmitter, COUNT(city_channel_tv_show.City_channel_ID) AS city_channels_count FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID LEFT JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(Top_Speed) as max_power, AVG(Top_Speed) as avg_power FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Top_Speed) as max_power, AVG(Top_Speed) as average_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Zhuzhou'
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE SUBSTR(vehicle.Build_Year, 1, 4) = '1996'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Driver_ID, driver.Name HAVING SUM(vehicle.Top_Speed) > 100 OR MAX(vehicle.Power) > 150
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT Model, Top_Speed FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Top_Speed FROM vehicle WHERE Model LIKE '%DJ%'
SELECT driver.Name, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT driver.Driver_ID, driver.Name, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code != "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Subject_Code != "Database"
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code
SELECT driver.Name, COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT Satisfactory_YN, COUNT(*) as count FROM Student_Assessments GROUP BY Satisfactory_YN ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.bio_data, Transcripts.date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.bio_data, Transcripts.date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id ORDER BY Transcripts.date_of_transcript DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Student_Assessments ON Exams.Exam_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.bio_data FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id GROUP BY Students.student_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT Students.bio_data FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id GROUP BY Students.student_id HAVING COUNT(Students_Addresses.student_address_id) >= 2
SELECT student_details, COUNT(*) FROM Students GROUP BY student_details
SELECT club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID HAVING COUNT(*) > 2 ORDER BY SUM(player.Earnings) DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT driver.Name FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Player_ID IS NULL
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
SELECT product_type_code, product_name FROM Products
SELECT product_type_code, product_name FROM Products WHERE product_name IS NOT NULL
SELECT Products.product_type_code, Products.product_name FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Customer_Orders.order_status_code = 'shipped'
SELECT DISTINCT Products.product_name, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_tracking_number != 'shipped' OR Shipments.shipment_tracking_number IS NULL
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_date IS NULL
SELECT Orders.order_id AS order_id, Orders.date_order_placed AS date, SUM(Products.product_price) AS total_cost FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id AS order_id, Orders.date_order_placed AS order_date, COALESCE(SUM(Products.product_price), 0) AS total_amount_paid FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id LEFT JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT product_name, product_color FROM Products
SELECT product_color, product_name FROM Products
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN ( SELECT Orders.customer_id AS customer_id FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.customer_id HAVING COUNT(DISTINCT Order_Items.order_item_id) >= 2 ) AS pm_customers ON pm_customers.customer_id = Orders.customer_id
SELECT DISTINCT t4.date_order_placed FROM Orders AS t4 JOIN ( SELECT t2.customer_id FROM Customer_Payment_Methods AS t2 GROUP BY t2.customer_id HAVING COUNT(*) >= 2 ) AS pm ON pm.customer_id = t4.customer_id
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year > ( SELECT AVG(T3_2.Start_Year) FROM program AS T3_2 )
SELECT channel.Channel_ID, channel.Name FROM channel WHERE channel.Analogue_terrestrial_channel <> 'Hank Baskett' OR channel.Analogue_terrestrial_channel IS NULL
SELECT city_channel.Affiliation FROM city_channel JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY city_channel.Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.City, t2.Transmitter FROM city_channel AS t1 JOIN city_channel_radio AS t3 ON t3.City_channel_ID = t1.ID JOIN radio AS t2 ON t3.Radio_ID = t2.Radio_ID ORDER BY t1.Owned_Since DESC
SELECT DISTINCT radio.RnaG_MHz FROM radio LEFT JOIN city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE city_channel_radio.Radio_ID IS NULL
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT vehicle_count AS max_vehicles_driven, Driver_ID AS driver_id FROM ( SELECT t3.Driver_ID, COUNT(DISTINCT t3.Vehicle_ID) AS vehicle_count FROM vehicle_driver AS t3 GROUP BY t3.Driver_ID ) AS x ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, COUNT(DISTINCT vehicle_driver.Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT driver.Citizenship FROM driver WHERE driver.Driver_ID NOT IN ( SELECT vehicle_driver.Driver_ID FROM vehicle_driver )
SELECT t2.Driver_ID, t2.Name FROM driver AS t2 JOIN vehicle_driver AS t3 ON t3.Driver_ID = t2.Driver_ID GROUP BY t2.Driver_ID, t2.Name HAVING COUNT(DISTINCT t3.Vehicle_ID) = 2 OR MAX(CASE WHEN t2.Citizenship = 'Ziyang' THEN 1 ELSE 0 END) = 1
SELECT driver.Driver_ID, driver.Name FROM driver LEFT JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name HAVING COUNT(DISTINCT vehicle_driver.Vehicle_ID) = 2 OR MAX(CASE WHEN driver.Citizenship = 'Ziyang' THEN 1 ELSE 0 END) = 1
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT DISTINCT vehicle.Model, vehicle.Builder FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'DJ1'
SELECT date_of_transcript FROM Transcripts WHERE lower(transcript_details) LIKE '%data%' ORDER BY date_of_transcript DESC
SELECT event_date FROM Student_Events WHERE lower(event_type_code) LIKE '%data%' ORDER BY event_date DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Student_Answer_Text FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Students.bio_data FROM Students LEFT JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Events.event_id IS NULL
SELECT Student_Assessments.Assessment FROM Student_Assessments WHERE Student_Assessments.Assessment IN ( SELECT Assessment FROM Student_Assessments WHERE Satisfactory_YN IN ('Normal','Absent') GROUP BY Assessment HAVING COUNT(DISTINCT Satisfactory_YN) = 2 )
SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text IN ('Normal','Absent') GROUP BY Student_Answers.Comments HAVING COUNT(DISTINCT Student_Answers.Student_Answer_Text) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_color = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_color = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_color = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT parent_product_id FROM Products GROUP BY parent_product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers WHERE customer_name IN ( SELECT customer_name FROM Customers GROUP BY customer_name HAVING COUNT(DISTINCT customer_id) = ( SELECT MIN(customer_count) FROM ( SELECT COUNT(DISTINCT customer_id) AS customer_count FROM Customers GROUP BY customer_name ) ) )
SELECT Customers.name FROM Customers JOIN Renting_history ON Renting_history.customer_id = Customers.id JOIN Discount ON Discount.id = Renting_history.discount_id WHERE Discount.name IN ( SELECT name FROM Discount GROUP BY name HAVING COUNT(*) = ( SELECT MIN(method_count) FROM ( SELECT COUNT(*) AS method_count FROM Discount GROUP BY name ) ) ) GROUP BY Customers.id, Customers.name
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_item_id FROM Order_Items GROUP BY order_item_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT Order_Items.product_id FROM Order_Items )
SELECT Products.product_name FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_item_id IS NULL
SELECT t1.customer_id AS id, t1.customer_name AS first_name, t1.customer_address AS last_name FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id JOIN Order_Items AS t3 ON t3.order_id = t2.order_id GROUP BY t1.customer_id, t1.customer_name, t1.customer_address HAVING COUNT(DISTINCT t2.order_id) > 2 AND COUNT(DISTINCT t3.order_item_id) >= 3
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_address FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_address HAVING COUNT(DISTINCT Customer_Orders.order_id) > 2 AND COUNT(DISTINCT Order_Items.order_item_id) >= 3
SELECT customer_name, customer_address, customer_phone FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Orders WHERE customer_id IS NOT NULL )
SELECT Customers.customer_name, Customers.customer_address, Customers.customer_phone FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT Products.product_id, Products.product_type_code, Products.product_price, Products.product_name FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_type_code, Products.product_price, Products.product_name HAVING COUNT(Order_Items.order_id) < 2
SELECT t1.product_id AS id, t1.product_name AS product_name, t1.product_price AS price FROM Order_Items AS t5 JOIN Products AS t1 ON t5.product_id = t1.product_id GROUP BY t1.product_id, t1.product_name, t1.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(order_count) FROM ( SELECT COUNT(*) AS order_count FROM Order_Items JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Order_Items.product_id ) )
SELECT Customer_Orders.order_id, SUM(Products.product_price) AS sum_product_prices FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customer_Orders.order_id ORDER BY sum_product_prices ASC LIMIT 1
SELECT Order_Items.order_id, SUM(CAST(Order_Items.order_quantity AS REAL)) AS total_cost FROM Order_Items GROUP BY Order_Items.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders ON Orders.order_id = Order_Items.order_id JOIN Customers ON Customers.customer_id = Orders.customer_id WHERE Customers.customer_last_name = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE product_price IS NULL OR product_price = 0
SELECT COUNT(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_number IS NULL OR TRIM(customer_number) = ''
SELECT Customers.customer_name AS email_address, Customers.customer_address AS town, Customers.customer_email AS county FROM Customers WHERE Customers.customer_email IN ( SELECT customer_email FROM Customers GROUP BY customer_email HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY customer_email ) ) )
SELECT Customers.payment_method_code AS email_address, Customers.customer_address AS city, Customers.customer_email AS county FROM Customers WHERE Customers.address_id = ( SELECT address_id FROM ( SELECT Customers.address_id, COUNT(Customer_Orders.order_id) AS order_count FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.address_id ORDER BY order_count ASC LIMIT 1 ) )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT channel.Name FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID GROUP BY program.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT channel.Name, director.Age FROM director_admin JOIN channel ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID GROUP BY director_admin.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM channel AS c LEFT JOIN program AS p ON p.Channel_ID = c.Channel_ID WHERE p.Program_ID IS NULL
SELECT channel.Name, channel.Internet FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet ORDER BY COUNT(DISTINCT program.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = program.Director_ID GROUP BY channel.Channel_ID, channel.Name HAVING SUM(CASE WHEN director.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN director.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID JOIN driver AS t2 ON t2.Driver_ID = t3.Driver_ID GROUP BY t1.Vehicle_ID, t1.Model HAVING COUNT(DISTINCT t3.Driver_ID) > 2 OR SUM(CASE WHEN t2.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS d LEFT JOIN vehicle_driver AS dv ON d.Driver_ID = dv.Driver_ID WHERE dv.Vehicle_ID IS NULL
SELECT t2.Name FROM driver AS t2 JOIN vehicle_driver AS t3 ON t3.Driver_ID = t2.Driver_ID JOIN vehicle AS t1 ON t1.Vehicle_ID = t3.Vehicle_ID WHERE t1.Top_Speed > ( SELECT AVG(t1b.Top_Speed) FROM vehicle AS t1b WHERE t1b.Builder = 'hardware type' ) AND t1.Builder = 'hardware type'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Citizenship = 'Hardware' AND vehicle.Top_Speed > ( SELECT AVG(T1b.Top_Speed) FROM driver AS T2b JOIN vehicle_driver AS T3b ON T2b.Driver_ID = T3b.Driver_ID JOIN vehicle AS T1b ON T3b.Vehicle_ID = T1b.Vehicle_ID WHERE T2b.Citizenship = 'Hardware' )
SELECT t1.customer_id AS customer_id, t1.customer_name AS name, t1.customer_phone AS phone, t1.customer_email AS email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id GROUP BY t1.customer_id, t1.customer_name, t1.customer_phone, t1.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.customer_id AS id, t1.customer_name AS name, t1.customer_phone AS phone, t1.customer_email AS email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id GROUP BY t1.customer_id, t1.customer_name, t1.customer_phone, t1.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS Customers LEFT JOIN Orders AS Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Orders AS o ON o.customer_id = c.customer_id WHERE o.order_id IS NULL
SELECT DISTINCT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE CAST(Shipments.invoice_number AS INTEGER) > 6 OR Orders.order_id IN ( SELECT T2b.order_id FROM Orders AS T2b JOIN Order_Items AS T3b ON T3b.order_id = T2b.order_id JOIN Shipment_Items AS T5b ON T5b.order_item_id = T3b.order_item_id GROUP BY T2b.order_id HAVING COUNT(DISTINCT T3b.product_id) > 3 )
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING SUM(CAST(Order_Items.order_quantity AS INTEGER)) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Capital, region.Name FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Capital, region.Name ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT Customers.* FROM Customers JOIN Renting_history ON Renting_history.customer_id = Customers.id GROUP BY Customers.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.* FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.customer_name FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(DISTINCT Customer_Orders.order_status_code) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customer_Interactions.Status_Code) DESC LIMIT 1
SELECT * FROM Customers WHERE customer_name IN ( SELECT customer_name FROM Customers GROUP BY customer_name HAVING COUNT(*) = ( SELECT MIN(service_count) FROM ( SELECT COUNT(*) AS service_count FROM Customers GROUP BY customer_name ) ) )
SELECT DISTINCT customer_name, customer_address, customer_phone, customer_email FROM Customers WHERE customer_email IN ( SELECT customer_email FROM Customers GROUP BY customer_email HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY customer_email ) ) )
SELECT DISTINCT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT DISTINCT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID WHERE Analytical_Layer.Analytical_Layer_Type_Code = 'good'
SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' OR Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Customers.Customer_Details FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Customers.* FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad' AND EXISTS ( SELECT 1 FROM Customers_and_Services WHERE Customers_and_Services.Customer_ID = Customers.Customer_ID AND Customers_and_Services.Service_ID = Services.Service_ID )
SELECT driver.Name, driver.Citizenship, vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Build_Year IN ('2013', '2014')
SELECT driver.Name, driver.Citizenship, vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year IN ('2013', '2014')
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.student_details, Students.student_id FROM Students LEFT JOIN ( SELECT student_id AS student_id, COUNT(*) AS class_count FROM Transcripts GROUP BY student_id ) AS C ON C.student_id = Students.student_id LEFT JOIN ( SELECT student_id AS student_id, COUNT(*) AS detention_count FROM Student_Events GROUP BY student_id ) AS D ON D.student_id = Students.student_id WHERE COALESCE(C.class_count, 0) >= 2 OR COALESCE(D.detention_count, 0) < 2
SELECT Students.student_details, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(*) >= 2 ) OR Students.student_id IN ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) < 2 )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Classes ON Classes.student_id = Students.student_id WHERE LOWER(Classes.class_details) LIKE '%data%' AND Students.student_id NOT IN ( SELECT T3b.student_id FROM Classes AS T3b WHERE LOWER(T3b.class_details) LIKE 'net%' )
SELECT DISTINCT t1.* FROM Students AS t1 JOIN Achievements AS t4 ON t4.student_id = t1.student_id WHERE lower(t4.other_details) LIKE '%data%' AND t1.student_id NOT IN ( SELECT t4b.student_id FROM Achievements AS t4b WHERE lower(t4b.other_details) LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS A ON Student_Loans.student_id = A.student_id
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS a ON Student_Loans.student_id = a.student_id
SELECT t2.Name, t2.Driver_ID FROM driver AS t2 JOIN vehicle_driver AS t3 ON t3.Driver_ID = t2.Driver_ID GROUP BY t2.Driver_ID ORDER BY COUNT(DISTINCT t3.Vehicle_ID) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data FROM Students JOIN Classes ON Classes.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT t1.student_id, t1.bio_data, t1.student_details, t7.achievement_id, t7.achievement_type_code, t7.date_achievement, t7.achievement_details, t7.other_details FROM Students AS t1 JOIN Achievements AS t7 ON t7.student_id = t1.student_id WHERE t7.achievement_details = ( SELECT t7m.achievement_details FROM Achievements AS t7m GROUP BY t7m.achievement_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND t1.student_id IN ( SELECT t7a.student_id FROM Achievements AS t7a WHERE t7a.achievement_details IN ( SELECT t7b.achievement_details FROM Achievements AS t7b GROUP BY t7b.achievement_details HAVING COUNT(DISTINCT t7b.student_id) = 3 ) )
SELECT Students.* FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Events.other_details IN ( SELECT other_details FROM Student_Events GROUP BY other_details HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Student_Events GROUP BY other_details ) ) ) AND Student_Events.other_details IN ( SELECT other_details FROM Student_Events GROUP BY other_details HAVING COUNT(*) = 3 )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.transcript_details = ( SELECT transcript_details FROM Transcripts GROUP BY transcript_details ORDER BY COUNT(*) DESC LIMIT 1 ) GROUP BY Students.student_id, Students.bio_data, Students.student_details HAVING COUNT(*) = ( SELECT COUNT(*) FROM Transcripts AS T2_all WHERE T2_all.student_id = Students.student_id )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.transcript_details = ( SELECT T2b.transcript_details FROM Transcripts AS T2b GROUP BY T2b.transcript_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS number, Student_Events.event_type_code AS event_type, Ref_Event_Types.event_type_description AS description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Student_Events.student_id) AS number_of_students, Student_Events.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY number_of_students DESC LIMIT 1
SELECT COUNT(DISTINCT Achievements.student_id) FROM Achievements JOIN Students_Addresses ON Achievements.student_id = Students_Addresses.student_id LEFT JOIN Student_Loans ON Student_Loans.student_id = Students_Addresses.student_id WHERE Student_Loans.student_loan_id IS NULL
SELECT COUNT(DISTINCT t6.student_id) FROM Achievements AS t6 JOIN Students AS s ON t6.student_id = s.student_id WHERE NOT EXISTS ( SELECT 1 FROM Student_Loans AS a WHERE a.student_id = s.student_id )
SELECT t2.id AS type_code, t2.name AS description FROM Renting_history AS t4 JOIN Discount AS t2 ON t4.discount_id = t2.id GROUP BY t2.id, t2.name ORDER BY COUNT(*) ASC LIMIT 1
SELECT t4.detention_type_code, t4.detention_type_description FROM Ref_Detention_Type AS t4 JOIN Detention AS t5 ON t5.detention_type_code = t4.detention_type_code GROUP BY t4.detention_type_code, t4.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details, Student_Loans.amount_of_loan, Student_Loans.date_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Transcripts.* FROM Student_Loans JOIN Students_Addresses ON Students_Addresses.student_id = Student_Loans.student_id JOIN Transcripts ON Transcripts.student_id = Students_Addresses.student_id WHERE Student_Loans.date_of_loan = (SELECT MIN(date_of_loan) FROM Student_Loans)
SELECT DISTINCT t1.* FROM Students AS t1 JOIN Students_Addresses AS t7 ON t7.student_id = t1.student_id WHERE t7.address_id IN ( SELECT t7s.address_id FROM Students_Addresses AS t7s JOIN Achievements AS t8 ON t8.student_id = t7s.student_id WHERE t8.date_achievement = (SELECT MIN(date_achievement) FROM Achievements) )
SELECT Achievements.achievement_type_code, Ref_Achievement_Type.achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code GROUP BY Achievements.achievement_type_code, Ref_Achievement_Type.achievement_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT t3.address_id, t2.address_details FROM Customers AS t3 JOIN Addresses AS t2 ON t3.address_id = t2.address_id GROUP BY t3.address_id, t2.address_details ORDER BY COUNT(*) DESC LIMIT 1
