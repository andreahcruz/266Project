SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Captain FROM club ORDER BY Captain ASC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name != 'Nike'
SELECT DISTINCT club.Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL OR player.Name != 'Nike' GROUP BY club.Club_ID HAVING COUNT(CASE WHEN player.Name = 'Nike' THEN 1 END) = 0
SELECT Earnings FROM player ORDER BY Wins_count ASC
SELECT Earnings FROM player ORDER BY Wins_count ASC
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Manager FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Captain) > 1
SELECT Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(DISTINCT player.Club_ID) > 1
SELECT Manager FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING COUNT(*) > 1)
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(*) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipments
SELECT COUNT(*) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT Station_name FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel.Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT ID) > 3
SELECT Racing_Series FROM driver WHERE Citizenship = 'United States'
SELECT Racing_Series FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT DISTINCT Name FROM driver ORDER BY Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Exam_ID FROM Exams ORDER BY Exam_ID ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Assessment FROM Student_Assessments
SELECT Student_Assessments.Assessment FROM Students JOIN Student_Assessments ON Students.Student_ID = Student_Assessments.Valid_Answer_ID
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders WHERE Customer_Orders.customer_id IS NOT NULL
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Captain = "Sam Allardyce"
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Captain, COUNT(*) FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY Captain, Manufacturer ORDER BY Captain
SELECT Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Australia" OR club.Manager = "Zimbabwe"
SELECT Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager IN ('Australia', 'Zimbabwe')
SELECT Order_Items.order_item_id, Order_Items.order_item_status_code, COUNT(*) FROM Order_Items JOIN Orders ON Orders.order_id = Order_Items.order_id GROUP BY Order_Items.order_item_id, Order_Items.order_item_status_code
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.order_item_id) as product_count FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, Orders.order_status_code FROM Orders WHERE Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(*) >= 2 )
SELECT order_id, date_order_placed FROM Orders GROUP BY order_id HAVING COUNT(order_id) >= 2
SELECT Customers.gender_code, COUNT(*) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT customer_id, COUNT(*) FROM Orders GROUP BY customer_id
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT invoice_status_code, shipment_date, invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT Orders.order_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT order_item_status_code, shipment_tracking_number FROM Shipment_Items JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_last_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE customer_first_name = "USA"
SELECT address_line_1, town_city, county FROM Customers WHERE customer_first_name = 'United States'
SELECT DISTINCT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Order_Items.order_item_id) > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Orders ON Products.product_id = Orders.customer_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(*) > 3
SELECT Invoices.invoice_date, Invoices.invoice_number FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices WHERE Invoices.invoice_number IN ( SELECT Shipments.invoice_number FROM Shipments GROUP BY Shipments.invoice_number HAVING COUNT(*) >= 2 )
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Orders.order_id, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program ORDER BY Program_ID DESC LIMIT 1
SELECT channel.Digital_terrestrial_channel, channel.Internet FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(*) > 1 )
SELECT Name, COUNT(Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, Name
SELECT Name FROM director JOIN program ON director.Director_ID = program.Director_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT Affiliation, COUNT(*) FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT Transmitter, 2FM_MHz FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel.ID) AS number_of_city_channels FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY radio.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT Build_Year, Model, Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Power > 100 OR vehicle.Top_Speed > 150
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Top_Speed > 150 OR vehicle.Total_Production > '100'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT vehicle.Model, COUNT(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model
SELECT vehicle.Model, COUNT(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Question_Text, Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Question_Text, Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT First_Name, Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT First_Name FROM Students WHERE Student_ID IN ( SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2 )
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(*) >= 2
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Captain ORDER BY AVG(player.Earnings) DESC
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Captain ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Manufacturer FROM club GROUP BY club.Manufacturer ORDER BY COUNT(club.Club_ID) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player )
SELECT Name FROM club WHERE NOT EXISTS ( SELECT 1 FROM player WHERE player.Club_ID = club.Club_ID )
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name HAVING SUM(CASE WHEN player.Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id HAVING Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(Order_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(DISTINCT Order_Items.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(DISTINCT Customer_Payment_Methods.customer_id) DESC LIMIT 1
SELECT t2.gender_code, COUNT(*) AS Cnt FROM Orders AS t5 JOIN Customers AS t2 ON t5.customer_id = t2.customer_id GROUP BY t2.gender_code
SELECT Customers.gender_code, COUNT(*) AS Cnt FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Customers.gender_code
SELECT Products.product_name, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT DISTINCT t1.product_name, t7.shipment_date FROM Shipments AS t7 JOIN Orders AS t5 ON t7.order_id = t5.order_id JOIN Order_Items AS t6 ON t6.order_id = t5.order_id JOIN Products AS t1 ON t6.product_id = t1.product_id
SELECT Products.product_name, Products.product_color FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipments.shipment_date IS NOT NULL
SELECT DISTINCT Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT DISTINCT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_date IS NULL
SELECT DISTINCT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Invoices.invoice_number = Shipments.invoice_number WHERE Shipments.shipment_date IS NULL
SELECT order_id, date_order_placed, order_status_code FROM Orders
SELECT Orders.order_id, Orders.date_order_placed, SUM(Customer_Payment_Methods.customer_id) AS total_amount_paid FROM Orders JOIN Customer_Payment_Methods ON Customer_Payment_Methods.customer_id = Orders.customer_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Customers.customer_first_name, Products.product_name FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id
SELECT Customers.customer_first_name, Products.product_name FROM Order_Items JOIN Customers ON Order_Items.order_item_id = Customers.customer_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 )
SELECT t5.date_order_placed FROM Orders AS t5 JOIN Customers AS t2 ON t5.customer_id = t2.customer_id JOIN Customer_Payment_Methods AS t3 ON t3.customer_id = t2.customer_id GROUP BY t5.order_id HAVING COUNT(DISTINCT t3.payment_method_code) >= 2
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Channel_ID, Internet FROM channel WHERE Digital_terrestrial_channel != 'Hank Baskett'
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, city_channel.Station_name FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID ORDER BY radio.ERP_kW DESC
SELECT DISTINCT radio.Transmitter FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.City_channel_ID IS NULL
SELECT vehicle.Model FROM vehicle WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT COUNT(*) AS Cnt, Driver_ID FROM vehicle_driver GROUP BY Driver_ID ORDER BY Cnt DESC LIMIT 1
SELECT Driver_ID, COUNT(*) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver ORDER BY Vehicle_ID ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT DISTINCT driver.Racing_Series FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'never driven'
SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2 ) OR Vehicle_ID IN ( SELECT t1.Vehicle_ID FROM vehicle AS t1 JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID JOIN driver AS t2 ON t2.Driver_ID = t3.Driver_ID WHERE t2.Name = 'Ziyang' )
SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2 ) OR Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT DISTINCT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exams.Exam_Date FROM Exams JOIN Questions_in_Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID JOIN Student_Answers ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Students ON Students.Student_ID = Student_Answers.Student_ID WHERE LOWER(Students.Student_ID) LIKE '%data%' ORDER BY Exams.Exam_Date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_ID IS NULL
SELECT Student_Answer_Text FROM Student_Assessments WHERE Assessment IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Assessment) = 2
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_price = (SELECT MAX(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name, address_id FROM Customers WHERE address_id IN ( SELECT address_id FROM Customers GROUP BY address_id HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY address_id ) ) )
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT Customers.customer_id, Customers.customer_first_name, Customers.customer_last_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.customer_first_name, Customers.customer_last_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT Customers.customer_id, Customers.customer_last_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.customer_last_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(DISTINCT Order_Items.order_item_id) >= 3
SELECT gender_code, customer_middle_initial, customer_first_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT Customers.customer_middle_initial FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(Order_Items.order_item_id) < 2
SELECT t6.product_id, t1.product_name, t1.product_price FROM Order_Items AS t6 JOIN Products AS t1 ON t6.product_id = t1.product_id GROUP BY t6.product_id, t1.product_name, t1.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items GROUP BY product_id ) )
SELECT Order_Items.order_id AS order_id, SUM(Products.product_price) AS sum_product_prices FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Order_Items.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT product_id, product_price AS total_cost FROM Products WHERE product_price IS NOT NULL ORDER BY product_price ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Customers.gender_code = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Customers.gender_code = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT COUNT(*) FROM Products AS t1 LEFT JOIN Order_Items AS t6 ON t6.product_id = t1.product_id WHERE t6.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS t2 LEFT JOIN Customer_Payment_Methods AS t3 ON t3.customer_id = t2.customer_id WHERE t3.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS t2 LEFT JOIN Customer_Payment_Methods AS t3 ON t2.customer_id = t3.customer_id WHERE t3.customer_id IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code = ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT email_address, town_city, county FROM Customers WHERE gender_code = ( SELECT gender_code FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, shipment_tracking_number FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Products.product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID, director.Name, director.Age ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT channel.Name, channel.Internet FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet ORDER BY COUNT(DISTINCT director_admin.Director_ID) DESC LIMIT 1
SELECT DISTINCT channel.Name FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = director_admin.Director_ID GROUP BY channel.Channel_ID, channel.Name HAVING SUM(CASE WHEN director.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN director.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID JOIN driver AS t2 ON t2.Driver_ID = t3.Driver_ID GROUP BY t1.Vehicle_ID, t1.Model HAVING COUNT(DISTINCT t2.Driver_ID) > 2 OR SUM(CASE WHEN t2.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Racing_Series = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver AS d LEFT JOIN vehicle_driver AS dv ON d.Driver_ID = dv.Driver_ID WHERE dv.Driver_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t3.customer_id, t3.customer_phone, t3.customer_address, t2.address_details FROM Customers AS t3 JOIN Customer_Orders AS t4 ON t4.customer_id = t3.customer_id JOIN Addresses AS t2 ON t2.address_id = t3.customer_id GROUP BY t3.customer_id, t3.customer_phone, t3.customer_address, t2.address_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS t3 LEFT JOIN Customer_Orders AS t4 ON t4.customer_id = t3.customer_id LEFT JOIN Order_Items AS t5 ON t5.order_id = t4.order_id WHERE t5.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_price > 6 OR Customer_Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(DISTINCT Order_Items.product_id) > 3 )
SELECT Order_Items.order_id, Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Order_Items.order_id, Customer_Orders.order_date HAVING MAX(CAST(Order_Items.order_quantity AS REAL)) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM region ORDER BY region.Population DESC LIMIT 1
SELECT region.Area, region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(Customers_and_Services.Customers_and_Services_Details) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(DISTINCT Services.Service_Details) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Services.Service_Details) DESC LIMIT 1
SELECT DISTINCT t2.Customer_Details FROM Customers_and_Services AS t4 JOIN Customers AS t2 ON t4.Customer_ID = t2.Customer_ID WHERE t4.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT Customers_and_Services_Details FROM Customers_and_Services WHERE Service_ID IN ( SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customer_Interactions GROUP BY Service_ID ) ) )
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT Service_ID FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' ) UNION SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT Service_ID FROM Customer_Interactions WHERE Services_and_Channels_Details = 'good' )
SELECT DISTINCT Services.Service_Details FROM Customers_and_Services JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID LEFT JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' OR Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Services.Service_Details FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID JOIN Services ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT Services.Service_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customers_and_Services.Customers_and_Services_Details = 'bad'
SELECT Notes, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Customers.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Renting_history JOIN Customers ON Renting_history.customer_id = Customers.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Renting_history.vehicles_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.Notes, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id ORDER BY Renting_history.total_hours DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY SUM(Renting_history.total_hours) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(*) >= 2 UNION SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(*) < 2
SELECT Students.student_details, Students.student_id FROM Students LEFT JOIN Classes ON Classes.student_id = Students.student_id LEFT JOIN Detention ON Detention.student_id = Students.student_id GROUP BY Students.student_id, Students.student_details HAVING COUNT(DISTINCT Classes.class_id) >= 2 OR COUNT(DISTINCT Detention.detention_id) < 2
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT T12b.teacher_id FROM Classes AS T12b WHERE T12b.class_details LIKE 'net%' )
SELECT DISTINCT t10.teacher_details FROM Teachers AS t10 JOIN Classes AS t12 ON t12.teacher_id = t10.teacher_id WHERE t12.class_details LIKE '%data%' AND t10.teacher_id NOT IN ( SELECT t12b.teacher_id FROM Classes AS t12b WHERE t12b.class_details LIKE 'net%' )
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Achievements.student_id = Student_Loans.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Achievements.student_id = Student_Loans.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(*) >= 2
SELECT Classes.class_details, Classes.teacher_id FROM Classes GROUP BY Classes.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.teacher_id FROM Classes GROUP BY Classes.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details, Student_Loans.date_of_loan, Student_Loans.amount_of_loan, Student_Loans.other_details, Classes.teacher_id, Classes.class_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Classes ON Classes.student_id = Students.student_id WHERE Students.student_id IN ( SELECT student_id FROM Behaviour_Monitoring GROUP BY student_id HAVING SUM(CASE WHEN behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) THEN 1 ELSE 0 END) > 0 )
SELECT Students.bio_data, Student_Events.other_details FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Events.other_details = (SELECT other_details FROM Student_Events GROUP BY other_details ORDER BY COUNT(*) DESC LIMIT 1) AND Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details HAVING COUNT(DISTINCT Behaviour_Monitoring.student_id) = 3 )
SELECT Student_Events.* FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id GROUP BY Students.student_id HAVING COUNT(DISTINCT Behaviour_Monitoring.behaviour_monitoring_details) = 1 AND MAX(Behaviour_Monitoring.behaviour_monitoring_details) = ( SELECT T3b.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3b GROUP BY T3b.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS Cnt, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS student_details, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Classes.teacher_id) FROM Classes JOIN Students ON Classes.student_id = Students.student_id LEFT JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_id IS NULL
SELECT COUNT(DISTINCT Classes.teacher_id) FROM Classes JOIN Students ON Classes.student_id = Students.student_id LEFT JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_id IS NULL
SELECT t8.detention_type_code AS event_type_code, t8.detention_type_description AS class_details FROM Detention AS t14 JOIN Ref_Detention_Type AS t8 ON t14.detention_type_code = t8.detention_type_code GROUP BY t8.detention_type_code, t8.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT t8.detention_type_code AS event_type_code, t8.detention_type_description AS class_details FROM Detention AS t14 JOIN Ref_Detention_Type AS t8 ON t14.detention_type_code = t8.detention_type_code GROUP BY t8.detention_type_code, t8.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Addresses.address_details FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Addresses ON Addresses.address_id = Student_Loans.student_loan_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Student_Events.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Teachers.teacher_details FROM Transcripts JOIN Classes ON Classes.student_id = Transcripts.student_id JOIN Teachers ON Teachers.teacher_id = Classes.teacher_id WHERE Transcripts.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 ) AND Transcripts.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts WHERE student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 ) )
SELECT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.student_id = ( SELECT Transcripts.student_id FROM Transcripts ORDER BY Transcripts.date_of_transcript ASC LIMIT 1 )
SELECT address_id, COUNT(*) AS Cnt FROM Students_Addresses GROUP BY address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.class_id, Classes.class_details FROM Students_Addresses JOIN Classes ON Students_Addresses.address_id = Classes.class_id GROUP BY Classes.class_id, Classes.class_details ORDER BY COUNT(*) DESC LIMIT 1
