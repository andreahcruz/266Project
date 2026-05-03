SELECT COUNT(club.Club_ID) FROM club
SELECT count(*) FROM club
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT club.Name FROM club ORDER BY club.Name ASC
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name != 'Nike'
SELECT club.Club_ID FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name != 'Nike'
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Wins_count
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Earnings ORDER BY COUNT(player.Wins_count) ASC
SELECT DISTINCT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player WHERE Earnings > 1200000)
SELECT player.DESCRIPITIVE_ATTRIBUTE_9 FROM player AS player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1200000
SELECT club.Manufacturer FROM club WHERE club.Club_ID IN (SELECT player.Club_ID FROM player GROUP BY player.Club_ID HAVING COUNT(*) > 1)
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name HAVING COUNT(player.Club_ID) > 1
SELECT club.Name FROM club WHERE EXISTS (SELECT 1 FROM player WHERE player.Club_ID = club.Club_ID GROUP BY player.Club_ID HAVING COUNT(*) > 1)
SELECT club.Country FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID GROUP BY club.Country HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT club.Name) FROM club
SELECT COUNT(DISTINCT club.Name) FROM player AS player JOIN club ON player.Club_ID = club.Club_ID
SELECT COUNT(Orders.order_id) FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id
SELECT COUNT(Order_Items.order_item_id) FROM Order_Items
SELECT COUNT(DISTINCT Order_Items.order_item_status_code) FROM Order_Items
SELECT COUNT(*) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT Customer_Payment_Methods.customer_id) FROM Customer_Payment_Methods
SELECT COUNT(shipment_id) FROM Shipments
SELECT COUNT(shipment_id) FROM Shipments
SELECT product_price FROM Products
SELECT AVG(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT product_price FROM Products
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT program.DESCRIPITIVE_ATTRIBUTE_11 FROM program ORDER BY program.Start_Year DESC
SELECT channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY radio.ERP_kW ASC
SELECT city_channel_radio.Station_name FROM city_channel INNER JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID INNER JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Transmitter != 'ABC'
SELECT AVG(2FM_MHz) FROM radio
SELECT city_channel.Affiliation FROM city_channel JOIN city_channel_radio ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY city_channel.Affiliation HAVING COUNT(city_channel.City) > 3
SELECT vehicle_driver.Racing_Series FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT vehicle_driver.Racing_Series FROM driver AS driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Name = 'United States'
SELECT COUNT(vehicle_driver.Driver_ID) FROM driver AS vehicle JOIN vehicle_driver ON vehicle.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Name = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(driver.Name) FROM vehicle_driver AS vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID
SELECT driver.Name FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID ORDER BY driver.Name ASC
SELECT driver.Racing_Series FROM vehicle_driver INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID ORDER BY driver.Racing_Series ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_ID IN ( SELECT Student_Assessments.Student_ID FROM Student_Assessments WHERE Student_Assessments.Student_Answer_Text = "Normal" )
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments AS Student_Assessments JOIN Valid_Answers AS Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Questions AS Questions ON Valid_Answers.Question_ID = Questions.Question_ID JOIN Student_Answers AS Student_Answers ON Questions.Question_ID = Student_Answers.Exam_ID WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Answer_Text FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Students.Last_Name FROM Students WHERE Students.Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions AS Questions JOIN Questions_in_Exams AS Questions_in_Exams ON Questions_in_Exams.Question_ID = Questions.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions.Question_Text) >= 3
SELECT Questions.DESCRIPITIVE_ATTRIBUTE_2 FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.DESCRIPITIVE_ATTRIBUTE_2 HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT Student_Assessments.Assessment FROM Student_Assessments
SELECT Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID
SELECT COUNT(Addresses.address_id) FROM Addresses
SELECT COUNT(Addresses.address_id) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware type"
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products WHERE product_name >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_name) > 1
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_number) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT payment_method_code FROM Customers
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(Customer_Orders.order_id) FROM Customer_Orders
SELECT COUNT(Customer_Orders.order_id) FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers AS Customers INNER JOIN Customer_Orders AS Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items AS Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT Manager, Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT player.Name FROM player WHERE player.Earnings = ( SELECT MAX(player.Earnings) FROM player )
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT player.Name , club.Club_ID FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2
SELECT club.Club_ID FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE player.Wins_count > player.Wins_count
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Earnings FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Captain = "Sam Allardyce"
SELECT Manufacturer , count(*) FROM club GROUP BY Manufacturer
SELECT club.Club_ID, club.Manufacturer FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer
SELECT player.Earnings FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE club.Country = "Australia" OR club.Country = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Country = "Australia" OR club.Country = "Zimbabwe"
SELECT Order_Items.order_item_id , Orders.DESCRIPITIVE_ATTRIBUTE_12 , count(*) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Order_Items.order_item_id
SELECT Order_Items.order_item_status_code, Orders.order_status_code, Order_Items.product_id FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT Orders.order_id , Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id HAVING COUNT(Products.product_id) >= 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id HAVING count(Products.product_id) >= 2
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2 , sum(Orders.order_id) FROM Orders AS Orders JOIN Customers AS Customers ON Orders.customer_id = Customers.customer_id GROUP BY Customers.DESCRIPITIVE_ATTRIBUTE_2
SELECT Orders.order_status_code, COUNT(*) FROM Order_Items AS Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_status_code
SELECT Customers.customer_first_name, Customers.gender_code, Customers.login_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id
SELECT customer_first_name , gender_code , customer_last_name , payment_method_code FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices INNER JOIN Orders ON Invoices.invoice_number = Orders.customer_id INNER JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Orders.order_status_code, Invoices.invoice_status_code, Shipments.order_status_code FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Orders ON Orders.order_id = Shipments.order_id JOIN Shipments AS T4_ship ON T4_ship.invoice_number = Invoices.invoice_number JOIN Order_Items ON Order_Items.order_id = T4_ship.shipment_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments AS T4_ship2 ON Shipment_Items.shipment_id = T4_ship2.shipment_id JOIN Orders AS T2_ship ON T2_ship.order_id = T4_ship2.order_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Shipments ON Shipments.order_id = Orders.order_id
SELECT Orders.order_status_code , Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.order_id = Shipments.order_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT Customers.customer_first_name , Customers.login_password FROM Customers WHERE Customers.customer_last_name LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE "%Dell%"
SELECT Orders.DESCRIPITIVE_ATTRIBUTE_3 , Shipments.shipment_date FROM Orders INNER JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Order_Items.order_item_status_code , Shipments.shipment_date FROM Orders AS Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Shipments.order_id = Orders.order_id
SELECT address_line_1 , town_city , county FROM Customers WHERE town_city = "USA"
SELECT town_city, customer_first_name, county FROM Customers
SELECT Products.product_id, Products.product_description FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Order_Items.order_item_status_code > 3
SELECT Products.product_id, Products.product_name FROM Products JOIN Orders ON Products.product_id = Orders.customer_id JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Products.product_id HAVING count(*) > 3
SELECT Invoices.invoice_status_code , Invoices.invoice_number FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Order_Items ON Order_Items.order_id = Shipments.order_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Invoices.invoice_number HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT Shipments.shipment_date , Invoices.invoice_number FROM Invoices AS Invoices INNER JOIN Shipments AS Shipments ON Invoices.invoice_number = Shipments.invoice_number INNER JOIN Orders AS Orders ON Shipments.order_id = Orders.order_id INNER JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Invoices.invoice_number HAVING COUNT(Order_Items.order_item_id) >= 2
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Shipments.shipment_tracking_number , Shipments.shipment_date FROM Shipments
SELECT director.Name FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID JOIN channel AS program ON channel.Channel_ID = program.Channel_ID ORDER BY channel.Start_Year DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT director.DESCRIPITIVE_ATTRIBUTE_7 FROM program AS channel JOIN director AS director ON channel.Director_ID = director.Director_ID JOIN director_admin AS program ON channel.Channel_ID = program.Channel_ID ORDER BY channel.Start_Year DESC LIMIT 1
SELECT channel.Name , channel.Digital_terrestrial_channel FROM channel WHERE channel.Channel_ID IN (SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(program.Channel_ID) > 1)
SELECT channel.Name, COUNT(program.Program_ID) FROM channel INNER JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Name
SELECT director.Name FROM program AS channel INNER JOIN director ON channel.Director_ID = director.Director_ID WHERE channel.Title = "Dracula"
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.DESCRITIVE_ATTRIBUTE_9 DESC
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_5 , COUNT(*) FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel.DESCRIPITIVE_ATTRIBUTE_5
SELECT city_channel.DESCRIPITIVE_ATTRIBUTE_2, city_channel_radio.DESCRIPITIVE_ATTRIBUTE_8 FROM city_channel INNER JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel.DESCRIPITIVE_ATTRIBUTE_5 = 'city channels' ORDER BY city_channel_radio.DESCRIPITIVE_ATTRIBUTE_8 ASC
SELECT radio.Transmitter, city_channel.City FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter , COUNT(city_channel_radio.City_channel_ID) FROM city_channel AS city_channel JOIN city_channel_radio AS city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio AS radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Transmitter
SELECT MAX(driver.Total_Production) , AVG(driver.Total_Production) FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'Zhuzhou'
SELECT MAX(driver.Name) AS max_power, AVG(driver.Name) AS avg_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Model = 'Zhuzhou'
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Top_Speed , vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = "1996"
SELECT vehicle.Build_Year , vehicle.Model , driver.Name FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year , vehicle.Model , driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT driver.Name) FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT vehicle.Model FROM vehicle WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Total_Production > 100 OR vehicle.Power > 150
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model , vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder LIKE "%DJ%"
SELECT driver.Name, COUNT(vehicle_driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT COUNT(driver.Driver_ID) FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Driver_ID = driver.Driver_ID
SELECT Exams.Exam_Name , Exams.Exam_Date FROM Questions_in_Exams JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code != "Database"
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams WHERE Exams.Subject_Code != "Database"
SELECT Questions.DESCRIBATIVE_ATTRIBUTE_2 , COUNT(*) FROM Questions AS Questions JOIN Questions_in_Exams AS Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.DESCRIBATIVE_ATTRIBUTE_2
SELECT Type_of_Question_Code , COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_ID IN (SELECT Student_ID FROM Students) GROUP BY Student_Answers.Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students INNER JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 , Student_Answers.Date_of_Answer FROM Student_Answers AS Student_Answers JOIN Students AS Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.Email_Adress , Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress , Student_Answers.Date_of_Answer FROM Students AS Students INNER JOIN Student_Answers AS Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students INNER JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(*) >= 2
SELECT Gender_MFU , COUNT(Students.Student_ID) FROM Students AS Students JOIN Student_Answers AS Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Gender_MFU
SELECT club.Name FROM club INNER JOIN player ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 GROUP BY player.Club_ID ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID ORDER BY avg(player.Events_number) DESC
SELECT club.Club_ID FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT player.Manufacturer FROM club AS club JOIN player ON club.Club_ID = player.Club_ID GROUP BY player.Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT club.Name FROM club WHERE club.Club_ID NOT IN (SELECT player.Club_ID FROM player)
SELECT club.Club_ID FROM club WHERE Club_ID NOT IN (SELECT player.Club_ID FROM player)
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 INTERSECT SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings < 1100000
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1400000 INTERSECT SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings < 1100000
SELECT Order_Items.order_item_status_code , Orders.date_order_placed FROM Orders AS Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Orders.order_status_code = 'earliest time' OR Order_Items.order_id > 1
SELECT Orders.order_status_code, Orders.order_status_code FROM Orders WHERE Orders.order_id IN (SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(Order_Items.order_id) > 1) ORDER BY Orders.order_id
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products WHERE Products.product_id IN (SELECT Order_Items.product_id FROM Order_Items WHERE Order_Items.order_item_id IN (SELECT Shipment_Items.order_item_id FROM Shipment_Items WHERE Shipment_Items.shipment_id IN (SELECT Shipments.shipment_id FROM Shipments WHERE Shipments.shipment_tracking_number < 2)))
SELECT payment_method_code FROM Customer_Payment_Methods
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING count(*) >= ( SELECT count(*) FROM Customers )
SELECT Customers.gender_code , COUNT(Products.product_name) FROM Products AS Products JOIN Customers AS Customers ON Products.product_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT product_id, product_size FROM Products GROUP BY product_size
SELECT Products.product_name, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Products ON Orders.customer_id = Products.product_id
SELECT Products.product_name , Shipments.shipment_date FROM Shipments JOIN Order_Items ON Shipments.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT Products.product_name , Products.product_color FROM Order_Items AS Order_Items JOIN Products AS Products ON Order_Items.product_id = Products.product_id JOIN Orders AS Orders ON Order_Items.order_id = Orders.order_id
SELECT Products.product_name , Products.product_color FROM Products JOIN Shipments ON Products.product_id = Shipments.order_id
SELECT Invoices.DESCRIPITIVE_ATTRIBUTE_2 FROM Invoices AS Invoices JOIN Shipments AS Shipments ON Invoices.invoice_number = Shipments.invoice_number WHERE Shipments.order_id IS NULL
SELECT Invoices.invoice_status_code FROM Invoices AS Invoices JOIN Orders AS Orders ON Invoices.invoice_number = Orders.customer_id WHERE Orders.order_id NOT IN (SELECT Shipments.shipment_id FROM Shipments WHERE Shipments.order_id IS NULL)
SELECT Products.product_name , Orders.date_order_placed , Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT Orders.order_id, Orders.date_order_placed, Products.product_price FROM Orders JOIN Products ON Orders.customer_id = Products.product_id
SELECT Products.product_name , T2.product_color FROM Products JOIN Products AS T2 ON Products.product_id = T2.product_id
SELECT Products.product_name , Products.product_id FROM Products
SELECT Orders.date_order_placed FROM Customers AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id GROUP BY Orders.order_id HAVING count(*) >= 2
SELECT Orders.date_order_placed FROM Customers AS Customers JOIN Customer_Payment_Methods AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id WHERE Customer_Payment_Methods.payment_method_code > 1
SELECT Orders.order_status_code FROM Orders GROUP BY Orders.order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Orders.order_status_code FROM Orders INNER JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_status_code ORDER BY COUNT(Orders.order_status_code) ASC LIMIT 1
SELECT director.Name FROM director JOIN director_admin ON director_admin.Director_ID = director.Director_ID JOIN channel ON channel.Channel_ID = director_admin.Channel_ID WHERE director.Age > (SELECT AVG(Age) FROM director)
SELECT channel.Channel_ID , channel.Name FROM channel AS channel JOIN program AS program ON program.Channel_ID = channel.Channel_ID JOIN director AS director ON director.Director_ID = program.Director_ID WHERE director.Name != "Hank Baskett"
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, city_channel.Station_name FROM city_channel AS city_channel INNER JOIN city_channel_radio AS city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID INNER JOIN radio AS radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY radio.ERP_kW DESC
SELECT radio.Transmitter FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.City_channel_ID IS NULL
SELECT vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT COUNT(*) , vehicle_driver.Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = ( SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name ORDER BY COUNT(vehicle_driver.Driver_ID) DESC LIMIT 1 )
SELECT driver.Driver_ID , count(*) FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Driver_ID = driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT driver.Driver_ID FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID ORDER BY vehicle.Power LIMIT 1
SELECT vehicle_driver.Driver_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID ORDER BY driver.Racing_Series LIMIT 1
SELECT driver.Name FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Citizenship FROM driver WHERE driver.Name NOT IN (SELECT driver.Name FROM vehicle_driver WHERE vehicle_driver.Vehicle_ID IS NOT NULL)
SELECT vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Ziyang' OR driver.Name = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Driver_ID IN (SELECT driver.Driver_ID FROM driver WHERE driver.Name = "Ziyang") OR vehicle_driver.Driver_ID IN (SELECT driver.Driver_ID FROM driver GROUP BY driver.Driver_ID HAVING COUNT(*) = 2)
SELECT vehicle.Power FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'maximum top speed'
SELECT COUNT(*) FROM vehicle WHERE Power = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name , driver.Citizenship FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Citizenship, driver.Citizenship FROM driver AS driver JOIN vehicle_driver AS vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle AS vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Question_ID JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(Assessment) ASC LIMIT 1
SELECT Valid_Answers.Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answers.Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC LIMIT 1
SELECT Students.First_Name FROM Students WHERE Students.Student_ID NOT IN (SELECT Student_Answers.Student_ID FROM Student_Answers)
SELECT Students.First_Name FROM Students WHERE Students.Student_ID NOT IN (SELECT Students.Student_ID FROM Students INNER JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID)
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Student_Answer_ID WHERE Student_Answers.Student_Answer_Text = 'Normal' INTERSECT SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Student_Answer_ID WHERE Student_Answers.Student_Answer_Text = 'Absent'
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments AS Student_Assessments JOIN Student_Answers AS Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Exam_ID WHERE Student_Answers.Student_Answer_Text = 'Normal' INTERSECT SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments AS Student_Assessments JOIN Student_Answers AS Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Exam_ID WHERE Student_Answers.Student_Answer_Text = 'Absent'
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 , Products.product_price FROM Products WHERE Products.product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_name FROM Products WHERE product_price > ( SELECT avg(product_price) FROM Products )
SELECT product_name FROM Products ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_price = (SELECT max(product_price) FROM Products)
SELECT Products.product_id , Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_2 = "Hardware" ORDER BY Products.product_price ASC LIMIT 1
SELECT Products.product_id , Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products WHERE Products.DESCRIPITIVE_ATTRIBUTE_3 = 'Hardware product' ORDER BY Products.product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_phone) DESC LIMIT 1
SELECT payment_method_code FROM Customers
SELECT customer_name FROM Customers GROUP BY customer_name ORDER BY COUNT(customer_name) ASC LIMIT 1
SELECT customer_name FROM Customers GROUP BY customer_name ORDER BY COUNT(*) LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Order_Items.DESCRIPITIVE_ATTRIBUTE_4 FROM Order_Items GROUP BY Order_Items.DESCRIPITIVE_ATTRIBUTE_4 ORDER BY COUNT(Order_Items.DESCRIPITIVE_ATTRIBUTE_4) DESC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(Order_Items.order_quantity) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_status_code > 3 AND Orders.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 2)
SELECT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Orders.order_id > 2 AND Order_Items.product_id IN (SELECT Order_Items.product_id FROM Order_Items JOIN Shipments ON Order_Items.order_item_id = Shipments.order_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipment_Items.order_item_id = (SELECT Order_Items.order_item_id FROM Order_Items GROUP BY Order_Items.order_item_id HAVING COUNT(Order_Items.order_item_id) = 3))
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Customers.customer_last_name, Customers.gender_code, Customers.customer_middle_initial FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products WHERE Products.product_id NOT IN (SELECT Order_Items.product_id FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Order_Items.product_id HAVING COUNT(*) >= 2)
SELECT Products.product_id , Products.DESCRIPITIVE_ATTRIBUTE_3 , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders AS Orders ON Order_Items.order_id = Orders.order_id JOIN Customers AS Customers ON Orders.customer_id = Customers.customer_id GROUP BY Products.product_id ORDER BY COUNT(Products.product_id) DESC
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Order_Items.order_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id , sum(Order_Items.product_price) FROM Order_Items AS Products JOIN Orders ON Products.order_id = Orders.order_id GROUP BY Orders.order_id ORDER BY sum(Order_Items.product_price) ASC LIMIT 1
SELECT Orders.order_status_code, Orders.date_order_placed FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id ORDER BY Order_Items.order_item_status_code ASC LIMIT 1
SELECT DISTINCT Products.product_name , Products.product_price , Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT product_price , product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price , product_size FROM Products WHERE product_price > ( SELECT avg(product_price) FROM Products )
SELECT COUNT(*) FROM Products WHERE product_name IS NULL
SELECT count(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items WHERE order_id IS NOT NULL)
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT email_address , town_city , county FROM Customers ORDER BY gender_code LIMIT 1
SELECT Customers.email_address, Customers.town_city, Customers.county FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.order_status_code = (SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT product_color , product_description , product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT product_color , product_description , product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT director.Name , COUNT(program.Program_ID) FROM program AS channel JOIN director ON channel.Director_ID = director.Director_ID JOIN program AS program ON program.Channel_ID = channel.Channel_ID GROUP BY director.Name ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT director.Name, director.Age FROM program JOIN director ON program.Director_ID = director.Director_ID JOIN director_admin ON director_admin.Director_ID = director.Director_ID JOIN channel ON director_admin.Channel_ID = channel.Channel_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN ( SELECT Channel_ID FROM program )
SELECT channel.Name, channel.Internet FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID GROUP BY channel.Channel_ID ORDER BY COUNT(director.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age > 40 AND director.Age < 60
SELECT vehicle_driver.Vehicle_ID, driver.DESCRIBITIVE_ATTRIBUTE_9 FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.DESCRIBITIVE_ATTRIBUTE_9 = 'Jeff Gordon' OR vehicle.Top_Speed > 2
SELECT driver.Driver_ID , vehicle.Model FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Name = 'Jeff Gordon' OR vehicle_driver.Driver_ID IN (SELECT T3_1.Driver_ID FROM vehicle_driver AS T3_1 GROUP BY T3_1.Driver_ID HAVING count(*) > 2)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(driver.Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT vehicle_driver.Driver_ID FROM vehicle_driver)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products GROUP BY product_type_code)
SELECT product_name FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware product' )
SELECT Customers.customer_phone , Customers.customer_name , Customers.customer_email , Customers.customer_name FROM Customers INNER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id INNER JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_phone ORDER BY COUNT(Order_Items.order_quantity) DESC LIMIT 1
SELECT Customers.address_id , Customers.customer_phone , Customers.customer_email , Customers.customer_id FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders WHERE order_id IN (SELECT order_id FROM Order_Items))
SELECT Customer_Orders.order_date, Order_Items.order_id FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_price > 6 OR Products.product_price > 3
SELECT Order_Items.order_id , Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name > 3 OR Products.product_type_code > 6
SELECT region.Capital FROM region JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Capital ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT region.Capital, region.Area FROM building AS building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Area ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers INNER JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(Services.Service_Details) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers INNER JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID INNER JOIN Services ON Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(Customers_and_Services.Customers_and_Services_Details) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID JOIN Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(Services.Service_ID) DESC LIMIT 1
SELECT Customer_Interactions.Status_Code , Customer_Interactions.Services_and_Channels_Details FROM Customer_Interactions JOIN Customers_and_Services ON Customer_Interactions.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customer_Interactions.Customer_Interaction_ID ORDER BY COUNT(Customer_Interactions.Customer_Interaction_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID INNER JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID ORDER BY Services.Service_ID LIMIT 1
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers_and_Services.Customer_ID = (SELECT Customers.Customer_ID FROM Customers JOIN Analytical_Layer ON Customers_and_Services.Customers_and_Services_ID = Analytical_Layer.Customers_and_Services_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(Analytical_Layer.Customers_and_Services_ID) LIMIT 1)
SELECT Services.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID INNER JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customers.Customer_Details = "Hardy Kutch" OR Customer_Interactions.Status_Code = "good"
SELECT Services.Service_Details FROM Services AS Services JOIN Customers_and_Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers AS Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' INTERSECT SELECT Services.Service_Details FROM Services AS Services JOIN Customer_Interactions AS Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Interactions.Status_Code = 'good'
SELECT Services.Service_Details FROM Services INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID INNER JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Services.Service_Details FROM Services INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID INNER JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Vehicles.name , Discount.name , Vehicles.Cost_per_25_miles FROM Vehicles JOIN Customers ON Vehicles.vehicles_id = Customers.id JOIN Discount ON Vehicles.vehicles_id = Discount.id WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2 , Discount.DESCRIPATIVE_ATTRIBUTE_6 , Vehicles.Cost_per_25_miles FROM Vehicles AS Vehicles JOIN Renting_history AS Renting_history ON Vehicles.id = Renting_history.vehicles_id JOIN Customers AS Customers ON Renting_history.customer_id = Customers.id JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2, Vehicles.Model_year FROM Renting_history AS Renting_history JOIN Vehicles AS Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Customers AS Customers ON Renting_history.customer_id = Customers.id GROUP BY Customers.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2 , Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Customers ON Renting_history.customer_id = Customers.id ORDER BY Renting_history.total_hours DESC LIMIT 1
SELECT Discount.DESCRIBITIVE_ATTRIBUTE_6 FROM Renting_history AS Customers JOIN Discount ON Customers.discount_id = Discount.id GROUP BY Discount.DESCRIBITIVE_ATTRIBUTE_6 ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Discount.DESCRIBATIVE_ATTRIBUTE_6 FROM Renting_history AS Renting_history JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.DESCRIBATIVE_ATTRIBUTE_6 ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Students.bio_data , Student_Events.event_type_code FROM Students AS Students JOIN Student_Events AS Student_Events ON Student_Events.student_id = Students.student_id JOIN Detention AS Detention ON Detention.student_id = Students.student_id WHERE Detention.class_details = 'classes' GROUP BY Students.student_id HAVING COUNT(Detention.class_details) >= 2 OR Detention.detention_summary < 2
SELECT Students.bio_data , Student_Events.event_type_code FROM Students INNER JOIN Student_Events ON Student_Events.student_id = Students.student_id INNER JOIN Classes ON Classes.student_id = Students.student_id WHERE Classes.class_details IN (SELECT class_details FROM Classes GROUP BY class_details HAVING COUNT(*) >= 2) OR Detention.datetime_detention_start < Detention.datetime_detention_end
SELECT Classes.DESCRIPITIVE_ATTRIBUTE_9 FROM Classes JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.DESCRIPITIVE_ATTRIBUTE_9 LIKE '%data%' AND Classes.student_id NOT IN (SELECT Students.student_id FROM Students WHERE Students.student_id IN (SELECT Classes.student_id FROM Classes WHERE Classes.DESCRIPITIVE_ATTRIBUTE_9 LIKE 'net%'))
SELECT teacher_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id WHERE Classes.class_details LIKE '%data%' AND Classes.class_details NOT LIKE 'net%'
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Students AS Students JOIN Achievements AS Achievements ON Students.student_id = Achievements.student_id JOIN Student_Loans AS Student_Loans ON Students.student_id = Student_Loans.student_id GROUP BY Students.student_id HAVING Count(Achievements.achievement_id) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Student_Loans.student_id = Achievements.student_id JOIN Students ON Achievements.student_id = Students.student_id JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code WHERE Ref_Achievement_Type.achievement_type_description = 'students two'
SELECT Teachers.teacher_details, Students.student_id FROM Students INNER JOIN Classes ON Students.student_id = Classes.student_id INNER JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id GROUP BY Teachers.teacher_details ORDER BY COUNT(Classes.teacher_id) DESC LIMIT 1
SELECT Teachers.teacher_details , Students.student_id FROM Teachers AS Teachers JOIN Classes AS Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students AS Students ON Classes.student_id = Students.student_id GROUP BY Students.student_id ORDER BY COUNT(Classes.class_id) DESC LIMIT 1
SELECT Students.student_details, Students.student_id, Behaviour_Monitoring.behaviour_monitoring_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Events.event_type_code IN ( SELECT event_type_code FROM Student_Events GROUP BY event_type_code ORDER BY COUNT(*) DESC LIMIT 1 ) AND Student_Events.event_type_code IN ( SELECT event_type_code FROM Student_Events GROUP BY event_type_code HAVING COUNT(*) = 3 )
SELECT Students.bio_data , Student_Events.other_details FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id WHERE Student_Events.event_date = ( SELECT event_date FROM Student_Events JOIN Student_Loans ON Student_Events.student_id = Student_Loans.student_id GROUP BY event_date ORDER BY COUNT(*) DESC LIMIT 1 ) INTERSECT SELECT Students.bio_data , Student_Events.other_details FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id WHERE Student_Events.event_date = ( SELECT event_date FROM Student_Events JOIN Student_Loans ON Student_Events.student_id = Student_Loans.student_id GROUP BY event_date ORDER BY COUNT(*) DESC LIMIT 2 )
SELECT Students.student_details FROM Students INNER JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id GROUP BY Students.student_id HAVING count(*) = (SELECT count(*) FROM Behaviour_Monitoring GROUP BY student_id ORDER BY count(*) DESC LIMIT 1)
SELECT Students.bio_data FROM Students INNER JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id GROUP BY Students.student_id ORDER BY COUNT(Behaviour_Monitoring.student_id) DESC LIMIT 1
SELECT COUNT(Students.student_id) , Ref_Event_Types.event_type_description , Ref_Event_Types.event_type_description FROM Students AS Students INNER JOIN Student_Events AS Student_Events ON Students.student_id = Student_Events.student_id INNER JOIN Ref_Event_Types AS Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT Students.student_details, Classes.class_details, Ref_Event_Types.event_type_description FROM Students INNER JOIN Student_Events ON Students.student_id = Student_Events.student_id INNER JOIN Classes ON Students.student_id = Classes.student_id INNER JOIN Ref_Event_Types ON Classes.teacher_id = Ref_Event_Types.event_type_code GROUP BY Classes.teacher_id ORDER BY COUNT(Students.student_id) DESC LIMIT 1
SELECT COUNT(Students.student_id) FROM Students AS Students JOIN Students_Addresses AS Students_Addresses ON Students.student_id = Students_Addresses.student_id WHERE Students.student_details = 'None'
SELECT COUNT(Teachers.teacher_id) FROM Teachers AS Teachers JOIN Classes AS Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Achievements AS Achievements ON Classes.student_id = Achievements.student_id WHERE Achievements.achievement_type_code NOT IN (SELECT Ref_Achievement_Type.achievement_type_code FROM Ref_Achievement_Type AS Ref_Achievement_Type JOIN Achievements AS Achievements ON Ref_Achievement_Type.achievement_type_code = Achievements.achievement_type_code)
SELECT Ref_Event_Types.event_type_code, Ref_Event_Types.DESCRIBITIVE_ATTRIBUTE_2 FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code JOIN Ref_Event_Types ON Detention.student_id = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.DESCRIBITIVE_ATTRIBUTE_2 ORDER BY COUNT(Ref_Event_Types.DESCRIBITIVE_ATTRIBUTE_2) ASC LIMIT 1
SELECT Ref_Event_Types.event_type_code , Ref_Event_Types.event_type_description FROM Detention AS Detention JOIN Ref_Detention_Type AS Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code JOIN Ref_Event_Types AS Ref_Event_Types ON Detention.student_id = Ref_Event_Types.event_type_code GROUP BY Detention.detention_type_code ORDER BY COUNT(Detention.detention_type_code) LIMIT 1
SELECT Students.bio_data , Students.student_details , Student_Loans.other_details FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT avg(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data , Students.student_details FROM Students INNER JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id JOIN Students ON Students.student_id = Classes.student_id JOIN Transcripts ON Transcripts.student_id = Students.student_id JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id WHERE Students_Addresses.student_address_id = (SELECT transcript_id FROM Students_Addresses ORDER BY date_to LIMIT 1)
SELECT Teachers.teacher_details FROM Teachers INNER JOIN Student_Events ON Teachers.teacher_id = Student_Events.event_type_code INNER JOIN Students ON Student_Events.student_id = Students.student_id INNER JOIN Transcripts ON Students.student_id = Transcripts.student_id ORDER BY Transcripts.date_of_transcript ASC LIMIT 1
SELECT Addresses.address_details , Addresses.address_details FROM Students_Addresses INNER JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id GROUP BY Addresses.address_details ORDER BY COUNT(Addresses.address_details) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_description, Addresses.address_details FROM Students_Addresses INNER JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id INNER JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_description ORDER BY COUNT(Ref_Address_Types.address_type_description) DESC LIMIT 1
