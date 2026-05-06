SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM player ORDER BY Name ASC
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT DISTINCT club.Name FROM club WHERE club.Name NOT IN (SELECT club.Name FROM club WHERE club.Manager = 'Nike')
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player WHERE Name = 'Nike')
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY sum(player.Earnings) ASC
SELECT club.Name, COUNT(player.Player_ID) AS win_count FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY win_count ASC
SELECT DISTINCT club.Captain FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(DISTINCT player.Player_ID) > 1
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING COUNT(DISTINCT Player_ID) > 1)
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID HAVING COUNT(player.Player_ID) > 1
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT club.Manager) FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT COUNT(DISTINCT Captain) FROM club
SELECT COUNT(DISTINCT Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT invoice_number) FROM Shipments WHERE shipment_tracking_number = 'shipped'
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Director_ID) FROM director
SELECT Name FROM director ORDER BY Age DESC
SELECT Name FROM channel WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Transmitter FROM radio WHERE RnaG_MHz != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio
SELECT city_channel.Station_name FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel.Station_name HAVING COUNT(DISTINCT city_channel_radio.City_channel_ID) > 3
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT vehicle.Model FROM vehicle WHERE vehicle.Build_Year = 'United States'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Power) FROM vehicle
SELECT Model FROM vehicle ORDER BY Model ASC
SELECT vehicle.Model FROM vehicle ORDER BY vehicle.Model ASC
SELECT count(*) FROM Questions_in_Exams
SELECT count(*) FROM Student_Assessments
SELECT DISTINCT Question_ID FROM Questions_in_Exams ORDER BY Question_ID ASC
SELECT DISTINCT Exam_Name FROM Exams ORDER BY Exam_Name ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = 'Normal'
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Question_Text FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_Text HAVING COUNT(*) >= 3
SELECT Questions.Question_Text FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_Text HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(*) FROM Customers
SELECT COUNT(Customers.customer_number) FROM Customers
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_name = 'hardware type'
SELECT COUNT(*) FROM Products WHERE product_name = 'Hardware'
SELECT Products.product_type_code FROM Products ORDER BY Products.product_price DESC
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
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT club.Name, club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Wins_count DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID = (SELECT Club_ID FROM player ORDER BY Earnings DESC LIMIT 1)
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name, player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = 'Sam Allardyce'
SELECT club.Name, COUNT(DISTINCT player.Player_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT Name, COUNT(DISTINCT Club_ID) FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY Name
SELECT Wins_count FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Australia" OR club.Manager = "Zimbabwe"
SELECT player.Wins_count FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager IN ('Australia', 'Zimbabwe')
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code, COUNT(Shipment_Items.shipment_id) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code HAVING COUNT(Shipment_Items.shipment_id) > 0
SELECT Order_Items.order_item_id, COUNT(Shipment_Items.order_item_id) AS product_count, Order_Items.order_item_status_code AS status FROM Order_Items LEFT JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code
SELECT Order_Items.order_item_id, Orders.date_order_placed FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Orders.date_order_placed HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code HAVING count(*) >= 2
SELECT Customers.customer_last_name, COUNT(Orders.order_id) FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.customer_last_name
SELECT Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT gender_code, customer_first_name, customer_middle_initial, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT shipment_tracking_number, shipment_date, invoice_date FROM Shipments JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipment_Items.order_item_id = Order_Items.order_item_id
SELECT Shipments.shipment_tracking_number, Order_Items.order_item_status_code FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id WHERE Shipments.shipment_tracking_number IS NOT NULL AND Order_Items.order_item_status_code IS NOT NULL
SELECT customer_first_name, customer_last_name FROM Customers WHERE login_name LIKE '+12%'
SELECT Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE Customers.login_password LIKE '+12%'
SELECT product_price FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_price FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT order_item_status_code, shipment_date FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'United States'
SELECT Products.product_id, Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_color HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_color HAVING COUNT(*) > 3
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id, Shipments.shipment_date HAVING COUNT(Shipment_Items.order_item_id) >= 2
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments
SELECT Shipments.shipment_id, Shipments.shipment_date FROM Shipments
SELECT Name FROM channel WHERE Channel_ID = (SELECT Channel_ID FROM program ORDER BY Director_ID DESC LIMIT 1)
SELECT count(*) FROM director WHERE Name LIKE '%bbc%'
SELECT director.Name FROM director ORDER BY director.Age DESC LIMIT 1
SELECT director.Name, director.Age FROM director WHERE director.Director_ID IN (SELECT Director_ID FROM program GROUP BY Director_ID HAVING COUNT(*) > 1)
SELECT director.Name, COUNT(program.Program_ID) FROM director LEFT JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID, director.Name
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online = (SELECT MAX(Is_online) FROM city_channel_radio)
SELECT tv_show.tv_show_name, COUNT(*) FROM city_channel_tv_show JOIN tv_show ON city_channel_tv_show.tv_show_ID = tv_show.tv_show_ID GROUP BY tv_show.tv_show_name
SELECT city_channel.City, city_channel.Station_name FROM city_channel ORDER BY city_channel.Station_name ASC
SELECT city_channel.Affiliation, radio.2FM_MHz FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT radio.Transmitter, COUNT(city_channel_radio.Radio_ID) AS city_channels_count FROM city_channel JOIN radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID AND city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Zhuzhou'
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Power = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Power = 1996
SELECT vehicle.Top_Speed, vehicle.Model, vehicle.Builder FROM vehicle
SELECT vehicle.Power, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed = 2012
SELECT vehicle.Model FROM vehicle WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT vehicle.Build_Year FROM vehicle WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT Build_Year, Power FROM vehicle WHERE Build_Year LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Power FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Driver_ID, driver.Name, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name
SELECT driver.Driver_ID, COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name != "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Exam_Name != "Database"
SELECT Questions.Question_Text, COUNT(*) FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_Text
SELECT Question_Text, COUNT(*) FROM Questions GROUP BY Question_Text
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Valid_Answer_Text, COUNT(*) as frequency FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.Middle_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT club.Sponsor FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club LEFT JOIN player ON player.Club_ID = club.Club_ID WHERE player.Club_ID IS NULL
SELECT club.Name FROM club LEFT JOIN player ON player.Club_ID = club.Club_ID WHERE player.Player_ID IS NULL
SELECT DISTINCT club.Sponsor FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT DISTINCT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Name HAVING SUM(CASE WHEN player.Wins_count > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Wins_count < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Shipments.shipment_date FROM Shipments LEFT JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id GROUP BY Shipments.shipment_id HAVING Shipments.shipment_date = (SELECT MIN(shipment_date) FROM Shipments) OR COUNT(Shipment_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) UNION SELECT t1.date_order_placed FROM Orders AS t1 JOIN Order_Items AS t2 ON t2.order_id = t1.order_id GROUP BY t1.order_id, t1.date_order_placed HAVING COUNT(t2.order_item_id) > 1
SELECT Products.product_id AS product_id, Products.product_name AS product_name, Products.product_price AS product_price, Products.product_color AS product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(DISTINCT Shipment_Items.shipment_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(DISTINCT Customers.customer_id) DESC LIMIT 1
SELECT t2.customer_middle_initial, COUNT(t1.product_id) AS Cnt FROM Products AS t1 JOIN Customers AS t2 ON t1.product_id = t2.customer_id GROUP BY t2.customer_middle_initial
SELECT product_name, SUM(parent_product_id) AS parent_product_id FROM Products GROUP BY product_name
SELECT Products.product_name, Shipments.shipment_date FROM Shipment_Items JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT DISTINCT t1.product_name, t4.shipment_date FROM Shipment_Items AS t5 JOIN Shipments AS t4 ON t5.shipment_id = t4.shipment_id JOIN Order_Items AS t3 ON t5.order_item_id = t3.order_item_id JOIN Products AS t1 ON t3.product_id = t1.product_id
SELECT DISTINCT Products.product_name, Products.product_color FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Shipments.shipment_tracking_number = 'shipped'
SELECT DISTINCT Products.product_name, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_date IS NULL
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_date IS NULL
SELECT Shipments.shipment_id, Shipments.shipment_date, SUM(Products.parent_product_id) AS total_cost FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Shipments.shipment_id, Shipments.shipment_date
SELECT Orders.order_id AS order_id, Orders.date_order_placed AS date_order_placed, COALESCE(SUM(Order_Items.product_id), 0) AS total_amount_paid FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Products.product_color, Products.product_name FROM Products
SELECT product_name, product_color FROM Products
SELECT Orders.date_order_placed FROM Orders JOIN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 ) AS T8 ON Orders.customer_id = T8.customer_id
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2 ) AS T8 ON Orders.customer_id = T8.customer_id
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year > (SELECT AVG(Start_Year) FROM program)
SELECT Channel_ID, Name FROM channel WHERE Digital_terrestrial_channel <> 'Hank Baskett' OR Digital_terrestrial_channel IS NULL
SELECT city_channel.Affiliation FROM city_channel JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY city_channel.Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT city_channel.City, radio.Transmitter FROM city_channel JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT radio.RnaG_MHz FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Radio_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Build_Year FROM vehicle WHERE Top_Speed > 6000 ORDER BY Power DESC LIMIT 1
SELECT t3.Vehicle_ID, COUNT(DISTINCT t3.Driver_ID) AS Cnt FROM vehicle_driver AS t3 GROUP BY t3.Vehicle_ID ORDER BY Cnt DESC LIMIT 1
SELECT vehicle_driver.Vehicle_ID, COUNT(DISTINCT vehicle_driver.Driver_ID) AS Cnt FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID ORDER BY Cnt DESC LIMIT 1
SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series > 5000
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT vehicle.Build_Year FROM vehicle LEFT JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 LEFT JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID GROUP BY t1.Vehicle_ID, t1.Model HAVING COUNT(DISTINCT t3.Driver_ID) = 2 OR t1.Total_Production = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 OR vehicle.Total_Production = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Power) FROM vehicle)
SELECT DISTINCT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'DJ1'
SELECT DISTINCT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = 'DJ1'
SELECT Exam_Date FROM Exams WHERE lower(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE lower(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Student_Answer_ID FROM Student_Assessments ORDER BY Valid_Answer_ID ASC LIMIT 1
SELECT Student_Assessments.Assessment FROM Student_Assessments WHERE Student_Assessments.Assessment IS NOT NULL AND TRIM(Student_Assessments.Assessment) <> '' GROUP BY Student_Assessments.Assessment ORDER BY COUNT(*) DESC LIMIT 1
SELECT Assessment FROM Student_Assessments WHERE Assessment IS NOT NULL GROUP BY Assessment ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_ID IS NULL
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Comments IN ('Normal','Absent') GROUP BY Student_Answers.Student_Answer_Text HAVING COUNT(DISTINCT Student_Answers.Comments) = 2
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers GROUP BY Student_Answers.Student_Answer_Text HAVING SUM(CASE WHEN Student_Answers.Comments = 'Normal' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Student_Answers.Comments = 'Absent' THEN 1 ELSE 0 END) > 0
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_name = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products ORDER BY product_price DESC LIMIT 1
SELECT Order_Items.order_item_id, Order_Items.order_quantity FROM Order_Items WHERE Order_Items.order_quantity = 'Hardware' ORDER BY Order_Items.order_id ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id FROM Products GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products GROUP BY product_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_id FROM Customers GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code, customer_phone FROM Customers WHERE customer_phone IN ( SELECT customer_phone FROM Customers GROUP BY customer_phone HAVING COUNT(DISTINCT customer_id) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(DISTINCT customer_id) AS cnt FROM Customers GROUP BY customer_phone ) ) )
SELECT payment_method_code FROM Customers WHERE customer_phone IN ( SELECT customer_phone FROM Customers GROUP BY customer_phone HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY customer_phone ) ) )
SELECT product_name FROM Products GROUP BY product_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_id FROM Products GROUP BY product_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products EXCEPT SELECT Products.product_type_code FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id
SELECT Products.product_type_code FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.product_id IS NULL
SELECT Products.product_id, Products.product_color, Products.product_size FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_color, Products.product_size HAVING COUNT(DISTINCT Order_Items.order_item_id) > 2 AND COUNT(DISTINCT Shipment_Items.shipment_id) >= 3
SELECT Products.product_id, Products.product_name, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_color HAVING COUNT(DISTINCT Order_Items.order_item_id) > 2 AND COUNT(Shipment_Items.shipment_id) >= 3
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders WHERE customer_id IS NOT NULL)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.parent_product_id, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.parent_product_id, Products.product_color HAVING COUNT(Shipment_Items.shipment_id) < 2
SELECT Products.product_id, Products.product_name, Products.parent_product_id FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.parent_product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.parent_product_id FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.parent_product_id HAVING COUNT(*) = ( SELECT MAX(order_cnt) FROM ( SELECT COUNT(*) AS order_cnt FROM Order_Items JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Order_Items.product_id ) )
SELECT Orders.order_id, SUM(Products.product_price) AS sum_price FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id ORDER BY sum_price ASC LIMIT 1
SELECT Order_Items.order_item_id, SUM(Orders.customer_id) AS total_cost FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Order_Items.order_item_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.parent_product_id, Products.product_description FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_last_name = 'female'
SELECT DISTINCT Products.product_name, Products.parent_product_id, Products.product_color FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_middle_initial = 'female'
SELECT parent_product_id, product_price FROM Products WHERE parent_product_id > (SELECT AVG(parent_product_id) FROM Products)
SELECT parent_product_id, product_price FROM Products WHERE parent_product_id > (SELECT AVG(parent_product_id) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE parent_product_id = 0 OR parent_product_id IS NULL
SELECT COUNT(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t1.customer_id = t2.customer_id WHERE t2.customer_id IS NULL
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = ( SELECT email_address FROM Customers GROUP BY email_address ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Customers.address_line_1, Customers.town_city, Customers.county FROM Customers WHERE Customers.email_address = ( SELECT email_address FROM ( SELECT Customers.email_address AS email_address, COUNT(Orders.order_id) AS order_count FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id GROUP BY Customers.email_address ORDER BY order_count ASC LIMIT 1 ) )
SELECT product_size, product_description, product_price FROM Products WHERE parent_product_id < (SELECT MAX(parent_product_id) FROM Products)
SELECT product_color, product_size, product_description FROM Products WHERE parent_product_id < (SELECT MAX(parent_product_id) FROM Products)
SELECT channel.Name FROM program JOIN channel ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM director_admin JOIN channel ON director_admin.Channel_ID = channel.Channel_ID GROUP BY director_admin.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM director AS director LEFT JOIN program AS program ON director.Director_ID = program.Director_ID WHERE program.Program_ID IS NULL
SELECT director.Name, director.Age FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID, director.Name, director.Age ORDER BY COUNT(DISTINCT program.Channel_ID) DESC LIMIT 1
SELECT director.Name FROM director JOIN program ON program.Director_ID = director.Director_ID WHERE program.Start_Year < 40 INTERSECT SELECT director.Name FROM director JOIN program ON program.Director_ID = director.Director_ID WHERE program.Start_Year > 60
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 ) OR driver.Name = 'Jeff Gordon'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM vehicle LEFT JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS vehicle LEFT JOIN vehicle_driver AS driver ON vehicle.Driver_ID = driver.Driver_ID WHERE driver.Driver_ID IS NULL
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'hardware') AND product_name = 'hardware'
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware')
SELECT Customers.customer_id, Customers.customer_number, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id, Customers.customer_number, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.customer_id, Customers.customer_number, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id, Customers.customer_number, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS Customers LEFT JOIN Customer_Orders AS Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING MAX(Order_Items.order_item_id) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING SUM(Order_Items.order_item_id) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.* FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.* FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Services.Service_ID ORDER BY COUNT(DISTINCT Customer_Interactions.Status_Code) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers_and_Services.Customer_ID IN ( SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Customer_ID ) ) )
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Customer_Interactions JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Customer_ID IN ( SELECT Customer_ID FROM Customer_Interactions GROUP BY Customer_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customer_Interactions GROUP BY Customer_ID ) ) )
SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer JOIN Customer_Interactions ON Analytical_Layer.Customers_and_Services_ID = Customer_Interactions.Channel_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' UNION SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID AND Customer_Interactions.Channel_ID = Customers_and_Services.Customers_and_Services_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT DISTINCT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID AND Customer_Interactions.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Combined_fuel_economy_rate FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2 ) UNION SELECT Students.bio_data, Students.student_details, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Student_Loans.student_id FROM Student_Loans GROUP BY Student_Loans.student_id HAVING COUNT(*) < 2 )
SELECT Students.bio_data, Students.student_id FROM Students LEFT JOIN ( SELECT Transcripts.student_id AS student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2 ) AS X ON X.student_id = Students.student_id LEFT JOIN ( SELECT Student_Events.student_id AS student_id FROM Student_Events GROUP BY Student_Events.student_id HAVING COUNT(*) < 2 ) AS Y ON Y.student_id = Students.student_id WHERE X.student_id IS NOT NULL OR Y.student_id IS NOT NULL
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Classes ON Classes.student_id = Students.student_id WHERE Classes.class_details LIKE '%data%' AND Students.student_id NOT IN ( SELECT T3b.student_id FROM Classes AS T3b WHERE T3b.class_details LIKE 'net%' )
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Achievements ON Achievements.student_id = Students.student_id WHERE lower(Achievements.achievement_details) LIKE '%data%' AND Students.student_id NOT IN ( SELECT T1b.student_id FROM Students AS T1b JOIN Achievements AS T4b ON T4b.student_id = T1b.student_id WHERE lower(T4b.achievement_details) LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2 ) AS T7 ON Student_Loans.student_id = T7.student_id
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT student_id FROM Student_Loans GROUP BY student_id HAVING COUNT(*) >= 2 ) AS A ON A.student_id = Student_Loans.student_id
SELECT t1.bio_data, t1.student_id FROM Students AS t1 JOIN Transcripts AS t2 ON t2.student_id = t1.student_id GROUP BY t1.student_id, t1.bio_data ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data, Students.student_id FROM Students JOIN Classes ON Classes.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data ORDER BY COUNT(DISTINCT Classes.class_id) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_id, Behaviour_Monitoring.student_id, Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring JOIN Students ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(DISTINCT student_id) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ) ) ) AND Behaviour_Monitoring.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) ) ORDER BY Students.student_id, Behaviour_Monitoring.behaviour_monitoring_id
SELECT Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.other_details IN ( SELECT other_details FROM Student_Loans GROUP BY other_details HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Student_Loans GROUP BY other_details ) ) ) AND Student_Loans.student_id IN ( SELECT student_id FROM Student_Loans WHERE other_details IN ( SELECT other_details FROM Student_Loans GROUP BY other_details HAVING COUNT(*) = 3 ) ) ORDER BY Student_Loans.student_id, Student_Loans.student_loan_id
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data, Students.student_details HAVING COUNT(*) = SUM( CASE WHEN Transcripts.transcript_details = ( SELECT T2b.transcript_details FROM Transcripts AS T2b GROUP BY T2b.transcript_details ORDER BY COUNT(*) DESC LIMIT 1 ) THEN 1 ELSE 0 END )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_details = ( SELECT T7b.achievement_details FROM Achievements AS T7b GROUP BY T7b.achievement_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS Cnt, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Student_Events.event_type_code, Ref_Event_Types.event_type_description, COUNT(DISTINCT Student_Events.student_id) AS student_id FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(DISTINCT Student_Events.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Students_Addresses.address_id) FROM Students_Addresses JOIN Students ON Students_Addresses.student_id = Students.student_id LEFT JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.student_loan_id IS NULL
SELECT COUNT(DISTINCT Student_Loans.student_id) FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.student_id IN ( SELECT Achievements.student_id FROM Achievements WHERE Achievements.student_id NOT IN (SELECT Classes.student_id FROM Classes) )
SELECT Detention.detention_summary, Ref_Detention_Type.detention_type_description FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Detention.detention_summary, Ref_Detention_Type.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT t4.detention_type_code, t4.detention_type_description FROM Ref_Detention_Type AS t4 JOIN Detention AS t5 ON t5.detention_type_code = t4.detention_type_code GROUP BY t4.detention_type_code, t4.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id WHERE Students_Addresses.date_from = (SELECT MIN(date_from) FROM Students_Addresses)
SELECT DISTINCT Students.* FROM Students JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id WHERE Students_Addresses.address_id = ( SELECT address_id FROM Students_Addresses WHERE date_from = (SELECT MIN(date_from) FROM Students_Addresses) )
SELECT Ref_Achievement_Type.achievement_type_code, Ref_Achievement_Type.achievement_type_description, COUNT(*) AS cnt FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code GROUP BY Ref_Achievement_Type.achievement_type_code, Ref_Achievement_Type.achievement_type_description ORDER BY cnt DESC LIMIT 1
SELECT Addresses.address_id, Addresses.address_details FROM Students_Addresses JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id GROUP BY Addresses.address_id, Addresses.address_details ORDER BY COUNT(*) DESC LIMIT 1
