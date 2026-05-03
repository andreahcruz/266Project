SELECT COUNT(club.Club_ID) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Wins_count ASC
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Wins_count ASC
SELECT DISTINCT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1200000
SELECT player.DESCRIPITIVE_ATTRIBUTE_8 FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manufacturer > 1200000
SELECT club.Manufacturer FROM club WHERE club.Captain IN (SELECT club.Captain FROM club GROUP BY club.Captain HAVING COUNT(*) > 1)
SELECT club.Manufacturer FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(club.Captain) > 1
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM player AS player JOIN club AS club ON player.Club_ID = club.Club_ID GROUP BY club.DESCRIPITIVE_ATTRIBUTE_2 HAVING COUNT(club.Club_ID) > 1
SELECT player.DESCRIPITIVE_ATTRIBUTE_8 FROM player WHERE player.Club_ID IN (SELECT club.Club_ID FROM club GROUP BY club.Club_ID HAVING COUNT(*) > 1) GROUP BY player.DESCRIPITIVE_ATTRIBUTE_8 HAVING COUNT(player.Club_ID) > 1
SELECT COUNT(player.Country) FROM player
SELECT COUNT(DISTINCT player.DESCRIPITIVE_ATTRIBUTE_8) FROM player
SELECT COUNT(Customers.customer_id) FROM Customers AS Customers JOIN Orders AS Orders ON Orders.customer_id = Customers.customer_id
SELECT COUNT(Customers.customer_id) FROM Customers INNER JOIN Orders ON Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id
SELECT COUNT(Order_Items.order_item_status_code) FROM Order_Items WHERE Order_Items.order_id = Orders.order_id
SELECT DISTINCT order_item_status_code FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(Shipments.shipment_id) FROM Shipments
SELECT COUNT(Products.product_name) FROM Products WHERE Products.product_id IS NOT NULL
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT Products.product_price FROM Products
SELECT COUNT(DISTINCT Internet) FROM channel
SELECT program.DESCRIPITIVE_ATTRIBUTE_11 FROM program INNER JOIN channel ON program.Channel_ID = channel.Channel_ID ORDER BY program.Start_Year DESC
SELECT channel.Name FROM channel INNER JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID INNER JOIN director ON director_admin.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio WHERE Radio_MHz = 'radios'
SELECT radio.Transmitter FROM radio AS city_channel_radio JOIN radio AS radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Radio_MHz = 'radios' ORDER BY radio.ERP_kW ASC
SELECT radio.Transmitter FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE city_channel.Affiliation != 'ABC'
SELECT avg(ERP_kW) FROM radio WHERE Radio_MHz = 'radios'
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_5 FROM city_channel JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID JOIN city_channel_tv_show ON city_channel_tv_show.City_channel_ID = city_channel.ID GROUP BY city_channel.DESCRIPITIVE_ATTRIBUTE_5 HAVING COUNT(city_channel_radio.City_channel_ID) > 3
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'United States'
SELECT COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT COUNT(driver.Name) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = vehicle.Vehicle_ID ORDER BY driver.Name
SELECT driver.Name FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT count(*) FROM Exams WHERE Exam_Name = 'exams'
SELECT count(*) FROM Exams WHERE Exam_Name = 'exams'
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Question_ID JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Student_Answers.Date_of_Answer = 'Normal'
SELECT COUNT(DISTINCT Student_Answers.Comments) FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT COUNT(DISTINCT Student_Answers.Comments) FROM Student_Answers INNER JOIN Questions_in_Exams ON Student_Answers.Question_ID = Questions_in_Exams.Exam_ID INNER JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code = 'student'
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 FROM Students WHERE Students.DESCRIPITIVE_ATTRIBUTE_4 != "M"
SELECT Student_Assessments.Student_Answer_Text FROM Students AS Students INNER JOIN Student_Assessments ON Students.Student_ID = Student_Assessments.Valid_Answer_ID WHERE Students.DESCRIPITIVE_ATTRIBUTE_2 != "M"
SELECT Questions.Type_of_Question_Code FROM Questions AS Questions JOIN Questions_in_Exams AS Questions_in_Exams ON Questions_in_Exams.Question_ID = Questions.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions.Question_Text) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions AS Questions JOIN Questions_in_Exams AS Questions_in_Exams ON Questions_in_Exams.Question_ID = Questions.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions.Type_of_Question_Code) >= 3
SELECT Students.Student_ID , Students.DESCRIPITIVE_ATTRIBUTE_2 , Students.DESCRIPITIVE_ATTRIBUTE_3 , Students.DESCRIPITIVE_ATTRIBUTE_4 , Students.DESCRIPITIVE_ATTRIBUTE_5 , Students.DESCRIPITIVE_ATTRIBUTE_6 FROM Students
SELECT Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID
SELECT COUNT(Addresses.address_id) FROM Addresses
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(product_name) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_name = "hardware type"
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products INNER JOIN Order_Items ON Order_Items.product_id = Products.product_id ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_name) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_name) > 1
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT DISTINCT customer_phone FROM Customers
SELECT customer_phone FROM Customers
SELECT COUNT(Customer_Orders.order_id) FROM Customer_Orders WHERE Customer_Orders.customer_id IS NOT NULL
SELECT COUNT(Customer_Orders.order_id) FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(Customers.customer_phone) FROM Customers AS Customers JOIN Order_Items AS Customer_Orders ON Customers.customer_id = Customer_Orders.order_id WHERE Customer_Orders.order_quantity IS NOT NULL
SELECT COUNT(DISTINCT Customers.DESCRIPITIVE_ATTRIBUTE_5) FROM Customers AS Customers INNER JOIN Customer_Orders AS Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items AS Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT club.Manager, club.Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name , player.Name FROM player AS club JOIN club AS player ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE player.Events_number > 2
SELECT player.Country FROM player WHERE player.Name = (SELECT club.Captain FROM club WHERE club.Manager = "Sam Allardyce")
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE club.Captain = "Sam Allardyce"
SELECT club.Manufacturer , count(*) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer
SELECT club.Manufacturer, COUNT(club.Club_ID) FROM club GROUP BY club.Manufacturer
SELECT player.Earnings FROM player WHERE player.Country = "Australia" OR player.Country = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Country = "Australia" OR club.Country = "Zimbabwe"
SELECT Products.product_id , Products.product_name , COUNT(Orders.order_status_code) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id
SELECT Products.product_name, COUNT(Products.product_name) AS count, Invoices.invoice_status_code, Products.product_id FROM Products JOIN Orders ON Products.product_id = Orders.customer_id JOIN Invoices ON Orders.order_id = Invoices.invoice_number GROUP BY Products.product_id
SELECT Orders.order_id , Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.product_id IN (SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(*) >= 2)
SELECT Orders.order_id , Invoices.invoice_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Orders.order_id HAVING count(DISTINCT Orders.order_status_code) >= 2
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2 , count(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.DESCRIPITIVE_ATTRIBUTE_2
SELECT Orders.order_status_code, count(*) FROM Order_Items AS Order_Items JOIN Orders AS Orders ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_middle_initial , Customer_Payment_Methods.payment_method_code FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code , Orders.date_order_placed , Shipments.shipment_date FROM Invoices INNER JOIN Orders ON Invoices.invoice_number = Orders.customer_id INNER JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices INNER JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipments ON Shipments.invoice_number = Order_Items.order_id JOIN Orders ON Orders.order_id = Order_Items.order_id JOIN Invoices ON Invoices.invoice_number = Shipments.invoice_number WHERE Orders.date_order_placed = 'ordered' AND Shipments.shipment_date = 'shipped'
SELECT Order_Items.order_item_status_code , Shipments.shipment_tracking_number FROM Invoices AS Invoices INNER JOIN Shipments AS Shipments ON Shipments.invoice_number = Invoices.invoice_number INNER JOIN Orders AS Orders ON Orders.order_id = Shipments.order_id INNER JOIN Order_Items AS Order_Items ON Order_Items.order_id = Orders.order_id WHERE Orders.date_order_placed = "ordered" AND Shipments.shipment_date = "shipped"
SELECT login_name , login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT Customers.customer_first_name , Customers.login_password FROM Customers AS Customers JOIN Orders AS Orders ON Orders.customer_id = Customers.customer_id WHERE Customers.phone_number LIKE '+12%'
SELECT product_name FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.DESCRIBITIVE_ATTRIBUTE_3 LIKE "%Dell%"
SELECT Orders.order_status_code , Orders.date_order_placed FROM Orders
SELECT Orders.order_status_code , Orders.date_order_placed FROM Orders
SELECT Customers.address_line_1 , Customers.town_city , Customers.county FROM Customers WHERE Customers.town_city = "USA"
SELECT customer_first_name, town_city, county FROM Customers WHERE town_city = 'United States'
SELECT Products.product_id, Products.product_name FROM Products WHERE Products.product_price > 3
SELECT Products.product_id, Products.product_name FROM Products AS Products JOIN Shipment_Items AS Orders ON Products.product_id = Orders.order_item_id GROUP BY Orders.order_item_id HAVING count(*) > 3
SELECT Invoices.invoice_status_code , Invoices.invoice_number FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Shipment_Items ON Shipment_Items.order_item_id = Shipments.shipment_id JOIN Orders ON Orders.order_id = Shipment_Items.order_item_id GROUP BY Invoices.invoice_number HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT Invoices.invoice_status_code , Invoices.invoice_number FROM Invoices INNER JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number INNER JOIN Orders ON Shipments.order_id = Orders.order_id GROUP BY Invoices.invoice_number HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Shipments.shipment_tracking_number , Shipments.shipment_date FROM Shipments
SELECT Shipments.shipment_tracking_number , Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID ORDER BY director.Age DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT channel.DESCRIPITIVE_ATTRIBUTE_2 FROM program AS channel JOIN director AS director ON channel.Director_ID = director.Director_ID ORDER BY channel.Start_Year DESC LIMIT 1
SELECT channel.Name, channel.Analogue_terrestrial_channel FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID WHERE program.Program_ID > 1
SELECT channel.Name, COUNT(program.Program_ID) FROM channel INNER JOIN program ON program.Channel_ID = channel.Channel_ID INNER JOIN director ON director.Director_ID = program.Director_ID GROUP BY channel.Name
SELECT channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID WHERE director.Name = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show WHERE tv_show.tv_show_name = 'tv shows'
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio AS radio INNER JOIN city_channel_radio AS city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT tv_show.tv_show_name , COUNT(city_channel.ID) FROM city_channel AS city_channel JOIN city_channel_tv_show AS city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID JOIN tv_show AS tv_show ON city_channel_tv_show.tv_show_ID = tv_show.tv_show_ID GROUP BY tv_show.tv_show_name
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_2 , city_channel_tv_show.DESCRIPATIVE_ATTRIBUTE_11 FROM city_channel_tv_show AS city_channel_tv_show JOIN city_channel AS city_channel ON city_channel_tv_show.City_channel_ID = city_channel.ID WHERE city_channel.DESCRIPITIVE_ATTRIBUTE_2 = 'city' ORDER BY city_channel_tv_show.DESCRIPATIVE_ATTRIBUTE_11 ASC
SELECT radio.Transmitter, city_channel.DESCRIPITIVE_ATTRIBUTE_2 FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter , COUNT(city_channel_tv_show.Is_online) FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel_tv_show ON city_channel_radio.City_channel_ID = city_channel_tv_show.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(vehicle.Power), AVG(vehicle.Power) FROM vehicle WHERE vehicle.Builder = 'Zhuzhou'
SELECT MAX(vehicle.Power), AVG(vehicle.Power) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Zhuzhou' AND vehicle.Builder = 'built'
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Build_Year , vehicle.Model , vehicle.Builder FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID
SELECT vehicle.Power , vehicle.Model , vehicle.Builder FROM vehicle
SELECT COUNT(vehicle_driver.Driver_ID) FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = "2012"
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT vehicle.Model FROM vehicle WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT driver.Citizenship FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'cars' AND vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model , vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model LIKE "%DJ%"
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID GROUP BY driver.Name
SELECT vehicle.Vehicle_ID, COUNT(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = "series" GROUP BY vehicle.Vehicle_ID
SELECT Exams.Exam_Date , Exams.Exam_Name FROM Exams WHERE Exams.Exam_Name NOT LIKE "Database"
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams WHERE Exams.Subject_Code != "Database"
SELECT Questions.Type_of_Question_Code , COUNT(*) FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code
SELECT Type_of_Question_Code , COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers GROUP BY Student_Answers.Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Answers AS Students JOIN Student_Assessments AS Exams ON Students.Student_ID = Exams.Student_Answer_ID JOIN Exams AS Questions_in_Exams ON Students.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams AS Student_Answers ON Students.Question_ID = Student_Answers.Exam_ID
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 , Exams.Exam_Date FROM Students AS Students INNER JOIN Student_Answers AS Student_Answers ON Students.Student_ID = Student_Answers.Student_ID INNER JOIN Exams AS Exams ON Student_Answers.Exam_ID = Exams.Exam_ID WHERE Student_Answers.Exam_ID = Student_Answers.Question_ID
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 , Exams.Exam_Date FROM Exams AS Exams JOIN Questions_in_Exams AS Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Students AS Students ON Questions_in_Exams.Question_ID = Students.Student_ID ORDER BY Exams.Exam_Date DESC
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 , Exams.Exam_Date FROM Exams AS Exams JOIN Student_Answers AS Student_Answers ON Exams.Exam_ID = Student_Answers.Exam_ID JOIN Students AS Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Exams.Exam_Date DESC
SELECT Student_Assessments.Student_Answer_Text FROM Student_Answers AS Students INNER JOIN Student_Assessments ON Student_Assessments.Valid_Answer_ID = Students.Exam_ID INNER JOIN Questions_in_Exams ON Students.Question_ID = Questions_in_Exams.Exam_ID GROUP BY Student_Assessments.Student_Answer_ID HAVING COUNT(*) >= 2
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Student_Answers ON Student_Answers.Student_ID = Student_Assessments.Student_Answer_ID WHERE Student_Answers.Exam_ID = 2
SELECT Gender_MFU , COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Wins_count DESC LIMIT 1
SELECT club.Name FROM player AS club JOIN club AS player ON player.Club_ID = club.Club_ID GROUP BY club.Name ORDER BY avg(club.Earnings) DESC
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Manufacturer FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID GROUP BY club.Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT club.Name FROM club WHERE club.Club_ID NOT IN (SELECT player.Club_ID FROM player)
SELECT club.Name FROM club WHERE club.Club_ID NOT IN ( SELECT player.Club_ID FROM player )
SELECT player.Country FROM player WHERE player.Earnings > 1400000 INTERSECT SELECT player.Country FROM player WHERE player.Earnings < 1100000
SELECT player.DESCRIPITIVE_ATTRIBUTE_8 FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1400000 INTERSECT SELECT player.DESCRIPITIVE_ATTRIBUTE_8 FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings < 1100000
SELECT Orders.order_status_code , Orders.date_order_placed FROM Orders WHERE Orders.date_order_placed = ( SELECT MIN(Orders.date_order_placed) FROM Orders ) OR Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(*) > 1 )
SELECT Orders.order_status_code, Orders.date_order_placed FROM Orders WHERE Orders.order_id IN (SELECT Orders.order_id FROM Orders GROUP BY Orders.order_id HAVING COUNT(Orders.order_id) > 1)
SELECT Products.product_id , Products.DESCRIBITIVE_ATTRIBUTE_3 , Products.product_price , Order_Items.DESCRIBITIVE_ATTRIBUTE_10 FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_id < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods INNER JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(Customer_Payment_Methods.payment_method_code) DESC LIMIT 1
SELECT Customers.gender_code , COUNT(Products.product_id) FROM Products AS Products JOIN Customers AS Customers ON Products.product_name = Customers.gender_code GROUP BY Customers.gender_code
SELECT product_name, COUNT(*) FROM Products GROUP BY product_name
SELECT Products.product_name, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Products ON Orders.customer_id = Products.product_id
SELECT Products.product_name , Orders.date_order_placed FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Order_Items ON Shipments.invoice_number = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT Products.DESCRIPITIVE_ATTRIBUTE_3 , Products.product_color FROM Order_Items AS Order_Items JOIN Orders AS Orders ON Order_Items.order_id = Orders.order_id JOIN Products AS Products ON Order_Items.product_id = Products.product_id WHERE Products.product_id = (SELECT Products.product_id FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments AS Shipments ON Order_Items.order_id = Shipments.order_id WHERE Shipments.shipment_tracking_number = 'shipped' GROUP BY Products.product_id ORDER BY SUM(Products.product_price) DESC LIMIT 1)
SELECT Products.product_name , Orders.order_status_code FROM Products AS Products JOIN Order_Items AS Orders ON Products.product_id = Orders.product_id JOIN Shipments AS Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_tracking_number = (SELECT Shipments.shipment_tracking_number FROM Shipments WHERE Shipments.shipment_id = (SELECT Shipments.shipment_id FROM Shipments AS T4A JOIN Shipment_Items AS Shipment_Items ON T4A.shipment_id = Shipment_Items.shipment_id))
SELECT Invoices.invoice_status_code FROM Invoices AS Invoices JOIN Orders AS Orders ON Invoices.invoice_number = Orders.customer_id WHERE Orders.order_id NOT IN (SELECT Shipments.shipment_id FROM Shipments WHERE Shipments.shipment_id = Shipments.order_id)
SELECT Invoices.invoice_status_code FROM Invoices AS Invoices JOIN Shipments AS Shipments ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_id NOT IN (SELECT shipment_id FROM Shipments WHERE Shipments.shipment_tracking_number = 'shipped')
SELECT Products.product_id, Orders.date_order_placed, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT Products.product_id, Orders.date_order_placed, SUM(Products.product_price) FROM Products JOIN Orders ON Orders.customer_id = Products.product_id GROUP BY Products.product_id
SELECT Products.product_name , Products.product_color FROM Products
SELECT Products.product_name , Products.product_name FROM Products AS Products JOIN Products AS T2 ON Products.product_id = T2.parent_product_id
SELECT Orders.date_order_placed FROM Customers AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id HAVING count(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2
SELECT Invoices.date_order_placed FROM Orders AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.order_id JOIN Shipments AS Invoices ON Invoices.order_id = Customers.order_id WHERE Invoices.invoice_number IN (SELECT Invoices.invoice_number FROM Orders AS Orders JOIN Order_Items AS Order_Items ON Order_Items.order_id = Orders.order_id JOIN Invoices AS Invoices ON Invoices.invoice_number = Order_Items.order_id JOIN Shipment_Items AS Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id JOIN Shipments AS Shipments ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Invoices.invoice_number HAVING COUNT(Shipment_Items.shipment_id) >= 2)
SELECT Orders.order_status_code FROM Orders GROUP BY Orders.order_status_code ORDER BY COUNT(Orders.order_status_code) ASC LIMIT 1
SELECT MIN(order_status_code) FROM Orders
SELECT director.Name FROM director INNER JOIN program ON director.Director_ID = program.Director_ID INNER JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE director.Age > ( SELECT AVG(Age) FROM director )
SELECT channel.Channel_ID , channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title != "Hank Baskett"
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_5 FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel.DESCRIPITIVE_ATTRIBUTE_5 LIKE '%city%' GROUP BY city_channel.DESCRIPITIVE_ATTRIBUTE_5 ORDER BY COUNT(city_channel.DESCRIPITIVE_ATTRIBUTE_5) DESC LIMIT 1
SELECT radio.Transmitter, radio.Radio_MHz, city_channel_tv_show.Is_online FROM radio AS radio INNER JOIN city_channel_radio AS city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel_tv_show AS city_channel_tv_show ON city_channel_tv_show.City_channel_ID = city_channel_radio.City_channel_ID ORDER BY radio.Radio_MHz DESC
SELECT DISTINCT radio.Transmitter FROM radio WHERE radio.Radio_MHz NOT IN (SELECT radio.Radio_MHz FROM radio JOIN city_channel ON city_channel.City = radio.Radio_MHz WHERE city_channel.Affiliation IS NOT NULL)
SELECT vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000 )
SELECT driver.Citizenship FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT vehicle.Power , vehicle_driver.Driver_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'driven' GROUP BY vehicle_driver.Driver_ID ORDER BY COUNT(vehicle_driver.Driver_ID) DESC LIMIT 1
SELECT vehicle.Vehicle_ID , count(*) FROM vehicle_driver AS vehicle JOIN driver AS driver ON vehicle.Vehicle_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID ORDER BY count(*) DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle WHERE vehicle.Power = (SELECT MIN(vehicle.Power) FROM vehicle)
SELECT vehicle_driver.Driver_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON driver.Driver_ID = vehicle.Vehicle_ID ORDER BY vehicle.Power LIMIT 1
SELECT DISTINCT driver.Name FROM vehicle_driver AS vehicle_driver JOIN driver ON vehicle_driver.Vehicle_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Citizenship FROM driver WHERE driver.Racing_Series NOT IN (SELECT vehicle.Builder FROM vehicle WHERE vehicle.Vehicle_ID IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver))
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power = 0
SELECT vehicle.Power, vehicle.Model FROM vehicle INNER JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE vehicle.Power > 1 OR driver.Citizenship = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Driver_ID = vehicle.Vehicle_ID WHERE vehicle.Power = 2 OR vehicle.Builder = "Ziyang"
SELECT vehicle.Power FROM vehicle WHERE vehicle.Top_Speed = ( SELECT MAX(vehicle.Top_Speed) FROM vehicle )
SELECT COUNT(vehicle.Power) FROM vehicle WHERE vehicle.Power = (SELECT MAX(vehicle.Power) FROM vehicle)
SELECT driver.Name , driver.Citizenship FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder = 'DJ1' AND vehicle.Build_Year = 'driven'
SELECT driver.Name, driver.Citizenship FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Exam_Name LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Assessments.Assessment FROM Student_Assessments GROUP BY Student_Assessments.Assessment ORDER BY COUNT(Student_Assessments.Assessment) LIMIT 1
SELECT Assessment FROM Student_Assessments ORDER BY Student_Answer_Text LIMIT 1
SELECT Student_Assessments.Student_Answer_Text FROM Valid_Answers AS Valid_Answers JOIN Student_Assessments AS Student_Assessments ON Valid_Answers.Valid_Answer_ID = Student_Assessments.Valid_Answer_ID GROUP BY Student_Assessments.Student_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(Valid_Answer_Text) DESC LIMIT 1
SELECT Students.First_Name FROM Students WHERE Students.First_Name IS NULL
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 FROM Students WHERE Students.Student_ID NOT IN (SELECT Student_Answers.Student_ID FROM Student_Answers)
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Valid_Answers ON Student_Answers.Student_ID = Valid_Answers.Question_ID WHERE Student_Answers.Comments = 'Normal' INTERSECT SELECT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Valid_Answers ON Student_Answers.Student_ID = Valid_Answers.Question_ID WHERE Student_Answers.Comments = 'Absent'
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Student_Answer_Text = 'Normal' INTERSECT SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Student_Answer_Text = 'Absent'
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 , Products.product_price FROM Products WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_type_code FROM Products WHERE product_price > ( SELECT avg(product_price) FROM Products )
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.product_price = (SELECT max(product_price) FROM Products)
SELECT Products.product_id , Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_2 = "Hardware" ORDER BY Products.product_price ASC LIMIT 1
SELECT Products.product_id , Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_3 = "Hardware" ORDER BY Products.product_price ASC LIMIT 1
SELECT Products.product_type_code FROM Products GROUP BY Products.product_type_code ORDER BY COUNT(Products.product_name) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(*) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(address_id) DESC LIMIT 1
SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(customer_phone) LIMIT 1
SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_name) LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) ASC LIMIT 1
SELECT Order_Items.order_item_id FROM Order_Items GROUP BY Order_Items.order_item_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Order_Items.order_quantity FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Order_Items.order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.product_id NOT IN (SELECT Order_Items.product_id FROM Order_Items WHERE Order_Items.order_quantity != '')
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_quantity IS NULL
SELECT Customers.gender_code , Customers.customer_first_name FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id INNER JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Shipment_Items.shipment_id IN (SELECT Order_Items.order_item_id FROM Order_Items INNER JOIN Shipments ON Order_Items.order_id = Shipments.order_id WHERE Shipments.shipment_tracking_number > 3) AND Orders.order_id IN (SELECT Orders.order_id FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.product_id IN (SELECT Products.product_id FROM Products WHERE Products.product_price > 2))
SELECT Products.product_id, Customers.gender_code, Customers.customer_first_name FROM Products AS Products JOIN Orders AS Customer_Payment_Methods ON Products.product_id = Customer_Payment_Methods.customer_id JOIN Customers AS Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id WHERE Customer_Payment_Methods.date_order_placed > 2 AND Customer_Payment_Methods.customer_id > 2
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Orders.date_order_placed = '0000-00-00 00:00:00'
SELECT Products.product_id , Customers.DESCRIPITIVE_ATTRIBUTE_8 , Products.product_price FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id JOIN Customers AS Customers ON Orders.customer_id = Customers.customer_id GROUP BY Customers.DESCRIPITIVE_ATTRIBUTE_8 ORDER BY COUNT(Orders.order_id) DESC LIMIT 1
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Shipment_Items AS Order_Items ON Products.product_id = Order_Items.order_item_id JOIN Shipments AS Shipments ON Order_Items.order_item_id = Shipments.shipment_id GROUP BY Products.product_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id , SUM(Products.product_price) FROM Products AS Products JOIN Order_Items AS Orders ON Products.product_id = Orders.product_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Orders.order_status_code, MIN(Orders.date_order_placed) FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_status_code ORDER BY MIN(Orders.date_order_placed) ASC LIMIT 1
SELECT DISTINCT Products.product_name , Products.product_price , Customers.customer_first_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Orders.order_id = Order_Items.order_id JOIN Customers ON Customers.customer_id = Orders.customer_id WHERE Customers.gender_code = 'female'
SELECT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Customers.gender_code = 'female'
SELECT product_name , product_price , product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_price , product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(*) FROM Products WHERE product_price = 0
SELECT COUNT(*) FROM Products WHERE product_id IS NULL
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.payment_method_code IS NULL
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.payment_method_code IS NULL
SELECT email_address , town_city , county FROM Customers WHERE gender_code IN ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Customers.gender_code, Customers.town_city, Customers.county FROM Customers WHERE Customers.gender_code IN (SELECT Orders.order_status_code FROM Orders GROUP BY Orders.order_status_code ORDER BY COUNT(Orders.order_id) ASC LIMIT 1)
SELECT product_color , product_description , product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT product_description , product_color , product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT director.Name FROM director AS director GROUP BY director.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT director.Name, director.Age FROM program JOIN director ON program.Director_ID = director.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY director.Name ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(channel.Internet) FROM channel WHERE channel.Channel_ID NOT IN (SELECT program.Channel_ID FROM program)
SELECT channel.Name, channel.Internet FROM channel INNER JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY channel.Name, channel.Internet ORDER BY COUNT(director_admin.Director_ID) DESC LIMIT 1
SELECT channel.Internet FROM channel AS channel JOIN program AS director ON channel.Channel_ID = director.Channel_ID JOIN director AS program ON director.Director_ID = program.Director_ID WHERE program.Age < 40 AND program.Age > 60
SELECT vehicle.Power, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'Jeff Gordon' OR driver.Name = 'more than 2'
SELECT vehicle.Vehicle_ID , vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'Jeff Gordon' OR vehicle_driver.Driver_ID IN (SELECT Driver_ID FROM vehicle_driver GROUP BY Driver_ID HAVING count(*) > 2)
SELECT COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver WHERE vehicle_driver.Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle)
SELECT COUNT(driver.Driver_ID) FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE vehicle.Power = 0
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = product_type_code)
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_3 = 'Hardware' )
SELECT Customers.customer_phone , Customers.customer_name , Customers.customer_email , Customers.customer_name FROM Customers INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity = (SELECT max(order_quantity) FROM Order_Items)
SELECT Customers.customer_id, Customers.DESRIPTIVE_ATTRIBUTE_4 AS name, Customers.DESRIPTIVE_ATTRIBUTE_5 AS phone, Customers.DESRIPTIVE_ATTRIBUTE_6 AS email FROM Customers JOIN Order_Items ON Order_Items.order_id = Customers.customer_id JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(Order_Items.order_id) DESC LIMIT 1
SELECT COUNT(Customers.customer_phone) FROM Customers WHERE Customers.customer_email = 'TRUE'
SELECT COUNT(Customers.customer_phone) FROM Customers WHERE Customers.customer_phone = 'customers' AND Customers.customer_id NOT IN (SELECT Customer_Orders.customer_id FROM Customer_Orders WHERE Customer_Orders.order_status_code LIKE '%order%')
SELECT Customer_Orders.order_date, Customer_Orders.order_id FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_quantity > 6 OR Products.DESCRIPITIVE_ATTRIBUTE_3 > 3
SELECT Order_Items.order_item_id , Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.product_id = Customer_Orders.order_id WHERE Order_Items.order_quantity > 6 OR Order_Items.order_quantity > 3
SELECT region.Capital FROM region AS region JOIN building AS building ON building.Region_ID = region.Region_ID GROUP BY region.Capital ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT region.Capital, region.Area FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Area ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT Customer_Interactions.Status_Code, Customer_Interactions.Services_and_Channels_Details, Customer_Interactions.Customer_Interaction_ID FROM Customer_Interactions INNER JOIN Customers ON Customer_Interactions.Channel_ID = Customers.Customer_ID INNER JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customer_Interactions.Customer_Interaction_ID ORDER BY COUNT(Customer_Interactions.Customer_Interaction_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(Services.Service_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(DISTINCT Services.Service_ID) DESC LIMIT 1
SELECT Services.Service_Details , Services.Service_ID , Customers.Customer_Details FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID JOIN Customers AS Customers ON Customer_Interactions.Channel_ID = Customers.Customer_ID GROUP BY Services.Service_ID ORDER BY COUNT(Customer_Interactions.Channel_ID) DESC LIMIT 1
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers_and_Services.Customers_and_Services_Details ORDER BY COUNT(Customers_and_Services.Customers_and_Services_Details) LIMIT 1
SELECT DISTINCT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID JOIN Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Services.Customers_and_Services_Details = (SELECT Customers_and_Services_Details FROM Customers_and_Services GROUP BY Customers_and_Services_Details ORDER BY COUNT(Customers_and_Services_Details) LIMIT 1)
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = "Hardy Kutch" OR Services.Customers_and_Services_Details = "good"
SELECT Customers.Customer_Details, Services.Service_Details FROM Services AS Services JOIN Customers_and_Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers AS Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' INTERSECT SELECT Services.Service_Details FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Interactions.DESCRIBITIVE_ATTRIBUTE_13 = 'good'
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions AS Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services AS Customer_Interactions ON Customer_Interactions.Service_ID = Customers_and_Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customers_and_Services.Customers_and_Services_Details = 'bad'
SELECT Vehicles.name , Discount.DESCRIPITIVE_ATTRIBUTE_6 , Vehicles.City_fuel_economy_rate FROM Vehicles JOIN Discount ON Vehicles.vehicles_id = Discount.id JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id JOIN Customers ON Renting_history.customer_id = Customers.id WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2 , Discount.DESCRIPATIVE_ATTRIBUTE_6 , Vehicles.Cost_per_25_miles FROM Customers AS Customers JOIN Renting_history AS Renting_history ON Customers.id = Renting_history.customer_id JOIN Vehicles AS Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id WHERE Customers.age = 2013 OR Customers.age = 2014
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history AS Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Customers ON Renting_history.customer_id = Customers.id GROUP BY Vehicles.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Vehicles.name , Vehicles.Model_year FROM Renting_history AS Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Customers ON Renting_history.customer_id = Customers.id ORDER BY Renting_history.total_hours DESC LIMIT 1
SELECT Discount.DESCRIPITIVE_ATTRIBUTE_6 FROM Renting_history AS Customers JOIN Discount AS Discount ON Customers.discount_id = Discount.id GROUP BY Discount.DESCRIPITIVE_ATTRIBUTE_6 ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Discount.DESCRIPITIVE_ATTRIBUTE_6 FROM Renting_history AS Renting_history JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.DESCRIPITIVE_ATTRIBUTE_6 ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_id FROM Students AS Students JOIN Classes AS Classes ON Students.student_id = Classes.student_id JOIN Teachers AS Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details = '2' OR Students.student_id IN (SELECT student_id FROM Detention WHERE student_id IN (SELECT student_id FROM Students GROUP BY student_id HAVING COUNT(student_id) > 2) AND datetime_detention_end IS NULL)
SELECT Students.bio_data , Students.student_id FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details = 'classes' AND (Students.student_id IN (SELECT Students.student_id FROM Students JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id HAVING COUNT(*) > 1) OR Students.student_id IN (SELECT Students.student_id FROM Students JOIN Classes ON Students.student_id = Classes.student_id WHERE Classes.class_details = 'detentions' GROUP BY Students.student_id HAVING COUNT(*) < 2))
SELECT Teachers.teacher_details FROM Classes AS Classes JOIN Teachers AS Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.DESCRIBITIVE_ATTRIBUTE_9 LIKE '%data%' AND Classes.student_id NOT IN (SELECT student_id FROM Students WHERE bio_data LIKE 'net%')
SELECT Teachers.teacher_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students ON Classes.student_id = Students.student_id WHERE Classes.DESCRITIVE_ATTRIBUTE_9 LIKE '%data%' AND Classes.DESCRITIVE_ATTRIBUTE_9 NOT LIKE 'net%'
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Students AS Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Achievements ON Achievements.student_id = Students.student_id GROUP BY Students.student_id HAVING Count(Achievements.other_details) >= 2
SELECT Student_Loans.amount_of_loan, Transcripts.date_of_transcript FROM Transcripts JOIN Students ON Transcripts.student_id = Students.student_id JOIN Achievements ON Achievements.student_id = Students.student_id JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Achievements.other_details LIKE '%achievements%' AND Students.student_details = 'students' AND Students.student_id IN (SELECT student_id FROM Students GROUP BY student_id HAVING COUNT(student_details) > 1)
SELECT Teachers.teacher_details, Students.student_id FROM Students INNER JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id INNER JOIN Teachers ON Behaviour_Monitoring.student_id = Teachers.teacher_id GROUP BY Students.student_id ORDER BY COUNT(Behaviour_Monitoring.student_id) DESC LIMIT 1
SELECT Teachers.teacher_details , Students.student_id FROM Students AS Students JOIN Classes AS Classes ON Students.student_id = Classes.student_id JOIN Teachers AS Teachers ON Classes.teacher_id = Teachers.teacher_id GROUP BY Students.student_id ORDER BY COUNT(Classes.teacher_id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) AND Behaviour_Monitoring.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 OFFSET 1)
SELECT Students.bio_data , Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) INTERSECT SELECT Students.bio_data , Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 2 OFFSET 1 )
SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.date_of_transcript = (SELECT date_of_transcript FROM Transcripts GROUP BY date_of_transcript ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Students.bio_data , Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT count(*) , Ref_Event_Types.DESCRIPITIVE_ATTRIBUTE_8 , Ref_Event_Types.DESCRIPITIVE_ATTRIBUTE_8 FROM Student_Events AS Students JOIN Ref_Event_Types AS Behaviour_Monitoring ON Students.event_type_code = Behaviour_Monitoring.event_type_code JOIN Students AS Ref_Event_Types ON Ref_Event_Types.student_id = Students.student_id GROUP BY Ref_Event_Types.DESCRIPITIVE_ATTRIBUTE_8 ORDER BY count(*) DESC LIMIT 1
SELECT Students.event_type_description, COUNT(Transcripts.transcript_details) FROM Students AS Students JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id GROUP BY Students.event_type_description ORDER BY COUNT(Transcripts.transcript_details) DESC LIMIT 1
SELECT COUNT(Students.student_id) FROM Students AS Students LEFT JOIN Achievements AS Achievements ON Students.student_id = Achievements.student_id WHERE Achievements.other_details IS NULL
SELECT COUNT(Teachers.teacher_details) FROM Teachers AS Students JOIN Classes AS Ref_Achievement_Type ON Students.student_id = Ref_Achievement_Type.student_id JOIN Achievements AS Teachers ON Ref_Achievement_Type.teacher_id = Teachers.student_id WHERE Teachers.achievement_type_code NOT IN (SELECT Achievements.achievement_type_code FROM Achievements AS Student_Loans JOIN Students AS Classes ON Student_Loans.student_id = Classes.student_id WHERE Student_Loans.achievement_details IS NOT NULL)
SELECT Ref_Event_Types.event_type_description, Ref_Event_Types.event_type_description FROM Ref_Event_Types GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Ref_Event_Types.event_type_description , Ref_Event_Types.address_type_description FROM Ref_Event_Types AS Ref_Event_Types JOIN Ref_Address_Types AS Ref_Address_Types ON Ref_Event_Types.event_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(Ref_Event_Types.event_type_description) LIMIT 1
SELECT Students.bio_data , Students.student_details , Student_Loans.amount_of_loan FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Students.bio_data, Students.student_details FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id JOIN Transcripts ON Transcripts.transcript_id = Classes.student_id JOIN Students ON Students.student_id = Transcripts.student_id ORDER BY Transcripts.date_of_transcript ASC LIMIT 1
SELECT Teachers.teacher_details FROM Teachers INNER JOIN Transcripts ON Teachers.teacher_id = Transcripts.student_id INNER JOIN Students ON Transcripts.student_id = Students.student_id ORDER BY Transcripts.date_of_transcript ASC LIMIT 1
SELECT Addresses.DESCRIPITIVE_ATTRIBUTE_9 , Students.bio_data FROM Students INNER JOIN Transcripts ON Transcripts.student_id = Students.student_id INNER JOIN Addresses ON Addresses.address_id = Transcripts.address_id GROUP BY Students.bio_data ORDER BY COUNT(*) DESC LIMIT 1
SELECT Addresses.address_details, Addresses.address_details FROM Addresses INNER JOIN Students_Addresses ON Addresses.address_id = Students_Addresses.address_id INNER JOIN Student_Events ON Student_Events.student_id = Students_Addresses.student_id INNER JOIN Students ON Students.student_id = Student_Events.student_id GROUP BY Addresses.address_details ORDER BY COUNT(Addresses.address_details) DESC LIMIT 1
