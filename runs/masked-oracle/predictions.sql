SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club
SELECT club.Name FROM club WHERE club.Name IS NOT NULL ORDER BY club.Name ASC
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manager != "Nike"
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings ASC
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY COUNT(player.Name) ASC
SELECT DISTINCT Name FROM club WHERE Sponsor > 1200000
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manufacturer > 1200000
SELECT player.Name FROM player WHERE player.Club_ID IN (SELECT club.Club_ID FROM club GROUP BY club.Club_ID HAVING COUNT(club.Club_ID) > 1)
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING COUNT(Club_ID) > 1)
SELECT club.Name FROM club WHERE club.Club_ID IN ( SELECT player.Club_ID FROM player GROUP BY player.Club_ID HAVING COUNT(player.Club_ID) > 1 )
SELECT player.Name FROM player WHERE player.Earnings > 1
SELECT COUNT(DISTINCT player.Name) FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID
SELECT COUNT(DISTINCT player.Name) FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID
SELECT COUNT(Customers.customer_id) FROM Customers
SELECT count(DISTINCT Customers.customer_id) FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(Order_Items.order_id) FROM Order_Items
SELECT DISTINCT order_item_status_code FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(customer_id) FROM Orders
SELECT COUNT(product_id) FROM Products
SELECT avg(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT COUNT(DISTINCT Name) FROM director
SELECT program.Title FROM program ORDER BY program.Start_Year DESC
SELECT channel.Name FROM channel AS channel INNER JOIN program AS program ON channel.Channel_ID = program.Channel_ID INNER JOIN director AS director ON program.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio WHERE Transmitter = 'radio'
SELECT city_channel_radio.Is_online FROM radio AS radio JOIN city_channel_radio AS city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Transmitter FROM radio WHERE 2FM_MHz != 'ABC' AND Transmitter NOT LIKE '%2FM_MHz%' ESCAPE ''
SELECT AVG(Is_online) FROM city_channel_radio WHERE Radio_ID IN (SELECT Radio_ID FROM radio WHERE Transmitter = 'radio')
SELECT city_channel_radio.Radio_ID FROM city_channel AS city_channel INNER JOIN city_channel_radio AS city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel_radio.Radio_ID HAVING COUNT(city_channel_radio.Radio_ID) > 3
SELECT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT count(*) FROM vehicle WHERE Model = 'NASCAR'
SELECT COUNT(*) FROM vehicle WHERE Model = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Power) FROM vehicle
SELECT Model FROM vehicle ORDER BY Model ASC
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams
SELECT DISTINCT Student_Assessments.Satisfactory_YN FROM Student_Assessments WHERE Student_Assessments.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Assessments.Satisfactory_YN FROM Student_Assessments WHERE Student_Assessments.Student_Answer_Text = 'Normal'
SELECT count(DISTINCT Student_Answers.Comments) FROM Students AS Students JOIN Student_Answers AS Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT First_Name FROM Students WHERE Middle_Name != "M"
SELECT First_Name FROM Students WHERE Middle_Name != "M"
SELECT Questions_in_Exams.Question_ID FROM Questions_in_Exams JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID GROUP BY Questions_in_Exams.Question_ID HAVING COUNT(*) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions AS Questions JOIN Questions_in_Exams AS Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions_in_Exams.Question_ID HAVING COUNT(Questions_in_Exams.Question_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(*) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT count(product_id) FROM Products
SELECT COUNT(product_id) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products
SELECT COUNT(product_id) FROM Products WHERE product_type_code = "Hardware"
SELECT Customer_Orders.order_status_code FROM Order_Items AS Products JOIN Customer_Orders ON Products.product_id = Customer_Orders.order_id ORDER BY Customer_Orders.order_status_code DESC
SELECT product_type_code FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) > 1
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(*) FROM Customers WHERE customer_id IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(Customers.customer_id) FROM Customers AS Customers JOIN Customer_Orders AS Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT player.Name, player.Country FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE club.Name = 'manager' OR club.Name = 'captain'
SELECT club.Name, club.Manager FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Manager' INTERSECT SELECT club.Name, club.Manager FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Captain'
SELECT player.Name FROM player WHERE player.Earnings = ( SELECT MAX(Earnings) FROM player )
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name , club.Manager FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID
SELECT player.Name, player.Country FROM player INNER JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name FROM player WHERE player.Earnings > 2
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID GROUP BY player.Name HAVING COUNT(player.Club_ID) > 2
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE club.Manufacturer = "Sam Allardyce"
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT club.Name , count(*) FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID GROUP BY club.Name
SELECT player.Name, COUNT(*) FROM player GROUP BY player.Name
SELECT Earnings FROM player WHERE Name = "Australia" OR Name = "Zimbabwe"
SELECT player.Name , player.Earnings FROM player WHERE player.Country = "Australia" OR player.Country = "Zimbabwe"
SELECT Shipments.order_id , Shipments.invoice_number , Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.order_id > 0
SELECT Shipments.order_id, Shipments.invoice_number, Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Products.product_id, Products.product_name FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id WHERE Shipment_Items.order_item_id = ( SELECT order_item_id FROM Order_Items GROUP BY order_item_id HAVING COUNT(order_item_id) >= 2 )
SELECT Orders.order_id, Orders.date_order_placed FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id INNER JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id WHERE Order_Items.product_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(Order_Items.product_id) >= 2 )
SELECT Customers.gender_code , count(*) FROM Customers AS Customers JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Order_Items.product_id, COUNT(*) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Order_Items.product_id
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_middle_initial , Customer_Payment_Methods.payment_method_code FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Orders.date_order_placed FROM Orders INNER JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date, Shipments.shipment_date FROM Shipments
SELECT Order_Items.product_id, Orders.order_status_code FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT Order_Items.order_item_status_code , Shipments.shipment_tracking_number FROM Shipments JOIN Order_Items ON Shipments.invoice_number = Order_Items.order_id WHERE Shipments.order_id = Order_Items.order_id
SELECT customer_first_name, login_password FROM Customers WHERE login_name LIKE '+12%'
SELECT Customers.customer_first_name , Customers.customer_middle_initial FROM Customers AS Customers JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.order_status_code LIKE '+12%'
SELECT product_color FROM Products WHERE product_name LIKE '%Dell%'
SELECT Order_Items.order_item_status_code FROM Products AS Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.product_color LIKE '%Dell%'
SELECT Order_Items.order_item_status_code , Shipments.shipment_date FROM Shipments INNER JOIN Order_Items ON Shipments.order_id = Order_Items.order_id
SELECT Order_Items.product_id , Order_Items.order_item_status_code FROM Orders AS Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id
SELECT customer_first_name , email_address , address_line_1 FROM Customers
SELECT customer_first_name, email_address, address_line_1 FROM Customers
SELECT Products.product_id, Products.product_color FROM Products AS Products JOIN Order_Items AS Customer_Payment_Methods ON Products.product_id = Customer_Payment_Methods.product_id WHERE Customer_Payment_Methods.product_id > 3
SELECT Products.product_id, Products.product_color FROM Products AS Products JOIN Order_Items AS Orders ON Orders.product_id = Products.product_id JOIN Shipment_Items AS Order_Items ON Order_Items.order_item_id = Orders.order_item_id GROUP BY Products.product_id HAVING count(*) > 3
SELECT Orders.order_status_code , Orders.order_id FROM Orders WHERE Orders.customer_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(*) >= 2 )
SELECT Shipments.shipment_date, Shipments.shipment_id FROM Shipments INNER JOIN Order_Items ON Shipments.invoice_number = Order_Items.order_id INNER JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id GROUP BY Shipments.shipment_id HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Shipments.shipment_tracking_number , Shipments.shipment_date FROM Shipments JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Order_Items.order_item_status_code , Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID ORDER BY channel.Start_Year DESC LIMIT 1
SELECT COUNT(Program_ID) FROM program WHERE Title LIKE '%bbc%'
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID ORDER BY channel.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel AS channel JOIN program AS program ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year > 1
SELECT director.Name, COUNT(program.Program_ID) FROM program INNER JOIN director ON program.Director_ID = director.Director_ID GROUP BY director.Name
SELECT channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Next_show_name FROM tv_show AS tv_show JOIN city_channel_tv_show AS city_channel_tv_show ON tv_show.tv_show_ID = city_channel_tv_show.tv_show_ID
SELECT Transmitter FROM radio WHERE RnaG_MHz > 150 OR RnaG_MHz < 30
SELECT city_channel_radio.Radio_ID FROM city_channel_radio WHERE city_channel_radio.Is_online = ( SELECT MAX(Is_online) FROM city_channel_radio )
SELECT tv_show.tv_show_name , COUNT(tv_show.tv_show_name) FROM tv_show JOIN city_channel_tv_show ON city_channel_tv_show.tv_show_ID = tv_show.tv_show_ID GROUP BY tv_show.tv_show_name
SELECT city_channel_radio.Radio_ID, city_channel_tv_show.Is_free FROM city_channel AS city_channel INNER JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID INNER JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID WHERE city_channel.City = 'city channels' ORDER BY city_channel_tv_show.Is_free ASC
SELECT radio.Transmitter, radio.Radio_MHz FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter , COUNT(city_channel_tv_show.tv_show_ID) FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel_tv_show ON city_channel_radio.City_channel_ID = city_channel_tv_show.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT vehicle.Power , vehicle.Builder FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE driver.Driver_ID IN ( SELECT Driver_ID FROM driver WHERE Name = "1996" )
SELECT vehicle.Power , vehicle.Top_Speed FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Top_Speed = 1996
SELECT driver.Name , driver.Citizenship , driver.Racing_Series FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID
SELECT driver.Citizenship , driver.Racing_Series , vehicle.Build_Year FROM vehicle AS vehicle JOIN driver AS driver ON vehicle.Vehicle_ID = driver.Driver_ID
SELECT COUNT(*) FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed = 2012
SELECT COUNT(DISTINCT vehicle.Vehicle_ID) FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed = 2012
SELECT vehicle.Model FROM vehicle WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Power > 100 OR vehicle.Top_Speed > 150
SELECT driver.Name, driver.Citizenship FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Name , driver.Citizenship FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Model LIKE "%DJ%"
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID GROUP BY driver.Vehicle_ID
SELECT count(*) FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID JOIN driver AS vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle_driver.Name
SELECT Exams.Subject_Code , Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name NOT LIKE "Database"
SELECT Exams.Exam_Date, Exams.Subject_Code FROM Exams WHERE Exams.Exam_Name != "Database"
SELECT Questions_in_Exams.Type_of_Question_Code , COUNT(*) FROM Questions_in_Exams GROUP BY Questions_in_Exams.Type_of_Question_Code
SELECT Questions.Question_ID , COUNT(*) FROM Questions GROUP BY Questions.Question_ID
SELECT Student_Assessments.Assessment FROM Student_Assessments GROUP BY Student_Assessments.Assessment ORDER BY COUNT(Student_Assessments.Assessment) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Exams.Subject_Code, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Exams ON Student_Answers.Exam_ID = Exams.Exam_ID
SELECT Students.First_Name , Exams.Subject_Code FROM Students AS Students JOIN Exams AS Exams ON Students.Student_ID = Exams.Exam_Name
SELECT Student_Assessments.Valid_Answer_ID , Student_Answers.Date_of_Answer FROM Student_Answers JOIN Student_Assessments ON Student_Answers.Student_ID = Student_Assessments.Student_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.Valid_Answer_ID , Exams.Exam_Date FROM Student_Assessments JOIN Exams ON Student_Assessments.Student_Answer_ID = Exams.Subject_Code
SELECT Student_Assessments.Valid_Answer_ID FROM Student_Assessments INNER JOIN Student_Answers ON Student_Assessments.Student_Answer_ID = Student_Answers.Student_Answer_ID WHERE Student_Answers.Exam_ID IN (SELECT Exam_ID FROM Questions_in_Exams GROUP BY Exam_ID HAVING COUNT(*) >= 2)
SELECT Student_Assessments.First_Name FROM Student_Assessments INNER JOIN Student_Answers ON Student_Assessments.Student_Answer_ID = Student_Answers.Student_Answer_ID GROUP BY Student_Answers.Student_Answer_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT First_Name , COUNT(*) FROM Students GROUP BY First_Name
SELECT player.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE club.Manufacturer > 2 ORDER BY club.Manufacturer DESC LIMIT 1
SELECT player.Name FROM player AS club JOIN club AS player ON club.Club_ID = player.Club_ID WHERE club.Wins_count > 2 GROUP BY club.Club_ID ORDER BY count(*) DESC LIMIT 1
SELECT player.Name FROM club AS club JOIN player ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY AVG(club.Name) DESC
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT player.Name FROM player WHERE player.Club_ID = (SELECT player.Club_ID FROM player GROUP BY Club_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID GROUP BY player.Name ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name FROM club WHERE club.Club_ID NOT IN (SELECT player.Club_ID FROM player)
SELECT Name FROM club WHERE Manufacturer > 1400000 INTERSECT SELECT Name FROM club WHERE Manufacturer < 1100000
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manufacturer > 1400000 INTERSECT SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manufacturer < 1100000
SELECT Shipments.shipment_date FROM Shipments WHERE Shipments.shipment_date = (SELECT MIN(shipment_date) FROM Shipments) OR Order_Items.product_id > 1
SELECT Shipments.shipment_date FROM Shipments WHERE Shipments.invoice_number = ( SELECT MIN(invoice_number) FROM Shipments ) SELECT Shipments.shipment_date FROM Shipments WHERE Shipments.invoice_number > 1
SELECT Products.product_id , Products.product_color , Products.product_price , Products.product_name FROM Products AS Products JOIN Shipment_Items AS Shipment_Items ON Products.product_id = Shipment_Items.order_item_id JOIN Order_Items AS Order_Items ON Shipment_Items.shipment_id = Order_Items.order_item_id WHERE Order_Items.product_id = ( SELECT product_id FROM Order_Items GROUP BY product_id HAVING count(*) < 2 )
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(Customer_Payment_Methods.payment_method_code) DESC LIMIT 1
SELECT Products.product_color , COUNT(Products.parent_product_id) FROM Products GROUP BY Products.product_color
SELECT parent_product_id, product_name, COUNT(*) FROM Products GROUP BY product_name
SELECT Shipments.shipment_tracking_number, Invoices.invoice_date FROM Shipments JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Order_Items.order_item_status_code , Orders.date_order_placed FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT Shipment_Items.order_item_id , Order_Items.order_item_status_code FROM Order_Items JOIN Shipments ON Order_Items.product_id = Shipments.order_id JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Products.product_name , Products.product_color FROM Products JOIN Orders ON Products.product_id = Orders.customer_id
SELECT Shipments.shipment_tracking_number FROM Shipments INNER JOIN Order_Items ON Shipments.invoice_number = Order_Items.order_id WHERE Order_Items.order_id IS NULL
SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.order_id NOT IN (SELECT Orders.order_id FROM Orders WHERE Orders.date_order_placed IS NOT NULL)
SELECT Shipments.order_id, Shipments.shipment_date, Shipments.shipment_tracking_number FROM Shipments
SELECT Orders.order_id, Orders.date_order_placed, Orders.customer_id FROM Orders
SELECT Products.product_color , Products.product_name FROM Products
SELECT Products.parent_product_id , Products.product_name FROM Products
SELECT Orders.date_order_placed FROM Customers AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id GROUP BY Orders.date_order_placed HAVING count(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2
SELECT Orders.date_order_placed FROM Customers AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders ON Customer_Payment_Methods.customer_id = Orders.customer_id WHERE Customers.customer_last_name = "2"
SELECT order_item_status_code FROM Order_Items WHERE order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id ORDER BY COUNT(*) LIMIT 1 )
SELECT MIN(order_item_status_code) FROM Order_Items
SELECT director.Name FROM director INNER JOIN program ON director.Director_ID = program.Director_ID INNER JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year > ( SELECT AVG(Age) FROM director )
SELECT channel.Name , channel.Channel_ID FROM channel AS channel JOIN program AS program ON program.Channel_ID = channel.Channel_ID WHERE channel.Name != "Hank Baskett"
SELECT city_channel_tv_show.Is_free FROM city_channel AS city_channel JOIN city_channel_radio AS city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN city_channel_tv_show AS city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID WHERE city_channel.City = "city channels" GROUP BY city_channel_tv_show.Is_free ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, radio.Radio_MHz FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE radio.2FM_MHz LIKE '%2FM_MHz' ESCAPE '.' ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT radio.Affiliation FROM radio WHERE radio.Affiliation NOT IN (SELECT city_channel.Affiliation FROM city_channel WHERE city_channel.Owned_Since IS NULL)
SELECT driver.Name FROM vehicle AS vehicle INNER JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT COUNT(*) , Vehicle_ID FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT vehicle.Vehicle_ID , count(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY count(*) DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle WHERE vehicle.Power = ( SELECT MIN(vehicle.Power) FROM vehicle )
SELECT vehicle_driver.Driver_ID FROM vehicle_driver WHERE vehicle_driver.Vehicle_ID = ( SELECT min(Vehicle_ID) FROM vehicle_driver )
SELECT DISTINCT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Builder FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT driver.Name, driver.Citizenship FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE vehicle.Vehicle_ID IN (SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID HAVING COUNT(*) >= 2) OR driver.Name = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Vehicle_ID IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(*) = 2) OR vehicle.Model = "Ziyang"
SELECT COUNT(Vehicle_ID) FROM vehicle WHERE Power = ( SELECT MAX(Power) FROM vehicle )
SELECT COUNT(Driver_ID) FROM vehicle_driver WHERE Vehicle_ID = (SELECT MAX(Vehicle_ID) FROM vehicle_driver)
SELECT driver.Name , driver.Citizenship FROM vehicle_driver INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE vehicle.Driver_ID IN ( SELECT Vehicle_ID FROM vehicle WHERE Builder = 'DJ1' )
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) ASC LIMIT 1
SELECT Student_Answer_ID FROM Student_Assessments WHERE Valid_Answer_ID = ( SELECT MIN(Valid_Answer_ID) FROM Student_Assessments )
SELECT Student_Assessments.Assessment FROM Student_Assessments GROUP BY Student_Assessments.Assessment ORDER BY COUNT(Student_Assessments.Assessment) DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC LIMIT 1
SELECT Students.First_Name FROM Students WHERE Students.Student_ID NOT IN (SELECT Student_Answers.Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT Student_Assessments.Assessment FROM Student_Assessments WHERE Student_Assessments.Student_Answer_Text = 'Normal' INTERSECT SELECT Student_Assessments.Assessment FROM Student_Assessments WHERE Student_Assessments.Student_Answer_Text = 'Absent'
SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Normal' INTERSECT SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Absent'
SELECT product_type_code FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_type_code FROM Products WHERE product_price > ( SELECT avg(product_price) FROM Products )
SELECT product_type_code FROM Products ORDER BY product_price DESC LIMIT 1
SELECT T2.product_type_code FROM Products AS Products JOIN Products AS T2 ON Products.product_id = T2.product_id WHERE Products.product_price = (SELECT max(product_price) FROM Products)
SELECT Order_Items.order_item_id , Order_Items.order_quantity FROM Order_Items WHERE Order_Items.product_id IN ( SELECT Products.product_id FROM Products WHERE Products.product_type_code = "Hardware" ORDER BY Products.product_price LIMIT 1 )
SELECT Products.product_id, Products.product_type_code FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_id = ( SELECT MIN(order_id) FROM Order_Items WHERE order_quantity = 'Hardware' )
SELECT product_price FROM Products GROUP BY product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers GROUP BY customer_name ORDER BY COUNT(customer_name) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) ASC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) LIMIT 1
SELECT Products.product_type_code FROM Products GROUP BY Products.product_type_code ORDER BY COUNT(Products.product_type_code) LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) ASC LIMIT 1
SELECT Order_Items.order_quantity FROM Order_Items GROUP BY Order_Items.order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Orders.product_type_code FROM Customer_Orders EXCEPT SELECT Customer_Orders.product_type_code FROM Customer_Orders INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT Customer_Orders.order_status_code FROM Customer_Orders WHERE Customer_Orders.customer_id = 0
SELECT Products.product_id, Products.parent_product_id, Products.product_name FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Order_Items.product_id > 2 AND Order_Items.order_id > 2
SELECT Products.product_id, Products.parent_product_id, Products.product_name, Products.product_price, Products.product_color, Products.product_size FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.product_id IN (SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(Order_Items.product_id) > 2) AND Order_Items.order_id IN (SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(Order_Items.order_id) >= 3)
SELECT gender_code , customer_first_name , customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products AS Products LEFT JOIN Shipment_Items AS Shipment_Items ON Shipment_Items.shipment_id = Products.product_id LEFT JOIN Shipments AS Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipment_Items.shipment_id IS NULL
SELECT Order_Items.product_id , Customers.gender_code , Order_Items.order_id FROM Products AS Products INNER JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Customers AS Customers ON Order_Items.order_id = Customers.customer_id GROUP BY Order_Items.product_id ORDER BY COUNT(Order_Items.product_id) DESC LIMIT 1
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Order_Items.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Shipment_Items.shipment_id , SUM(Shipments.order_id * Shipments.invoice_number) FROM Shipment_Items JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id GROUP BY Shipment_Items.shipment_id ORDER BY SUM(Shipments.order_id * Shipments.invoice_number) ASC LIMIT 1
SELECT Orders.order_status_code, SUM(Order_Items.product_id) FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_status_code ORDER BY SUM(Order_Items.product_id) ASC LIMIT 1
SELECT DISTINCT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Order_Items AS Products JOIN Customers AS Customers ON Products.product_id = Customers.customer_id WHERE Products.order_item_status_code = 'female'
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Products AS Products JOIN Customers AS Customers ON Products.product_id = Customers.customer_id WHERE Products.parent_product_id = 'female'
SELECT product_price , product_color FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_price, product_color FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(product_id) FROM Products WHERE product_color = 'Not Sold'
SELECT COUNT(product_id) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(customer_id) FROM Customers WHERE gender_code NOT IN (SELECT payment_method_code FROM Customer_Payment_Methods)
SELECT count(*) FROM Customers WHERE gender_code NOT IN (SELECT payment_method_code FROM Customer_Payment_Methods)
SELECT gender_code, email_address, address_line_1 FROM Customers GROUP BY town_city ORDER BY COUNT(town_city) ASC LIMIT 1
SELECT Customers.gender_code, Customers.email_address, Customers.address_line_1 FROM Customers WHERE Customers.customer_id IN (SELECT Orders.customer_id FROM Orders GROUP BY Orders.customer_id ORDER BY COUNT(Orders.customer_id) ASC LIMIT 1)
SELECT product_color , product_size , product_description FROM Products WHERE parent_product_id < ( SELECT MAX(parent_product_id) FROM Products )
SELECT product_size , product_color , product_description FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT director.Name , count(*) FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID GROUP BY director.Name ORDER BY count(*) DESC LIMIT 1
SELECT director.Name, director.Age FROM program INNER JOIN director ON program.Director_ID = director.Director_ID INNER JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year = ( SELECT MAX(Start_Year) FROM program )
SELECT COUNT(Program_ID) FROM program WHERE Start_Year = 0
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel AS channel JOIN program AS program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Name, channel.Analogue_terrestrial_channel ORDER BY COUNT(channel.Name) DESC LIMIT 1
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID WHERE channel.Start_Year < 40 AND channel.Start_Year > 60
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE Model = 'Jeff Gordon') OR vehicle_driver.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle GROUP BY Vehicle_ID HAVING COUNT(Vehicle_ID) > 2)
SELECT driver.Name , driver.Citizenship FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID HAVING count(*) > 2 UNION SELECT driver.Name , driver.Citizenship FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon'
SELECT COUNT(*) FROM driver WHERE Name NOT IN (SELECT Model FROM vehicle)
SELECT count(*) FROM vehicle WHERE Top_Speed = 0
SELECT product_type_code FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT T2.product_type_code FROM Products AS Products JOIN Products AS T2 ON Products.product_id = T2.product_id WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT Customers.customer_id , Customers.customer_number , Customers.customer_name , Customers.customer_phone FROM Customers INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(Customer_Orders.customer_id) DESC LIMIT 1
SELECT Customers.customer_id, Customers.address_id, Customers.customer_number, Customers.customer_name FROM Customers AS Customers JOIN Customer_Orders AS Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT Customer_Orders.customer_id, Customer_Orders.order_id FROM Order_Items AS Products JOIN Customer_Orders ON Products.order_id = Customer_Orders.order_id WHERE Products.product_id > 6 OR Products.order_item_id > 3
SELECT Order_Items.order_item_id, Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.product_id = 1 AND (Order_Items.order_item_id > 6 OR Order_Items.order_id > 3)
SELECT region.Name FROM building AS building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Name ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT region.Name, region.Capital FROM building AS building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Name ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT Analytical_Layer.Customers_and_Services_ID, Analytical_Layer.Pattern_Recognition, Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers_and_Services.Customer_ID = ( SELECT Customers.Customer_ID FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Analytical_Layer.Customers_and_Services_ID, Analytical_Layer.Pattern_Recognition, Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customer_Interactions.Channel_ID = ( SELECT MAX(Customer_Interactions.Channel_ID) FROM Customer_Interactions )
SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer GROUP BY Analytical_Layer.Customers_and_Services_ID ORDER BY COUNT(Analytical_Layer.Customers_and_Services_ID) DESC LIMIT 1
SELECT Services.Service_Details , Services.Service_ID FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID JOIN Customers AS Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID GROUP BY Services.Service_ID ORDER BY COUNT(Customers.Customer_ID) DESC LIMIT 1
SELECT Analytical_Layer.Customers_and_Services_ID , Analytical_Layer.Pattern_Recognition , Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer WHERE Analytical_Layer.Customers_and_Services_ID = ( SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer GROUP BY Analytical_Layer.Customers_and_Services_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Customers.Service_Details, Customers.Customer_ID FROM Customer_Interactions AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID WHERE Services.Channel_ID = (SELECT MIN(Channel_ID) FROM Customer_Interactions GROUP BY Customer_ID ORDER BY COUNT(*) LIMIT 1)
SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = "Hardy Kutch" INTERSECT SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer WHERE Analytical_Layer.Pattern_Recognition = "good"
SELECT Customer_Interactions.Status_Code FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = "Hardy Kutch" INTERSECT SELECT Customer_Interactions.Status_Code FROM Customer_Interactions WHERE Customer_Interactions.Services_and_Channels_Details = "good"
SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = 'bad' AND Analytical_Layer.Customers_and_Services_ID IN ( SELECT Analytical_Layer.Customers_and_Services_ID FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'Hardy Kutch' )
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customers_and_Services.Customers_and_Services_ID IN ( SELECT Customer_Interactions.Customer_Interaction_ID FROM Customer_Interactions WHERE Customer_Interactions.Status_Code = 'bad' )
SELECT Vehicles.name , Vehicles.Model_year , Vehicles.Combined_fuel_economy_rate FROM Vehicles WHERE Vehicles.Type_of_powertrain = 2013 INTERSECT SELECT Vehicles.name , Vehicles.Model_year , Vehicles.Combined_fuel_economy_rate FROM Vehicles WHERE Vehicles.Type_of_powertrain = 2014
SELECT Vehicles.name , Vehicles.Type_of_powertrain , Renting_history.discount_id FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Renting_history.customer_id = 2013 OR Renting_history.customer_id = 2014
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history AS Customers JOIN Vehicles ON Customers.vehicles_id = Vehicles.id JOIN Discount ON Customers.discount_id = Discount.id GROUP BY Vehicles.id ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history INNER JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Renting_history AS Customers JOIN Discount ON Customers.discount_id = Discount.id GROUP BY Discount.name ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Vehicles.name FROM Renting_history AS Customers JOIN Vehicles AS Discount ON Customers.vehicles_id = Discount.id JOIN Discount AS Vehicles ON Customers.discount_id = Vehicles.id GROUP BY Vehicles.name ORDER BY COUNT(Vehicles.name) DESC LIMIT 1
SELECT Achievements.achievement_type_code, Achievements.achievement_id FROM Achievements WHERE Achievements.achievement_id IN ( SELECT Achievements.achievement_id FROM Achievements GROUP BY Achievements.achievement_id HAVING COUNT(Achievements.achievement_id) >= 2 ) INTERSECT SELECT Achievements.achievement_type_code, Achievements.achievement_id FROM Achievements WHERE Achievements.student_id < 2
SELECT Achievements.achievement_type_code , Achievements.achievement_id FROM Achievements WHERE Achievements.achievement_id IN (SELECT Behaviour_Monitoring.behaviour_monitoring_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_id HAVING COUNT(*) >= 2) INTERSECT SELECT Achievements.achievement_type_code , Achievements.achievement_id FROM Achievements WHERE Achievements.student_id < 2
SELECT Achievements.achievement_type_code, Achievements.student_id, Achievements.date_achievement, Achievements.achievement_details, Achievements.other_details FROM Achievements JOIN Classes ON Achievements.student_id = Classes.student_id JOIN Students ON Classes.student_id = Students.student_id WHERE Classes.class_details LIKE '%data%' AND Classes.class_details NOT LIKE 'net%'
SELECT Students.bio_data FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details LIKE '%data%' AND Classes.class_details NOT LIKE 'net%'
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id GROUP BY Students.student_id HAVING Count(*) >= 2
SELECT Transcripts.student_id, Transcripts.date_of_transcript FROM Transcripts INNER JOIN Students ON Transcripts.student_id = Students.student_id GROUP BY Transcripts.student_id HAVING COUNT(Transcripts.student_id) >= 2
SELECT Students.bio_data, Students.student_id FROM Students AS Students INNER JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id GROUP BY Students.student_id ORDER BY COUNT(Transcripts.student_id) DESC LIMIT 1
SELECT Teachers.teacher_details , Students.student_id FROM Students AS Students JOIN Classes AS Classes ON Students.student_id = Classes.student_id JOIN Teachers AS Teachers ON Teachers.teacher_id = Classes.teacher_id GROUP BY Students.student_id ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details, Transcripts.date_of_transcript, Transcripts.transcript_details FROM Students JOIN Transcripts ON Transcripts.student_id = Students.student_id JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Transcripts.date_of_transcript IN ( SELECT date_of_transcript FROM Transcripts GROUP BY date_of_transcript ORDER BY COUNT(date_of_transcript) DESC LIMIT 1 ) AND Transcripts.date_of_transcript IN ( SELECT date_of_transcript FROM Transcripts WHERE student_id = 3 GROUP BY date_of_transcript )
SELECT Achievements.achievement_type_code , Achievements.student_id , Achievements.date_achievement , Achievements.achievement_details , Achievements.other_details FROM Achievements JOIN Students ON Achievements.student_id = Students.student_id WHERE Achievements.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id ORDER BY COUNT(Achievements.student_id) DESC LIMIT 1 ) INTERSECT SELECT Achievements.achievement_type_code , Achievements.student_id , Achievements.date_achievement , Achievements.achievement_details , Achievements.other_details FROM Achievements JOIN Students ON Achievements.student_id = Students.student_id WHERE Achievements.student_id IN ( SELECT Achievements.student_id FROM Achievements JOIN Students ON Achievements.student_id = Students.student_id JOIN Transcripts ON Students.student_id = Transcripts.student_id GROUP BY Achievements.student_id ORDER BY COUNT(Achievements.student_id) DESC LIMIT 1 )
SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Transcripts AS Transcripts ON Transcripts.student_id = Students.student_id GROUP BY Students.student_id HAVING count(*) = (SELECT count(*) FROM Transcripts GROUP BY student_id ORDER BY count(*) DESC LIMIT 1)
SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id GROUP BY Transcripts.student_id ORDER BY COUNT(Transcripts.student_id) DESC LIMIT 1
SELECT Students.student_id , Ref_Event_Types.event_type_code , Ref_Event_Types.event_type_description FROM Students AS Students JOIN Behaviour_Monitoring AS Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id JOIN Student_Events AS Student_Events ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code ORDER BY COUNT(Ref_Event_Types.event_type_code) DESC LIMIT 1
SELECT Detention.detention_type_code, Detention.student_id, count(*) FROM Detention GROUP BY Detention.detention_type_code ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(Students.student_id) FROM Students WHERE Students.student_id NOT IN (SELECT Achievements.student_id FROM Achievements)
SELECT COUNT(Students.student_id) FROM Students AS Students JOIN Achievements AS Ref_Achievement_Type ON Students.student_id = Ref_Achievement_Type.student_id LEFT JOIN Student_Loans AS Teachers ON Students.student_id = Teachers.student_id WHERE Teachers.other_details IS NULL
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type WHERE detention_type_code IN ( SELECT Ref_Detention_Type.detention_type_code FROM Ref_Detention_Type GROUP BY detention_type_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Ref_Detention_Type.detention_type_code , Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type JOIN Detention ON Ref_Detention_Type.detention_type_code = Detention.detention_type_code GROUP BY Ref_Detention_Type.detention_type_code ORDER BY COUNT(Ref_Detention_Type.detention_type_code) LIMIT 1
SELECT Students.bio_data, Students.student_details, Transcripts.student_id, Transcripts.date_of_transcript, Transcripts.transcript_details FROM Students INNER JOIN Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.student_id > ( SELECT AVG(student_id) FROM Transcripts )
SELECT Students.bio_data, Students.student_details, Student_Loans.amount_of_loan FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id INNER JOIN Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.student_id = ( SELECT Transcripts.student_id FROM Transcripts GROUP BY Transcripts.student_id ORDER BY AVG(Transcripts.student_id) DESC LIMIT 1 ) AND Transcripts.student_id > ( SELECT AVG(student_id) FROM Transcripts )
SELECT Teachers.teacher_details FROM Teachers INNER JOIN Classes ON Teachers.teacher_id = Classes.teacher_id INNER JOIN Students ON Classes.student_id = Students.student_id INNER JOIN Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT Student_Events.event_type_code, Student_Events.student_id, Student_Events.event_date, Student_Events.other_details FROM Student_Events JOIN Students ON Student_Events.student_id = Students.student_id JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types INNER JOIN Students_Addresses ON Ref_Address_Types.address_type_code = Students_Addresses.address_type_code INNER JOIN Students ON Students_Addresses.student_id = Students.student_id GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses INNER JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(Ref_Address_Types.address_type_code) DESC LIMIT 1
