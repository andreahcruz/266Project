SELECT COUNT(Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Captain ASC
SELECT Club_ID FROM club ORDER BY Club_ID ASC
SELECT club.Name FROM club WHERE club.Manufacturer != 'Nike'
SELECT club.Name FROM club WHERE club.Club_ID NOT IN ( SELECT player.Club_ID FROM player WHERE player.Name = 'Nike' )
SELECT player.Earnings FROM player ORDER BY player.Wins_count ASC
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID ORDER BY player.Wins_count ASC
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY Manufacturer HAVING count(DISTINCT Captain) > 1
SELECT Manufacturer FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING COUNT(*) > 1) GROUP BY Manufacturer
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID HAVING COUNT(player.Player_ID) > 1
SELECT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manager HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT player.Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_status_code) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipments
SELECT COUNT(shipment_id) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY radio.ERP_kW ASC
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(CAST(2FM_MHz AS REAL)) FROM radio WHERE 2FM_MHz IS NOT NULL AND 2FM_MHz NOT LIKE '%[A-Za-z]%' AND CAST(2FM_MHz AS REAL) IS NOT NULL
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT ID) > 3
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT vehicle_driver.Vehicle_ID) FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT driver.Racing_Series FROM driver ORDER BY driver.Racing_Series ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Student_Assessments ON Student_Answers.Student_ID = Student_Assessments.Student_Answer_ID WHERE Student_Assessments.Satisfactory_YN = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Question_Text FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Question_Text HAVING COUNT(*) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(address_id) FROM Addresses
SELECT count(address_id) FROM Addresses
SELECT COUNT(product_name) FROM Products
SELECT COUNT(DISTINCT product_name) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(product_name) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(customer_phone) FROM Customers
SELECT COUNT(customer_phone) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT Manager, Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 GROUP BY club.Club_ID, club.Name
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2 GROUP BY club.Club_ID, club.Name
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Captain = "Sam Allardyce"
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager IN ('Australia', 'Zimbabwe')
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, COUNT(Order_Items.product_id) as product_count, Orders.order_status_code, Orders.order_id FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Order_Items.product_id) >= 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT Customers.gender_code, COUNT(Orders.order_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Order_Items.order_item_status_code, COUNT(Orders.order_id) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Order_Items.order_item_status_code
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.login_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT Orders.order_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Orders.order_status_code, Shipments.shipment_tracking_number FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_middle_initial, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT Orders.order_status_code, Orders.date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE county = "USA"
SELECT address_line_1, town_city, county FROM Customers WHERE email_address = 'United States'
SELECT Products.product_id, Products.product_description FROM Products WHERE Products.product_name > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Order_Items.order_item_id) > 3
SELECT Invoices.invoice_date, Invoices.invoice_number FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number HAVING COUNT(Shipments.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT program.Title FROM program ORDER BY program.Program_ID DESC LIMIT 1
SELECT channel.Internet, channel.Digital_terrestrial_channel FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID HAVING COUNT(program.Program_ID) > 1
SELECT channel.Internet, COUNT(program.Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Internet
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT radio.Transmitter FROM radio WHERE radio.ERP_kW > 150 OR radio.ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT Transmitter, City FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel.ID) AS number_of_city_channels FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT vehicle.Model FROM vehicle WHERE vehicle.Power > 100 OR vehicle.Top_Speed > 150
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Top_Speed > 150 OR vehicle.Total_Production > 100
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Model
SELECT vehicle.Vehicle_ID, COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Exams.Subject_Code != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Question_Text, Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Question_Text, Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_ID) >= 2
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer ORDER BY COUNT(DISTINCT club.Club_ID) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player WHERE Club_ID IS NOT NULL )
SELECT club.Club_ID FROM club LEFT JOIN player ON player.Club_ID = club.Club_ID WHERE player.Club_ID IS NULL
SELECT DISTINCT club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE player.Earnings > 1400000 OR player.Earnings < 1100000
SELECT club.Club_ID FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID HAVING SUM(CASE WHEN player.Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id HAVING MIN(Orders.date_order_placed) = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(Order_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(DISTINCT Order_Items.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(DISTINCT Customers.customer_id) DESC LIMIT 1
SELECT t2.gender_code, COUNT(DISTINCT t1.product_id) AS Cnt FROM Orders AS t5 JOIN Customers AS t2 ON t5.customer_id = t2.customer_id JOIN Order_Items AS t6 ON t6.order_id = t5.order_id JOIN Products AS t1 ON t6.product_id = t1.product_id GROUP BY t2.gender_code
SELECT Customers.gender_code, COUNT(DISTINCT Orders.order_id) AS Cnt FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT Products.product_name, Shipments.shipment_date FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipments ON Shipments.order_id = Order_Items.order_id
SELECT DISTINCT t1.product_name, t7.shipment_date FROM Shipments AS t7 JOIN Shipment_Items AS t8 ON t8.shipment_id = t7.shipment_id JOIN Order_Items AS t6 ON t6.order_item_id = t8.order_item_id JOIN Products AS t1 ON t1.product_id = t6.product_id
SELECT DISTINCT Products.product_name, Products.product_color FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT DISTINCT Customers.gender_code, Products.product_color FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id JOIN Customers ON Orders.customer_id = Customers.customer_id
SELECT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_id IS NULL
SELECT DISTINCT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_tracking_number IS NULL OR Shipments.shipment_tracking_number = ''
SELECT Orders.order_id, Orders.date_order_placed, SUM(Customers.customer_id) AS total_cost FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, SUM(Customer_Payment_Methods.payment_method_code) AS total_amount_paid FROM Orders JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Orders.customer_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Customers.customer_first_name, Products.product_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT Customers.customer_first_name, Products.product_name FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY Orders.order_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2
SELECT t5.date_order_placed FROM Orders AS t5 JOIN Customers AS t2 ON t5.customer_id = t2.customer_id JOIN Customer_Payment_Methods AS t3 ON t3.customer_id = t2.customer_id GROUP BY t5.order_id HAVING COUNT(DISTINCT t3.payment_method_code) >= 2
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT channel.Channel_ID, channel.Internet FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = director_admin.Director_ID WHERE director.Name <> 'Hank Baskett'
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, city_channel.Station_name FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID ORDER BY radio.ERP_kW DESC
SELECT DISTINCT radio.Transmitter FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.City_channel_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT COUNT(DISTINCT t3.Vehicle_ID) AS CntVehicles, t2.Driver_ID FROM driver AS t2 JOIN vehicle_driver AS t3 ON t2.Driver_ID = t3.Driver_ID GROUP BY t2.Driver_ID ORDER BY CntVehicles DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, COUNT(DISTINCT vehicle_driver.Vehicle_ID) AS Cnt FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY Cnt DESC LIMIT 1
SELECT vehicle_driver.Driver_ID FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID ORDER BY vehicle.Total_Production ASC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT DISTINCT driver.Racing_Series FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN ( SELECT Vehicle_ID FROM vehicle_driver )
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN (SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 LEFT JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID LEFT JOIN driver AS t2 ON t2.Driver_ID = t3.Driver_ID WHERE t2.Racing_Series = 'two' OR t2.Driver_ID = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID LEFT JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) = 2 OR vehicle.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT DISTINCT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Questions ON Questions.Question_ID = Questions_in_Exams.Question_ID WHERE Questions.Type_of_Question_Code LIKE '%data%' ORDER BY Exams.Exam_Date DESC
SELECT Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Questions ON Questions.Question_ID = Questions_in_Exams.Question_ID WHERE Questions.Type_of_Question_Code LIKE '%data%' ORDER BY Exams.Exam_Date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answers.Valid_Answer_Text FROM Questions JOIN Valid_Answers ON Valid_Answers.Question_ID = Questions.Question_ID GROUP BY Valid_Answers.Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_ID IS NULL
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT Addresses.address_details FROM Products JOIN Addresses ON Products.product_id = Addresses.address_id GROUP BY Products.product_type_code ORDER BY COUNT(Products.product_name) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Addresses.address_details FROM Customers JOIN Addresses ON Customers.payment_method_code = Addresses.address_id GROUP BY Addresses.address_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(DISTINCT customer_id) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(DISTINCT customer_id) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_id FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Customer_Orders.order_status_code FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT t2.customer_id, t2.gender_code, t2.customer_last_name FROM Customers AS t2 JOIN Orders AS t5 ON t5.customer_id = t2.customer_id JOIN Order_Items AS t6 ON t6.order_id = t5.order_id GROUP BY t2.customer_id, t2.gender_code, t2.customer_last_name HAVING COUNT(DISTINCT t5.order_id) > 2 AND COUNT(DISTINCT t6.order_item_id) >= 3
SELECT Customers.customer_id, Customers.gender_code, Customers.customer_first_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.gender_code, Customers.customer_first_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(DISTINCT Order_Items.order_item_id) >= 3
SELECT gender_code, customer_middle_initial, customer_first_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.country, Customers.customer_last_name, Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(Order_Items.order_item_id) < 2
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id, Products.product_name, Products.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items GROUP BY product_id ) )
SELECT Orders.order_id, SUM(Products.product_price) AS sum_product_prices FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id ORDER BY sum_product_prices ASC LIMIT 1
SELECT Orders.order_id, SUM(Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY Orders.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Customers.gender_code IS NOT NULL AND Customers.gender_code <> ''
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Customers.gender_code = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT Customers.gender_code, Orders.order_status_code FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders ON Orders.order_id = Order_Items.order_id JOIN Customers ON Customers.customer_id = Orders.customer_id WHERE Products.product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT COUNT(*) FROM Products AS t1 LEFT JOIN Order_Items AS t6 ON t6.product_id = t1.product_id WHERE t6.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS t2 LEFT JOIN Customer_Payment_Methods AS t3 ON t2.customer_id = t3.customer_id WHERE t3.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS t2 LEFT JOIN Customer_Payment_Methods AS t3 ON t2.customer_id = t3.customer_id WHERE t3.customer_id IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code IN ( SELECT gender_code FROM Customers GROUP BY gender_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY gender_code ) ) )
SELECT t2.email_address, t2.town_city, t2.county FROM Customers AS t2 WHERE t2.gender_code = ( SELECT t2g.gender_code FROM Customers AS t2g JOIN Orders AS t5 ON t5.customer_id = t2g.customer_id GROUP BY t2g.gender_code ORDER BY COUNT(t5.order_id) ASC LIMIT 1 )
SELECT Products.product_color, Customers.customer_last_name, Shipments.shipment_tracking_number FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders ON Orders.order_id = Order_Items.order_id JOIN Customers ON Customers.customer_id = Orders.customer_id JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Products.product_price < (SELECT MAX(product_price) FROM Products)
SELECT Products.product_color, Products.product_description, Orders.order_status_code FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id WHERE Products.product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Director_ID FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(*) FROM channel AS t1 LEFT JOIN program AS t3 ON t3.Channel_ID = t1.Channel_ID WHERE t3.Program_ID IS NULL
SELECT channel.Name, channel.Internet FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet ORDER BY COUNT(DISTINCT program.Director_ID) DESC LIMIT 1
SELECT channel.Internet FROM director_admin JOIN channel ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director_admin.Director_ID = director.Director_ID GROUP BY channel.Channel_ID, channel.Internet HAVING SUM(CASE WHEN director.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN director.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Racing_Series = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS d LEFT JOIN vehicle_driver AS dv ON d.Driver_ID = dv.Driver_ID WHERE dv.Driver_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT Addresses.address_details FROM Products JOIN Addresses ON Products.product_id = Addresses.address_id WHERE Products.product_name = 'Hardware' AND Products.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT Customers.customer_id, Customers.customer_phone, Customers.customer_address, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_phone, Customers.customer_address, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT t3.customer_id, t3.customer_phone, t3.customer_address, t2.address_details FROM Customers AS t3 JOIN Customer_Orders AS t4 ON t4.customer_id = t3.customer_id JOIN Order_Items AS t5 ON t5.order_id = t4.order_id JOIN Addresses AS t2 ON t2.address_id = t3.customer_id GROUP BY t3.customer_id, t3.customer_phone, t3.customer_address, t2.address_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS Products LEFT JOIN Customer_Orders AS Addresses ON Addresses.customer_id = Products.customer_id LEFT JOIN Order_Items AS Customers ON Customers.order_id = Addresses.order_id WHERE Customers.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT DISTINCT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_price > 6 OR Customer_Orders.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3 )
SELECT DISTINCT Order_Items.order_id, Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Order_Items.order_id, Customer_Orders.order_date HAVING MAX(CAST(Order_Items.order_quantity AS REAL)) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Area, region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Area, region.Capital ORDER BY COUNT(building.Name) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(Customers_and_Services.Customers_and_Services_Details) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID GROUP BY Customer_Interactions.Customer_ID ORDER BY COUNT(DISTINCT Customer_Interactions.Service_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Services.Service_Details) DESC LIMIT 1
SELECT DISTINCT t2.Customer_Details FROM Customers_and_Services AS t4 JOIN Customers AS t2 ON t4.Customer_ID = t2.Customer_ID WHERE t4.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers_and_Services.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT Service_ID FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' ) UNION SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' UNION SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Services.Service_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT DISTINCT t1.Service_Details FROM Customer_Interactions AS t5 JOIN Customers AS t2 ON t5.Customer_ID = t2.Customer_ID JOIN Services AS t1 ON t5.Service_ID = t1.Service_ID WHERE t2.Customer_Details = 'Hardy Kutch' AND t5.Status_Code = 'bad'
SELECT Notes, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Customers.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Renting_history JOIN Customers ON Renting_history.customer_id = Customers.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Vehicles.Notes, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Renting_history.vehicles_id ORDER BY SUM(Renting_history.total_hours) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Student_Events.other_details, Students.student_id FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(*) >= 2 ) AND Students.student_id IN ( SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(*) < 2 )
SELECT Student_Events.other_details AS other_details, Students.student_id FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id LEFT JOIN Classes ON Classes.student_id = Students.student_id LEFT JOIN Detention ON Detention.student_id = Students.student_id GROUP BY Students.student_id, Student_Events.other_details HAVING COUNT(DISTINCT Classes.class_id) >= 2 OR COUNT(DISTINCT Detention.detention_id) < 2
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT T12b.teacher_id FROM Classes AS T12b WHERE T12b.class_details LIKE 'net%' )
SELECT DISTINCT t10.teacher_details FROM Teachers AS t10 JOIN Classes AS t12 ON t12.teacher_id = t10.teacher_id WHERE t12.class_details LIKE '%data%' AND t10.teacher_id NOT IN ( SELECT t12b.teacher_id FROM Classes AS t12b WHERE t12b.class_details LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Student_Loans.student_id = Achievements.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Achievements.student_id = Student_Loans.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT t12.class_details, t10.teacher_id FROM Classes AS t12 JOIN Teachers AS t10 ON t12.teacher_id = t10.teacher_id GROUP BY t10.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.class_details, Teachers.teacher_id FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id GROUP BY Teachers.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.bio_data, t12.class_details FROM Students AS t1 JOIN Classes AS t12 ON t12.student_id = t1.student_id WHERE t1.student_id IN ( SELECT b.student_id FROM Behaviour_Monitoring AS b GROUP BY b.student_id HAVING SUM(CASE WHEN b.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN b.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3) THEN 1 ELSE 0 END) > 0 )
SELECT Students.bio_data, Student_Events.other_details FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Events.other_details = (SELECT other_details FROM Student_Events GROUP BY other_details ORDER BY COUNT(*) DESC LIMIT 1) AND Students.student_id IN (SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details HAVING COUNT(DISTINCT Behaviour_Monitoring.student_id) = 3)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id GROUP BY Students.student_id HAVING COUNT(DISTINCT Behaviour_Monitoring.behaviour_monitoring_details) = 1 AND MIN(Behaviour_Monitoring.behaviour_monitoring_details) = ( SELECT T3b.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3b GROUP BY T3b.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT T3b.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3b GROUP BY T3b.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT Student_Events.student_id) AS Cnt, Student_Events.event_type_code, Ref_Event_Types.event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code, Ref_Event_Types.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Student_Events.student_id) AS student_details, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY COUNT(DISTINCT Student_Events.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT Classes.teacher_id) FROM Classes JOIN Students ON Classes.student_id = Students.student_id LEFT JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_id IS NULL
SELECT COUNT(DISTINCT t10.teacher_id) FROM Teachers AS t10 JOIN Classes AS t12 ON t12.teacher_id = t10.teacher_id JOIN Students AS t1 ON t1.student_id = t12.student_id WHERE t1.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT t5.event_type_code, t12.class_details FROM Detention AS t14 JOIN Ref_Event_Types AS t5 ON t14.detention_type_code = t5.event_type_code JOIN Classes AS t12 ON t12.teacher_id = t5.event_type_code GROUP BY t5.event_type_code, t12.class_details ORDER BY COUNT(*) ASC LIMIT 1
SELECT detention_type_code, COUNT(*) AS cnt FROM Detention GROUP BY detention_type_code ORDER BY cnt LIMIT 1
SELECT Students.bio_data, Classes.class_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Classes ON Classes.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Student_Events.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Teachers.teacher_details FROM Transcripts JOIN Students ON Transcripts.student_id = Students.student_id JOIN Classes ON Classes.student_id = Students.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Transcripts.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 )
SELECT DISTINCT Teachers.teacher_details FROM Transcripts JOIN Students ON Transcripts.student_id = Students.student_id JOIN Classes ON Classes.student_id = Students.student_id JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id WHERE Transcripts.transcript_id = (SELECT MIN(transcript_id) FROM Transcripts)
SELECT Students_Addresses.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Students_Addresses.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
