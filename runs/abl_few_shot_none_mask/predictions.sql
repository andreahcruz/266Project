SELECT COUNT(club.Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT DISTINCT Name FROM club ORDER BY Name ASC
SELECT club.Club_ID FROM club ORDER BY club.Club_ID ASC
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.Club_ID FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name != 'Nike'
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Wins_count ASC
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Country ORDER BY COUNT(player.Wins_count) ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1200000
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING count(*) > 1
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Club_ID) > 1
SELECT club.Name FROM club WHERE club.Club_ID IN (SELECT player.Club_ID FROM player GROUP BY player.Club_ID HAVING COUNT(player.Club_ID) > 1)
SELECT club.Country FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID GROUP BY club.Country HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT club.Name) FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT COUNT(DISTINCT club.Name) FROM club JOIN player ON player.Club_ID = club.Club_ID
SELECT COUNT(Orders.order_id) FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id
SELECT count(DISTINCT Orders.customer_id) FROM Orders
SELECT count(*) FROM Orders
SELECT COUNT(DISTINCT Order_Items.order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT Customer_Payment_Methods.customer_id) FROM Orders AS Products JOIN Customer_Payment_Methods ON Products.customer_id = Customer_Payment_Methods.customer_id JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id
SELECT COUNT(shipment_id) FROM Shipments
SELECT COUNT(Shipments.shipment_id) FROM Shipments
SELECT avg(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT avg(Products.product_price) FROM Products AS Products JOIN Orders AS Customers ON Products.product_id = Customers.customer_id
SELECT Products.product_price FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id
SELECT COUNT(*) FROM channel WHERE Digital_terrestrial_channel = 'digital terrestrial'
SELECT program.DESCRIPITIVE_ATTRIBUTE_11 FROM program ORDER BY program.Start_Year DESC
SELECT director.Name FROM director INNER JOIN program ON director.Director_ID = program.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM city_channel AS city_channel JOIN city_channel_radio AS city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio AS radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY radio.ERP_kW ASC
SELECT city_channel.Station_name FROM city_channel INNER JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel_radio.Is_online != 'ABC'
SELECT avg(radio.Radio_MHz) FROM city_channel_radio AS city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT radio.Affiliation FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Affiliation HAVING COUNT(city_channel.City) > 3
SELECT vehicle.Builder FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'United States'
SELECT vehicle_driver.Racing_Series FROM driver AS driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'United States'
SELECT COUNT(vehicle_driver.Driver_ID) FROM driver AS vehicle JOIN vehicle_driver ON vehicle.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Name = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Citizenship = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT driver.DESCRIPITIVE_ATTRIBUTE_9 FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Driver_ID = driver.Driver_ID WHERE driver.DESCRIPITIVE_ATTRIBUTE_9 LIKE '%driver%' ORDER BY driver.DESCRIPITIVE_ATTRIBUTE_9
SELECT vehicle_driver.Racing_Series FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'drivers' ORDER BY vehicle_driver.Racing_Series ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Questions.Type_of_Question_Code FROM Questions INNER JOIN Exams ON Questions.Question_ID = Exams.Exam_ID ORDER BY Questions.Type_of_Question_Code ASC
SELECT DISTINCT Questions.Type_of_Question_Code FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID ORDER BY Questions.Type_of_Question_Code
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers INNER JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID INNER JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID INNER JOIN Questions ON Exams.Exam_ID = Questions.Question_ID WHERE Student_Answers.Comments = 'Normal'
SELECT DISTINCT Student_Answers.Comments FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Questions ON Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code = "Normal"
SELECT COUNT(DISTINCT Student_Answers.Satisfactory_YN) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Students.Last_Name FROM Students WHERE Students.Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions AS Students JOIN Questions_in_Exams AS Questions ON Students.Question_ID = Questions.Question_ID JOIN Exams AS Exams ON Questions.Exam_ID = Exams.Exam_ID JOIN Student_Answers AS Questions_in_Exams ON Questions_in_Exams.Student_ID = Students.Student_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Exams.Exam_ID) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions AS Students JOIN Questions_in_Exams AS Questions ON Students.Question_ID = Questions.Question_ID JOIN Student_Answers AS Exams ON Questions.Exam_ID = Exams.Exam_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Students.Question_ID) >= 3
SELECT Students.First_Name , Students.Middle_Name , Students.Last_Name , Students.Gender_MFU , Students.Student_Address , Students.Email_Adress , Students.Cell_Mobile_Phone , Students.Home_Phone FROM Students
SELECT Questions.Type_of_Question_Code, Questions.Question_Text, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Students.Email_Adress, Students.Cell_Mobile_Phone, Students.Home_Phone FROM Students JOIN Questions_in_Exams ON Students.Student_ID = Questions_in_Exams.Student_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID
SELECT COUNT(*) FROM Addresses
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT Products.product_price FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.DESCRIPATIVE_ATTRIBUTE_2 = 'Monitor'
SELECT Products.product_price FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_2 = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(Products.product_price) FROM Products WHERE Products.product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Order_Items.order_quantity DESC
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Products.product_price DESC
SELECT Addresses.address_details FROM Addresses JOIN Order_Items ON Addresses.address_id = Order_Items.order_item_id JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id JOIN Products ON Customers.customer_name = Products.product_type_code GROUP BY Addresses.address_details HAVING COUNT(Products.product_name) >= 2
SELECT Addresses.address_details FROM Addresses JOIN Products ON Products.product_type_code = Addresses.address_details GROUP BY Addresses.address_details HAVING COUNT(Products.product_name) > 1
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers WHERE customer_phone = 'used customers'
SELECT DISTINCT Customer_Orders.order_status_code FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(Order_Items.order_item_id) FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Order_Items AS Products JOIN Customer_Orders AS Addresses ON Products.order_id = Addresses.order_id JOIN Customers AS Customers ON Addresses.customer_id = Customers.customer_id
SELECT Manager, Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT player.Name FROM player WHERE player.Earnings = ( SELECT MAX(player.Earnings) FROM player )
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name , player.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID HAVING SUM(player.Wins_count) > 2
SELECT club.Club_ID FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE player.Wins_count > player.Wins_count
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT club.Manufacturer FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE club.Captain = "Sam Allardyce"
SELECT club.Name , count(*) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT Manager, COUNT(*) FROM player GROUP BY Manager
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT player.Earnings FROM player AS player JOIN club AS club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT Orders.order_id , Orders.order_status_code , count(*) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id
SELECT COUNT(Products.product_id), Customers.gender_code, Orders.order_id FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id JOIN Customers ON Orders.order_status_code = Customers.gender_code
SELECT Orders.order_id , Orders.order_status_code FROM Order_Items AS Order_Items JOIN Orders AS Orders ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id HAVING COUNT(Order_Items.product_id) >= 2
SELECT Orders.order_id , Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name IN ( SELECT Products.product_name FROM Products GROUP BY Products.product_name HAVING count(*) >= 2 )
SELECT Customers.gender_code , count(*) FROM Orders AS Products JOIN Customers AS Customers ON Products.customer_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT Orders.order_status_code, COUNT(*) FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Orders.order_status_code
SELECT 1
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name , Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code , Invoices.invoice_date , Shipments.shipment_date FROM Shipments INNER JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Customers.gender_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Orders ON Orders.order_id = Shipments.order_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id JOIN Customers ON Customers.address_line_1 = Orders.order_status_code
SELECT Orders.order_status_code , Shipments.shipment_tracking_number FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Orders.DESCRIPITIVE_ATTRIBUTE_28 , Shipments.shipment_tracking_number FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Shipments.order_id = Orders.order_id
SELECT login_name , login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT Customers.login_name , Customers.login_password FROM Customers JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id WHERE Customers.phone_number LIKE '+12%'
SELECT Products.product_size FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Products.product_name LIKE '%Dell%'
SELECT Products.product_name FROM Products JOIN Customer_Payment_Methods ON Products.product_id = Customer_Payment_Methods.customer_id WHERE Products.product_description LIKE '%Dell%'
SELECT Orders.order_status_code , Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Orders.order_status_code , Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Customers.address_line_1 , Customers.town_city , Customers.email_address FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customers.country = "customers" AND Customers.customer_last_name = "USA"
SELECT Customers.town_city , Customers.country , Customers.county FROM Customers JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id WHERE Customers.customer_last_name = 'United States'
SELECT Products.product_id, Customers.DESCRIPITIVE_ATTRIBUTE_9 FROM Products JOIN Orders ON Products.product_id = Orders.customer_id JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_tracking_number > 3
SELECT Products.product_id, Products.product_name FROM Products JOIN Orders ON Products.product_id = Orders.customer_id JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Products.product_id HAVING count(*) > 3
SELECT Invoices.invoice_status_code , Invoices.invoice_number FROM Shipments AS Products JOIN Invoices AS Customers ON Products.invoice_number = Customers.invoice_number JOIN Order_Items AS Customer_Payment_Methods ON Customer_Payment_Methods.order_id = Products.order_id JOIN Orders AS T4_1 ON T4_1.order_id = Customer_Payment_Methods.order_id JOIN Orders AS T5_1 ON T5_1.order_id = T5_1.customer_id JOIN Customers AS T2_1 ON T2_1.customer_id = T5_1.customer_id JOIN Shipments AS T7_1 ON T7_1.shipment_id = Products.shipment_id GROUP BY Invoices.invoice_number HAVING COUNT(T7_1.shipment_id) >= 2
SELECT Invoices.invoice_status_code , Invoices.invoice_number FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Shipment_Items ON Shipment_Items.order_item_id = Shipments.shipment_id JOIN Order_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id JOIN Orders ON Orders.order_id = Order_Items.order_id WHERE Orders.customer_id IN (SELECT Customers.customer_id FROM Customers GROUP BY Customers.customer_id HAVING COUNT(*) >= 2)
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Shipments.shipment_tracking_number , Shipments.shipment_date FROM Shipments
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID JOIN channel AS program ON channel.Channel_ID = program.Channel_ID ORDER BY program.Title ASC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT program.Title FROM program ORDER BY program.Program_ID DESC LIMIT 1
SELECT channel.Name , channel.Analogue_terrestrial_channel FROM channel WHERE channel.Channel_ID IN (SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(program.Channel_ID) > 1)
SELECT channel.Name, COUNT(program.Program_ID) FROM channel INNER JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Name
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID WHERE channel.Title = "Dracula"
SELECT tv_show.tv_show_name, radio.RnaG_MHz FROM tv_show JOIN city_channel_tv_show ON tv_show.tv_show_ID = city_channel_tv_show.tv_show_ID JOIN city_channel_radio ON city_channel_tv_show.City_channel_ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT radio.Transmitter FROM city_channel AS city_channel JOIN city_channel_radio AS city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio AS radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Radio_MHz > 150 OR radio.Radio_MHz < 30
SELECT radio.Transmitter FROM city_channel_radio AS city_channel INNER JOIN radio ON city_channel.Radio_ID = radio.Radio_ID WHERE radio.ERP_kW = ( SELECT MAX(ERP_kW) FROM radio )
SELECT city_channel.Affiliation , COUNT(*) FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel.Affiliation
SELECT city_channel.Station_name , city_channel.City FROM city_channel INNER JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID INNER JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.Station_name ASC
SELECT Transmitter, City FROM radio JOIN city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID JOIN city_channel ON city_channel.ID = city_channel_radio.City_channel_ID
SELECT radio.Transmitter , COUNT(city_channel_radio.City_channel_ID) FROM radio AS radio JOIN city_channel_radio AS city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID GROUP BY radio.Radio_ID
SELECT MAX(driver.Name), AVG(driver.Name) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'Zhuzhou'
SELECT MAX(driver.Name), AVG(driver.Name) FROM vehicle AS T1_1 INNER JOIN vehicle_driver ON T1_1.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE T1_1.Builder = 'Zhuzhou'
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Build_Year , vehicle.Model , driver.Name FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year , vehicle.Model , driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(vehicle_driver.Driver_ID) FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = "2012"
SELECT COUNT(DISTINCT driver.Name) FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT vehicle.Model FROM vehicle WHERE vehicle.Top_Speed > 150 OR vehicle.Total_Production > 100
SELECT driver.Racing_Series FROM vehicle_driver AS vehicle_driver JOIN vehicle AS vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 150 OR vehicle.Total_Production > 100
SELECT vehicle.Builder, vehicle.Top_Speed FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model , vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE "%DJ%"
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Name
SELECT COUNT(driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID
SELECT Exams.Exam_Name , Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code != "Database"
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams INNER JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID INNER JOIN Students ON Questions_in_Exams.Question_ID = Students.Student_ID WHERE Students.First_Name != "Database"
SELECT Type_of_Question_Code , COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Questions.Type_of_Question_Code , COUNT(Questions.Question_ID) FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students INNER JOIN Questions_in_Exams ON Students.Student_ID = Questions_in_Exams.Student_ID INNER JOIN Student_Answers ON Questions_in_Exams.Exam_ID = Student_Answers.Exam_ID
SELECT Students.First_Name , Student_Answers.Date_of_Answer FROM Students AS Students INNER JOIN Questions_in_Exams AS Questions_in_Exams ON Students.Student_ID = Questions_in_Exams.Student_ID INNER JOIN Student_Answers AS Student_Answers ON Questions_in_Exams.Exam_ID = Student_Answers.Exam_ID
SELECT Students.Email_Adress , Student_Answers.Date_of_Answer FROM Students JOIN Questions_in_Exams ON Students.Student_ID = Questions_in_Exams.Student_ID JOIN Student_Answers ON Questions_in_Exams.Exam_ID = Student_Answers.Exam_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress , Student_Answers.Date_of_Answer FROM Students AS Students JOIN Student_Answers AS Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students INNER JOIN Questions_in_Exams ON Students.Student_ID = Questions_in_Exams.Student_ID INNER JOIN Student_Answers ON Questions_in_Exams.Exam_ID = Student_Answers.Exam_ID INNER JOIN Questions ON Student_Answers.Question_ID = Questions.Question_ID WHERE Student_Answers.Question_ID = Questions_in_Exams.Question_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Question_ID) >= 2
SELECT Students.First_Name FROM Students INNER JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID INNER JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID INNER JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID GROUP BY Students.Student_ID HAVING COUNT(Exams.Exam_Name) >= 2
SELECT 1
SELECT club.Name FROM club INNER JOIN player ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 GROUP BY player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID ORDER BY avg(player.Earnings) DESC
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club WHERE Club_ID IN (SELECT Club_ID FROM club GROUP BY Club_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT club.Name FROM club WHERE club.Club_ID NOT IN (SELECT player.Club_ID FROM player)
SELECT club.Club_ID FROM club WHERE Club_ID NOT IN ( SELECT player.Club_ID FROM player )
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 INTERSECT SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings < 1100000
SELECT Orders.date_order_placed , Order_Items.order_item_status_code FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Order_Items.order_item_status_code > 1 OR Orders.date_order_placed = ( SELECT MIN(date_order_placed) FROM Orders )
SELECT Invoices.invoice_date, Orders.date_order_placed FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number JOIN Orders ON Shipments.shipment_id = Orders.order_id WHERE Orders.order_id IN (SELECT Orders.order_id FROM Orders GROUP BY Orders.order_id HAVING count(*) > 1)
SELECT Products.product_id , Customers.gender_code , Products.product_price , Products.product_color FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders AS Orders ON Orders.order_id = Order_Items.order_id JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Orders.customer_id WHERE Order_Items.order_id IN (SELECT Orders.order_id FROM Orders GROUP BY Orders.order_id HAVING count(*) < 2)
SELECT Customer_Payment_Methods.payment_method_code FROM Customers AS Products JOIN Customer_Payment_Methods ON Products.customer_id = Customer_Payment_Methods.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING count(*) >= ( SELECT count(*) FROM Customers )
SELECT Customers.gender_code , COUNT(Orders.order_id) FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id JOIN Customers AS Customers ON Orders.customer_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT Customers.gender_code, COUNT(*) FROM Orders AS Products JOIN Customers AS Customers ON Products.customer_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT Products.product_name , Shipments.shipment_date FROM Products JOIN Orders ON Products.product_id = Orders.customer_id JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Products.product_name , Customer_Payment_Methods.payment_method_code FROM Order_Items AS Order_Items JOIN Products AS Products ON Order_Items.product_id = Products.product_id JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Order_Items.order_id = Customer_Payment_Methods.customer_id JOIN Shipments AS Shipments ON Order_Items.order_id = Shipments.order_id
SELECT Customers.gender_code , Products.product_name FROM Products AS Products JOIN Customer_Payment_Methods AS Customers ON Products.product_id = Customers.customer_id JOIN Shipments AS Customer_Payment_Methods ON Customers.customer_id = Shipments.order_id
SELECT Invoices.invoice_status_code FROM Invoices AS Products JOIN Orders AS Customers ON Products.invoice_number = Customers.customer_id WHERE Customers.order_id NOT IN (SELECT Shipments.shipment_id FROM Shipments AS Customer_Payment_Methods)
SELECT Invoices.invoice_status_code FROM Invoices AS Invoices JOIN Orders AS Orders ON Invoices.invoice_number = Orders.customer_id WHERE Orders.order_status_code = 'shipped'
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT vehicle.Vehicle_ID FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'vehicles ever used' ORDER BY vehicle.Total_Production ASC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID ORDER BY driver.Name LIMIT 1
SELECT DISTINCT driver.DESCRIPITIVE_ATTRIBUTE_9 FROM vehicle_driver AS driver JOIN vehicle AS vehicle ON driver.Driver_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT vehicle.Vehicle_ID, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = 'Ziyang' OR driver.Name = 'two'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Driver_ID IN (SELECT Driver_ID FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(*) = 2) OR vehicle.Builder = "Ziyang"
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'maximum top speed'
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT Addresses.DESCRIPITIVE_ATTRIBUTE_6 FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Addresses AS Addresses ON Order_Items.order_id = Addresses.address_id WHERE Products.product_price > ( SELECT avg(product_price) FROM Products )
SELECT Addresses.DESCRIBITIVE_ATTRIBUTE_6 FROM Addresses JOIN Products ON Addresses.address_id = Products.product_id JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Products.product_price > ( SELECT avg(product_price) FROM Products )
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.product_price = (SELECT max(product_price) FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_2 = "Clothes")
SELECT Products.product_id , Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_3 = "Hardware" AND Products.product_price = ( SELECT MIN(product_price) FROM Products WHERE product_name = "Hardware" )
SELECT Products.product_id , Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_3 = ( SELECT product_name FROM Products ORDER BY product_price ASC LIMIT 1 )
SELECT Addresses.address_details FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id JOIN Customers AS Customers ON Order_Items.order_item_id = Customers.address_id JOIN Addresses AS Addresses ON Addresses.address_id = Customers.customer_id GROUP BY Addresses.address_details ORDER BY COUNT(Products.product_id) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Addresses.address_details FROM Addresses INNER JOIN Customers ON Addresses.address_id = Customers.address_id INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Customers.customer_phone = 'used customers' GROUP BY Addresses.address_details ORDER BY COUNT(Order_Items.product_id) DESC LIMIT 1
SELECT Addresses.address_details FROM Customers AS Customers JOIN Customer_Orders AS Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items AS Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products AS Products ON Order_Items.product_id = Products.product_id GROUP BY Addresses.address_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.customer_name FROM Customers INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_name ORDER BY COUNT(Order_Items.product_id) ASC LIMIT 1
SELECT Addresses.address_details FROM Addresses INNER JOIN Customers ON Addresses.address_id = Customers.customer_id INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity = ( SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products GROUP BY Products.DESCRIPITIVE_ATTRIBUTE_2 ORDER BY COUNT(*) ASC LIMIT 1
SELECT Addresses.address_details FROM Addresses JOIN Products ON Addresses.order_item_id = Products.product_id GROUP BY Addresses.address_details ORDER BY COUNT(Addresses.address_details) ASC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.product_id NOT IN (SELECT Order_Items.product_id FROM Order_Items WHERE Order_Items.order_id IS NULL)
SELECT Products.product_name FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_id IS NULL
SELECT Customers.country , Customers.gender_code , Customers.customer_first_name FROM Customers JOIN Orders ON Customers.address_line_1 = Orders.order_status_code JOIN Order_Items ON Orders.customer_id = Order_Items.order_id WHERE Orders.order_status_code > 2 AND Order_Items.order_item_status_code = 3
SELECT Products.product_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_item_id = (SELECT Order_Items.order_item_id FROM Order_Items GROUP BY Order_Items.order_item_id HAVING COUNT(Order_Items.order_item_id) > 2) AND Order_Items.order_item_id = (SELECT Order_Items.order_item_id FROM Order_Items JOIN Order_Items AS Shipments ON Order_Items.order_id = Shipments.order_id GROUP BY Order_Items.order_item_id HAVING COUNT(Order_Items.order_item_id) >= 3)
SELECT Customers.customer_first_name , Customers.customer_middle_initial , Customers.country FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE Customers.country NOT IN (SELECT Orders.order_status_code FROM Orders)
SELECT Products.product_id , Customers.gender_code , Products.product_price , Products.product_color FROM Products JOIN Customer_Payment_Methods ON Products.product_id = Customer_Payment_Methods.customer_id JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.customer_id NOT IN ( SELECT Orders.customer_id FROM Orders GROUP BY Orders.customer_id HAVING COUNT(*) >= 2 )
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Orders.order_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.payment_method_code = ( SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods AS Customer_Payment_Methods JOIN Orders AS Orders ON Customer_Payment_Methods.customer_id = Orders.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Products.product_id , Customers.gender_code , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders AS Orders ON Orders.order_id = Order_Items.order_id JOIN Customers AS Customers ON Customers.customer_id = Orders.customer_id GROUP BY Orders.order_id ORDER BY COUNT(Orders.order_id) DESC LIMIT 1
SELECT Orders.order_id , SUM(Products.product_price) FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders AS Orders ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Orders.order_id, SUM(Customers.gender_code) FROM Orders INNER JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Orders.order_id ORDER BY SUM(Customers.gender_code) ASC LIMIT 1
SELECT Products.product_name , Products.product_price , Products.product_description FROM Customers AS Customers JOIN Products ON Customers.customer_id = Products.product_id WHERE Customers.gender_code = 'female customers'
SELECT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.country = 'female customers'
SELECT Products.product_price , Products.product_size FROM Products GROUP BY Products.product_price HAVING AVG(Products.product_price) < Products.product_price
SELECT Customers.gender_code , Orders.phone_number FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT count(*) FROM Products WHERE order_id IS NULL
SELECT COUNT(Customers.country) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT COUNT(Customers.country) FROM Customers LEFT JOIN Orders ON Customers.country = Orders.order_status_code WHERE Orders.order_status_code IS NULL
SELECT Customers.email_address , Customers.address_line_1 , Customers.country FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customers.gender_code = 'least common gender'
SELECT Customers.email_address, Customers.town_city, Customers.county FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_status_code = 'orders less'
SELECT Customers.gender_code , Customers.customer_first_name , Shipments.shipment_tracking_number FROM Products AS Products JOIN Customers ON Products.product_id = Customers.customer_id JOIN Shipments ON Customers.customer_id = Shipments.order_id WHERE Products.product_price < (SELECT MAX(product_price) FROM Products)
SELECT Products.product_name , Products.product_description , Customers.customer_first_name FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Products.product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Name , count(*) FROM program AS channel JOIN director AS program ON channel.Director_ID = program.Director_ID JOIN channel AS director ON channel.Channel_ID = director.Channel_ID GROUP BY director.Name ORDER BY count(*) DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON program.Director_ID = director.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID WHERE director_admin.Director_ID = program.Director_ID GROUP BY director.Name ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN ( SELECT Channel_ID FROM program )
SELECT channel.Name, channel.Internet FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID GROUP BY channel.Channel_ID ORDER BY COUNT(director.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age > 60 AND director.Age < 40
SELECT vehicle.Vehicle_ID, driver.Name FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Name = 'Jeff Gordon' OR driver.Racing_Series > 2
SELECT vehicle.Vehicle_ID , vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon' OR vehicle_driver.Driver_ID IN (SELECT Driver_ID FROM vehicle_driver GROUP BY Driver_ID HAVING count(*) > 2)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(driver.Driver_ID) FROM driver WHERE driver.Racing_Series = 'not driven'
SELECT Products.product_name FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Products.product_price > (SELECT AVG(Products.product_price) FROM Products WHERE Products.product_type_code = 'hardware')
SELECT Addresses.address_details FROM Products AS Products JOIN Customers AS Customers ON Products.product_id = Customers.customer_id JOIN Addresses AS Addresses ON Customers.customer_id = Addresses.address_id WHERE Customers.product_price > ( SELECT AVG(T3_1.product_price) FROM Customers AS T3_1 JOIN Products AS T1_1 ON T3_1.customer_id = T1_1.product_id WHERE T1_1.product_type_code = 'Hardware product' )
SELECT Products.product_type_code , Products.product_name , Addresses.address_details , Products.product_price FROM Products INNER JOIN Addresses ON Products.product_type_code = Addresses.address_details INNER JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_quantity = (SELECT max(order_quantity) FROM Order_Items)
SELECT Products.product_id , Products.product_type_code , Products.product_name , Products.product_price FROM Products AS Products JOIN Order_Items AS Addresses ON Products.product_id = Addresses.product_id GROUP BY Products.product_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT order_id FROM Order_Items)
SELECT count(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT Addresses.address_details, Customer_Orders.order_id FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_price > 6 OR Products.product_price > 3
SELECT Order_Items.order_id , Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_quantity > 6 OR Products.product_name > 3
SELECT region.Capital FROM building AS building JOIN region AS region ON building.Region_ID = region.Region_ID GROUP BY region.Capital ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT region.Area, region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Area ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT Channels.Channel_Details FROM Customers_and_Services AS Services JOIN Customers AS Customers ON Services.Service_ID = Customers.Customer_ID JOIN Channels AS Channels ON Services.Customer_ID = Channels.Channel_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(Services.Customers_and_Services_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers INNER JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(Services.Service_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions AS Channels ON Services.Service_ID = Channels.Service_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(DISTINCT Channels.Channel_ID) DESC LIMIT 1
SELECT Services.Service_Details , Customer_Interactions.Status_Code FROM Customer_Interactions AS Customer_Interactions JOIN Customers AS Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services AS Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customer_Interactions.Service_ID ORDER BY COUNT(Customer_Interactions.Service_ID) DESC LIMIT 1
SELECT Channels.Channel_Details FROM Channels INNER JOIN Customers_and_Services ON Channels.Channel_ID = Customers_and_Services.Service_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Channels.Channel_ID ORDER BY COUNT(Services.Service_ID) ASC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID WHERE Services.Service_ID = (SELECT Service_ID FROM Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Services.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = "Hardy Kutch" UNION SELECT Services.Service_Details FROM Services WHERE Services.Service_Details = "good"
SELECT Services.Service_Details FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Channel_ID = ( SELECT Channel_ID FROM Channels WHERE Channel_Details = 'good' ) INTERSECT SELECT Services.Service_Details FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Customer_ID = ( SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch' )
SELECT Services.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Services.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID INNER JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Notes , Type_of_powertrain , Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 INTERSECT SELECT Notes , Type_of_powertrain , Annual_fuel_cost FROM Vehicles WHERE Model_year = 2014
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2 , Discount.DESCRIPATIVE_ATTRIBUTE_6 , Vehicles.Cost_per_25_miles FROM Vehicles AS Vehicles JOIN Renting_history AS Renting_history ON Vehicles.id = Renting_history.vehicles_id JOIN Customers AS Customers ON Renting_history.customer_id = Customers.id JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT Vehicles.name, Customers.name FROM Renting_history AS Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Customers ON Renting_history.customer_id = Customers.id GROUP BY Vehicles.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Customers.name , Vehicles.Model_year FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Discount ON Renting_history.discount_id = Discount.id ORDER BY Renting_history.total_hours DESC LIMIT 1
SELECT Discount.DESCRIBITIVE_ATTRIBUTE_6 FROM Renting_history AS Customers JOIN Discount ON Customers.discount_id = Discount.id GROUP BY Discount.DESCRIBITIVE_ATTRIBUTE_6 ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Discount.DESCRIPITIVE_ATTRIBUTE_6 FROM Renting_history AS Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.DESCRIPITIVE_ATTRIBUTE_6 ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Students.student_id , Addresses.address_details FROM Students AS Students JOIN Classes AS Classes ON Students.student_id = Classes.student_id JOIN Teachers AS Teachers ON Classes.teacher_id = Teachers.teacher_id JOIN Addresses AS Addresses ON Teachers.teacher_id = Addresses.address_id WHERE Classes.class_details = '2 or more classes' OR Detention.detention_type_description < 2
SELECT Students.student_id , Student_Events.other_details FROM Students AS Students INNER JOIN Student_Events AS Student_Events ON Student_Events.student_id = Students.student_id INNER JOIN Classes AS Classes ON Classes.student_id = Students.student_id INNER JOIN Teachers AS Teachers ON Classes.teacher_id = Teachers.teacher_id GROUP BY Students.student_id HAVING COUNT(Classes.teacher_id) >= 2 OR COUNT(Detention.student_id) < 2
SELECT Teachers.teacher_details FROM Teachers INNER JOIN Classes ON Teachers.teacher_id = Classes.teacher_id INNER JOIN Students ON Classes.student_id = Students.student_id WHERE Students.bio_data LIKE '%data%' AND Classes.class_details NOT LIKE 'net%'
SELECT teacher_details FROM Teachers AS T10_1 INNER JOIN Classes AS T12_1 ON T10_1.teacher_id = T12_1.teacher_id WHERE T12_1.class_details LIKE '%data%' AND T12_1.teacher_id NOT IN (SELECT teacher_id FROM Classes AS T12_2 WHERE T12_2.class_details LIKE 'net%')
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Students AS Students INNER JOIN Achievements AS Achievements ON Achievements.student_id = Students.student_id INNER JOIN Student_Loans AS Student_Loans ON Student_Loans.student_id = Students.student_id GROUP BY Students.student_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.other_details = 'two or more achievements'
SELECT Teachers.address_details , Students.student_id FROM Students INNER JOIN Classes ON Students.student_id = Classes.student_id INNER JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id GROUP BY Teachers.address_details ORDER BY COUNT(Classes.teacher_id) DESC LIMIT 1
SELECT Teachers.teacher_id , Teachers.teacher_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id GROUP BY Teachers.teacher_id ORDER BY COUNT(Classes.teacher_id) DESC LIMIT 1
SELECT bio_data, class_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Classes ON Students.student_id = Classes.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) AND Classes.class_details IN (SELECT class_details FROM Classes GROUP BY class_details HAVING COUNT(*) = 3)
SELECT 1
SELECT Students.bio_data , Students.student_details FROM Students INNER JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id INNER JOIN Addresses ON Behaviour_Monitoring.student_id = Addresses.address_id WHERE Addresses.address_details = (SELECT address_details FROM Addresses GROUP BY address_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Students.student_details , Addresses.address_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Addresses ON Behaviour_Monitoring.student_id = Addresses.address_id GROUP BY Addresses.address_details ORDER BY COUNT(Addresses.address_details) DESC LIMIT 1
SELECT COUNT(Students.student_id) , Ref_Event_Types.event_type_description , Classes.DESCRIBITIVE_ATTRIBUTE_36 FROM Students AS Students JOIN Student_Events AS Student_Events ON Students.student_id = Student_Events.student_id JOIN Ref_Event_Types AS Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code JOIN Classes AS Classes ON Students.student_id = Classes.student_id GROUP BY Classes.DESCRIBITIVE_ATTRIBUTE_36 ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT 1
SELECT COUNT(Teachers.teacher_id) FROM Students AS Students JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id JOIN Behaviour_Monitoring AS Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Teachers AS Teachers ON Students.student_id = Teachers.teacher_id WHERE Behaviour_Monitoring.student_details = ''
SELECT COUNT(Teachers.teacher_id) FROM Teachers JOIN Students ON Teachers.teacher_id = Students.student_id WHERE Students.student_id NOT IN (SELECT Students.student_id FROM Students JOIN Achievements ON Students.student_id = Achievements.student_id)
SELECT Ref_Event_Types.event_type_description, Addresses.address_details FROM Classes JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id JOIN Addresses ON Classes.student_id = Addresses.address_id JOIN Ref_Event_Types ON Classes.teacher_id = Ref_Event_Types.event_type_code WHERE Classes.class_details = (SELECT Ref_Event_Types.event_type_description FROM Classes JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id JOIN Ref_Event_Types ON Classes.teacher_id = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Classes.class_details, Ref_Event_Types.event_type_description FROM Classes AS Students JOIN Ref_Event_Types AS Transcripts ON Students.student_id = Transcripts.event_type_code GROUP BY Classes.class_details ORDER BY COUNT(Classes.class_details) LIMIT 1
SELECT Students.student_id , Students.bio_data , Students.student_details FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Students.bio_data, Student_Events.other_details FROM Students INNER JOIN Student_Events ON Student_Events.student_id = Students.student_id INNER JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT 1
SELECT 1
SELECT 1
SELECT 1
