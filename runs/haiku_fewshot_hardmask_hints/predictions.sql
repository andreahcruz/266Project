SELECT COUNT(Club_ID) FROM club
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
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(Is_online) FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID WHERE radio.Radio_MHz IS NOT NULL
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
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Events_number > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Name = "Sam Allardyce"
SELECT club.Manufacturer, count(*) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, COUNT(Products.product_id) AS product_count, Orders.order_status_code, Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id LEFT JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.order_status_code, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT Orders.order_id, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Orders.order_id, Shipments.shipment_date HAVING COUNT(DISTINCT Shipments.invoice_number) >= 2
SELECT Customers.gender_code, COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Orders.order_status_code, COUNT(Orders.order_id) FROM Orders GROUP BY Orders.order_status_code
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.gender_code, Customers.customer_middle_initial, Customers.customer_first_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices JOIN Orders ON Invoices.invoice_number = Orders.customer_id JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Orders.date_order_placed IS NOT NULL AND Shipments.shipment_id IS NOT NULL
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id WHERE Invoices.invoice_date IS NOT NULL AND Shipments.shipment_id IS NOT NULL
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_size FROM Products WHERE Products.product_name LIKE '%Dell%'
SELECT Orders.order_status_code, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Shipments.shipment_tracking_number, Shipments.shipment_date FROM Shipments
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = "USA"
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
SELECT MAX(Top_Speed), AVG(Top_Speed) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Builder FROM vehicle WHERE Build_Year = "1996"
SELECT Top_Speed, Power FROM vehicle WHERE Builder = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Builder = '2012'
SELECT DISTINCT driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Racing_Series HAVING SUM(vehicle.Power) > 100 OR MAX(vehicle.Top_Speed) > 150
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
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
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT club.Sponsor FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Sponsor FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Events_number DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT club.Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL
SELECT DISTINCT player.Country FROM player WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Name FROM club WHERE Club_ID IN ( SELECT player.Club_ID FROM player WHERE player.Earnings > 1400000 ) AND Club_ID IN ( SELECT player.Club_ID FROM player WHERE player.Earnings < 1100000 )
SELECT DISTINCT Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id WHERE Shipments.shipment_date = (SELECT MIN(shipment_date) FROM Shipments) OR Shipments.invoice_number > 1
SELECT shipment_date FROM Shipments WHERE order_id IN (SELECT order_id FROM Orders ORDER BY order_id LIMIT 1) UNION SELECT shipment_date FROM Shipments WHERE order_id IN (SELECT order_id FROM Orders WHERE order_id IN (SELECT order_id FROM Shipments GROUP BY order_id HAVING COUNT(*) > 1))
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_size FROM Products WHERE Products.product_id IN (SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(DISTINCT Order_Items.order_id) < 2)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.gender_code, COUNT(DISTINCT Products.product_name) FROM Products JOIN Customers ON Products.parent_product_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT product_color, COUNT(product_name) FROM Products GROUP BY product_color
SELECT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipment_Items ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT DISTINCT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_id IS NOT NULL ORDER BY Shipments.shipment_date
SELECT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Orders.date_order_placed IS NOT NULL AND Shipments.shipment_id IS NOT NULL
SELECT DISTINCT Products.product_name, Products.product_size FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.shipment_id IS NOT NULL
SELECT Invoices.invoice_status_code FROM Invoices JOIN Orders ON Invoices.invoice_number = Orders.order_id WHERE Orders.order_id NOT IN (SELECT order_id FROM Shipments)
SELECT Orders.order_status_code FROM Orders WHERE Orders.order_id NOT IN (SELECT Shipments.order_id FROM Shipments)
SELECT Orders.order_id, Orders.date_order_placed, SUM(Shipments.invoice_number) as total_cost FROM Orders LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, SUM(Order_Items.order_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Products.product_color, Products.product_name FROM Products
SELECT Products.product_color, Products.product_name FROM Products
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Customers.customer_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2
SELECT DISTINCT Orders.date_order_placed FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Customers.customer_id IN ( SELECT Customers.customer_id FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Customers.customer_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2 )
SELECT order_item_status_code, COUNT(*) as count FROM Order_Items GROUP BY order_item_status_code ORDER BY count ASC LIMIT 1
SELECT order_item_status_code FROM Order_Items GROUP BY order_item_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT director.Name FROM director WHERE director.Age > (SELECT AVG(Age) FROM director)
SELECT Channel_ID, Internet FROM channel WHERE Name != 'Hank Baskett'
SELECT Affiliation FROM city_channel WHERE City = 'city' GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, radio.2FM_MHz, city_channel.Owned_Since FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY city_channel.Owned_Since DESC
SELECT DISTINCT radio.Transmitter FROM radio WHERE radio.Radio_ID NOT IN ( SELECT radio.Radio_ID FROM radio JOIN city_channel ON radio.Radio_ID = city_channel.ID WHERE city_channel.Affiliation IS NOT NULL )
SELECT Model FROM vehicle WHERE Power = (SELECT Power FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1) AND Power > 6000
SELECT vehicle.Model FROM vehicle WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT MAX(vehicle_count) AS max_vehicles, Driver_ID FROM ( SELECT Driver_ID, COUNT(Power) AS vehicle_count FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY Driver_ID ) ORDER BY vehicle_count DESC LIMIT 1
SELECT driver.Driver_ID, count(vehicle.Power) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY driver.Driver_ID ORDER BY count(vehicle.Power) DESC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(driver.Racing_Series) ASC LIMIT 1
SELECT vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Power ORDER BY COUNT(driver.Racing_Series) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN (SELECT DISTINCT vehicle_driver.Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID LEFT JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 OR vehicle.Builder = 'Ziyang'
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN ( SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 ) OR vehicle.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(Power) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Assessment FROM Student_Assessments JOIN Student_Answers ON Student_Assessments.Student_Answer_ID = Student_Answers.Student_Answer_Text JOIN Students ON Student_Answers.Student_ID = Students.Student_ID GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Assessment, COUNT(*) as frequency FROM Student_Assessments GROUP BY Assessment ORDER BY frequency ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID WHERE Student_Answers.Student_ID IS NULL
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_ID IN ( SELECT Student_Answers.Student_ID FROM Student_Answers WHERE Student_Answers.Comments = 'Normal' INTERSECT SELECT Student_Answers.Student_ID FROM Student_Answers WHERE Student_Answers.Comments = 'Absent' )
SELECT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_ID IN ( SELECT Student_Answers.Student_ID FROM Student_Answers WHERE Student_Answers.Comments = 'Normal' INTERSECT SELECT Student_Answers.Student_ID FROM Student_Answers WHERE Student_Answers.Comments = 'Absent' )
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT Products.product_id, Products.product_name FROM Products WHERE Products.product_type_code = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT Products.product_id, Products.product_type_code FROM Products WHERE Products.product_name = 'Hardware' ORDER BY Products.product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(customer_phone) DESC LIMIT 1
SELECT address_id FROM Customers GROUP BY address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_phone FROM Customers WHERE customer_address = (SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(DISTINCT customer_phone) ASC LIMIT 1)
SELECT customer_phone FROM Customers WHERE customer_address IN (SELECT customer_address FROM Customers GROUP BY customer_address ORDER BY COUNT(*) ASC LIMIT 1)
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY count(*) DESC LIMIT 1
SELECT order_quantity FROM Order_Items GROUP BY order_quantity ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_name FROM Products EXCEPT SELECT Products.product_name FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT DISTINCT Products.product_name FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT DISTINCT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers WHERE Customers.customer_id IN ( SELECT Customers.customer_id FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id HAVING COUNT(DISTINCT Orders.order_id) > 2 ) AND Customers.customer_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(Order_Items.order_item_id) >= 3 )
SELECT DISTINCT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id WHERE Customers.customer_id IN ( SELECT Orders.customer_id FROM Orders GROUP BY Orders.customer_id HAVING COUNT(DISTINCT Orders.order_id) > 2 ) AND Customers.customer_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(*) >= 3 )
SELECT gender_code, customer_first_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.gender_code, Customers.customer_first_name, Customers.customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders)
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_size FROM Products WHERE Products.product_id NOT IN ( SELECT Products.product_id FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id HAVING COUNT(Orders.date_order_placed) >= 2 )
SELECT Products.product_id, Products.product_name, Products.product_price, COUNT(*) as frequency FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price ORDER BY frequency DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id, SUM(Products.product_price) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT Orders.order_id, SUM(Order_Items.product_id) as total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.customer_first_name = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE product_price = 0
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Customers.email_address, Customers.town_city, Customers.county FROM Customers WHERE Customers.gender_code = ( SELECT Customers.gender_code FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code ORDER BY COUNT(Orders.order_id) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT max(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Name, COUNT(program.Program_ID) AS program_count FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID, director.Name ORDER BY program_count DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(DISTINCT Internet) FROM channel WHERE Internet NOT IN (SELECT DISTINCT channel.Internet FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID)
SELECT channel.Name, channel.Internet FROM channel WHERE channel.Channel_ID = ( SELECT director_admin.Channel_ID FROM director_admin GROUP BY director_admin.Channel_ID ORDER BY COUNT(DISTINCT director_admin.Director_ID) DESC LIMIT 1 )
SELECT DISTINCT channel.Internet FROM channel JOIN director ON channel.Channel_ID = director.Director_ID WHERE director.Age < 40 INTERSECT SELECT DISTINCT channel.Internet FROM channel JOIN director ON channel.Channel_ID = director.Director_ID WHERE director.Age > 60
SELECT DISTINCT vehicle.Power, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Power IN ( SELECT vehicle.Power FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Power HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 ) OR driver.Name = 'Jeff Gordon'
SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 UNION SELECT DISTINCT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT DISTINCT Driver_ID FROM vehicle_driver)
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver WHERE driver.Driver_ID NOT IN (SELECT DISTINCT vehicle_driver.Driver_ID FROM vehicle_driver)
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_name = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware')
SELECT Customers.customer_id, Customers.customer_phone, Customers.customer_name, Customers.customer_email FROM Customers WHERE Customers.customer_id = (SELECT Customer_Orders.customer_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Customers.customer_id, Customers.customer_phone, Customers.customer_name, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(Customer_Orders.order_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id LEFT JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_id IS NULL
SELECT Customer_Orders.order_date, Order_Items.order_item_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.product_id IN ( SELECT product_id FROM Products WHERE product_id IN ( SELECT Order_Items.product_id FROM Order_Items WHERE Order_Items.order_item_id > 6 ) ) OR Order_Items.product_id IN ( SELECT product_id FROM Products WHERE product_id IN ( SELECT Order_Items.product_id FROM Order_Items GROUP BY Order_Items.product_id HAVING COUNT(*) > 3 ) )
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_item_id > 6 OR Order_Items.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3)
SELECT region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY building.Region_ID ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID GROUP BY building.Region_ID ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.Customer_ID, Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Customers_and_Services_ID) DESC LIMIT 1
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY COUNT(DISTINCT Customers.Customer_ID) DESC LIMIT 1
SELECT Services.Service_ID, Services.Service_Details, COUNT(DISTINCT Customers.Customer_ID) as service_count FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID GROUP BY Services.Service_ID, Services.Service_Details ORDER BY service_count DESC LIMIT 1
SELECT Customers_and_Services.Customers_and_Services_Details FROM Customers_and_Services WHERE Customers_and_Services.Customer_ID = ( SELECT Customers_and_Services.Customer_ID FROM Customers_and_Services GROUP BY Customers_and_Services.Customer_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers_and_Services.Customer_ID = ( SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = "Hardy Kutch" OR Customer_Interactions.Services_and_Channels_Details = "good"
SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Services.Service_Details IN ( SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Services.Service_Details = 'Hardy Kutch' ) UNION SELECT DISTINCT Services.Service_ID, Services.Service_Details FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Interactions.Status_Code = 'good'
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = 'Hardy Kutch' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.City_fuel_economy_rate FROM Vehicles WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Customers.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Customers.age IN (2013, 2014)
SELECT Vehicles.Notes, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Renting_history.vehicles_id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Vehicles.Notes, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Renting_history.vehicles_id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(DISTINCT Classes.class_details) >= 2 ) OR Students.student_id IN ( SELECT Detention.student_id FROM Detention WHERE Detention.detention_summary < 2 )
SELECT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(DISTINCT Classes.teacher_id) >= 2 ) OR Students.student_id IN ( SELECT Detention.student_id FROM Detention WHERE Detention.detention_summary < 2 )
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students ON Classes.student_id = Students.student_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT Classes.teacher_id FROM Classes WHERE Classes.class_details LIKE 'net%' )
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT Classes.teacher_id FROM Classes WHERE Classes.class_details LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.other_details IS NOT NULL GROUP BY Students.student_id HAVING COUNT(DISTINCT Achievements.other_details) >= 2
SELECT Student_Loans.amount_of_loan, Students_Addresses.date_from FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id WHERE Students.student_id IN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) >= 2 )
SELECT Teachers.teacher_details, Students.student_id FROM Students JOIN Classes ON Students.student_id = Classes.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id GROUP BY Students.student_id, Teachers.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Teachers.teacher_details, Classes.class_id FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students ON Classes.student_id = Students.student_id GROUP BY Classes.class_id, Teachers.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_id, Behaviour_Monitoring.behaviour_monitoring_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 )
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 ) )
SELECT Students.bio_data, Students.student_details FROM Students WHERE Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.student_id HAVING COUNT(DISTINCT Behaviour_Monitoring.behaviour_monitoring_details) = 1 AND Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) )
SELECT Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT Students.student_id) AS number, Ref_Event_Types.event_type_description AS type, Student_Events.event_type_code AS description FROM Student_Events JOIN Students ON Student_Events.student_id = Students.student_id JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code WHERE Ref_Event_Types.event_type_description = ( SELECT Ref_Event_Types.event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1 ) GROUP BY Ref_Event_Types.event_type_description, Student_Events.event_type_code
SELECT COUNT(DISTINCT Students.student_id) as num_students, Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(DISTINCT Students.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Student_Loans.student_id) FROM Student_Loans JOIN Students_Addresses ON Student_Loans.student_id = Students_Addresses.student_id WHERE Students_Addresses.student_address_id NOT IN (SELECT Achievements.achievement_id FROM Achievements WHERE Achievements.other_details IS NOT NULL)
SELECT COUNT(DISTINCT Students.student_id) FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id JOIN Teachers ON Student_Loans.student_id = Students.student_id JOIN Classes ON Students.student_id = Classes.student_id WHERE Classes.teacher_id IN ( SELECT Teachers.teacher_id FROM Teachers WHERE Teachers.teacher_id NOT IN ( SELECT Classes.teacher_id FROM Classes WHERE Classes.class_details IS NOT NULL ) )
SELECT detention_summary, COUNT(*) as count FROM Detention GROUP BY detention_summary ORDER BY count ASC LIMIT 1
SELECT detention_summary, COUNT(*) as count FROM Detention GROUP BY detention_summary ORDER BY count ASC LIMIT 1
SELECT Students.bio_data, Student_Loans.other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.student_id, Students.bio_data, Students.student_details, Student_Loans.student_loan_id, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id JOIN Students ON Students.student_id = Classes.student_id JOIN Transcripts ON Transcripts.student_id = Students.student_id WHERE Transcripts.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students ON Classes.student_id = Students.student_id JOIN Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.date_of_transcript = (SELECT MIN(Transcripts.date_of_transcript) FROM Transcripts)
SELECT achievement_type_code, achievement_type_description FROM Ref_Achievement_Type WHERE achievement_type_code = (SELECT achievement_type_code FROM Achievements GROUP BY achievement_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Addresses.address_id, Addresses.address_details FROM Addresses JOIN Students_Addresses ON Addresses.address_id = Students_Addresses.address_id GROUP BY Addresses.address_id, Addresses.address_details ORDER BY COUNT(*) DESC LIMIT 1
