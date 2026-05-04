SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player WHERE Name = 'Nike')
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT DISTINCT player.Country FROM player WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 1200000
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING count(DISTINCT player.Name) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Captain) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Player_ID) > 1
SELECT player.Country FROM player GROUP BY player.Country HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT player.Country) FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.date_order_placed IS NOT NULL
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT COUNT(DISTINCT Order_Items.order_item_status_code) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.date_order_placed IS NOT NULL
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT count(*) FROM Shipments
SELECT COUNT(DISTINCT Products.product_id) FROM Products JOIN Shipments ON Products.product_id = Shipments.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Internet) FROM channel WHERE Analogue_terrestrial_channel = 'terrestrial'
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio WHERE Radio_MHz IS NOT NULL
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Station_name FROM city_channel WHERE City IS NOT NULL AND Affiliation != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Radio_MHz
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT City) > 3
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Citizenship = 'United States'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT count(DISTINCT vehicle_driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID ORDER BY driver.Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT count(*) FROM Exams WHERE Exam_Name IS NOT NULL
SELECT count(Exam_Name) FROM Exams WHERE Exam_Name IS NOT NULL
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answers.Student_ID FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers WHERE Comments IS NOT NULL
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(address_id) FROM Addresses
SELECT count(address_id) FROM Addresses
SELECT COUNT(DISTINCT product_name) FROM Products
SELECT COUNT(DISTINCT product_name) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(product_name) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT club.Manager, club.Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT player.Name FROM player ORDER BY player.Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2 GROUP BY club.Club_ID, club.Name
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT club.Manufacturer, count(*) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, COUNT(Products.product_id) AS product_count, Orders.order_status_code, Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id LEFT JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.order_status_code, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT Orders.order_id, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Orders.order_id HAVING COUNT(DISTINCT Shipments.invoice_number) >= 2
SELECT Customers.gender_code, COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Orders.order_status_code, COUNT(Orders.order_id) FROM Orders GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code, Customers.customer_middle_initial, Customers.customer_first_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices JOIN Orders ON Invoices.invoice_number = Orders.customer_id JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Orders.date_order_placed IS NOT NULL AND Shipments.shipment_id IS NOT NULL
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Invoices JOIN Orders ON Invoices.invoice_number = Shipments.invoice_number JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Invoices.invoice_date IS NOT NULL AND Shipments.shipment_id IS NOT NULL
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT Orders.order_status_code, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Customers.address_line_1, Customers.town_city, Customers.county FROM Customers WHERE Customers.email_address = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'United States'
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(*) > 3
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Invoices.invoice_number, Invoices.invoice_date HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices WHERE Invoices.invoice_number IN ( SELECT Shipments.invoice_number FROM Shipments GROUP BY Shipments.invoice_number HAVING COUNT(*) >= 2 )
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Internet FROM channel WHERE Channel_ID IN (SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(program.Program_ID) > 1)
SELECT channel.Internet, COUNT(program.Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Internet
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Sub_tittle FROM tv_show
SELECT DISTINCT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT city_channel.City, city_channel.Station_name FROM city_channel ORDER BY city_channel.Station_name ASC
SELECT Transmitter, City FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel.City) AS city_count FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Builder FROM vehicle WHERE Build_Year = "1996"
SELECT Top_Speed, Power FROM vehicle WHERE Builder = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT DISTINCT driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Racing_Series HAVING SUM(vehicle.Power) > 100 OR MAX(vehicle.Top_Speed) > 150
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING SUM(vehicle.Total_Production) > 100 OR vehicle.Top_Speed > 150
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT Racing_Series, COUNT(DISTINCT Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY Racing_Series
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT player.Country FROM player WHERE player.Wins_count > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club LEFT JOIN player ON player.Club_ID = club.Club_ID WHERE player.Events_number IS NULL
SELECT t1.Name FROM club AS t1 LEFT JOIN player AS t2 ON t2.Club_ID = t1.Club_ID WHERE t2.Events_number IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING SUM(CASE WHEN Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id WHERE Shipments.shipment_date = (SELECT MIN(shipment_date) FROM Shipments) OR Orders.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT DISTINCT t7.shipment_date FROM Shipments AS t7 JOIN Shipment_Items AS t8 ON t8.shipment_id = t7.shipment_id WHERE t7.shipment_date = (SELECT MIN(shipment_date) FROM Shipments) OR t7.shipment_id IN ( SELECT t8b.shipment_id FROM Shipment_Items AS t8b GROUP BY t8b.shipment_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders ON Orders.order_id = Order_Items.order_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(DISTINCT Orders.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(DISTINCT Customers.country) DESC LIMIT 1
SELECT t2.gender_code, COUNT(DISTINCT t1.product_name) FROM Customers AS t2 JOIN Orders AS t5 ON t5.customer_id = t2.customer_id JOIN Order_Items AS t6 ON t6.order_id = t5.order_id JOIN Products AS t1 ON t6.product_id = t1.product_id GROUP BY t2.gender_code
SELECT Customers.gender_code, COUNT(DISTINCT Products.product_name) AS product_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Customers.gender_code
SELECT Products.product_name, Orders.date_order_placed FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT t1.product_name, t7.shipment_date FROM Shipments AS t7 JOIN Order_Items AS t6 ON t7.shipment_id = t6.order_item_id JOIN Products AS t1 ON t6.product_id = t1.product_id
SELECT Products.product_name, Order_Items.order_item_status_code FROM Shipments JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Products ON Products.product_id = Order_Items.product_id
SELECT DISTINCT Products.product_name, Products.product_color FROM Shipments JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Order_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Products ON Products.product_id = Order_Items.product_id
SELECT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Invoices.invoice_number = Shipments.invoice_number WHERE Shipments.shipment_id IS NULL
SELECT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_id IS NULL
SELECT Orders.order_id, Orders.date_order_placed, SUM(Order_Items.order_id) AS total_cost FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, SUM(Order_Items.order_id) AS total_amount_paid FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Customers.gender_code, Products.product_name FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id
SELECT Customers.gender_code, Products.product_name FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 )
SELECT DISTINCT t5.date_order_placed FROM Orders AS t5 JOIN Customers AS t2 ON t5.customer_id = t2.customer_id JOIN Customer_Payment_Methods AS t3 ON t3.customer_id = t2.customer_id GROUP BY t5.order_id, t5.date_order_placed HAVING COUNT(DISTINCT t3.payment_method_code) >= 2
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Channel_ID, Internet FROM channel WHERE Digital_terrestrial_channel != 'Hank Baskett' OR Digital_terrestrial_channel IS NULL
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, tv_show.tv_show_name FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID JOIN city_channel_tv_show ON city_channel_tv_show.City_channel_ID = city_channel.ID JOIN tv_show ON city_channel_tv_show.tv_show_ID = tv_show.tv_show_ID ORDER BY radio.Lyric_FM_MHz DESC
SELECT DISTINCT radio.Transmitter FROM radio WHERE radio.Radio_ID NOT IN ( SELECT DISTINCT city_channel_radio.Radio_ID FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE city_channel.City IS NOT NULL AND city_channel.Affiliation IS NOT NULL )
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Builder > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT t3.Driver_ID, COUNT(DISTINCT t1.Power) AS vehicle_count FROM vehicle_driver AS t3 JOIN vehicle AS t1 ON t3.Vehicle_ID = t1.Vehicle_ID GROUP BY t3.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, SUM(vehicle.Power) AS vehicles_count FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle_driver.Driver_ID ORDER BY vehicles_count DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle ORDER BY vehicle.Power ASC LIMIT 1
SELECT vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Power ORDER BY COUNT(driver.Racing_Series) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver )
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series IS NOT NULL )
SELECT DISTINCT t1.Power, t1.Model FROM vehicle AS t1 LEFT JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID GROUP BY t1.Vehicle_ID, t1.Power, t1.Model HAVING COUNT(DISTINCT t3.Driver_ID) = 2 OR t1.Builder = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 ) OR vehicle.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(Power) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Questions ON Questions.Question_ID = Questions_in_Exams.Question_ID WHERE Questions.Type_of_Question_Code LIKE '%data%' ORDER BY Exams.Exam_Date DESC
SELECT Exams.Exam_Date FROM Questions_in_Exams JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE LOWER(Questions.Type_of_Question_Code) LIKE '%data%' ORDER BY Exams.Exam_Date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Comments IS NULL
SELECT DISTINCT Exams.Exam_Name FROM Exams JOIN Questions_in_Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID LEFT JOIN Student_Answers ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID AND Student_Answers.Question_ID = Questions_in_Exams.Question_ID WHERE Student_Answers.Comments IS NULL
SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Satisfactory_YN IN ('Normal','Absent') GROUP BY Student_Answers.Comments HAVING COUNT(DISTINCT Student_Answers.Satisfactory_YN) = 2
SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text IN ('Normal','Absent') GROUP BY Student_Answers.Comments HAVING COUNT(DISTINCT Student_Answers.Student_Answer_Text) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_name) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_price FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Products.product_price ORDER BY COUNT(DISTINCT Customers.customer_phone) DESC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT t3.customer_phone, t5.order_quantity FROM Order_Items AS t5 JOIN Customer_Orders AS t4 ON t5.order_id = t4.order_id JOIN Customers AS t3 ON t4.customer_id = t3.customer_id WHERE t5.order_quantity IN ( SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(DISTINCT product_id) ASC LIMIT 1 )
SELECT Customers.customer_phone FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.order_quantity IN ( SELECT order_quantity FROM Order_Items GROUP BY order_quantity HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items GROUP BY order_quantity ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_name) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products EXCEPT SELECT Products.product_name FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id
SELECT DISTINCT Products.product_name FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_quantity IS NULL
SELECT t2.customer_id AS id, t2.town_city AS first_name, t2.county AS last_name FROM Customers AS t2 JOIN Orders AS t5 ON t5.customer_id = t2.customer_id JOIN Order_Items AS t6 ON t6.order_id = t5.order_id GROUP BY t2.customer_id, t2.town_city, t2.county HAVING COUNT(DISTINCT t5.order_id) > 2 AND COUNT(DISTINCT t6.order_item_id) >= 3
SELECT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.gender_code, Customers.customer_first_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(Shipment_Items.shipment_id) < 2
SELECT t1.product_id, t1.product_name, t1.product_price FROM Order_Items AS t6 JOIN Products AS t1 ON t6.product_id = t1.product_id GROUP BY t1.product_id, t1.product_name, t1.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Order_Items.product_id ) )
SELECT Orders.order_id, SUM(Products.product_price) AS sum_prices FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id ORDER BY sum_prices ASC LIMIT 1
SELECT Orders.order_id, SUM(Order_Items.order_id) AS total_cost FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders ON Orders.order_id = Order_Items.order_id JOIN Customers ON Customers.customer_id = Orders.customer_id WHERE Customers.country = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT t1.product_name) FROM Products AS t1 WHERE t1.product_id NOT IN ( SELECT t6.product_id FROM Order_Items AS t6 )
SELECT COUNT(*) FROM Products AS t1 LEFT JOIN Order_Items AS t6 ON t6.product_id = t1.product_id LEFT JOIN Shipment_Items AS t8 ON t8.order_item_id = t6.order_item_id WHERE t8.shipment_id IS NULL
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id WHERE Customer_Payment_Methods.payment_method_code IS NULL
SELECT COUNT(*) FROM Customers AS t2 LEFT JOIN Customer_Payment_Methods AS t3 ON t3.customer_id = t2.customer_id WHERE t3.payment_method_code IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code IN ( SELECT gender_code FROM Customers GROUP BY gender_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY gender_code ) ) )
SELECT Customers.email_address, Customers.town_city, Customers.county FROM Customers WHERE Customers.gender_code = ( SELECT Customers.gender_code FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id GROUP BY Customers.gender_code ORDER BY COUNT(Orders.order_id) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Director_ID FROM program JOIN director ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID, director.Name, director.Age ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(DISTINCT channel.Internet) FROM channel LEFT JOIN program ON program.Channel_ID = channel.Channel_ID WHERE program.Program_ID IS NULL
SELECT channel.Name, channel.Internet FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet ORDER BY COUNT(DISTINCT director_admin.Director_ID) DESC LIMIT 1
SELECT DISTINCT channel.Internet FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = director_admin.Director_ID WHERE director.Age < 40 INTERSECT SELECT DISTINCT channel.Internet FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = director_admin.Director_ID WHERE director.Age > 60
SELECT DISTINCT t1.Power, t1.Model FROM vehicle AS t1 JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID JOIN driver AS t2 ON t2.Driver_ID = t3.Driver_ID GROUP BY t1.Vehicle_ID, t1.Power, t1.Model HAVING COUNT(DISTINCT t3.Driver_ID) > 2 OR SUM(CASE WHEN t2.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT COUNT(*) FROM driver AS t2 LEFT JOIN vehicle_driver AS t3 ON t2.Driver_ID = t3.Driver_ID WHERE t3.Driver_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT Customers.customer_id, Customers.customer_phone, Customers.customer_address, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_phone, Customers.customer_address, Customers.customer_email ORDER BY COUNT(Order_Items.order_quantity) DESC LIMIT 1
SELECT t3.customer_id, t3.customer_phone, t3.customer_address, t3.customer_email FROM Customers AS t3 JOIN Customer_Orders AS t4 ON t4.customer_id = t3.customer_id JOIN Order_Items AS t5 ON t5.order_id = t4.order_id GROUP BY t3.customer_id, t3.customer_phone, t3.customer_address, t3.customer_email ORDER BY COUNT(DISTINCT t5.order_quantity) DESC LIMIT 1
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id LEFT JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.order_quantity IS NULL
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id LEFT JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.order_quantity IS NULL
SELECT DISTINCT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING MAX(Order_Items.order_item_id) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING SUM(Order_Items.order_item_id) > 6 OR COUNT(DISTINCT Products.product_name) > 3
SELECT region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Area ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT region.Area, region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Area, region.Capital ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT Customers.* FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.* FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Service_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(DISTINCT Services.Service_Details) DESC LIMIT 1
SELECT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Services.Service_ID) DESC LIMIT 1
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details IN ( SELECT Services.Service_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_Details HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Services.Service_Details ) ) )
SELECT DISTINCT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details IN ( SELECT Service_Details FROM Services GROUP BY Service_Details HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Services GROUP BY Service_Details ) ) )
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT Customers_and_Services.Service_ID FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' ) UNION SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' UNION SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers.Customer_ID = Customers_and_Services.Customer_ID JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Analytical_Layer.Analytical_Layer_Type_Code = 'bad'
SELECT DISTINCT t1.* FROM Services AS t1 JOIN Customers_and_Services AS t4 ON t4.Service_ID = t1.Service_ID JOIN Customers AS t2 ON t4.Customer_ID = t2.Customer_ID JOIN Analytical_Layer AS t7 ON t7.Customers_and_Services_ID = t4.Customers_and_Services_ID WHERE t2.Customer_Details = 'Hardy Kutch' AND t7.Analytical_Layer_Type_Code = 'bad'
SELECT name, Type_of_powertrain, Combined_fuel_economy_rate FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Customers.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Renting_history JOIN Customers ON Renting_history.customer_id = Customers.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(DISTINCT Classes.class_details) >= 2 ) AND Students.student_id IN ( SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(Detention.detention_summary) < 2 )
SELECT DISTINCT Students.bio_data, Students.student_id FROM Students LEFT JOIN Classes ON Classes.student_id = Students.student_id LEFT JOIN Detention ON Detention.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data HAVING COUNT(DISTINCT Classes.class_details) >= 2 OR COUNT(DISTINCT Detention.detention_summary) < 2
SELECT DISTINCT Teachers.* FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id JOIN Students ON Classes.student_id = Students.student_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT T12b.teacher_id FROM Classes AS T12b WHERE T12b.class_details LIKE 'net%' )
SELECT DISTINCT t10.* FROM Teachers AS t10 JOIN Classes AS t12_data ON t12_data.teacher_id = t10.teacher_id JOIN Students AS t1_data ON t1_data.student_id = t12_data.student_id WHERE t1_data.bio_data LIKE '%data%' AND NOT EXISTS ( SELECT 1 FROM Classes AS t12_net JOIN Students AS t1_net ON t1_net.student_id = t12_net.student_id WHERE t12_net.teacher_id = t10.teacher_id AND t1_net.bio_data LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Students JOIN Achievements ON Achievements.student_id = Students.student_id JOIN Student_Loans ON Student_Loans.student_id = Students.student_id GROUP BY Students.student_id HAVING COUNT(Achievements.other_details) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Achievements ON Achievements.student_id = Students.student_id GROUP BY Students.student_id, Student_Loans.student_loan_id HAVING COUNT(Achievements.other_details) >= 2
SELECT t12.class_details, t10.teacher_id FROM Classes AS t12 JOIN Teachers AS t10 ON t12.teacher_id = t10.teacher_id GROUP BY t10.teacher_id, t12.class_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.class_details, Teachers.teacher_id FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id GROUP BY Teachers.teacher_id, Classes.class_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT t1.bio_data, t12.class_details FROM Behaviour_Monitoring AS t3 JOIN Students AS t1 ON t3.student_id = t1.student_id JOIN Classes AS t12 ON t12.student_id = t1.student_id WHERE t3.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND t1.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT Students.bio_data, Classes.class_details FROM Students JOIN Classes ON Classes.student_id = Students.student_id WHERE Classes.teacher_id IN ( SELECT teacher_id FROM Classes GROUP BY teacher_id HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Classes GROUP BY teacher_id ) ) ) AND Students.student_id IN ( SELECT T12a.student_id FROM Classes AS T12a JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = T12a.student_id GROUP BY T12a.student_id HAVING COUNT(DISTINCT Behaviour_Monitoring.behaviour_monitoring_details) >= 2 ) AND Classes.teacher_id IN ( SELECT teacher_id FROM Classes GROUP BY teacher_id HAVING COUNT(*) = 3 )
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id GROUP BY Students.student_id, Students.bio_data, Students.student_details HAVING COUNT(DISTINCT Behaviour_Monitoring.behaviour_monitoring_details) = 1 AND MIN(Behaviour_Monitoring.behaviour_monitoring_details) = ( SELECT T3b.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3b GROUP BY T3b.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.bio_data FROM Students JOIN Classes ON Classes.student_id = Students.student_id WHERE Classes.class_details = ( SELECT Classes.class_details FROM Classes GROUP BY Classes.class_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS number, Ref_Event_Types.event_type_description AS event_type, Classes.class_details AS description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code JOIN Classes ON Classes.student_id = Student_Events.student_id GROUP BY Ref_Event_Types.event_type_description, Classes.class_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Students.student_details) AS num_students, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Students ON Student_Events.student_id = Students.student_id JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(DISTINCT Students.student_details) DESC LIMIT 1
SELECT COUNT(DISTINCT Classes.teacher_id) FROM Student_Loans JOIN Classes ON Student_Loans.student_id = Classes.student_id LEFT JOIN Achievements ON Student_Loans.student_id = Achievements.student_id WHERE Achievements.other_details IS NULL
SELECT COUNT(DISTINCT t10.teacher_id) FROM Teachers AS t10 JOIN Classes AS t12 ON t12.teacher_id = t10.teacher_id JOIN Students AS s ON s.student_id = t12.student_id WHERE s.student_id NOT IN ( SELECT DISTINCT t15.student_id FROM Achievements AS t15 WHERE t15.achievement_details IS NOT NULL )
SELECT t5.event_type_code, t5.event_type_description FROM Detention AS t14 JOIN Ref_Detention_Type AS t8 ON t14.detention_type_code = t8.detention_type_code JOIN Ref_Event_Types AS t5 ON t14.detention_summary = t5.event_type_code GROUP BY t5.event_type_code, t5.event_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT t5.event_type_code, t5.event_type_description, t14.detention_summary FROM Detention AS t14 JOIN Ref_Detention_Type AS t8 ON t14.detention_type_code = t8.detention_type_code JOIN Ref_Event_Types AS t5 ON t8.detention_type_description = t5.event_type_code GROUP BY t5.event_type_code, t5.event_type_description, t14.detention_summary ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Classes.class_details FROM Classes JOIN Students ON Classes.student_id = Students.student_id WHERE Classes.teacher_id > (SELECT AVG(teacher_id) FROM Classes)
SELECT Students.bio_data, Classes.class_details FROM Students JOIN Classes ON Classes.student_id = Students.student_id WHERE Classes.teacher_id > (SELECT AVG(teacher_id) FROM Classes)
SELECT DISTINCT Teachers.teacher_id, Teachers.teacher_details FROM Classes JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.student_id = ( SELECT Transcripts.student_id FROM Transcripts ORDER BY Transcripts.date_of_transcript ASC LIMIT 1 )
SELECT DISTINCT Teachers.teacher_details, Classes.class_details FROM Transcripts JOIN Classes ON Classes.student_id = Transcripts.student_id JOIN Teachers ON Teachers.teacher_id = Classes.teacher_id WHERE Transcripts.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
