SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM player ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Manager != 'Nike'
SELECT DISTINCT club.Name FROM club WHERE club.Club_ID NOT IN (SELECT player.Club_ID FROM player WHERE player.Name = 'Nike')
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY sum(player.Earnings) ASC
SELECT club.Name, COUNT(player.Player_ID) AS win_count FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > player.Events_number GROUP BY club.Club_ID, club.Name ORDER BY win_count ASC
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING count(DISTINCT player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(DISTINCT player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID HAVING COUNT(player.Player_ID) > 1
SELECT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manager HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT club.Manager) FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT COUNT(DISTINCT Manager) FROM club
SELECT COUNT(DISTINCT Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT Order_Items.order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT invoice_number) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Director_ID) FROM director
SELECT Name FROM director ORDER BY Age DESC
SELECT channel.Name FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT radio.Transmitter FROM radio WHERE radio.Lyric_FM_MHz != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio
SELECT Affiliation FROM city_channel WHERE ID IN (SELECT ID FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT ID) > 3) GROUP BY Affiliation
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT driver.Name FROM driver WHERE driver.Racing_Series = 'United States'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Power) FROM vehicle
SELECT Model FROM vehicle ORDER BY Model ASC
SELECT vehicle.Model FROM vehicle ORDER BY vehicle.Model ASC
SELECT count(*) FROM Questions_in_Exams
SELECT count(*) FROM Student_Assessments
SELECT DISTINCT Question_ID FROM Questions_in_Exams ORDER BY Question_ID ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = 'Normal'
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Question_Text FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_Text HAVING COUNT(*) >= 3
SELECT Questions.Question_ID FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_ID HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(customer_number) FROM Customers
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_name = "hardware type"
SELECT COUNT(*) FROM Products WHERE product_name = 'Hardware'
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products GROUP BY product_name HAVING count(*) >= 2
SELECT product_name FROM Products GROUP BY product_name HAVING COUNT(*) >= 2
SELECT COUNT(DISTINCT customer_id) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT club.Name, club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Wins_count DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 GROUP BY club.Club_ID, club.Name
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT club.Name, COUNT(DISTINCT player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT club.Name, COUNT(DISTINCT player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT player.Wins_count FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Australia" OR club.Manager = "Zimbabwe"
SELECT player.Earnings, player.Events_number, player.Wins_count, player.Club_ID FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager IN ('Australia', 'Zimbabwe')
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code, COUNT(Shipment_Items.shipment_id) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code
SELECT Order_Items.order_item_id, COUNT(Shipment_Items.order_item_id) as product_count, Order_Items.order_item_status_code FROM Order_Items LEFT JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code
SELECT Order_Items.order_item_id, Orders.date_order_placed FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Orders.date_order_placed HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Customers.customer_first_name, COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.customer_first_name
SELECT Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Invoices.invoice_date FROM Shipments JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Orders.date_order_placed FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Shipments.shipment_tracking_number, Shipment_Items.shipment_id FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipments.shipment_tracking_number IS NOT NULL
SELECT customer_first_name, customer_last_name FROM Customers WHERE login_password LIKE '+12%'
SELECT customer_first_name, customer_middle_initial FROM Customers WHERE login_password LIKE '+12%'
SELECT product_price FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_price FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT order_item_status_code, shipment_date FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT Order_Items.order_item_status_code, Order_Items.order_item_id FROM Order_Items
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'United States'
SELECT Products.product_id, Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_color HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id HAVING COUNT(*) > 3
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments
SELECT channel.Name FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID ORDER BY director.Age DESC LIMIT 1
SELECT count(*) FROM director WHERE Name LIKE '%bbc%'
SELECT director.Name FROM director ORDER BY director.Age DESC LIMIT 1
SELECT director.Name, director.Age FROM director WHERE director.Director_ID IN (SELECT Director_ID FROM program GROUP BY Director_ID HAVING COUNT(*) > 1)
SELECT director.Name, COUNT(program.Program_ID) FROM director LEFT JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID, director.Name
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID WHERE director.Name = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online = (SELECT MAX(Is_online) FROM city_channel_radio)
SELECT tv_show.tv_show_name, COUNT(*) FROM city_channel_tv_show JOIN tv_show ON city_channel_tv_show.tv_show_ID = tv_show.tv_show_ID GROUP BY tv_show.tv_show_name
SELECT city_channel.Station_name, city_channel.City FROM city_channel ORDER BY city_channel.City ASC
SELECT radio.Transmitter, city_channel.Station_name FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel_radio.Radio_ID) AS city_channels_count FROM city_channel JOIN radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel_radio.Radio_ID IS NOT NULL GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power) as max_power, AVG(Power) as avg_power FROM vehicle WHERE Model = 'Zhuzhou'
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Power = 1996
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Power = 1996
SELECT vehicle.Top_Speed, vehicle.Model, vehicle.Build_Year FROM vehicle
SELECT driver.Name, vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed = 2012
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = '2012'
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT vehicle.Build_Year FROM vehicle WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT Model, Power FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Build_Year, Power FROM vehicle WHERE Build_Year LIKE '%DJ%'
SELECT driver.Driver_ID, driver.Name, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name
SELECT driver.Driver_ID, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name != "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Exam_Name != "Database"
SELECT Questions.Question_Text, COUNT(*) FROM Questions GROUP BY Questions.Question_Text
SELECT Question_Text, COUNT(*) FROM Questions GROUP BY Question_Text
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.Student_Address, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(*) >= 2
SELECT Middle_Name, COUNT(*) FROM Students GROUP BY Middle_Name
SELECT club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT Name FROM club GROUP BY Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club LEFT JOIN player ON player.Club_ID = club.Club_ID WHERE player.Player_ID IS NULL
SELECT t1.Name FROM club AS t1 LEFT JOIN player AS t2 ON t2.Club_ID = t1.Club_ID WHERE t2.Player_ID IS NULL
SELECT club.Manufacturer FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Name HAVING SUM(CASE WHEN player.Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Shipments.shipment_date FROM Shipments LEFT JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id GROUP BY Shipments.shipment_id HAVING Shipments.shipment_date = (SELECT MIN(shipment_date) FROM Shipments) OR COUNT(Shipment_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT t3.order_id FROM Shipments AS t3 JOIN Shipment_Items AS t4 ON t4.shipment_id = t3.shipment_id GROUP BY t3.order_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(DISTINCT Shipment_Items.shipment_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(DISTINCT Customer_Payment_Methods.customer_id) DESC LIMIT 1
SELECT t2.customer_first_name, COUNT(t1.product_id) FROM Products AS t1 JOIN Customers AS t2 ON t1.product_id = t2.customer_id GROUP BY t2.customer_first_name
SELECT product_color, COUNT(*) AS product_count FROM Products GROUP BY product_color
SELECT Products.product_name, Shipments.shipment_date FROM Shipment_Items JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT DISTINCT t1.product_name, t4.shipment_date FROM Shipment_Items AS t5 JOIN Shipments AS t4 ON t5.shipment_id = t4.shipment_id JOIN Order_Items AS t3 ON t5.order_item_id = t3.order_item_id JOIN Products AS t1 ON t3.product_id = t1.product_id WHERE t4.shipment_tracking_number = 'shipped'
SELECT DISTINCT Products.product_name, Products.product_color FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Shipments.shipment_tracking_number = 'shipped'
SELECT DISTINCT Products.product_name, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_date IS NULL
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_date IS NULL
SELECT Shipments.shipment_id AS order_id, Shipments.shipment_date AS date, SUM(Products.product_price) AS total_cost FROM Shipments JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Shipments.shipment_id, Shipments.shipment_date
SELECT Orders.order_id AS id, Orders.date_order_placed AS date, COALESCE(SUM(Products.product_price), 0) AS total_amount_paid FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id LEFT JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT product_color, product_size FROM Products
SELECT product_color, product_name FROM Products
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 ) AS PM ON PM.customer_id = Orders.customer_id
SELECT DISTINCT t4.date_order_placed FROM Orders AS t4 JOIN ( SELECT t4.customer_id FROM Orders AS t4 JOIN Order_Items AS t5 ON t5.order_id = t4.order_id GROUP BY t4.customer_id HAVING COUNT(DISTINCT t5.product_id) >= 2 ) AS cust ON cust.customer_id = t4.customer_id
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM channel WHERE Internet > (SELECT AVG(Internet) FROM channel)
SELECT Channel_ID, Name FROM channel WHERE Digital_terrestrial_channel != 'Hank Baskett' OR Digital_terrestrial_channel IS NULL
SELECT city_channel.Affiliation FROM city_channel GROUP BY city_channel.Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT city_channel.City, radio.Transmitter FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT radio.RnaG_MHz FROM radio LEFT JOIN city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE city_channel_radio.Radio_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Top_Speed > 6000 ORDER BY Power DESC LIMIT 1
SELECT MAX(vehicle_count) AS Cnt, Vehicle_ID FROM ( SELECT Vehicle_ID, COUNT(DISTINCT Driver_ID) AS vehicle_count FROM vehicle_driver GROUP BY Vehicle_ID ) sub WHERE vehicle_count = (SELECT MAX(vehicle_count) FROM (SELECT Vehicle_ID, COUNT(DISTINCT Driver_ID) AS vehicle_count FROM vehicle_driver GROUP BY Vehicle_ID))
SELECT vehicle_driver.Vehicle_ID, COUNT(DISTINCT vehicle_driver.Driver_ID) AS Cnt FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID ORDER BY Cnt DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle WHERE Top_Speed = (SELECT MIN(Top_Speed) FROM vehicle) AND Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT Build_Year FROM vehicle WHERE Vehicle_ID NOT IN ( SELECT Vehicle_ID FROM vehicle_driver )
SELECT DISTINCT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 LEFT JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID GROUP BY t1.Vehicle_ID, t1.Model HAVING COUNT(DISTINCT t3.Driver_ID) = 2 OR t1.Builder = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 OR vehicle.Total_Production = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT DISTINCT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'DJ1'
SELECT DISTINCT vehicle.Model, vehicle.Builder FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'DJ1'
SELECT Exam_Date FROM Exams WHERE lower(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE lower(Exam_Name) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Answer_Text, COUNT(*) AS assessment_count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY assessment_count ASC LIMIT 1
SELECT Student_Answer_Text FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Assessments GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_ID IS NULL
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Valid_Answer_Text FROM Valid_Answers WHERE Valid_Answer_ID IN ( SELECT Valid_Answer_ID FROM Student_Assessments WHERE Assessment IN ('Normal','Absent') GROUP BY Valid_Answer_ID HAVING COUNT(DISTINCT Assessment) = 2 )
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text HAVING SUM(CASE WHEN Comments = 'Normal' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Comments = 'Absent' THEN 1 ELSE 0 END) > 0
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_name = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_price = (SELECT MAX(product_price) FROM Products WHERE product_name = 'Clothes') AND product_name = 'Clothes'
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code, customer_phone FROM Customers WHERE customer_phone IN ( SELECT customer_phone FROM Customers GROUP BY customer_phone HAVING COUNT(DISTINCT payment_method_code) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(DISTINCT payment_method_code) AS cnt FROM Customers GROUP BY customer_phone ) ) )
SELECT payment_method_code FROM Customers WHERE customer_phone IN ( SELECT customer_phone FROM Customers GROUP BY customer_phone HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY customer_phone ) ) )
SELECT product_name FROM Products GROUP BY product_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_id FROM Products GROUP BY product_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT Products.product_type_code FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.product_id IS NULL
SELECT t2.customer_id, t2.gender_code, t2.customer_first_name FROM Customers AS t2 JOIN Orders AS t4 ON t4.customer_id = t2.customer_id JOIN Order_Items AS t5 ON t5.order_id = t4.order_id GROUP BY t2.customer_id, t2.gender_code, t2.customer_first_name HAVING COUNT(DISTINCT t4.order_id) > 2 AND COUNT(t5.order_item_id) >= 3
SELECT Products.product_id, Products.product_color, Products.product_size FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_color, Products.product_size HAVING COUNT(DISTINCT Order_Items.order_item_id) > 2 AND COUNT(Shipment_Items.shipment_id) >= 3
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders WHERE customer_id IS NOT NULL )
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.parent_product_id, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.parent_product_id, Products.product_color HAVING COUNT(Order_Items.order_item_id) < 2
SELECT t1.product_id AS id, t1.product_name AS product_name, t1.parent_product_id AS price FROM Order_Items AS t5 JOIN Products AS t1 ON t5.product_id = t1.product_id GROUP BY t1.product_id, t1.product_name, t1.parent_product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Order_Items.product_id ) )
SELECT Shipments.shipment_id, SUM(Products.parent_product_id) AS sum_price FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Shipments.shipment_id ORDER BY sum_price ASC LIMIT 1
SELECT Order_Items.order_item_id, SUM(Orders.customer_id) AS total_cost FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Order_Items.order_item_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.parent_product_id, Products.product_description FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_middle_initial = 'female'
SELECT DISTINCT Products.product_name, Products.parent_product_id, Products.product_color FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT parent_product_id, product_price FROM Products WHERE parent_product_id > (SELECT AVG(parent_product_id) FROM Products)
SELECT parent_product_id, product_price FROM Products WHERE parent_product_id > (SELECT AVG(parent_product_id) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE parent_product_id = 0 OR parent_product_id IS NULL
SELECT COUNT(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.payment_method_code IS NULL
SELECT address_line_1, town_city, county FROM Customers WHERE email_address IN ( SELECT email_address FROM Customers GROUP BY email_address HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY email_address ) ) )
SELECT DISTINCT t1.address_line_1, t1.town_city, t1.county FROM Customers AS t1 JOIN Orders AS t2 ON t2.customer_id = t1.customer_id WHERE t1.email_address = ( SELECT t1g.email_address FROM Customers AS t1g JOIN Orders AS t2g ON t2g.customer_id = t1g.customer_id GROUP BY t1g.email_address ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_size, product_description, product_color FROM Products WHERE parent_product_id < (SELECT MAX(parent_product_id) FROM Products)
SELECT product_color, product_size, product_description FROM Products WHERE parent_product_id < (SELECT MAX(parent_product_id) FROM Products)
SELECT channel.Name FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM director_admin JOIN channel ON director_admin.Channel_ID = channel.Channel_ID GROUP BY director_admin.Channel_ID ORDER BY COUNT(DISTINCT director_admin.Director_ID) DESC LIMIT 1
SELECT COUNT(*) FROM director AS t2 LEFT JOIN program AS t3 ON t3.Director_ID = t2.Director_ID WHERE t3.Program_ID IS NULL
SELECT channel.Name, channel.Internet FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID ORDER BY COUNT(DISTINCT program.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM director_admin AS T4a JOIN channel AS channel ON T4a.Channel_ID = channel.Channel_ID JOIN director AS T2a ON T4a.Director_ID = T2a.Director_ID GROUP BY channel.Channel_ID, channel.Name HAVING SUM(CASE WHEN T2a.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN T2a.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 ) OR driver.Name = 'Jeff Gordon'
SELECT DISTINCT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID JOIN driver AS t2 ON t2.Driver_ID = t3.Driver_ID GROUP BY t1.Vehicle_ID, t1.Model HAVING COUNT(DISTINCT t2.Driver_ID) > 2 OR SUM(CASE WHEN t2.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver AS d LEFT JOIN vehicle_driver AS dc ON d.Driver_ID = dc.Driver_ID WHERE dc.Driver_ID IS NULL
SELECT COUNT(*) FROM vehicle AS vehicle LEFT JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT product_type_code FROM Products WHERE product_name = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'hardware')
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware')
SELECT Customers.customer_id, Customers.customer_number, Customers.customer_name, Customers.customer_phone FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id, Customers.customer_number, Customers.customer_name, Customers.customer_phone ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.customer_id, t1.customer_number, t1.customer_phone, t1.customer_email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id GROUP BY t1.customer_id, t1.customer_number, t1.customer_phone, t1.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id WHERE t2.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING MAX(Order_Items.order_item_id) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING SUM(Order_Items.order_item_id) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.* FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.* FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.Service_Details FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customer_Interactions.Service_ID ORDER BY COUNT(DISTINCT Customer_Interactions.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Customers_and_Services_Details) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers_and_Services.Customer_ID IN ( SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Customer_ID ) ) )
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Customer_ID IN ( SELECT Customer_ID FROM Customer_Interactions GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customer_Interactions GROUP BY Customer_ID ) ) )
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Customer_Interactions ON Customer_Interactions.Channel_ID = Customers_and_Services.Customers_and_Services_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT Customers.* FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT Customers.* FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID AND Customer_Interactions.Channel_ID = Customers_and_Services.Customers_and_Services_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID AND Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Students_Addresses.student_id FROM Students_Addresses GROUP BY Students_Addresses.student_id HAVING COUNT(DISTINCT Students_Addresses.address_id) >= 2 ) AND Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) < 2 )
SELECT Students.bio_data, Students.student_id FROM Students LEFT JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id LEFT JOIN Student_Events ON Student_Events.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data HAVING COUNT(DISTINCT Students_Addresses.student_address_id) >= 2 OR COUNT(DISTINCT Student_Events.event_id) < 2
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Detention ON Detention.student_id = Students.student_id WHERE LOWER(Detention.other_details) LIKE '%data%' AND Students.student_id NOT IN ( SELECT T1b.student_id FROM Students AS T1b JOIN Detention AS T4b ON T4b.student_id = T1b.student_id WHERE LOWER(T4b.other_details) LIKE 'net%' )
SELECT DISTINCT t1.student_id, t1.bio_data, t1.student_details FROM Students AS t1 JOIN Achievements AS t4 ON t4.student_id = t1.student_id WHERE lower(t4.achievement_details) LIKE '%data%' AND t1.student_id NOT IN ( SELECT t4b.student_id FROM Achievements AS t4b WHERE lower(t4b.achievement_details) LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Student_Loans GROUP BY student_id HAVING COUNT(*) >= 2 ) AS A ON Student_Loans.student_id = A.student_id
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS A ON A.student_id = Student_Loans.student_id
SELECT t1.student_id, t1.student_details FROM Students AS t1 JOIN Transcripts AS t2 ON t2.student_id = t1.student_id GROUP BY t1.student_id, t1.student_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data, Students.student_id FROM Students JOIN Classes ON Classes.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data ORDER BY COUNT(DISTINCT Classes.teacher_id) DESC LIMIT 1
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.student_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.other_details = ( SELECT other_details FROM Student_Loans GROUP BY other_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND Students.student_id IN ( SELECT student_id FROM Student_Loans WHERE other_details IN ( SELECT other_details FROM Student_Loans GROUP BY other_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.other_details IN ( SELECT other_details FROM Student_Loans GROUP BY other_details HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Student_Loans GROUP BY other_details)) ) AND Student_Loans.other_details IN ( SELECT other_details FROM Student_Loans GROUP BY other_details HAVING COUNT(*) = 3 ) GROUP BY Students.student_id, Students.bio_data, Students.student_details
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data, Students.student_details HAVING COUNT(*) = SUM( CASE WHEN Transcripts.transcript_details = (SELECT transcript_details FROM Transcripts GROUP BY transcript_details ORDER BY COUNT(*) DESC LIMIT 1) THEN 1 ELSE 0 END )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_details = ( SELECT achievement_details FROM Achievements GROUP BY achievement_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS Cnt, Ref_Event_Types.event_type_code AS event_type, Ref_Event_Types.event_type_description AS description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Student_Events.student_id) AS number_of_students, Student_Events.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(DISTINCT Student_Events.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Achievements.achievement_type_code) FROM Achievements JOIN Students_Addresses ON Achievements.student_id = Students_Addresses.student_id LEFT JOIN Student_Loans ON Student_Loans.student_id = Students_Addresses.student_id WHERE Student_Loans.student_loan_id IS NULL
SELECT COUNT(DISTINCT t6.student_id) FROM Achievements AS t6 JOIN Students AS t1 ON t6.student_id = t1.student_id WHERE t6.student_id IN ( SELECT t6b.student_id FROM Achievements AS t6b WHERE t6b.student_id NOT IN ( SELECT DISTINCT t5.student_id FROM Classes AS t5 ) )
SELECT Detention.detention_summary, Ref_Detention_Type.detention_type_description FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Detention.detention_summary, Ref_Detention_Type.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT t4.detention_type_code, t4.detention_type_description FROM Detention AS t5 JOIN Ref_Detention_Type AS t4 ON t5.detention_type_code = t4.detention_type_code GROUP BY t4.detention_type_code, t4.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Students.* FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.student_id IN ( SELECT student_id FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1 )
SELECT DISTINCT Classes.* FROM Student_Loans JOIN Students_Addresses ON Students_Addresses.student_id = Student_Loans.student_id JOIN Classes ON Classes.student_id = Students_Addresses.student_id WHERE Student_Loans.date_of_loan = (SELECT MIN(date_of_loan) FROM Student_Loans)
SELECT Students_Addresses.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Students_Addresses.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
