SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT club.Name FROM club WHERE club.Name LIKE 'club%' ORDER BY club.Name
SELECT club.Name FROM club WHERE club.Name != "Nike"
SELECT club.Name FROM club WHERE club.Name NOT IN (SELECT player.Country FROM player WHERE player.Country = 'Nike')
SELECT club.DESCRIPITIVE_ATTRIBUTE_2 FROM club ORDER BY player.Events_number
SELECT club.Name FROM club WHERE club.Name IN ( SELECT club.Name FROM club GROUP BY club.Name ORDER BY COUNT(*) ASC )
SELECT DISTINCT club.Name FROM club WHERE club.Events_number > 1200000
SELECT player.Name FROM player WHERE player.Earnings > 1200000
SELECT club.Name FROM club WHERE club.Club_ID IN (SELECT player.Club_ID FROM player GROUP BY player.Club_ID HAVING COUNT(*) > 1)
SELECT DISTINCT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING COUNT(*) > 1)
SELECT club.Name FROM club WHERE EXISTS (SELECT 1 FROM player WHERE player.Club_ID = club.Club_ID GROUP BY player.Club_ID HAVING COUNT(*) > 1)
SELECT club.Name FROM club WHERE club.Name IN (SELECT club.Name FROM club GROUP BY club.Name HAVING COUNT(*) > 1)
SELECT COUNT(DISTINCT club.Name) FROM club
SELECT COUNT(DISTINCT player.Name) FROM player
SELECT COUNT(Customers.customer_id) FROM Customers AS Customers JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers INNER JOIN Orders ON Orders.customer_id = Customers.customer_id
SELECT COUNT(Order_Items.order_id) FROM Order_Items
SELECT DISTINCT order_item_status_code FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Order_Items WHERE order_id IN (SELECT order_id FROM Orders)
SELECT COUNT(*) FROM Products
SELECT avg(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT COUNT(DISTINCT Analogue_terrestrial_channel) FROM channel
SELECT program.Title FROM program INNER JOIN director ON program.Director_ID = director.Director_ID ORDER BY director.Age DESC
SELECT channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio WHERE Transmitter = 'radio'
SELECT city_channel_radio.Is_online FROM city_channel_radio WHERE city_channel_radio.Radio_ID IN ( SELECT radio.Radio_ID FROM radio WHERE radio.Transmitter = 'radios' ) ORDER BY city_channel_radio.Is_online ASC
SELECT Transmitter FROM radio WHERE Radio_MHz != 'ABC'
SELECT avg(ERP_kW) FROM radio
SELECT city_channel_radio.Is_online FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID GROUP BY city_channel_radio.Is_online HAVING COUNT(city_channel_tv_show.Is_online) > 3
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver AS driver ON vehicle.Vehicle_ID = driver.Driver_ID
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver AS driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle AS vehicle INNER JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'NASCAR'
SELECT COUNT(*) FROM vehicle WHERE Builder = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(vehicle.Power) FROM vehicle
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = vehicle.Vehicle_ID
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams
SELECT DISTINCT Subject_Code FROM Exams
SELECT DISTINCT Valid_Answers.Valid_Answer_Text FROM Valid_Answers INNER JOIN Questions ON Valid_Answers.Question_ID = Questions.Question_ID INNER JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID WHERE Questions_in_Exams.Question_ID = Questions.Question_ID AND Questions.Type_of_Question_Code = 'Normal'
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = 'Normal'
SELECT count(DISTINCT Student_Answers.Student_Answer_Text) FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers
SELECT Students.First_Name FROM Students WHERE Students.Middle_Name != "M"
SELECT First_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions AS Questions JOIN Questions_in_Exams AS Questions_in_Exams ON Questions_in_Exams.Question_ID = Questions.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions AS Questions JOIN Questions_in_Exams AS Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
SELECT Students.First_Name , Students.Middle_Name , Students.Last_Name , Students.Gender_MFU , Students.Student_Address FROM Students
SELECT Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Answers.Date_of_Answer, Student_Answers.Student_Answer_Text FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT COUNT(product_id) FROM Products
SELECT COUNT(product_id) FROM Products
SELECT product_price FROM Products WHERE product_type_code = 'Monitor'
SELECT product_price FROM Products
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products WHERE product_type_code = "Hardware"
SELECT Products.DESCRIPITIVE_ATTRIBUTE_2 FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id ORDER BY Order_Items.order_quantity DESC
SELECT product_type_code FROM Products ORDER BY product_name DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT customer_name FROM Customers
SELECT DISTINCT customer_address FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders WHERE customer_id IN (SELECT customer_id FROM Customers)
SELECT COUNT(Customer_Orders.order_id) FROM Customers AS Customers JOIN Customer_Orders AS Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT club.Name, club.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Country = 'Manager' OR player.Country = 'Captain'
SELECT club.Name, club.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Manager' INTERSECT SELECT club.Name, club.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID WHERE player.Name = 'Captain'
SELECT club.Name FROM club WHERE club.Earnings = ( SELECT MAX(Earnings) FROM club )
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name , player.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID
SELECT club.Name, club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID
SELECT club.Name FROM club WHERE club.Name IN (SELECT player.Name FROM player WHERE player.Earnings > 2)
SELECT club.Name FROM club WHERE club.Name IN (SELECT player.Name FROM player WHERE player.Earnings > 2)
SELECT club.Name FROM club WHERE club.Name IN (SELECT club.Name FROM club WHERE club.Captain = "Sam Allardyce")
SELECT club.Name FROM club AS club JOIN player AS player ON player.Club_ID = club.Club_ID WHERE player.Country = "Sam Allardyce"
SELECT club.Name , count(*) FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT club.Name, COUNT(*) FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name
SELECT player.Events_number FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT player.Name , player.Country FROM player WHERE player.Country = "Australia" OR player.Country = "Zimbabwe"
SELECT Products.product_id , Products.product_name , count(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id , Products.product_name
SELECT Order_Items.product_id, COUNT(Shipments.shipment_id), Order_Items.order_item_status_code, Order_Items.order_item_id FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id GROUP BY Order_Items.order_item_id
SELECT Products.product_id , Products.product_name FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Shipment_Items.order_item_id = ( SELECT Shipments.invoice_number FROM Shipments AS Shipments JOIN Invoices AS Invoices ON Shipments.shipment_date = Invoices.invoice_date GROUP BY Shipments.invoice_number HAVING COUNT(Shipments.invoice_number) >= 2 )
SELECT Shipments.shipment_id , Invoices.invoice_status_code FROM Shipments INNER JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number GROUP BY Shipments.shipment_id HAVING count(*) >= 2
SELECT Customers.DESCRIPITIVE_ATTRIBUTE_2 , COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.DESCRIPITIVE_ATTRIBUTE_2
SELECT Order_Items.order_item_status_code, COUNT(*) FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Order_Items.order_item_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name , Customer_Payment_Methods.payment_method_code FROM Customers INNER JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Shipments INNER JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Orders.order_status_code, Orders.date_order_placed, Orders.date_order_placed FROM Orders WHERE Orders.order_id IN (SELECT Shipments.order_id FROM Shipments)
SELECT Shipments.shipment_tracking_number, Orders.order_status_code FROM Shipment_Items JOIN Shipments ON Shipment_Items.order_item_id = Shipments.shipment_id JOIN Order_Items ON Shipment_Items.shipment_id = Order_Items.order_item_id JOIN Orders ON Order_Items.order_id = Orders.order_id
SELECT Order_Items.order_item_status_code , Shipments.shipment_tracking_number FROM Order_Items JOIN Shipments ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Order_Items.invoice_number = Invoices.invoice_number JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Order_Items.order_item_status_code = 'Ordered' INTERSECT SELECT Order_Items.order_item_status_code , Shipments.shipment_tracking_number FROM Order_Items JOIN Shipments ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Order_Items.invoice_number = Invoices.invoice_number JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Order_Items.order_item_status_code = 'Shipped'
SELECT login_password, login_password FROM Customers WHERE login_password LIKE '+12%'
SELECT Customers.customer_first_name , Customers.customer_last_name FROM Customers AS Customers JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Customers.customer_first_name LIKE '+12%'
SELECT product_name FROM Products WHERE product_color LIKE '%Dell%'
SELECT Products.product_name FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT Order_Items.order_item_status_code , Shipments.shipment_date FROM Shipments INNER JOIN Order_Items ON Shipments.invoice_number = Order_Items.order_item_id
SELECT Order_Items.order_item_status_code , Orders.date_order_placed FROM Orders AS Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id
SELECT county , email_address , address_line_1 FROM Customers WHERE customer_first_name = "USA"
SELECT county FROM Customers
SELECT Products.product_id, Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Products.product_price > 3
SELECT Products.product_id, Products.product_name FROM Products JOIN Shipment_Items ON Shipment_Items.order_item_id = Products.product_id GROUP BY Products.product_id HAVING count(*) > 3
SELECT Orders.date_order_placed , Orders.order_id FROM Orders JOIN Shipment_Items ON Shipment_Items.order_item_id = Orders.order_id GROUP BY Orders.order_id HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT Shipments.shipment_date , Shipments.shipment_id FROM Shipments JOIN Order_Items ON Shipments.invoice_number = Order_Items.order_item_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id GROUP BY Shipments.shipment_id HAVING COUNT(Shipment_Items.shipment_id) >= 2
SELECT order_id , shipment_date FROM Shipments
SELECT Order_Items.order_id , Orders.date_order_placed FROM Orders AS Orders JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id
SELECT channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID INNER JOIN director ON program.Director_ID = director.Director_ID ORDER BY director.Age DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Analogue_terrestrial_channel LIKE '%bbc%'
SELECT channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Start_Year = ( SELECT MAX(program.Start_Year) FROM program )
SELECT channel.Name, channel.Internet FROM channel AS channel JOIN program AS program ON program.Channel_ID = channel.Channel_ID JOIN director AS director ON director.Director_ID = program.Director_ID GROUP BY channel.Name, channel.Internet HAVING COUNT(program.Program_ID) > 1
SELECT director.Name, COUNT(program.Title) FROM program INNER JOIN director ON program.Director_ID = director.Director_ID GROUP BY director.Name
SELECT channel.Name FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show.tv_show_name, tv_show.Sub_tittle FROM tv_show INNER JOIN city_channel_tv_show ON tv_show.tv_show_ID = city_channel_tv_show.tv_show_ID
SELECT city_channel_radio.Is_online FROM city_channel_radio WHERE city_channel_radio.Radio_ID IN (SELECT Radio_ID FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30)
SELECT city_channel_radio.Is_online FROM city_channel_radio WHERE Radio_ID IN ( SELECT Radio_ID FROM radio ORDER BY ERP_kW DESC LIMIT 1 )
SELECT tv_show.tv_show_name , COUNT(*) FROM tv_show JOIN city_channel_tv_show ON tv_show.tv_show_ID = city_channel_tv_show.tv_show_ID GROUP BY tv_show.tv_show_name
SELECT city_channel_tv_show.DESCRIPITIVE_ATTRIBUTE_12, city_channel_radio.DESCRIPATIVE_ATTRIBUTE_8 FROM city_channel_radio JOIN city_channel_tv_show ON city_channel_radio.Radio_ID = city_channel_tv_show.tv_show_ID WHERE city_channel_radio.Radio_ID = city_channel.ID
SELECT radio.Transmitter, radio.Radio_MHz FROM city_channel_radio INNER JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE city_channel_radio.Is_online = 'radios'
SELECT radio.Transmitter , COUNT(city_channel_tv_show.Is_online) FROM city_channel_radio AS city_channel JOIN radio AS radio ON city_channel.Radio_ID = radio.Radio_ID JOIN city_channel_tv_show AS city_channel_tv_show ON city_channel.City_channel_ID = city_channel_tv_show.City_channel_ID GROUP BY radio.Transmitter
SELECT MAX(Total_Production) AS max_power, AVG(Total_Production) AS avg_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE Model = 'Zhuzhou'
SELECT MAX(Total_Production) AS max_power, AVG(Total_Production) AS avg_power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE Model = 'Zhuzhou'
SELECT vehicle.Total_Production , vehicle.Power FROM vehicle WHERE vehicle.Top_Speed = 1996
SELECT vehicle.Total_Production , vehicle.Total_Production FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID JOIN driver AS vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Name = 'year' AND vehicle_driver.Citizenship = 'built' AND vehicle_driver.Racing_Series = '1996'
SELECT vehicle.Build_Year , driver.Name , driver.Citizenship FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID
SELECT vehicle.Power , driver.Citizenship , driver.Racing_Series FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(*) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = "2012"
SELECT COUNT(DISTINCT vehicle.Vehicle_ID) FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed = 2012
SELECT vehicle.Builder FROM vehicle WHERE vehicle.Top_Speed > 100 OR vehicle.Power > 150
SELECT driver.Name FROM vehicle AS vehicle INNER JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Power > 150 OR vehicle.Top_Speed > 100
SELECT driver.Name, driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder LIKE '%DJ%'
SELECT vehicle.Builder , vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Builder LIKE "%DJ%"
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle AS vehicle INNER JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle_driver.Vehicle_ID
SELECT COUNT(*) FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID GROUP BY driver.Vehicle_ID
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams WHERE Exams.Exam_Name NOT LIKE "Database"
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams WHERE Exams.Subject_Code != "Database"
SELECT Type_of_Question_Code , COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Questions.Type_of_Question_Code , COUNT(*) FROM Questions GROUP BY Questions.Type_of_Question_Code
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers GROUP BY Student_Answers.Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Student_Assessments.Student_Answer_Text, Student_Answers.Date_of_Answer FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Valid_Answer_ID = Student_Answers.Exam_ID
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 , Exams.Exam_Date FROM Students AS Students INNER JOIN Student_Answers AS Student_Answers ON Students.Student_ID = Student_Answers.Student_ID INNER JOIN Exams AS Exams ON Student_Answers.Exam_ID = Exams.Exam_ID
SELECT Student_Assessments.Student_Answer_Text , Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Student_Assessments ON Questions_in_Exams.Question_ID = Student_Assessments.Valid_Answer_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.Student_Answer_Text , Student_Answers.Date_of_Answer FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Students ON Questions_in_Exams.Question_ID = Students.Student_ID JOIN Student_Assessments ON Student_Assessments.Valid_Answer_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Student_Assessments.Student_Answer_Text FROM Student_Answers AS Students INNER JOIN Student_Assessments AS Questions_in_Exams ON Questions_in_Exams.Student_Answer_ID = Students.Exam_ID WHERE Students.Student_ID IN (SELECT Student_ID FROM Students GROUP BY Student_ID HAVING COUNT(*) >= 2)
SELECT Student_Assessments.Student_Answer_Text FROM Student_Answers AS Students INNER JOIN Student_Assessments ON Students.Exam_ID = Student_Assessments.Student_Answer_ID GROUP BY Student_Assessments.Student_Answer_ID HAVING COUNT(*) >= 2
SELECT First_Name , COUNT(*) FROM Students GROUP BY First_Name
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT player.Name FROM player AS club JOIN club AS player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID HAVING count(*) > 2 ORDER BY count(*) DESC LIMIT 1
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY AVG(player.Events_number) DESC
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Events_number) DESC
SELECT club.Name FROM club WHERE club.Name = (SELECT club.Name FROM club GROUP BY club.Name ORDER BY COUNT(*) DESC LIMIT 1)
SELECT club.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name FROM club WHERE club.Name NOT IN (SELECT player.Name FROM player)
SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE club.Name = 'country' AND player.Events_number > 1400000 INTERSECT SELECT club.Name FROM club INNER JOIN player ON club.Club_ID = player.Club_ID WHERE club.Name = 'country' AND player.Events_number < 1100000
SELECT player.Name FROM player WHERE player.Earnings > 1400000 INTERSECT SELECT player.Name FROM player WHERE player.Earnings < 1100000
SELECT Orders.order_status_code , Orders.date_order_placed FROM Orders WHERE Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR Orders.order_status_code = 1
SELECT DISTINCT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items) UNION SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1)
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id WHERE Shipment_Items.shipment_id IS NULL
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods INNER JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(Customer_Payment_Methods.payment_method_code) DESC LIMIT 1
SELECT Products.product_name , COUNT(*) FROM Products GROUP BY Products.product_name
SELECT COUNT(*) FROM Products
SELECT Products.product_name, Invoices.invoice_date FROM Products AS Products JOIN Shipments AS Shipments ON Products.product_id = Shipments.invoice_number JOIN Invoices AS Invoices ON Shipments.invoice_number = Invoices.invoice_number
SELECT Products.product_name , Orders.date_order_placed FROM Products AS Products INNER JOIN Orders AS Orders ON Products.product_id = Orders.customer_id
SELECT Order_Items.order_item_status_code , Products.product_name FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipments ON Shipments.order_id = Order_Items.order_id WHERE Shipments.shipment_tracking_number = 'shipped'
SELECT Products.product_name , Products.order_status_code FROM Products AS Products JOIN Orders AS Orders ON Products.product_id = Orders.customer_id WHERE Orders.date_order_placed = (SELECT max(date_order_placed) FROM Orders)
SELECT Shipments.shipment_tracking_number FROM Shipments AS Invoices JOIN Orders AS Orders ON Invoices.invoice_number = Orders.order_id WHERE Orders.order_id NOT IN (SELECT Orders.order_id FROM Orders AS Orders JOIN Order_Items AS Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id WHERE Shipment_Items.order_item_id = 1)
SELECT Orders.order_status_code FROM Orders WHERE Orders.date_order_placed = 'shipped'
SELECT Shipments.shipment_tracking_number, Orders.order_status_code, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Products.product_id, Invoices.invoice_date, Products.product_price FROM Products JOIN Orders ON Orders.customer_id = Products.product_id JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Invoices ON Invoices.invoice_number = Shipments.invoice_number
SELECT Products.product_name , Products.product_name FROM Products
SELECT Products.product_name , Products.product_color FROM Products
SELECT Invoices.invoice_date FROM Customers AS Customers JOIN Orders AS Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Invoices AS Invoices ON Customer_Payment_Methods.order_id = Invoices.invoice_number GROUP BY Invoices.invoice_number HAVING count(DISTINCT Customer_Payment_Methods.customer_id) >= 2
SELECT Invoices.invoice_date FROM Customers AS Customers JOIN Orders AS Orders ON Customers.customer_id = Orders.customer_id JOIN Invoices AS Invoices ON Orders.customer_id = Invoices.invoice_number WHERE Customers.customer_last_name = "2"
SELECT order_status_code FROM Orders WHERE customer_id = (SELECT customer_id FROM Orders GROUP BY customer_id ORDER BY COUNT(*) LIMIT 1)
SELECT order_item_status_code FROM Order_Items WHERE order_id IN (SELECT order_id FROM Orders GROUP BY order_id ORDER BY COUNT(*) LIMIT 1)
SELECT channel.Name FROM channel INNER JOIN director ON channel.Channel_ID = director.Director_ID WHERE director.Age > (SELECT AVG(Age) FROM director)
SELECT channel.Name, channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID WHERE program.Title NOT LIKE '%Hank Baskett%'
SELECT city_channel_tv_show.Is_online FROM city_channel AS city_channel JOIN city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID GROUP BY city_channel_tv_show.Is_online ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, radio.Radio_MHz FROM city_channel_radio AS city_channel JOIN radio ON city_channel.Radio_ID = radio.Radio_ID WHERE city_channel.Is_online = "radios" ORDER BY city_channel.Is_online DESC
SELECT DISTINCT radio.Transmitter FROM radio WHERE radio.Radio_MHz NOT IN (SELECT city_channel_tv_show.Is_online FROM city_channel_tv_show)
SELECT driver.Name FROM vehicle AS vehicle INNER JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID INNER JOIN driver AS driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Top_Speed > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT driver.Citizenship FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Total_Production > 6000 ORDER BY vehicle.Power DESC LIMIT 1
SELECT COUNT(*) , vehicle.Vehicle_ID FROM vehicle INNER JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT vehicle.Vehicle_ID , count(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY count(*) DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle WHERE vehicle.Top_Speed = (SELECT MIN(vehicle.Top_Speed) FROM vehicle)
SELECT vehicle_driver.Driver_ID FROM vehicle_driver WHERE vehicle_driver.Vehicle_ID = ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver ORDER BY vehicle_driver.Vehicle_ID ASC LIMIT 1 )
SELECT DISTINCT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID WHERE vehicle.Top_Speed > 5000
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Driver_ID = driver.Driver_ID WHERE vehicle.Driver_ID NOT IN (SELECT vehicle.Vehicle_ID FROM vehicle AS vehicle JOIN vehicle_driver AS driver ON vehicle.Vehicle_ID = driver.Vehicle_ID)
SELECT driver.Name FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID LEFT JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Vehicle_ID IS NULL
SELECT driver.Name, driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IN (SELECT vehicle.Vehicle_ID FROM vehicle GROUP BY vehicle.Vehicle_ID HAVING COUNT(vehicle.Vehicle_ID) >= 2) OR driver.Racing_Series = 'Ziyang'
SELECT vehicle.Vehicle_ID, driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE (SELECT COUNT(*) FROM vehicle_driver AS T4 WHERE T4.Vehicle_ID = vehicle.Vehicle_ID) = 2 OR driver.Racing_Series = "Ziyang"
SELECT COUNT(vehicle.Vehicle_ID) FROM vehicle AS vehicle INNER JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Total_Production = 'maximum top speed'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name , driver.Citizenship FROM vehicle_driver INNER JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle_driver.Vehicle_ID = ( SELECT Vehicle_ID FROM vehicle WHERE Builder = 'DJ1' )
SELECT driver.Name, driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Builder = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Valid_Answer_ID = ( SELECT Student_ID FROM Students GROUP BY Student_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Assessment FROM Student_Assessments WHERE Valid_Answer_ID = ( SELECT Valid_Answer_ID FROM Student_Assessments GROUP BY Valid_Answer_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments GROUP BY Student_Assessments.Student_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC LIMIT 1
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Valid_Answer_ID NOT IN (SELECT Student_Answers.Exam_ID FROM Student_Answers)
SELECT Students.DESCRIPITIVE_ATTRIBUTE_2 FROM Students WHERE Students.Student_ID NOT IN (SELECT Student_Answers.Student_ID FROM Student_Answers)
SELECT Student_Answers.Comments FROM Student_Answers WHERE Student_Answers.Student_Answer_Text IN (SELECT Valid_Answer_Text FROM Valid_Answers WHERE Question_ID = 1)
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = 'Normal' INTERSECT SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments WHERE Student_Assessments.Satisfactory_YN = 'Absent'
SELECT product_type_code FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_type_code FROM Products WHERE product_price > (SELECT avg(product_price) FROM Products)
SELECT product_type_code FROM Products ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_price = (SELECT max(product_price) FROM Products)
SELECT Order_Items.order_id , Order_Items.order_quantity FROM Order_Items WHERE Order_Items.product_id IN ( SELECT Products.product_id FROM Products WHERE Products.product_type_code = "Hardware" ORDER BY Products.product_price ASC LIMIT 1 )
SELECT Products.product_id , Products.DESCRIBITIVE_ATTRIBUTE_2 FROM Products WHERE Products.product_price = ( SELECT MIN(product_price) FROM Products WHERE Products.DESCRIBITIVE_ATTRIBUTE_3 = 'Hardware' )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT customer_phone FROM Customers GROUP BY customer_phone ORDER BY COUNT(*) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) ASC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Order_Items.order_item_id FROM Order_Items GROUP BY Order_Items.order_item_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Order_Items.order_item_id FROM Customer_Orders AS Customer_Orders JOIN Order_Items AS Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Order_Items.order_item_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_type_code FROM Products EXCEPT SELECT Products.product_type_code FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id
SELECT product_type_code FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT Products.product_id, Products.product_name, Products.product_name FROM Products INNER JOIN Order_Items ON Order_Items.product_id = Products.product_id INNER JOIN Shipment_Items ON Shipment_Items.shipment_id = Shipments.shipment_id INNER JOIN Shipments ON Shipments.invoice_number = Shipment_Items.shipment_id WHERE Order_Items.order_item_status_code = 'order' GROUP BY Products.product_id HAVING COUNT(Order_Items.order_item_status_code) > 2 AND COUNT(Order_Items.order_item_status_code) > 3
SELECT Products.product_id, Products.product_name, Customers.gender_code FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Order_Items.order_id IN (SELECT Orders.order_id FROM Orders GROUP BY Orders.order_id HAVING COUNT(Orders.order_id) > 2) AND Customers.customer_first_name IN (SELECT Customers.customer_first_name FROM Customers GROUP BY Customers.customer_first_name HAVING COUNT(Customers.customer_first_name) >= 3)
SELECT Customers.gender_code , Customers.customer_first_name , Customers.customer_last_name FROM Customers WHERE Customers.customer_id NOT IN (SELECT Orders.customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.customer_id IS NULL
SELECT Products.product_id , Products.product_name , Products.product_price , Products.product_color FROM Products LEFT JOIN Shipment_Items ON Products.product_id = Shipment_Items.order_item_id LEFT JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id WHERE Shipments.shipment_tracking_number NOT IN ( SELECT Shipments.shipment_tracking_number FROM Shipments GROUP BY Shipments.shipment_tracking_number HAVING COUNT(*) >= 2 )
SELECT Products.product_id , Customers.gender_code , Customers.customer_first_name FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Customers AS Customers ON Order_Items.order_id = Customers.customer_id GROUP BY Customers.gender_code , Customers.customer_first_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id , Products.product_name , Products.product_price FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Shipment_Items.shipment_id ORDER BY COUNT(Shipment_Items.shipment_id) DESC LIMIT 1
SELECT Shipment_Items.order_item_id , SUM(Products.product_price * Products.product_price) FROM Products AS Products JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items AS Shipment_Items ON Order_Items.order_item_id = Shipment_Items.shipment_id GROUP BY Shipment_Items.order_item_id ORDER BY SUM(Products.product_price * Products.product_price) ASC LIMIT 1
SELECT Orders.order_status_code, MIN(Orders.date_order_placed) FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_status_code
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Customers ON Order_Items.order_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT Products.product_name, Products.product_price, Customers.customer_last_name FROM Products INNER JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT product_price , product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(*) FROM Products WHERE product_price = 0
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(Customers.gender_code) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id WHERE Customer_Payment_Methods.payment_method_code IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT county , email_address , address_line_1 FROM Customers GROUP BY gender_code ORDER BY COUNT(gender_code) LIMIT 1
SELECT Customers.gender_code, Customers.email_address, Customers.address_line_1 FROM Customers WHERE Customers.town_city = (SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT product_color , product_description , product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT product_color , product_description , product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT channel.Name , COUNT(director_admin.Director_ID) FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID GROUP BY channel.Name ORDER BY COUNT(director_admin.Director_ID) DESC LIMIT 1
SELECT channel.Name, director.Age FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY channel.Name, director.Age ORDER BY COUNT(director_admin.Is_first_director) DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM director_admin)
SELECT channel.Name, channel.Internet FROM channel AS channel INNER JOIN program AS program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Name, channel.Internet ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT channel.Name FROM program AS channel JOIN director AS director ON channel.Director_ID = director.Director_ID WHERE director.Age < 40 AND director.Age > 60
SELECT vehicle.Vehicle_ID, driver.Citizenship FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon' OR driver.Racing_Series > 2
SELECT driver.Name , driver.Citizenship FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Top_Speed > 2 OR vehicle.Builder = 'Jeff Gordon'
SELECT COUNT(*) FROM driver WHERE Citizenship NOT IN (SELECT Citizenship FROM vehicle_driver)
SELECT COUNT(*) FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT product_type_code FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_type_code FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT Customers.address_id , Customers.customer_name , Customers.customer_phone , Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.product_id = (SELECT product_id FROM Order_Items ORDER BY product_id DESC LIMIT 1)
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT Customer_Orders.order_date, Customer_Orders.order_id FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.order_quantity > 6 OR Order_Items.product_id > 3
SELECT Customer_Orders.order_id , Customer_Orders.order_date FROM Order_Items AS Products JOIN Customer_Orders ON Products.product_id = Customer_Orders.order_id WHERE Products.order_quantity = '6' OR Products.order_id = 3
SELECT region.Capital FROM building AS building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Capital ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT region.Capital, region.Area FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Capital ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT Customer_Interactions.Status_Code FROM Customer_Interactions WHERE Customer_Interactions.Channel_ID = ( SELECT Customer_Interactions.Channel_ID FROM Customer_Interactions GROUP BY Customer_Interactions.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Analytical_Layer.Pattern_Recognition, Analytical_Layer.DESCRITIVE_ATTRIBUTE_18, COUNT(Analytical_Layer.Analytical_ID) FROM Analytical_Layer INNER JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID GROUP BY Analytical_Layer.Analytical_ID ORDER BY COUNT(Analytical_Layer.Analytical_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services AS Services JOIN Customers ON Services.Customer_ID = Customers.Customer_ID JOIN Analytical_Layer AS Customers_and_Services ON Services.Customers_and_Services_ID = Customers_and_Services.Analytical_ID GROUP BY Customers.Customer_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Customers_and_Services_ID) DESC LIMIT 1
SELECT Services.Service_Details , COUNT(Analytical_Layer.Customers_and_Services_ID) FROM Services AS Services JOIN Customers_and_Services AS Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Analytical_Layer AS Analytical_Layer ON Customers_and_Services.Customers_and_Services_ID = Analytical_Layer.Analytical_ID GROUP BY Services.Service_ID ORDER BY COUNT(Analytical_Layer.Customers_and_Services_ID) DESC LIMIT 1
SELECT Analytical_Layer.Analytical_Layer_Type_Code , Analytical_Layer.Pattern_Recognition , Analytical_Layer.Analytical_ID FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = ( SELECT Status_Code FROM Customer_Interactions GROUP BY Status_Code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Customer_Interactions.Status_Code, Customer_Interactions.Services_and_Channels_Details FROM Customer_Interactions JOIN Customers_and_Services ON Customer_Interactions.Customer_ID = Customers_and_Services.Customer_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customer_Interactions.Status_Code, Customer_Interactions.Services_and_Channels_Details ORDER BY COUNT(Customer_Interactions.Status_Code) ASC LIMIT 1
SELECT Analytical_Layer.Pattern_Recognition FROM Analytical_Layer WHERE Analytical_Layer.Customers_and_Services_ID IN (SELECT Customers_and_Services.Customers_and_Services_ID FROM Customers_and_Services WHERE Customers_and_Services.Service_ID IN (SELECT Services.Service_ID FROM Services WHERE Services.Service_Details = 'Hardy Kutch')) OR Analytical_Layer.Customers_and_Services_ID IN (SELECT Customers_and_Services.Customers_and_Services_ID FROM Customers_and_Services JOIN Customer_Interactions ON Customers_and_Services.Customers_and_Services_ID = Customer_Interactions.Channel_ID WHERE Customer_Interactions.Status_Code = 'good')
SELECT Customer_Interactions.Status_Code, Customer_Interactions.Services_and_Channels_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Channel_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' INTERSECT SELECT Customer_Interactions.Status_Code, Customer_Interactions.Services_and_Channels_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Channel_ID = Customers.Customer_ID WHERE Customer_Interactions.Status_Code = 'good'
SELECT Analytical_Layer.Pattern_Recognition FROM Analytical_Layer INNER JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID INNER JOIN Customer_Interactions ON Customers_and_Services.Service_ID = Customer_Interactions.Customer_Interaction_ID WHERE Customer_Interactions.Status_Code = 'bad' AND Customer_Interactions.Channel_ID = ( SELECT Channel_ID FROM Customer_Interactions WHERE Services_and_Channels_Details = 'Hardy Kutch' )
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services INNER JOIN Customer_Interactions ON Customers_and_Services.Customer_ID = Customer_Interactions.Channel_ID INNER JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID INNER JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Services.Service_Details = 'Hardy Kutch' AND Customer_Interactions.DESCRITIVE_ATTRIBUTE_13 = 'bad'
SELECT Customers.name , Discount.name , Vehicles.Cost_per_25_miles FROM Customers INNER JOIN Renting_history ON Customers.id = Renting_history.customer_id INNER JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Customers.membership_credit = 2013 OR Customers.membership_credit = 2014
SELECT Customers.name , Discount.name , Vehicles.Cost_per_25_miles FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Combined_fuel_economy_rate = 2013 OR Vehicles.Combined_fuel_economy_rate = 2014
SELECT Vehicles.name, Vehicles.Type_of_powertrain FROM Renting_history AS Renting_history JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles AS Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.DESCRIPITIVE_ATTRIBUTE_6, Vehicles.DESCRIPATIVE_ATTRIBUTE_9 FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id JOIN Customers ON Renting_history.customer_id = Customers.id ORDER BY Renting_history.total_hours DESC LIMIT 1
SELECT Discount.DESCRIBITIVE_ATTRIBUTE_6 FROM Renting_history AS Customers JOIN Discount AS Discount ON Customers.discount_id = Discount.id GROUP BY Discount.DESCRIBITIVE_ATTRIBUTE_6 ORDER BY COUNT(Customers.id) DESC LIMIT 1
SELECT Vehicles.name FROM Renting_history AS Renting_history JOIN Discount AS Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles AS Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Achievements.achievement_details , Achievements.achievement_type_code FROM Achievements AS Students JOIN Students AS Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.student_id IN (SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring WHERE Behaviour_Monitoring.student_id IN (SELECT Student_Events.student_id FROM Student_Events WHERE Student_Events.event_date = Student_Events.event_date GROUP BY Student_Events.student_id HAVING COUNT(*) >= 2)) INTERSECT SELECT Achievements.achievement_details , Achievements.achievement_type_code FROM Achievements AS Students JOIN Students AS Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.student_id NOT IN (SELECT Classes.student_id FROM Classes WHERE Classes.class_details = 'detention')
SELECT Ref_Detention_Type.detention_type_description , Teachers.teacher_details FROM Teachers AS Students JOIN Achievements AS Transcripts ON Students.teacher_id = Transcripts.achievement_type_code JOIN Ref_Detention_Type AS Behaviour_Monitoring ON Behaviour_Monitoring.detention_type_code = Transcripts.detention_type_code WHERE Transcripts.student_id IN (SELECT Transcripts.student_id FROM Achievements AS Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) >= 2) OR Transcripts.student_id IN (SELECT Transcripts.student_id FROM Achievements AS Transcripts GROUP BY Transcripts.student_id HAVING COUNT(*) < 2)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Classes ON Students.student_id = Classes.student_id WHERE Classes.DESCRIBITIVE_ATTRIBUTE_9 LIKE '%data%' AND Students.student_id NOT IN (SELECT Students.student_id FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.DESCRIBITIVE_ATTRIBUTE_9 LIKE 'net%')
SELECT Students.bio_data FROM Students INNER JOIN Classes ON Students.student_id = Classes.student_id WHERE Classes.DESCRITIVE_ATTRIBUTE_9 LIKE '%data%' AND Classes.DESCRITIVE_ATTRIBUTE_9 NOT LIKE 'net%'
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Student_Loans.student_id = Achievements.student_id GROUP BY Student_Loans.student_id HAVING Count(*) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Events.event_type_code IN (SELECT address_type_code FROM Students_Addresses WHERE address_id = 2)
SELECT Behaviour_Monitoring.behaviour_monitoring_details , Students.student_id FROM Students INNER JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id GROUP BY Students.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data , Students.student_id FROM Students AS Students JOIN Achievements AS Achievements ON Students.student_id = Achievements.student_id GROUP BY Students.student_id ORDER BY COUNT(Achievements.student_id) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.date_of_transcript IN ( SELECT date_of_transcript FROM Transcripts GROUP BY date_of_transcript ORDER BY COUNT(*) DESC LIMIT 1 ) AND Transcripts.date_of_transcript IN ( SELECT date_of_transcript FROM Transcripts JOIN Student_Events ON Transcripts.transcript_id = Student_Events.event_id GROUP BY date_of_transcript HAVING COUNT(DISTINCT Student_Events.student_id) = 3 )
SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Student_Events AS Student_Events ON Students.student_id = Student_Events.student_id JOIN Achievements AS Achievements ON Students.student_id = Achievements.student_id WHERE Student_Events.event_type_code = ( SELECT event_type_code FROM Student_Events GROUP BY event_type_code ORDER BY COUNT(*) DESC LIMIT 1 ) INTERSECT SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Student_Events AS Student_Events ON Students.student_id = Student_Events.student_id JOIN Achievements AS Achievements ON Students.student_id = Achievements.student_id WHERE Student_Events.event_type_code = ( SELECT event_type_code FROM Student_Events WHERE student_id = ( SELECT student_id FROM Student_Events GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1 ) GROUP BY event_type_code ORDER BY COUNT(*) DESC LIMIT 1 ) LIMIT 1
SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Transcripts AS Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.date_of_transcript = (SELECT date_of_transcript FROM Transcripts GROUP BY date_of_transcript ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Students.bio_data , Students.student_details FROM Students AS Students JOIN Transcripts AS Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.date_of_transcript = ( SELECT date_of_transcript FROM Transcripts GROUP BY date_of_transcript ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT count(*) , Ref_Event_Types.event_type_description , Ref_Event_Types.event_type_description FROM Student_Events AS Students JOIN Ref_Event_Types AS Behaviour_Monitoring ON Students.event_type_code = Behaviour_Monitoring.event_type_code JOIN Students AS Ref_Event_Types ON Students.student_id = Ref_Event_Types.student_id GROUP BY Ref_Event_Types.event_type_description ORDER BY count(*) DESC LIMIT 1
SELECT Ref_Event_Types.event_type_description, COUNT(Detention.detention_type_code) AS number_of_students, Ref_Achievement_Type.achievement_type_description, Ref_Achievement_Type.achievement_type_description FROM Detention INNER JOIN Ref_Detention_Type AS Ref_Achievement_Type ON Detention.detention_type_code = Ref_Achievement_Type.detention_type_code INNER JOIN Ref_Event_Types ON Ref_Achievement_Type.detention_type_description = Ref_Event_Types.event_type_description GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(Detention.detention_type_code) DESC LIMIT 1
SELECT COUNT(Students.student_id) FROM Students AS Students LEFT JOIN Student_Loans AS Student_Loans ON Students.student_id = Student_Loans.student_id LEFT JOIN Achievements AS Achievements ON Students.student_id = Achievements.student_id WHERE Student_Loans.amount_of_loan = 0
SELECT COUNT(Students.student_id) FROM Students AS Students JOIN Classes AS Ref_Achievement_Type ON Students.student_id = Ref_Achievement_Type.student_id JOIN Achievements AS Teachers ON Ref_Achievement_Type.teacher_id = Teachers.achievement_id WHERE Teachers.achievement_type_code NOT IN (SELECT Achievements.achievement_type_code FROM Achievements AS Achievements JOIN Classes AS T7 ON Achievements.student_id = T7.teacher_id JOIN Student_Loans AS T8 ON T7.student_id = T8.student_id WHERE T8.amount_of_loan > 0)
SELECT Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type WHERE Ref_Detention_Type.detention_type_description IN ( SELECT Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type GROUP BY Ref_Detention_Type.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Ref_Detention_Type.detention_type_description , Ref_Detention_Type.detention_type_description FROM Detention AS Ref_Event_Types JOIN Ref_Detention_Type AS Ref_Achievement_Type ON Ref_Event_Types.detention_type_code = Ref_Achievement_Type.detention_type_code JOIN Ref_Detention_Type AS Ref_Address_Types ON Ref_Event_Types.student_id = Ref_Address_Types.detention_type_code JOIN Ref_Detention_Type AS Ref_Detention_Type ON Ref_Event_Types.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Ref_Detention_Type.detention_type_description ORDER BY COUNT(Ref_Detention_Type.detention_type_description) LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT Teachers.teacher_details FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id JOIN Student_Loans ON Students.student_id = Student_Loans.student_id JOIN Teachers ON Student_Loans.student_id = Teachers.teacher_id WHERE Transcripts.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT Student_Events.* FROM Student_Events INNER JOIN Transcripts ON Student_Events.event_id = Transcripts.student_id INNER JOIN Students ON Transcripts.student_id = Students.student_id WHERE Transcripts.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT Ref_Address_Types.address_type_description , Ref_Address_Types.address_type_description FROM Ref_Address_Types GROUP BY Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_description, Ref_Address_Types.address_type_code FROM Ref_Address_Types JOIN Students_Addresses ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_description ORDER BY COUNT(Students_Addresses.student_address_id) DESC LIMIT 1
