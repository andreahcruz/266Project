SELECT COUNT(club.Club_ID) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Wins_count ASC
SELECT player.Events_number FROM player JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manufacturer > 1200000
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer HAVING count(*) > 1
SELECT club.Manufacturer FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(club.Club_ID) > 1
SELECT player.Country FROM player WHERE player.Player_ID > 1
SELECT player.Country FROM player WHERE player.Earnings > 1
SELECT COUNT(DISTINCT player.Country) FROM player
SELECT COUNT(DISTINCT player.Country) FROM player
SELECT COUNT(Customers.customer_id) FROM Customers AS Customers JOIN Orders AS Orders ON Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers
SELECT count(*) FROM Orders
SELECT DISTINCT order_status_code FROM Orders WHERE date_order_placed IS NOT NULL
SELECT COUNT(payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(shipment_id) FROM Shipments
SELECT COUNT(product_name) FROM Products
SELECT product_price FROM Products
SELECT AVG(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT product_price FROM Products
SELECT COUNT(DISTINCT channel.Internet) FROM channel WHERE channel.Analogue_terrestrial_channel = 'digital terrestrial'
SELECT program.Title FROM program INNER JOIN channel ON program.Channel_ID = channel.Channel_ID ORDER BY program.Start_Year DESC
SELECT director.Name FROM director WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio WHERE Radio_MHz = 'radios'
SELECT radio.Transmitter FROM radio AS radio JOIN city_channel_radio AS city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT radio.Transmitter FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE city_channel.Affiliation != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio WHERE Radio_ID = (SELECT Radio_ID FROM radio WHERE Transmitter = 'radios')
SELECT city_channel.Affiliation FROM city_channel WHERE city_channel.City IN ( SELECT city_channel.City FROM city_channel GROUP BY city_channel.City HAVING COUNT(city_channel.City) > 3 )
SELECT driver.Citizenship FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID
SELECT driver.Driver_ID FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT count(*) FROM vehicle_driver WHERE driver.Name = 'NASCAR'
SELECT COUNT(driver.Name) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID = 1 AND driver.Racing_Series = 'NASCAR'
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT driver.Name FROM vehicle_driver JOIN driver ON vehicle_driver.Vehicle_ID = driver.Driver_ID
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID ORDER BY driver.Name ASC
SELECT count(*) FROM Exams WHERE Exam_Name = 'exams'
SELECT count(*) FROM Exams WHERE Exam_Name = 'exams'
SELECT DISTINCT Exams.Subject_Code FROM Exams ORDER BY Exams.Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT DISTINCT Student_Answers.Student_ID FROM Student_Answers INNER JOIN Valid_Answers ON Student_Answers.Question_ID = Valid_Answers.Question_ID WHERE Valid_Answers.Valid_Answer_Text = 'Normal'
SELECT DISTINCT Student_Assessments.Assessment FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Exam_ID JOIN Questions_in_Exams ON Student_Answers.Question_ID = Questions_in_Exams.Question_ID WHERE Student_Answers.Student_ID = 1 AND Student_Assessments.Student_Answer_Text = "Normal"
SELECT COUNT(DISTINCT Student_Answers.Comments) FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT COUNT(DISTINCT Student_Answers.Comments) FROM Student_Answers
SELECT Students.First_Name FROM Students WHERE Students.Gender_MFU != "M"
SELECT Student_Assessments.Satisfactory_YN FROM Students AS Students INNER JOIN Student_Assessments ON Students.Gender_MFU != "M" AND Students.Student_ID = Student_Assessments.Student_Answer_ID
SELECT Questions_in_Exams.Question_ID FROM Questions AS Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions_in_Exams.Question_ID HAVING COUNT(Questions.Question_ID) >= 3
SELECT Questions_in_Exams.Question_ID FROM Questions_in_Exams WHERE Questions_in_Exams.Question_ID IN (SELECT Questions.Question_ID FROM Questions GROUP BY Questions.Question_ID HAVING COUNT(Questions.Question_ID) >= 3)
SELECT Students.Student_ID , Students.First_Name , Students.Middle_Name , Students.Last_Name , Students.Gender_MFU , Students.Student_Address FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(product_name) FROM Products
SELECT COUNT(product_name) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(product_id) FROM Products WHERE product_type_code = "hardware type"
SELECT COUNT(product_id) FROM Products WHERE product_type_code = "Hardware"
SELECT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(product_name) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_name) > 1
SELECT COUNT(customer_phone) FROM Customers
SELECT COUNT(customer_phone) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT customer_address FROM Customers WHERE customer_phone IS NOT NULL
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(Customer_Orders.order_id) FROM Customers AS Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(Customers.customer_phone) FROM Customers AS Customers JOIN Order_Items AS Customer_Orders ON Customers.customer_id = Customer_Orders.order_id WHERE Customer_Orders.order_quantity IS NOT NULL
SELECT COUNT(Customers.customer_phone) FROM Customers AS Customers INNER JOIN Customer_Orders AS Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_status_code = 'order'
SELECT club.Manager, club.Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name , player.Events_number FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID
SELECT player.Events_number, club.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2 GROUP BY club.Club_ID HAVING count(*) > 1
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2
SELECT player.Events_number FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE club.Captain = "Sam Allardyce"
SELECT club.Manufacturer , count(*) FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Manufacturer
SELECT club.Manufacturer, COUNT(club.Club_ID) FROM club INNER JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Manufacturer
SELECT player.Earnings FROM player WHERE player.Country = "Australia" OR player.Country = "Zimbabwe"
SELECT player.Earnings FROM player AS player JOIN club AS club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT Orders.order_id, Orders.date_order_placed, count(Products.product_id) FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id WHERE Products.product_name IS NOT NULL GROUP BY Orders.order_id
SELECT Products.product_name, COUNT(Products.product_name), Invoices.invoice_status_code, Products.product_id FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id JOIN Invoices AS Invoices ON Orders.order_id = Invoices.invoice_number GROUP BY Products.product_id
SELECT Products.product_id, Products.product_size FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.product_id IN ( SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(product_name) >= 2 )
SELECT Orders.order_id , Orders.date_order_placed FROM Orders INNER JOIN Products ON Products.product_id = Orders.customer_id WHERE Products.product_name = 'products' GROUP BY Orders.order_id HAVING count(*) >= 2
SELECT Customers.gender_code , sum(Orders.order_id) FROM Customers AS Customers JOIN Orders AS Orders ON Orders.customer_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT Orders.customer_id, Orders.order_status_code FROM Orders WHERE Orders.order_id IN (SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code , Customers.customer_middle_initial , Customers.customer_first_name , Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Orders.date_order_placed FROM Invoices INNER JOIN Orders ON Invoices.invoice_number = Orders.order_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices INNER JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number
SELECT Order_Items.order_item_status_code , Shipments.shipment_tracking_number FROM Order_Items INNER JOIN Shipments ON Order_Items.order_id = Shipments.order_id WHERE Shipments.shipment_id = Shipment_Items.shipment_id AND Shipment_Items.order_item_id = Order_Items.product_id
SELECT Order_Items.order_item_status_code , Shipments.shipment_tracking_number FROM Invoices AS Invoices JOIN Shipments AS Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Order_Items AS Order_Items ON Order_Items.order_id = Shipments.order_id WHERE Order_Items.order_id = Shipments.order_id AND Shipments.shipment_date = Order_Items.invoice_date
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT Customers.customer_first_name , Customers.login_password FROM Customers AS Customers JOIN Orders AS Orders ON Orders.customer_id = Customers.customer_id WHERE Customers.phone_number LIKE '+12%'
SELECT product_name FROM Products WHERE product_color LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT Orders.order_status_code , Orders.date_order_placed FROM Orders
SELECT Orders.order_status_code , Orders.date_order_placed FROM Orders
SELECT Customers.address_line_1 , Customers.town_city , Customers.county FROM Customers WHERE Customers.town_city = "USA"
SELECT customer_first_name, town_city, county FROM Customers
SELECT Products.product_id, Products.product_description FROM Products WHERE Products.product_price > 3
SELECT Products.product_id, Products.product_description FROM Products AS Products JOIN Shipment_Items AS Orders ON Orders.order_item_id = Products.product_id GROUP BY Products.product_id HAVING count(*) > 3
SELECT Invoices.invoice_number , Invoices.shipment_date FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Orders ON Orders.order_id = Shipment_Items.order_item_id GROUP BY Invoices.invoice_number HAVING COUNT(Orders.date_order_placed) >= 2
SELECT Shipments.shipment_date , Shipments.shipment_id FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id GROUP BY Shipments.shipment_id HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Shipments.shipment_date , Shipments.shipment_tracking_number FROM Shipments
SELECT Shipments.shipment_tracking_number , Shipments.shipment_date FROM Shipments
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID ORDER BY channel.Start_Year DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID ORDER BY channel.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel AS channel JOIN program AS program ON program.Channel_ID = channel.Channel_ID WHERE program.Start_Year > 1
SELECT channel.Name, COUNT(program.Program_ID) FROM channel INNER JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Name
SELECT director.Name FROM program AS channel INNER JOIN director ON channel.Director_ID = director.Director_ID INNER JOIN channel AS program ON channel.Channel_ID = program.Channel_ID WHERE channel.Title = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Next_show_name FROM tv_show AS tv_show INNER JOIN city_channel_tv_show AS city_channel_tv_show ON tv_show.tv_show_ID = city_channel_tv_show.tv_show_ID
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio AS radio INNER JOIN city_channel_radio AS city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT city_channel.Affiliation , COUNT(city_channel.ID) FROM city_channel JOIN city_channel_tv_show ON city_channel_tv_show.City_channel_ID = city_channel.ID GROUP BY city_channel.Affiliation
SELECT city_channel.City, city_channel_tv_show.Affiliation FROM city_channel INNER JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID WHERE city_channel.City = 'city' ORDER BY city_channel_tv_show.Affiliation ASC
SELECT radio.Transmitter, radio.Radio_MHz, city_channel.City FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter , COUNT(city_channel_tv_show.City_channel_ID) FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel_tv_show ON city_channel_radio.City_channel_ID = city_channel_tv_show.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(vehicle.Power), AVG(vehicle.Power) FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = 'Zhuzhou'
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Build_Year , vehicle.Model , vehicle.Builder FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year , vehicle.Model , vehicle.Builder FROM vehicle
SELECT COUNT(vehicle_driver.Driver_ID) FROM vehicle AS vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = "2012"
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT vehicle.Model FROM vehicle WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Name , vehicle.Build_Year FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Model LIKE "%DJ%"
SELECT driver.Racing_Series, COUNT(*) FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID GROUP BY driver.Racing_Series
SELECT vehicle_driver.Driver_ID, count(*) FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle_driver.Driver_ID
SELECT Exams.Subject_Code , Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name NOT LIKE "Database"
SELECT Exam_Date, Subject_Code FROM Exams WHERE Subject_Code != "Database"
SELECT Questions_in_Exams.Question_ID , COUNT(*) FROM Questions_in_Exams JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID GROUP BY Questions_in_Exams.Question_ID
SELECT T2.Type_of_Question_Code , COUNT(Questions.Question_ID) FROM Questions AS Questions JOIN Questions AS T2 ON Questions.Question_ID = T2.Question_ID GROUP BY T2.Type_of_Question_Code
SELECT Student_Assessments.Assessment FROM Student_Assessments WHERE Student_Assessments.Valid_Answer_ID IN ( SELECT Valid_Answers.Question_ID FROM Valid_Answers WHERE Valid_Answers.Valid_Answer_ID IN ( SELECT Student_Answers.Student_ID FROM Student_Answers WHERE Student_Answers.Exam_ID IN ( SELECT Questions_in_Exams.Exam_ID FROM Questions_in_Exams WHERE Questions_in_Exams.Question_ID IN ( SELECT Questions.Question_ID FROM Questions WHERE Questions.Type_of_Question_Code = 'student' ) ) ) ) GROUP BY Student_Assessments.Assessment ORDER BY COUNT(Student_Assessments.Assessment) DESC
SELECT Gender_MFU FROM Students GROUP BY Gender_MFU ORDER BY COUNT(Gender_MFU) DESC
SELECT Exams.Exam_Name, Student_Answers.Date_of_Answer FROM Exams JOIN Student_Answers ON Exams.Exam_ID = Student_Answers.Student_ID JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.First_Name , Exams.Exam_Date FROM Students AS Students INNER JOIN Exams AS Exams ON Students.Student_ID = Exams.Exam_ID
SELECT Students.Email_Adress , Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress , Exams.Exam_Date FROM Exams AS Exams JOIN Students AS Students ON Exams.Exam_ID = Students.Student_ID ORDER BY Exams.Exam_Date DESC
SELECT Student_Assessments.Valid_Answer_ID FROM Student_Assessments INNER JOIN Student_Answers ON Student_Assessments.Student_Answer_ID = Student_Answers.Student_Answer_Text WHERE Student_Answers.Exam_ID IN (SELECT Exam_ID FROM Questions_in_Exams GROUP BY Exam_ID HAVING COUNT(*) >= 2)
SELECT Students.First_Name FROM Students INNER JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_ID) >= 2
SELECT Students.Gender_MFU , COUNT(Students.Student_ID) FROM Students GROUP BY Students.Gender_MFU
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT player.Country FROM player AS player JOIN club AS club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 2 GROUP BY player.Player_ID ORDER BY count(*) DESC LIMIT 1
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY avg(player.Earnings) DESC
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT club.Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT T5.Manufacturer FROM club AS T4 JOIN player AS T5 ON T4.Club_ID = T5.Club_ID GROUP BY T5.Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Club_ID FROM club WHERE Club_ID IS NULL
SELECT club.Club_ID FROM club WHERE club.Club_ID NOT IN ( SELECT player.Club_ID FROM player )
SELECT player.Country FROM player WHERE player.Earnings > 1400000 INTERSECT SELECT player.Country FROM player WHERE player.Earnings < 1100000
SELECT player.Country FROM player WHERE player.Earnings > 1400000 INTERSECT SELECT player.Country FROM player WHERE player.Earnings < 1100000
SELECT Shipments.shipment_date FROM Shipments WHERE Shipments.order_id = ( SELECT Orders.date_order_placed FROM Orders ORDER BY Orders.date_order_placed ASC LIMIT 1 ) OR Shipments.order_id > 1
SELECT Shipments.shipment_date FROM Shipments WHERE Shipments.order_id IN (SELECT Orders.order_id FROM Orders GROUP BY Orders.order_id HAVING COUNT(Orders.order_id) > 1)
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_id < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods INNER JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(Customer_Payment_Methods.payment_method_code) DESC LIMIT 1
SELECT Customers.gender_code , COUNT(Products.product_name) FROM Products AS Products JOIN Customers AS Customers ON Products.parent_product_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT Products.product_name, COUNT(*) FROM Products GROUP BY Products.product_name
SELECT Products.product_name, Shipments.shipment_date FROM Shipments JOIN Products ON Shipments.order_id = Products.product_id
SELECT Order_Items.product_name , Shipments.shipment_date FROM Shipments INNER JOIN Order_Items ON Shipments.order_id = Order_Items.order_id WHERE Shipments.shipment_id IN ( SELECT shipment_id FROM Shipments )
SELECT Products.product_name , Products.product_color FROM Products JOIN Orders ON Products.product_id = Orders.customer_id WHERE Orders.date_order_placed = Shipments.shipment_date AND Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Products.product_name , Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id WHERE Shipments.shipment_id > 0
SELECT Invoices.invoice_number , Invoices.shipment_tracking_number FROM Invoices AS Invoices JOIN Shipments AS Shipments ON Invoices.invoice_number = Shipments.invoice_number WHERE Shipments.shipment_id NOT IN (SELECT shipment_id FROM Orders AS Orders WHERE Orders.customer_id = Shipments.shipment_id)
SELECT Invoices.invoice_number FROM Invoices AS Invoices JOIN Shipments AS Shipments ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_id = (SELECT shipment_id FROM Shipments WHERE order_id = (SELECT order_id FROM Orders WHERE date_order_placed = '00:00:00'))
SELECT Orders.customer_id, Orders.date_order_placed, Orders.customer_id FROM Orders
SELECT Orders.order_id, Orders.date_order_placed, Orders.customer_id FROM Orders
SELECT Products.product_color , Products.product_name FROM Products
SELECT Products.parent_product_id , Products.product_name FROM Products
SELECT Orders.date_order_placed FROM Customers AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id GROUP BY Orders.customer_id HAVING count(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2
SELECT Orders.date_order_placed FROM Customers AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.customer_id > 1
SELECT order_status_code FROM Orders WHERE order_id IN (SELECT order_id FROM Orders GROUP BY order_id ORDER BY COUNT(order_id) LIMIT 1)
SELECT MIN(order_status_code) FROM Orders
SELECT director.Name FROM director INNER JOIN program ON director.Director_ID = program.Director_ID INNER JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE director.Age > ( SELECT CAST(SUM(director.Age) AS REAL) / COUNT(director.Director_ID) FROM director INNER JOIN program ON director.Director_ID = program.Director_ID INNER JOIN channel ON program.Channel_ID = channel.Channel_ID )
SELECT channel.Channel_ID , channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID WHERE channel.Internet != "Hank Baskett"
SELECT city_channel_radio.Affiliation FROM city_channel AS city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel_radio.Affiliation ORDER BY COUNT(city_channel_radio.Affiliation) DESC LIMIT 1
SELECT radio.Transmitter, radio.Radio_MHz, radio.RnaG_MHz FROM radio AS radio INNER JOIN city_channel_radio AS city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel AS city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE radio.Radio_MHz = 'radios' ORDER BY radio.ERP_kW DESC
SELECT DISTINCT radio.Transmitter FROM radio WHERE radio.Radio_MHz NOT IN (SELECT radio.Radio_MHz FROM radio JOIN city_channel ON radio.Radio_MHz = city_channel.Affiliation)
SELECT vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, MAX(vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle_driver.Driver_ID
SELECT vehicle_driver.Driver_ID, count(*) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle_driver.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle WHERE vehicle.Power = (SELECT MIN(vehicle.Power) FROM vehicle)
SELECT vehicle_driver.Driver_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Vehicle_ID = driver.Driver_ID WHERE driver.Racing_Series = ( SELECT Racing_Series FROM driver ORDER BY Racing_Series ASC LIMIT 1 )
SELECT DISTINCT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE vehicle.Power > 5000
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Name FROM driver WHERE Name NOT IN (SELECT Citizenship FROM vehicle_driver)
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT vehicle.Power, vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Ziyang') OR vehicle.Top_Speed = 2
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE driver.Driver_ID IN (SELECT driver.Driver_ID FROM driver WHERE driver.Name = "Ziyang") OR vehicle.Builder = "Ziyang"
SELECT vehicle.Power FROM vehicle WHERE vehicle.Top_Speed = ( SELECT MAX(vehicle.Top_Speed) FROM vehicle )
SELECT COUNT(vehicle_driver.Power) FROM vehicle_driver INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle_driver.Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Citizenship , driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM vehicle_driver AS vehicle_driver JOIN driver ON vehicle_driver.Vehicle_ID = driver.Driver_ID WHERE vehicle_driver.Driver_ID IN (SELECT Driver_ID FROM vehicle_driver WHERE Power = (SELECT Power FROM vehicle WHERE Model = 'DJ1'))
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Exam_Name LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Assessments.Assessment FROM Student_Assessments GROUP BY Student_Assessments.Assessment ORDER BY COUNT(Student_Assessments.Assessment) LIMIT 1
SELECT Assessment FROM Student_Assessments ORDER BY Valid_Answer_ID ASC LIMIT 1
SELECT Student_Assessments.Student_Answer_ID FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID WHERE Valid_Answers.Valid_Answer_Text = 'valid' GROUP BY Student_Assessments.Student_Answer_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(Valid_Answer_Text) DESC LIMIT 1
SELECT Students.First_Name FROM Students WHERE Students.Student_ID NOT IN (SELECT Student_Answers.Student_ID FROM Student_Answers)
SELECT Students.First_Name FROM Students WHERE Students.Student_ID NOT IN ( SELECT Student_Answers.Student_ID FROM Student_Answers )
SELECT Student_Answers.Comments FROM Student_Answers JOIN Valid_Answers ON Valid_Answers.Valid_Answer_ID = Student_Answers.Exam_ID WHERE Student_Answers.Student_Answer_Text = 'Normal' INTERSECT SELECT Student_Answers.Comments FROM Student_Answers JOIN Valid_Answers ON Valid_Answers.Valid_Answer_ID = Student_Answers.Exam_ID WHERE Student_Answers.Student_Answer_Text = 'Absent'
SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Normal' INTERSECT SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Absent'
SELECT Products.product_name , Products.product_price FROM Products WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT Products.product_type_code FROM Products WHERE Products.product_price > ( SELECT avg(product_price) FROM Products )
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT Products.product_name FROM Products WHERE Products.product_price = (SELECT max(product_price) FROM Products)
SELECT Products.product_id , Products.product_name FROM Products WHERE Products.product_type_code = "Hardware" ORDER BY Products.product_price LIMIT 1
SELECT Products.product_id , Products.product_type_code FROM Products WHERE Products.product_name = 'Hardware' ORDER BY Products.product_price LIMIT 1
SELECT T2.product_type_code FROM Products AS Products JOIN Products AS T2 ON Products.product_id = T2.product_id GROUP BY T2.product_type_code ORDER BY COUNT(Products.product_id) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT customer_address FROM Customers WHERE customer_phone GROUP BY customer_address ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers GROUP BY customer_name ORDER BY COUNT(customer_name) DESC LIMIT 1
SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(customer_phone) LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_id) LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) ASC LIMIT 1
SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Order_Items.order_quantity FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Order_Items.order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_name FROM Products WHERE Products.product_id NOT IN (SELECT Order_Items.product_id FROM Order_Items WHERE Order_Items.order_quantity != '')
SELECT Products.product_name FROM Products WHERE Products.product_name NOT IN (SELECT Order_Items.order_quantity FROM Order_Items)
SELECT Shipment_Items.shipment_id, Customers.gender_code, Customers.customer_first_name FROM Customers INNER JOIN Shipment_Items ON Shipment_Items.shipment_id = Customers.customer_id INNER JOIN Order_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id INNER JOIN Orders ON Orders.order_id = Order_Items.product_id WHERE Orders.customer_id = Customers.customer_id GROUP BY Shipment_Items.shipment_id HAVING COUNT(Shipment_Items.shipment_id) > 2 INTERSECT SELECT Shipment_Items.shipment_id FROM Shipment_Items WHERE Shipment_Items.order_item_id > 2 INTERSECT SELECT Order_Items.product_id FROM Order_Items WHERE Order_Items.order_id > 3
SELECT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers AS Products JOIN Orders AS Customers ON Products.customer_id = Customers.customer_id JOIN Order_Items AS Customer_Payment_Methods ON Customers.order_id = Customer_Payment_Methods.order_id WHERE Customer_Payment_Methods.product_id > 2 AND Customer_Payment_Methods.product_id >= 3
SELECT gender_code , customer_first_name , customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products AS Products LEFT JOIN Orders AS Orders ON Products.product_id = Orders.customer_id WHERE Orders.date_order_placed = '00:00:00'
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items AS Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Shipments AS Shipments ON Shipments.order_id = Shipments.order_id JOIN Orders AS Orders ON Orders.customer_id = Shipments.order_id JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Orders.customer_id WHERE Order_Items.order_id = Orders.order_id GROUP BY Products.product_name ORDER BY COUNT(Order_Items.order_id) DESC LIMIT 1
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Order_Items.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id , SUM(Products.product_price) FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Orders.order_id, sum(Order_Items.product_id) FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id ORDER BY sum(Order_Items.product_id) ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Customers AS Customers ON Order_Items.order_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT Products.product_name, Products.product_price, Products.product_description FROM Products AS Products JOIN Customers AS Customers ON Products.product_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT product_name , product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(product_name) FROM Products WHERE parent_product_id = 0
SELECT COUNT(Products.product_name) FROM Products WHERE Products.product_id NOT IN (SELECT Order_Items.product_id FROM Order_Items)
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.payment_method_code IS NULL
SELECT count(*) FROM Customers WHERE gender_code IS NULL
SELECT Customers.email_address , Customers.town_city , Customers.county FROM Customers GROUP BY Customers.gender_code ORDER BY COUNT(Customers.gender_code) ASC LIMIT 1
SELECT Customers.email_address, Customers.town_city, Customers.county FROM Customers WHERE Customers.gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(gender_code) ASC LIMIT 1)
SELECT product_color , product_description , product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT product_size , product_description , product_color FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT director.Director_ID , count(*) FROM program AS channel JOIN director AS director ON channel.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY count(*) DESC LIMIT 1
SELECT director.Name, director.Age FROM director INNER JOIN program ON director.Director_ID = program.Director_ID INNER JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE program.Program_ID = ( SELECT MAX(Program_ID) FROM program )
SELECT COUNT(Internet) FROM channel WHERE Analogue_terrestrial_channel IS NULL
SELECT channel.Name, channel.Internet FROM channel AS channel JOIN program AS program ON program.Channel_ID = channel.Channel_ID JOIN director AS director ON director.Director_ID = program.Director_ID GROUP BY channel.Name, channel.Internet ORDER BY COUNT(director.Director_ID) DESC LIMIT 1
SELECT director.Name FROM program AS director JOIN channel AS channel ON director.Channel_ID = channel.Channel_ID WHERE channel.Analogue_terrestrial_channel > 60 AND channel.Analogue_terrestrial_channel < 40
SELECT vehicle.Power, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'Jeff Gordon' OR vehicle_driver.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING count(*) > 2)
SELECT vehicle.Vehicle_ID , vehicle.Model FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'Jeff Gordon' OR vehicle_driver.Vehicle_ID IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver AS vehicle_driver JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle_driver.Vehicle_ID HAVING count(*) > 2)
SELECT COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver WHERE vehicle_driver.Vehicle_ID NOT IN (SELECT vehicle.Vehicle_ID FROM vehicle)
SELECT COUNT(driver.Driver_ID) FROM driver WHERE driver.Racing_Series NOT IN (SELECT vehicle.Builder FROM vehicle WHERE vehicle.Power = driver.Driver_ID)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT Products.product_type_code FROM Products WHERE Products.product_name = 'Hardware' AND Products.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT Customers.customer_phone , Customers.customer_number , Customers.address_id , Customers.customer_email FROM Customers INNER JOIN Order_Items ON Customers.customer_id = Order_Items.order_id INNER JOIN Customer_Orders ON Order_Items.order_item_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id = (SELECT Customer_Orders.customer_id FROM Customer_Orders GROUP BY Customer_Orders.customer_id ORDER BY COUNT(Customer_Orders.customer_id) DESC LIMIT 1)
SELECT Customers.customer_id , Customers.customer_phone , Customers.address_id , Customers.customer_email FROM Customers AS Customers JOIN Order_Items AS Customer_Orders ON Customers.customer_id = Customer_Orders.order_id GROUP BY Customers.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(Customers.customer_phone) FROM Customers WHERE Customers.customer_phone NOT IN (SELECT Order_Items.order_quantity FROM Order_Items)
SELECT COUNT(Customers.customer_phone) FROM Customers WHERE Customers.customer_phone NOT IN (SELECT Customers.customer_phone FROM Customers INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NOT NULL)
SELECT Customer_Orders.order_date, Customer_Orders.order_id FROM Order_Items AS Products JOIN Customer_Orders ON Products.order_id = Customer_Orders.order_id WHERE Products.product_id = (SELECT product_id FROM Products WHERE product_price > 6) OR Products.product_id = (SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(product_id) > 3)
SELECT Order_Items.order_item_id , Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.product_id = 1 AND (Order_Items.product_id > 6 OR Order_Items.product_id > 3)
SELECT region.Capital FROM building AS building JOIN region ON building.Region_ID = region.Region_ID ORDER BY building.Name DESC LIMIT 1
SELECT region.Name, region.Capital FROM region WHERE region.Area IN (SELECT building.Number_of_Stories FROM building GROUP BY building.Number_of_Stories ORDER BY COUNT(building.Number_of_Stories) DESC LIMIT 1)
SELECT Analytical_Layer.Customers_and_Services_ID, Analytical_Layer.Pattern_Recognition, Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = ( SELECT Services.Service_Details FROM Services GROUP BY Services.Service_Details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Analytical_Layer.Customers_and_Services_ID, Analytical_Layer.Pattern_Recognition, Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = (SELECT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Analytical_Layer ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(Analytical_Layer.Customers_and_Services_ID) DESC LIMIT 1)
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID JOIN Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(Customers.Customer_Details) DESC LIMIT 1
SELECT Customer_Interactions.Status_Code , Customer_Interactions.Services_and_Channels_Details , Services.Service_Details FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Customers_and_Services AS Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customer_Interactions.Status_Code , Customer_Interactions.Services_and_Channels_Details ORDER BY COUNT(Customer_Interactions.Status_Code) DESC LIMIT 1
SELECT Analytical_Layer.Customers_and_Services_ID , Analytical_Layer.Pattern_Recognition , Analytical_Layer.Analytical_Layer_Type_Code FROM Analytical_Layer INNER JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Services.Service_Details = ( SELECT Services.Service_Details FROM Services GROUP BY Services.Service_Details ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID JOIN Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Services.Customers_and_Services_Details = (SELECT Customers_and_Services_Details FROM Customers_and_Services GROUP BY Customers_and_Services_Details ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Customers.Service_Details FROM Services AS Services JOIN Customers_and_Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers AS Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = "Hardy Kutch" INTERSECT SELECT Customers.Service_Details FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID JOIN Customers AS Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customer_Interactions.Status_Code = "good"
SELECT Customers.Customer_Details FROM Customers AS Services JOIN Customers_and_Services AS Customers ON Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customers_and_Services_Details = 'Hardy Kutch' INTERSECT SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customer_Interactions AS Customers ON Services.Service_ID = Customers.Customer_ID WHERE Customers.Status_Code = 'good'
SELECT Customers.Service_Details FROM Services AS Services JOIN Customers_and_Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers AS Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions AS Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Status_Code = 'bad' AND Customers.Customer_Details = 'Hardy Kutch'
SELECT Customers.Customer_Details FROM Customers INNER JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID INNER JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customer_Interactions.Status_Code = 'bad' AND Customers.Customer_Details = 'Hardy Kutch' AND Services.Service_Details = Customer_Interactions.Services_and_Channels_Details
SELECT Vehicles.name , Vehicles.Type_of_powertrain , Vehicles.Combined_fuel_economy_rate FROM Vehicles JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT Discount.name , Vehicles.Type_of_powertrain , Vehicles.Annual_fuel_cost FROM Vehicles AS Vehicles JOIN Renting_history AS Renting_history ON Renting_history.vehicles_id = Vehicles.id JOIN Customers AS Customers ON Renting_history.customer_id = Customers.id JOIN Discount AS Discount ON Customers.id = Discount.id WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT Vehicles.Notes, Vehicles.Model_year FROM Renting_history AS Customers JOIN Vehicles ON Customers.vehicles_id = Vehicles.id JOIN Discount ON Customers.discount_id = Discount.id GROUP BY Vehicles.Notes ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Vehicles.Notes, Vehicles.Model_year FROM Renting_history AS Renting_history INNER JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id INNER JOIN Discount ON Renting_history.discount_id = Discount.id WHERE Renting_history.id = ( SELECT MAX(id) FROM Renting_history )
SELECT Discount.name FROM Renting_history AS Customers JOIN Discount AS Discount ON Customers.discount_id = Discount.id JOIN Vehicles AS Vehicles ON Customers.vehicles_id = Vehicles.id GROUP BY Discount.name ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Discount.name FROM Renting_history AS Renting_history JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Students.bio_data , Students.student_id FROM Students AS Students JOIN Behaviour_Monitoring AS Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = '2 or more classes' INTERSECT SELECT Students.bio_data , Students.student_id FROM Students AS Students JOIN Students AS Transcripts ON Students.student_details = Transcripts.student_details WHERE Transcripts.student_id NOT IN (SELECT Students.student_id FROM Students AS Students JOIN Detention AS Detention ON Students.student_id = Detention.student_id WHERE Detention.detention_summary < 2)
SELECT Students.bio_data , Students.student_id FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = 'classes' INTERSECT SELECT Students.bio_data , Students.student_id FROM Students JOIN Classes ON Classes.student_id = Students.student_id WHERE Classes.class_details = 'classes' INTERSECT SELECT Students.bio_data , Students.student_id FROM Students WHERE Students.student_details = 'student' AND Students.student_id NOT IN (SELECT Students.student_id FROM Students JOIN Detention ON Detention.student_id = Students.student_id WHERE Detention.detention_summary = 'detentions' GROUP BY Students.student_id HAVING COUNT(*) >= 2)
SELECT Achievements.achievement_type_code, Achievements.date_achievement, Achievements.achievement_details, Achievements.other_details FROM Achievements JOIN Classes ON Achievements.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Achievements.achievement_type_code LIKE '%data%' AND Classes.class_details NOT LIKE 'net%'
SELECT T5.teacher_details FROM Classes AS Students INNER JOIN Teachers AS T2_1 ON Students.teacher_id = T2_1.teacher_id INNER JOIN Students AS T3_1 ON Students.student_id = T3_1.student_id INNER JOIN Achievements AS T4_1 ON T3_1.student_id = T4_1.student_id INNER JOIN Teachers AS T5 ON Students.student_id = T5.teacher_id WHERE Students.class_details LIKE '%data%' AND Students.class_details NOT LIKE 'net%'
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Achievements ON Students.student_id = Achievements.student_id GROUP BY Student_Loans.student_id HAVING Count(Achievements.other_details) >= 2
SELECT Student_Loans.amount_of_loan, Students_Addresses.date_to FROM Students_Addresses INNER JOIN Student_Loans ON Students_Addresses.student_id = Student_Loans.student_id INNER JOIN Students ON Student_Loans.student_id = Students.student_id INNER JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.other_details = 'achievements' AND Students.student_details = 'students' GROUP BY Student_Loans.student_id HAVING COUNT(Student_Loans.student_id) >= 2
SELECT Teachers.teacher_details, Teachers.teacher_id FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id GROUP BY Teachers.teacher_id ORDER BY COUNT(Classes.teacher_id) DESC LIMIT 1
SELECT Teachers.teacher_details , Teachers.teacher_id FROM Teachers AS Teachers JOIN Classes AS Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students AS Students ON Classes.student_id = Students.student_id GROUP BY Teachers.teacher_id ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.transcript_details IN ( SELECT Transcripts.transcript_details FROM Transcripts GROUP BY Transcripts.transcript_details ORDER BY COUNT(Transcripts.transcript_details) DESC LIMIT 1 ) AND Transcripts.transcript_details IN ( SELECT Transcripts.transcript_details FROM Transcripts WHERE Transcripts.student_id = Students.student_id GROUP BY Transcripts.transcript_details HAVING COUNT(Transcripts.transcript_details) = 3 )
SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Behaviour_Monitoring AS Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id JOIN Student_Events AS Student_Events ON Students.student_id = Student_Events.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = "3 students" INTERSECT SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id GROUP BY Transcripts.student_id ORDER BY COUNT(Transcripts.student_id) DESC LIMIT 1
SELECT Students.bio_data , Students.student_details FROM Students WHERE Students.student_id IN (SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.student_id ORDER BY COUNT(Behaviour_Monitoring.student_id) DESC LIMIT 1)
SELECT Students.bio_data , Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id GROUP BY Students.student_id ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT Students.student_id , Ref_Event_Types.event_type_description , Ref_Event_Types.event_type_code FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT Students.event_type_description, Students.class_details, count(*) FROM Students AS Students JOIN Detention AS Detention ON Detention.student_id = Students.student_id GROUP BY Students.event_type_description ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(Achievements.student_id) FROM Achievements WHERE Achievements.other_details IS NULL
SELECT COUNT(Teachers.teacher_details) FROM Teachers AS Students JOIN Achievements AS Ref_Achievement_Type ON Students.student_id = Ref_Achievement_Type.student_id JOIN Students AS Teachers ON Ref_Achievement_Type.achievement_type_code = Teachers.bio_data WHERE Ref_Achievement_Type.achievement_details = 'NULL'
SELECT Ref_Event_Types.event_type_description, Ref_Event_Types.event_type_code FROM Ref_Event_Types AS Ref_Event_Types JOIN Detention AS Ref_Achievement_Type ON Ref_Event_Types.event_type_code = Ref_Achievement_Type.detention_type_code GROUP BY Ref_Event_Types.event_type_code ORDER BY COUNT(Ref_Event_Types.event_type_code) ASC LIMIT 1
SELECT Ref_Achievement_Type.achievement_type_description, Ref_Achievement_Type.achievement_type_code FROM Ref_Achievement_Type JOIN Ref_Detention_Type ON Ref_Detention_Type.detention_type_code = Ref_Achievement_Type.achievement_type_code GROUP BY Ref_Achievement_Type.achievement_type_code ORDER BY COUNT(Ref_Achievement_Type.achievement_type_code) ASC LIMIT 1
SELECT Students.bio_data , Students.student_details , Student_Loans.amount_of_loan FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Students.bio_data, Students.student_details, Student_Loans.amount_of_loan FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Teachers.teacher_details FROM Students AS Students INNER JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id INNER JOIN Teachers AS Teachers ON Teachers.teacher_id = Classes.teacher_id WHERE Transcripts.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT Teachers.teacher_details FROM Teachers INNER JOIN Transcripts ON Transcripts.student_id = Teachers.teacher_id INNER JOIN Students ON Students.student_id = Transcripts.student_id WHERE Transcripts.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT Addresses.address_details , Addresses.address_details FROM Addresses INNER JOIN Students_Addresses ON Students_Addresses.address_id = Addresses.address_id INNER JOIN Students ON Students_Addresses.student_id = Students.student_id GROUP BY Addresses.address_details ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses INNER JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code INNER JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(Ref_Address_Types.address_type_code) DESC LIMIT 1
