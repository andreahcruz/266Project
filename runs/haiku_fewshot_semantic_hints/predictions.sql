SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != "Nike"
SELECT DISTINCT club.Name FROM club WHERE club.Club_ID NOT IN ( SELECT DISTINCT player.Club_ID FROM player WHERE player.Country = 'Nike' )
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT DISTINCT player.Country FROM player WHERE player.Earnings > 1200000
SELECT DISTINCT player.Country FROM player WHERE player.Events_number > 1200000
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(DISTINCT player.Player_ID) > 1
SELECT DISTINCT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(DISTINCT player.Name) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID HAVING COUNT(player.Player_ID) > 1
SELECT player.Country FROM player GROUP BY player.Country HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.date_order_placed IS NOT NULL
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id WHERE Shipment_Items.shipment_id IN (SELECT shipment_id FROM Shipments WHERE shipment_date IS NOT NULL)
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(shipment_id) FROM Shipments
SELECT COUNT(DISTINCT Products.product_id) FROM Products JOIN Shipments ON Products.product_id = Shipments.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Internet) FROM channel WHERE Analogue_terrestrial_channel = 'terrestrial'
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT t2.Name FROM director WHERE t2.Age BETWEEN 30 AND 60
SELECT count(*) FROM radio WHERE Radio_MHz IS NOT NULL
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online ASC
SELECT Station_name FROM city_channel WHERE City = 'city' AND Affiliation != 'ABC'
SELECT AVG(CAST(Is_online AS REAL)) FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT City) > 3
SELECT driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Citizenship = 'United States'
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE driver.Racing_Series = 'United States'
SELECT count(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID ORDER BY driver.Name ASC
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID ORDER BY driver.Name ASC
SELECT count(*) FROM Exams WHERE Exam_Name IS NOT NULL
SELECT count(*) FROM Exams WHERE Exam_Name IS NOT NULL
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams WHERE Exam_Name = 'exams' ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Student_Answers.Question_ID = Valid_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Answers ON Valid_Answers.Question_ID = Student_Answers.Question_ID WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers WHERE Comments IS NOT NULL
SELECT COUNT(DISTINCT Student_Answer_Text) FROM Student_Answers WHERE Comments IS NOT NULL
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Middle_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Exam_ID) >= 3
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
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(product_name) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_name) >= 2
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT COUNT(DISTINCT customer_phone) FROM Customers
SELECT DISTINCT customer_number FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(Customer_Orders.order_id) FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT COUNT(DISTINCT Customers.customer_phone) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT club.Club_ID, club.Manager, club.Captain FROM club
SELECT club.Club_ID, club.Manager, club.Captain FROM club
SELECT player.Name FROM player ORDER BY player.Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID
SELECT player.Events_number, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 GROUP BY club.Club_ID, club.Name
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 GROUP BY club.Club_ID, club.Name
SELECT player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT club.Manufacturer, count(club.Club_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer
SELECT club.Manufacturer, COUNT(DISTINCT player.Club_ID) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer
SELECT player.Earnings FROM player WHERE player.Country = "Australia" OR player.Country = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Country IN ('Australia', 'Zimbabwe')
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, COUNT(Products.product_id) AS product_count, Orders.order_status_code FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id LEFT JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Order_Items.order_item_id) >= 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING count(*) >= 2
SELECT Customers.gender_code, COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Order_Items.product_id, COUNT(Orders.order_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Order_Items.product_id
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code, Customers.customer_middle_initial, Customers.customer_first_name, Customer_Payment_Methods.payment_method_code FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_number, Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Invoices.invoice_number, Orders.order_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Orders.date_order_placed IS NOT NULL AND Shipments.shipment_date IS NOT NULL
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Orders.date_order_placed IS NOT NULL AND Shipments.shipment_date IS NOT NULL
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT Order_Items.order_item_status_code, Shipments.shipment_date FROM Order_Items JOIN Shipments ON Order_Items.order_item_id = Shipments.shipment_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_date FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = "USA"
SELECT email_address, town_city, county FROM Customers WHERE address_line_1 = 'United States'
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id HAVING COUNT(*) > 3
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number, Invoices.invoice_date HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number HAVING COUNT(DISTINCT Shipments.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT Name FROM director ORDER BY Director_ID ASC LIMIT 1
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID ORDER BY program.Start_Year DESC LIMIT 1
SELECT channel.Internet, channel.Digital_terrestrial_channel FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(program.Program_ID) > 1 )
SELECT channel.Internet, COUNT(program.Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Internet
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID JOIN channel ON program.Channel_ID = channel.Channel_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Sub_tittle FROM tv_show
SELECT DISTINCT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.Is_online > 150 OR city_channel_radio.Is_online < 30
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel_radio.Is_online DESC LIMIT 1
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT city_channel.City, city_channel_radio.Is_online FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID ORDER BY city_channel_radio.Is_online ASC
SELECT radio.Transmitter, city_channel.City FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Radio_MHz IS NOT NULL
SELECT radio.Transmitter, radio.Radio_MHz, COUNT(city_channel.City) AS city_channels_count FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Transmitter, radio.Radio_MHz
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Top_Speed), AVG(Top_Speed) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Total_Production FROM vehicle WHERE Build_Year = "1996"
SELECT Top_Speed, Power FROM vehicle WHERE Builder = '1996' AND Build_Year = '1996'
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE CAST(vehicle.Total_Production AS NUMERIC) > 100 OR vehicle.Top_Speed > 150
SELECT vehicle.Model, vehicle.Builder FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Model LIKE '%DJ%'
SELECT driver.Racing_Series, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Racing_Series
SELECT driver.Citizenship, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Citizenship
SELECT Exams.Subject_Code, Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Satisfactory_YN, COUNT(*) as count FROM Student_Assessments GROUP BY Satisfactory_YN ORDER BY count DESC
SELECT Assessment, COUNT(*) as frequency FROM Student_Assessments GROUP BY Assessment ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.First_Name, Exams.Exam_Date FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress, Exams.Exam_Date FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID ORDER BY Exams.Exam_Date DESC
SELECT First_Name FROM Students WHERE Student_ID IN ( SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2 )
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT player.Country FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT club.Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT DISTINCT player.Country FROM player WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING SUM(CASE WHEN Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Orders.date_order_placed FROM Orders WHERE Orders.order_id IN ( SELECT Orders.order_id FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id LEFT JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id GROUP BY Orders.order_id HAVING Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(Shipment_Items.shipment_id) > 1 )
SELECT shipment_date FROM Shipments WHERE shipment_id IN ( SELECT shipment_id FROM Shipments GROUP BY order_id HAVING COUNT(*) > 1 ) OR order_id = ( SELECT order_id FROM Shipments ORDER BY shipment_date ASC LIMIT 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products WHERE Products.product_id IN (SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(DISTINCT Order_Items.order_id) < 2)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.gender_code, COUNT(t1.product_name) FROM Products JOIN Customers ON t1.parent_product_id = t2.customer_id GROUP BY t2.gender_code
SELECT product_name, COUNT(*) as product_count FROM Products GROUP BY product_name
SELECT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_item_id = Shipments.shipment_id
SELECT DISTINCT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_id IS NOT NULL ORDER BY Shipments.shipment_date
SELECT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_id IS NOT NULL
SELECT DISTINCT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_item_id = Shipments.shipment_id WHERE Shipments.shipment_id IS NOT NULL
SELECT Orders.order_status_code FROM Orders WHERE Orders.order_id NOT IN ( SELECT Shipments.order_id FROM Shipments WHERE Shipments.shipment_tracking_number IS NOT NULL )
SELECT Orders.order_status_code FROM Orders WHERE Orders.order_id NOT IN (SELECT Shipments.order_id FROM Shipments)
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price) as total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT DISTINCT product_name FROM Products
SELECT product_color, product_name FROM Products
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customers.customer_id FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Customers.customer_id HAVING COUNT(Customer_Payment_Methods.payment_method_code) >= 2 )
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Customers.customer_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2
SELECT order_item_status_code, COUNT(*) as count FROM Order_Items GROUP BY order_item_status_code ORDER BY count ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT channel.Channel_ID, channel.Internet FROM channel WHERE channel.Name != 'Hank Baskett'
SELECT Affiliation FROM city_channel WHERE City = 'city' GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, radio.RnaG_MHz, city_channel.Owned_Since FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT radio.Transmitter FROM radio WHERE radio.Radio_ID NOT IN ( SELECT city_channel_radio.Radio_ID FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE city_channel.Affiliation IS NOT NULL )
SELECT vehicle.Model FROM vehicle WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT vehicle.Model FROM vehicle WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT MAX(vehicle_count) AS max_vehicles, Driver_ID FROM (SELECT Driver_ID, COUNT(Power) AS vehicle_count FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY Driver_ID) AS subquery GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, count(vehicle.Power) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle_driver.Driver_ID ORDER BY count(vehicle.Power) DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(driver.Racing_Series) ASC LIMIT 1
SELECT vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Power ORDER BY COUNT(vehicle_driver.Driver_ID) ASC LIMIT 1
SELECT DISTINCT driver.Racing_Series FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Power > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver WHERE vehicle_driver.Driver_ID IN (SELECT driver.Driver_ID FROM driver))
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series IS NOT NULL )
SELECT DISTINCT vehicle.Power, vehicle.Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = 'Ziyang' OR vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 )
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN ( SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 ) OR vehicle.Builder = 'Ziyang'
SELECT COUNT(Power) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(Power) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Assessment FROM Student_Assessments WHERE Valid_Answer_ID IN (SELECT Student_ID FROM Students) GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Assessment, COUNT(*) as frequency FROM Student_Assessments GROUP BY Assessment ORDER BY frequency ASC LIMIT 1
SELECT Student_Answer_Text FROM Student_Answers WHERE Student_Answer_Text IS NOT NULL GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT Students.First_Name FROM Students WHERE Students.Student_ID NOT IN (SELECT DISTINCT Student_Answers.Student_ID FROM Student_Answers)
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_ID IN ( SELECT T2a.Student_ID FROM Student_Answers AS T2a WHERE T2a.Comments = 'Normal' ) AND Student_Answers.Student_ID IN ( SELECT T2b.Student_ID FROM Student_Answers AS T2b WHERE T2b.Comments = 'Absent' )
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_ID IN ( SELECT T2a.Student_ID FROM Student_Answers T2a WHERE T2a.Comments = 'Normal' ) AND Student_Answers.Student_ID IN ( SELECT T2b.Student_ID FROM Student_Answers T2b WHERE T2b.Comments = 'Absent' )
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_number FROM Customers GROUP BY customer_number ORDER BY COUNT(customer_phone) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_phone FROM Customers WHERE customer_address = (SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(DISTINCT customer_phone) ASC LIMIT 1)
SELECT customer_phone FROM Customers WHERE customer_number = ( SELECT customer_number FROM Customers GROUP BY customer_number ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY count(*) DESC LIMIT 1
SELECT Order_Items.order_quantity FROM Order_Items GROUP BY Order_Items.order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT Products.product_name FROM Products EXCEPT SELECT Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT DISTINCT Products.product_name FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_quantity IS NULL
SELECT DISTINCT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers WHERE Customers.customer_id IN ( SELECT Orders.customer_id FROM Orders GROUP BY Orders.customer_id HAVING COUNT(Orders.order_id) > 2 ) AND Customers.customer_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(Order_Items.order_item_id) >= 3 )
SELECT DISTINCT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Customers.customer_id IN ( SELECT Orders.customer_id FROM Orders GROUP BY Orders.customer_id HAVING COUNT(DISTINCT Orders.order_id) > 2 ) AND Customers.customer_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(*) >= 3 )
SELECT gender_code, customer_first_name, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id LEFT JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id HAVING COUNT(Orders.order_id) < 2
SELECT Products.product_id, Products.product_name, Products.product_price, COUNT(*) as frequency FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id, Products.product_name, Products.product_price ORDER BY frequency DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id, SUM(Products.product_price) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Order_Items.order_id, SUM(CAST(Order_Items.order_item_status_code AS REAL)) as total_cost FROM Order_Items GROUP BY Order_Items.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.parent_product_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE product_price = 0 OR product_price IS NULL
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods WHERE payment_method_code IS NOT NULL)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Customers.email_address, Customers.town_city, Customers.county FROM Customers WHERE Customers.gender_code = ( SELECT Customers.gender_code FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code ORDER BY COUNT(Orders.order_id) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Director_ID, director.Name, COUNT(program.Program_ID) AS program_count FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID, director.Name ORDER BY program_count DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(DISTINCT Internet) FROM channel WHERE Internet NOT IN (SELECT DISTINCT channel.Internet FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID)
SELECT channel.Name, channel.Internet FROM channel WHERE channel.Channel_ID = ( SELECT director_admin.Channel_ID FROM director_admin GROUP BY director_admin.Channel_ID ORDER BY COUNT(DISTINCT director_admin.Director_ID) DESC LIMIT 1 )
SELECT DISTINCT channel.Internet FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID JOIN director ON program.Director_ID = director.Director_ID WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age < 40 ) AND channel.Channel_ID IN ( SELECT program.Channel_ID FROM program JOIN director ON program.Director_ID = director.Director_ID WHERE director.Age > 60 )
SELECT DISTINCT vehicle.Power, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Power IN ( SELECT vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Power HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 ) OR driver.Racing_Series = 'Jeff Gordon'
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'Jeff Gordon' OR vehicle.Power IN ( SELECT vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Power HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 )
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware')
SELECT Customers.customer_id, Customers.customer_phone, Customers.customer_name, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id ORDER BY COUNT(Order_Items.order_quantity) DESC LIMIT 1
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id ORDER BY COUNT(Order_Items.order_quantity) DESC LIMIT 1
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id LEFT JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NULL
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id LEFT JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NULL
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity > 6 OR Customer_Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(DISTINCT Order_Items.product_id) > 3 )
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE CAST(Order_Items.order_quantity AS INTEGER) > 6 OR Customer_Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Order_Items.order_id HAVING COUNT(DISTINCT Products.product_name) > 3 )
SELECT region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT region.Capital FROM region JOIN (SELECT building.Region_ID, COUNT(building.Name) AS building_count FROM building GROUP BY building.Region_ID ORDER BY building_count DESC LIMIT 1) AS subquery ON region.Region_ID = subquery.Region_ID
SELECT Customers.Customer_Details, COUNT(*) as usage_count FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY usage_count DESC LIMIT 1
SELECT Customers.Customer_Details, COUNT(Services.Service_ID) as service_count FROM Customers JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY service_count DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Services.Service_ID) DESC LIMIT 1
SELECT Customers.Customer_ID, Customers.Customer_Details, COUNT(DISTINCT Services.Service_ID) as service_count FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY service_count DESC LIMIT 1
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_ID = ( SELECT Customers_and_Services.Customer_ID FROM Customers_and_Services GROUP BY Customers_and_Services.Customer_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customers_and_Services.Service_ID = ( SELECT Services.Service_ID FROM Services WHERE Services.Service_ID IN ( SELECT Customers_and_Services.Service_ID FROM Customers_and_Services GROUP BY Customers_and_Services.Service_ID ORDER BY COUNT(*) ASC LIMIT 1 ) )
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = "Hardy Kutch" UNION SELECT DISTINCT Services.Service_Details FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Interactions.Status_Code = "good"
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services LEFT JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID LEFT JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID LEFT JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID AND Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' OR Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID AND Services.Service_ID = Customer_Interactions.Service_ID WHERE Customers.Customer_Details = "Hardy Kutch" AND Customer_Interactions.Status_Code = "bad"
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Cost_per_25_miles FROM Vehicles WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Customers.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Discount ON Renting_history.discount_id = Discount.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Customers.age IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Renting_history.vehicles_id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Renting_history.vehicles_id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT DISTINCT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(DISTINCT Classes.class_details) >= 2 ) OR Students.student_id IN ( SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(Detention.detention_summary) < 2 )
SELECT DISTINCT Students.bio_data, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(DISTINCT Classes.class_details) >= 2 ) OR Students.student_id IN ( SELECT Detention.student_id FROM Detention WHERE Detention.detention_summary IS NOT NULL GROUP BY Detention.student_id HAVING COUNT(Detention.detention_summary) < 2 )
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT Classes.teacher_id FROM Classes WHERE Classes.class_details LIKE 'net%' )
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT Classes.teacher_id FROM Classes WHERE Classes.class_details LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Students_Addresses.date_to FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Achievements ON Students.student_id = Achievements.student_id WHERE Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(Achievements.other_details) >= 2 )
SELECT Student_Loans.amount_of_loan, Students_Addresses.date_to FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Achievements ON Students.student_id = Achievements.student_id GROUP BY Students.student_id HAVING COUNT(Achievements.other_details) >= 2
SELECT Teachers.teacher_details, Teachers.teacher_id FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id GROUP BY Teachers.teacher_id ORDER BY COUNT(Classes.student_id) DESC LIMIT 1
SELECT Teachers.teacher_details, Students.student_id FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id GROUP BY Students.student_id, Teachers.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT Students.student_id, Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) ) AND Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details HAVING COUNT(Behaviour_Monitoring.student_id) = 3 )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = ( SELECT COUNT(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) ) AND Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 ) GROUP BY Students.student_id
SELECT Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.student_id HAVING COUNT(DISTINCT Behaviour_Monitoring.behaviour_monitoring_details) = 1 AND Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) )
SELECT Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT Students.student_id) AS number, Ref_Event_Types.event_type_description AS event_type, Classes.class_details AS description FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code JOIN Classes ON Students.student_id = Classes.student_id WHERE Ref_Event_Types.event_type_description = ( SELECT Ref_Event_Types.event_type_description FROM Ref_Event_Types JOIN Student_Events ON Ref_Event_Types.event_type_code = Student_Events.event_type_code GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1 ) GROUP BY Ref_Event_Types.event_type_description, Classes.class_details
SELECT COUNT(DISTINCT Students.student_id) AS number_of_students, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(DISTINCT Students.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Achievements.achievement_id) FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Achievements ON Students.student_id = Achievements.student_id WHERE Achievements.other_details IS NULL OR Achievements.other_details = ''
SELECT COUNT(DISTINCT Teachers.teacher_id) FROM Teachers JOIN Students ON Teachers.teacher_id = Students.student_id JOIN Classes ON Students.student_id = Classes.student_id WHERE Classes.teacher_id NOT IN ( SELECT Classes.teacher_id FROM Classes JOIN Achievements ON Classes.teacher_id = Achievements.student_id WHERE Achievements.achievement_details IS NOT NULL )
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type WHERE detention_type_code IN (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description FROM Ref_Event_Types WHERE event_type_code IN (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) LIMIT 1)
SELECT Students.student_details, Students.bio_data, Student_Loans.other_details, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id JOIN Students ON Students.student_id = Classes.student_id JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT DISTINCT Teachers.teacher_details, Classes.class_details FROM Classes JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id JOIN Students ON Classes.student_id = Students.student_id JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Students.student_id = ( SELECT Transcripts.student_id FROM Transcripts ORDER BY Transcripts.date_of_transcript ASC LIMIT 1 )
SELECT Ref_Achievement_Type.achievement_type_code, Ref_Achievement_Type.achievement_type_description FROM Ref_Achievement_Type JOIN Achievements ON Ref_Achievement_Type.achievement_type_code = Achievements.achievement_type_code GROUP BY Ref_Achievement_Type.achievement_type_code, Ref_Achievement_Type.achievement_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types JOIN Addresses ON Ref_Address_Types.address_type_code = Addresses.address_id GROUP BY Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
