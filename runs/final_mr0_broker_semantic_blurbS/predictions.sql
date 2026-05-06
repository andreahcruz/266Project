SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Name NOT IN (SELECT club.Name FROM club WHERE club.Manager = 'Nike')
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player WHERE Name = 'Nike')
SELECT club.Name, COUNT(player.Player_ID) AS wins_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY wins_count ASC
SELECT club.Name, COUNT(player.Player_ID) AS win_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 0 GROUP BY club.Club_ID, club.Name ORDER BY win_count ASC
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(DISTINCT player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(DISTINCT player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT club.Name) FROM club
SELECT COUNT(DISTINCT Name) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT Shipments.shipment_tracking_number) FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id AND Order_Items.order_item_id = Shipment_Items.order_item_id
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipments
SELECT COUNT(DISTINCT Products.product_id) FROM Products JOIN Shipments ON Products.product_id = Shipments.order_id WHERE Shipments.shipment_tracking_number IS NOT NULL
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Director_ID) FROM director
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID ORDER BY program.Start_Year DESC
SELECT Name FROM channel WHERE Age BETWEEN 30 AND 60 JOIN director ON channel.Channel_ID = director.Director_ID
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Transmitter FROM radio WHERE Lyric_FM_MHz != 'ABC'
SELECT AVG(director.Age) FROM director JOIN channel ON director.Director_ID = director_admin.Director_ID JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID WHERE channel.Name = 'radio'
SELECT city_channel.City FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel.City HAVING COUNT(DISTINCT city_channel_radio.Radio_ID) > 3
SELECT driver.Citizenship FROM driver WHERE driver.Racing_Series = 'United States'
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Total_Production) FROM vehicle WHERE Total_Production IS NOT NULL
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT count(*) FROM Questions_in_Exams
SELECT count(*) FROM Student_Assessments
SELECT DISTINCT Question_ID FROM Questions_in_Exams ORDER BY Question_ID ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Student_Answers.Student_Answer_ID) FROM Student_Answers WHERE Student_Answers.Comments IS NOT NULL OR Student_Answers.Student_Answer_Text IS NOT NULL
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Assessments
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE First_Name != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_ID, Questions.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Student_Answer_ID, Student_Answers.Exam_ID, Student_Answers.Question_ID, Student_Answers.Student_ID, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text, Student_Assessments.Student_Answer_ID, Student_Assessments.Valid_Answer_ID, Student_Assessments.Student_Answer_Text, Student_Assessments.Satisfactory_YN, Student_Assessments.Assessment FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID LEFT JOIN Student_Assessments ON Student_Assessments.Valid_Answer_ID = Students.Student_ID
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers WHERE payment_method_code IS NOT NULL
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.product_type_code FROM Products ORDER BY Products.product_price DESC
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(DISTINCT customer_id) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT customer_name FROM Customers
SELECT DISTINCT customer_name FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, player.Name, player.Country FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Sam Allardyce'
SELECT club.Name, COUNT(DISTINCT player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT club.Name, COUNT(DISTINCT player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Customer_Orders.order_id, Customer_Orders.order_status_code, COUNT(Order_Items.product_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_status_code
SELECT Customer_Orders.order_id, Customer_Orders.order_status_code, COUNT(Order_Items.order_item_id) AS product_count FROM Customer_Orders LEFT JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_status_code
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING COUNT(Order_Items.product_id) >= 2
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING count(Order_Items.product_id) >= 2
SELECT Customers.customer_name, COUNT(Customer_Orders.order_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_name
SELECT Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Shipment_Items.shipment_id FROM Shipments LEFT JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipment_Items.shipment_id FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Shipments.shipment_tracking_number, Shipment_Items.shipment_id FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipments.shipment_tracking_number IS NOT NULL
SELECT Customers.customer_number, Customers.customer_name FROM Customers WHERE Customers.customer_address LIKE '+12%'
SELECT Customers.customer_number, Customers.customer_name FROM Customers WHERE Customers.customer_address LIKE '+12%'
SELECT product_name FROM Products WHERE product_type_code LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT order_item_status_code, date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Customers.customer_name, Customers.customer_address, Customers.customer_phone FROM Customers WHERE Customers.customer_number = 'USA'
SELECT Customers.customer_number, Customers.customer_name, Customers.customer_address FROM Customers WHERE Customers.customer_phone = 'United States'
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_name HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id HAVING COUNT(*) > 3
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(DISTINCT Shipment_Items.order_item_id) >= 2
SELECT Shipment_Items.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Orders.order_id, Orders.date_order_placed FROM Orders
SELECT channel.Name FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID ORDER BY director.Age ASC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Analogue_terrestrial_channel LIKE '%bbc%' OR Digital_terrestrial_channel LIKE '%bbc%' OR Internet LIKE '%bbc%'
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT director.Name, director.Age FROM director WHERE director.Director_ID IN (SELECT program.Director_ID FROM program GROUP BY program.Director_ID HAVING COUNT(*) > 1)
SELECT director.Name, COUNT(program.Program_ID) FROM director LEFT JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID, director.Name
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT Next_show_name, COUNT(*) FROM tv_show GROUP BY Next_show_name
SELECT city_channel.City, city_channel.Station_name FROM city_channel ORDER BY city_channel.Station_name ASC
SELECT radio.Transmitter, radio.Radio_MHz FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT radio.Transmitter, COUNT(city_channel_radio.City_channel_ID) FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Transmitter
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power) AS max_power, AVG(Power) AS average_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Zhuzhou'
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Build_Year = '1996'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Name, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship LIKE '%DJ%'
SELECT driver.Name, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name
SELECT driver.Driver_ID, driver.Name, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code != "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Subject_Code != "Database"
SELECT Questions.Question_Text, COUNT(*) FROM Questions GROUP BY Questions.Question_Text
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Student_Assessments.Student_Answer_ID, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Student_Assessments ON Student_Answers.Student_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Students ON Student_Answers.Student_ID = Students.Student_ID JOIN Student_Assessments ON Students.Student_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT DISTINCT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT First_Name, COUNT(*) FROM Students GROUP BY First_Name
SELECT club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Club_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Player_ID IS NULL
SELECT t1.Name FROM club AS t1 LEFT JOIN player AS t2 ON t2.Club_ID = t1.Club_ID WHERE t2.Player_ID IS NULL
SELECT club.Sponsor FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name HAVING SUM(CASE WHEN player.Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(Order_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT t2.order_id FROM Order_Items AS t2 GROUP BY t2.order_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(DISTINCT Shipment_Items.shipment_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.customer_address, COUNT(*) AS number_of_products FROM Products AS t1 JOIN Customers AS t2 ON t1.product_id = t2.customer_id GROUP BY t2.customer_address
SELECT product_type_code, COUNT(*) AS product_count FROM Products GROUP BY product_type_code
SELECT Products.product_name, Shipments.shipment_date FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT t1.product_name, t4.shipment_date FROM Shipment_Items AS t5 JOIN Shipments AS t4 ON t5.shipment_id = t4.shipment_id JOIN Order_Items AS t3 ON t5.order_item_id = t3.order_item_id JOIN Products AS t1 ON t3.product_id = t1.product_id
SELECT Products.product_name, Shipments.shipment_tracking_number FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Shipments.shipment_tracking_number = 'shipped'
SELECT DISTINCT Products.product_name, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Orders.order_status_code FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Order_Items.order_item_status_code = 'not shipped'
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_date IS NULL
SELECT Orders.order_id AS order_id, Orders.date_order_placed AS date_order_placed, SUM(Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id AS order_id, Orders.date_order_placed AS date_order_placed, COALESCE(SUM(Products.product_price), 0) AS total_amount_paid FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id LEFT JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT product_type_code, product_name FROM Products
SELECT product_type_code, product_name FROM Products
SELECT Customer_Orders.order_date FROM Customer_Orders JOIN ( SELECT customer_id FROM Customer_Orders GROUP BY customer_id HAVING COUNT(*) >= 2 ) AS T4 ON Customer_Orders.customer_id = T4.customer_id
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 ) AS PM ON PM.customer_id = Orders.customer_id
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year > (SELECT AVG(Start_Year) FROM program)
SELECT channel.Channel_ID, channel.Name FROM channel WHERE channel.Channel_ID NOT IN ( SELECT program.Channel_ID FROM program WHERE program.Title = 'Hank Baskett' )
SELECT city_channel_radio.Is_online FROM city_channel_radio GROUP BY city_channel_radio.Is_online ORDER BY COUNT(*) DESC LIMIT 1
SELECT city_channel.City, radio.Transmitter FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT radio.Transmitter FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Radio_ID IS NULL
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT t3.Driver_ID, COUNT(DISTINCT t3.Vehicle_ID) AS vehicle_count FROM vehicle_driver AS t3 GROUP BY t3.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, COUNT(DISTINCT vehicle_driver.Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT driver.Citizenship FROM driver WHERE driver.Driver_ID NOT IN ( SELECT vehicle_driver.Driver_ID FROM vehicle_driver )
SELECT t2.Driver_ID, t2.Name FROM driver AS t2 LEFT JOIN vehicle_driver AS t3 ON t3.Driver_ID = t2.Driver_ID GROUP BY t2.Driver_ID, t2.Name HAVING COUNT(DISTINCT t3.Vehicle_ID) = 2 OR MAX(CASE WHEN t2.Citizenship = 'Ziyang' THEN 1 ELSE 0 END) = 1
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 ) OR vehicle.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT DISTINCT vehicle.Model, vehicle.Builder FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'DJ1'
SELECT Exam_Date FROM Exams WHERE lower(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT t2.Student_Answer_Text FROM Student_Answers AS t2 GROUP BY t2.Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Student_Answer_Text FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers WHERE Valid_Answer_Text IS NOT NULL AND TRIM(Valid_Answer_Text) <> '' GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Student_Answers.Comments FROM Student_Answers GROUP BY Student_Answers.Comments HAVING SUM(CASE WHEN Student_Answers.Student_Answer_Text = 'Normal' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Student_Answers.Student_Answer_Text = 'Absent' THEN 1 ELSE 0 END) > 0
SELECT Student_Answers.Comments FROM Student_Answers GROUP BY Student_Answers.Comments HAVING SUM(CASE WHEN Student_Answers.Student_Answer_Text = 'Normal' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Student_Answers.Student_Answer_Text = 'Absent' THEN 1 ELSE 0 END) > 0
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_color = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_number FROM Customers GROUP BY customer_number ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers WHERE customer_phone IN ( SELECT customer_phone FROM Customers GROUP BY customer_phone HAVING COUNT(DISTINCT customer_id) = ( SELECT MIN(customer_count) FROM ( SELECT COUNT(DISTINCT customer_id) AS customer_count FROM Customers GROUP BY customer_phone ) ) )
SELECT payment_method_code FROM Customers WHERE customer_name IN ( SELECT customer_name FROM Customers GROUP BY customer_name HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY customer_name ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_id FROM Products GROUP BY product_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products EXCEPT SELECT Products.product_type_code FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id
SELECT Products.product_type_code FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.product_id IS NULL
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_address FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_address HAVING COUNT(DISTINCT Customer_Orders.order_id) > 2 AND COUNT(DISTINCT Order_Items.order_item_id) >= 3
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_address FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_address HAVING COUNT(DISTINCT Customer_Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT Customers.customer_name, Customers.customer_address, Customers.customer_phone FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT Customers.customer_name, Customers.customer_address, Customers.customer_phone FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT Products.product_id, Products.product_type_code, Products.product_price, Products.product_name FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_type_code, Products.product_price, Products.product_name HAVING COUNT(Order_Items.product_id) < 2
SELECT Products.product_id, Products.product_type_code, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_type_code, Products.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_type_code, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_type_code, Products.product_price HAVING COUNT(*) = ( SELECT MAX(order_count) FROM ( SELECT COUNT(*) AS order_count FROM Order_Items GROUP BY product_id ) )
SELECT Customer_Orders.order_id, SUM(Products.product_price) AS sum_price FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customer_Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Customer_Orders.order_id, SUM(CAST(Order_Items.order_quantity AS REAL)) AS total_cost FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_type_code, Products.product_price, Products.product_name FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_name = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_last_name = 'female'
SELECT product_price, product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE product_price IS NULL OR product_price = 0
SELECT COUNT(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT Customers.customer_name, Customers.customer_address, Customers.customer_email FROM Customers WHERE Customers.customer_address IN ( SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Customers.town_city, Customers.email_address, Customers.address_line_1 FROM Customers WHERE Customers.gender_code = ( SELECT gender FROM ( SELECT Customers.gender_code AS gender, COUNT(Orders.order_id) AS order_count FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id GROUP BY Customers.gender_code ORDER BY order_count ASC LIMIT 1 ) )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT channel.Name FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT channel.Name, director.Age FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = director_admin.Director_ID ORDER BY ( SELECT COUNT(*) FROM program WHERE program.Channel_ID = channel.Channel_ID ) DESC LIMIT 1
SELECT COUNT(*) FROM channel AS T1a WHERE NOT EXISTS (SELECT 1 FROM program AS T3a WHERE T3a.Channel_ID = T1a.Channel_ID)
SELECT channel.Name, channel.Internet FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet ORDER BY COUNT(DISTINCT program.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = program.Director_ID GROUP BY channel.Channel_ID, channel.Name HAVING SUM(CASE WHEN director.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN director.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT driver.Driver_ID, driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Driver_ID, driver.Name HAVING COUNT(DISTINCT vehicle.Vehicle_ID) > 2 OR SUM(CASE WHEN vehicle.Model = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS driver LEFT JOIN vehicle_driver AS vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS T1a LEFT JOIN Customer_Orders AS T2a ON T2a.customer_id = T1a.customer_id WHERE T2a.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT DISTINCT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING MAX(CAST(Order_Items.order_quantity AS REAL)) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING SUM(CASE WHEN CAST(Order_Items.order_quantity AS REAL) > 6 THEN 1 ELSE 0 END) > 0 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Capital, region.Area FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Capital, region.Area ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT Customers.* FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_ID ORDER BY COUNT(DISTINCT Customer_Interactions.Status_Code) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers_and_Services.Customer_ID IN ( SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Customer_ID ) ) ) GROUP BY Services.Service_ID, Services.Service_Details
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers_and_Services.Customer_ID IN ( SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Customer_ID ) ) )
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID WHERE Analytical_Layer.Analytical_Layer_Type_Code = 'good'
SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Customers.Customer_Details FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT DISTINCT Customers.* FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Cost_per_25_miles FROM Vehicles WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Customers.name, Vehicles.Type_of_powertrain, Vehicles.Cost_per_25_miles FROM Renting_history JOIN Customers ON Renting_history.customer_id = Customers.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.student_details, Students.student_id FROM Students JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id GROUP BY Students.student_id, Students.student_details HAVING COUNT(DISTINCT Students_Addresses.student_address_id) >= 2 UNION SELECT Students.student_details, Students.student_id FROM Students LEFT JOIN Transcripts ON Transcripts.student_id = Students.student_id GROUP BY Students.student_id, Students.student_details HAVING COUNT(DISTINCT Transcripts.transcript_id) < 2
SELECT Students.bio_data, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2 ) OR Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) < 2 )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Classes ON Classes.student_id = Students.student_id WHERE LOWER(Classes.class_details) LIKE '%data%' AND Students.student_id NOT IN ( SELECT T3b.student_id FROM Classes AS T3b WHERE LOWER(T3b.class_details) LIKE 'net%' )
SELECT DISTINCT t1.student_id, t1.bio_data, t1.student_details FROM Students AS t1 JOIN Classes AS t3 ON t3.student_id = t1.student_id WHERE lower(t3.class_details) LIKE '%data%' AND NOT EXISTS ( SELECT 1 FROM Classes AS t3b WHERE t3b.student_id = t1.student_id AND lower(t3b.class_details) LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) >= 2 ) AS T6A ON Student_Loans.student_id = T6A.student_id
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS A ON A.student_id = Student_Loans.student_id
SELECT t1.bio_data, t1.student_id FROM Students AS t1 JOIN Classes AS t7 ON t7.student_id = t1.student_id GROUP BY t1.student_id, t1.bio_data ORDER BY COUNT(DISTINCT t7.teacher_id) DESC LIMIT 1
SELECT Students.student_id, Students.student_details FROM Students JOIN Classes ON Classes.student_id = Students.student_id GROUP BY Students.student_id, Students.student_details ORDER BY COUNT(DISTINCT Classes.teacher_id) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_details = ( SELECT T7a.achievement_details FROM Achievements AS T7a GROUP BY T7a.achievement_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND EXISTS ( SELECT 1 FROM Achievements AS T7b WHERE T7b.student_id = Students.student_id AND T7b.achievement_details IN ( SELECT T7c.achievement_details FROM Achievements AS T7c GROUP BY T7c.achievement_details HAVING COUNT(DISTINCT T7c.student_id) = 3 ) ) GROUP BY Students.student_id, Students.bio_data, Students.student_details
SELECT Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT T3b.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3b GROUP BY T3b.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND Students.student_id IN ( SELECT T3c.student_id FROM Behaviour_Monitoring AS T3c GROUP BY T3c.student_id HAVING SUM( CASE WHEN T3c.behaviour_monitoring_details IN ( SELECT T3d.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3d GROUP BY T3d.behaviour_monitoring_details HAVING COUNT(DISTINCT T3d.student_id) = 3 ) THEN 1 ELSE 0 END ) > 0 AND SUM( CASE WHEN T3c.behaviour_monitoring_details = ( SELECT T3e.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3e GROUP BY T3e.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) THEN 1 ELSE 0 END ) > 0 )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data, Students.student_details HAVING COUNT(*) = SUM(CASE WHEN Transcripts.transcript_details = (SELECT transcript_details FROM Transcripts GROUP BY transcript_details ORDER BY COUNT(*) DESC LIMIT 1) THEN 1 ELSE 0 END)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_details = ( SELECT T7b.achievement_details FROM Achievements AS T7b GROUP BY T7b.achievement_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS number, Student_Events.event_type_code AS event_type, Ref_Event_Types.event_type_description AS description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Student_Events.student_id) AS number_of_students, Student_Events.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(DISTINCT Student_Events.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Achievements.achievement_type_code) FROM Achievements JOIN Students_Addresses ON Achievements.student_id = Students_Addresses.student_id LEFT JOIN Student_Loans ON Student_Loans.student_id = Students_Addresses.student_id WHERE Student_Loans.student_loan_id IS NULL
SELECT COUNT(DISTINCT t5.teacher_id) FROM Classes AS t5 JOIN Students AS t1 ON t5.student_id = t1.student_id WHERE NOT EXISTS ( SELECT 1 FROM Student_Loans AS t4 WHERE t4.student_id = t1.student_id )
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type JOIN Detention ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT t4.detention_type_code, t4.detention_type_description FROM Ref_Detention_Type AS t4 JOIN Detention AS t5 ON t5.detention_type_code = t4.detention_type_code GROUP BY t4.detention_type_code, t4.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Teachers.teacher_id, Teachers.teacher_details FROM Student_Loans JOIN Students_Addresses ON Students_Addresses.student_id = Student_Loans.student_id JOIN Classes ON Classes.student_id = Students_Addresses.student_id JOIN Teachers ON Teachers.teacher_id = Classes.teacher_id WHERE Student_Loans.date_of_loan = (SELECT MIN(date_of_loan) FROM Student_Loans)
SELECT DISTINCT t1.* FROM Students AS t1 JOIN Students_Addresses AS t7 ON t7.student_id = t1.student_id WHERE t7.address_id IN ( SELECT t3.event_type_code FROM Student_Events AS t3 WHERE t3.event_date = (SELECT MIN(event_date) FROM Student_Events) )
SELECT Achievements.achievement_type_code, Ref_Achievement_Type.achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code GROUP BY Achievements.achievement_type_code, Ref_Achievement_Type.achievement_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students_Addresses.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Students_Addresses.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
