SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Captain FROM club ORDER BY Captain ASC
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name != 'Nike'
SELECT DISTINCT club.Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE club.Club_ID NOT IN ( SELECT Club_ID FROM player WHERE Name = 'Nike' )
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT driver.Name FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID, driver.Name ORDER BY COUNT(vehicle_driver.Driver_ID) ASC
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT club.Manufacturer FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(DISTINCT player.Name) > 1
SELECT club.Manufacturer FROM club INNER JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Manufacturer HAVING COUNT(DISTINCT player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(*) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(player.Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT customer_phone) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT order_quantity) FROM Order_Items
SELECT COUNT(DISTINCT order_status_code) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Order_Items WHERE order_quantity = 'shipped'
SELECT COUNT(*) FROM Shipments
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT City_channel_ID) FROM city_channel_radio JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE city_channel.Affiliation = 'digital'
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID ORDER BY radio.ERP_kW ASC
SELECT DISTINCT city_channel.Station_name FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel.Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(ID) > 3
SELECT driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE Racing_Series = 'NASCAR')
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID ORDER BY driver.Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Exam_ID FROM Exams ORDER BY Exam_ID ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = "Normal"
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Questions ON Student_Answers.Question_ID = Questions.Question_ID WHERE Questions.Question_Text = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Students.student_details FROM Students WHERE Students.bio_data != 'M'
SELECT student_details FROM Students WHERE bio_data != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Question_Text FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Question_Text HAVING COUNT(*) >= 3
SELECT Students.student_id, Students.bio_data, Students.student_details FROM Students
SELECT Students.student_id, Students.bio_data, Students.student_details, Students_Addresses.student_address_id, Students_Addresses.address_id, Students_Addresses.address_type_code, Students_Addresses.date_from, Students_Addresses.date_to FROM Students LEFT JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id
SELECT COUNT(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT vehicle.Top_Speed FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_size = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_name = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_name = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT DISTINCT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_id FROM Products GROUP BY product_id HAVING COUNT(*) >= 2
SELECT Name FROM driver WHERE Driver_ID IN ( SELECT Driver_ID FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(*) >= 2 )
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods
SELECT DISTINCT membership_credit FROM Discount
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NOT NULL
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT Manager, Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT DISTINCT t1.Name FROM club JOIN player ON t1.Club_ID = t2.Club_ID WHERE t2.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Captain = 'Sam Allardyce'
SELECT driver.Name, COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Name
SELECT Builder, COUNT(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY Builder
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name IN ('Australia', 'Zimbabwe')
SELECT Orders.order_id, Orders.order_status_code, COUNT(*) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Customer_Orders.order_id, COUNT(*) AS product_count, Customers.customer_name, Customer_Orders.order_status_code FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id LEFT JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customers.customer_name, Customer_Orders.order_status_code
SELECT Orders.order_id, Orders.date_order_placed FROM Orders WHERE Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(*) >= 2 )
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT Customers.customer_phone, COUNT(*) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_phone
SELECT order_status_code, COUNT(*) FROM Orders GROUP BY order_status_code
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.customer_first_name, Customers.gender_code, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT DISTINCT Orders.order_id, Orders.order_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT order_status_code, order_id FROM Customer_Orders
SELECT Customer_Orders.order_status_code, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Order_Items.order_quantity IS NOT NULL
SELECT DISTINCT Customers.customer_name FROM Customers WHERE Customers.customer_phone LIKE '+12%'
SELECT customer_name, customer_phone FROM Customers WHERE customer_phone LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT Addresses.address_details, Customers.customer_name, Customers.customer_address FROM Addresses JOIN Customers ON Addresses.address_id = Customers.customer_id WHERE Customers.customer_phone = "USA"
SELECT Addresses.address_details, Customers.customer_address, Customers.customer_name FROM Addresses JOIN Customers ON Addresses.address_id = Customers.customer_id WHERE Customers.customer_phone = 'United States'
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Shipment_Items.shipment_id) > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id HAVING COUNT(Orders.order_id) > 3
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING COUNT(*) >= 2
SELECT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id HAVING COUNT(*) >= 2
SELECT Customers.customer_number, Customer_Orders.order_date FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT Customers.customer_number, Customer_Orders.order_date FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT Name FROM director JOIN director_admin ON director.Director_ID = director_admin.Director_ID ORDER BY director_admin.Is_first_director DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program ORDER BY Program_ID DESC LIMIT 1
SELECT channel.Digital_terrestrial_channel, channel.Internet FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(*) > 1 )
SELECT channel.Name, COUNT(program.Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID WHERE program.Title = 'Dracula'
SELECT t2.Name, t3.Start_Year FROM program JOIN director ON t3.Director_ID = t2.Director_ID
SELECT radio.Transmitter FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE radio.ERP_kW > 150 OR radio.ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT Affiliation, COUNT(*) FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT Transmitter, City FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel.City) AS number_of_city_channels FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID GROUP BY radio.Transmitter
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE CAST(vehicle.Total_Production AS NUMERIC) > 100 OR vehicle.Power > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT vehicle.Model, COUNT(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model
SELECT vehicle.Vehicle_ID, COUNT(DISTINCT driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID
SELECT Exam_Date, Exam_Name FROM Exams WHERE Exam_ID NOT IN ( SELECT Exam_ID FROM Exams WHERE Subject_Code = "Database" )
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code
SELECT Model, COUNT(*) FROM vehicle GROUP BY Model
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.bio_data, Students_Addresses.date_to FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.bio_data, Students_Addresses.date_to FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id ORDER BY Students_Addresses.date_to DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.bio_data FROM Students_Addresses JOIN Students ON Students_Addresses.student_id = Students.student_id GROUP BY Students_Addresses.student_id HAVING COUNT(*) >= 2
SELECT Students.student_details FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id GROUP BY Students_Addresses.student_id HAVING COUNT(*) >= 2
SELECT student_details, COUNT(*) FROM Students GROUP BY student_details
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT player.Country FROM player WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Captain ORDER BY AVG(player.Earnings) DESC
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Captain ORDER BY AVG(player.Earnings) DESC
SELECT Builder FROM vehicle GROUP BY Builder ORDER BY COUNT(*) DESC LIMIT 1
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY player.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player )
SELECT t1.Name FROM club AS t1 LEFT JOIN player AS t2 ON t2.Club_ID = t1.Club_ID WHERE t2.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name HAVING SUM(CASE WHEN player.Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(Order_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(Order_Items.order_item_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(DISTINCT Customer_Payment_Methods.customer_id) DESC LIMIT 1
SELECT t2.gender_code, COUNT(*) AS number_of_products FROM Products AS t1 JOIN Customers AS t2 ON t1.product_id = t2.customer_id GROUP BY t2.gender_code
SELECT product_size, COUNT(*) FROM Products GROUP BY product_size
SELECT product_name, product_type_code FROM Products
SELECT product_name, product_type_code FROM Products
SELECT Products.product_type_code, Products.product_name FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Customer_Orders.order_status_code = 'shipped'
SELECT DISTINCT Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_date IS NULL
SELECT DISTINCT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_date IS NULL
SELECT Orders.order_id, Orders.date_order_placed, SUM(Shipments.invoice_number) AS total_cost FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, SUM(CAST(Shipments.shipment_tracking_number AS REAL)) AS total_amount_paid FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT product_color, product_name FROM Products
SELECT product_color, product_name FROM Products
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 )
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 )
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Channel_ID, Name FROM channel WHERE Digital_terrestrial_channel != 'Hank Baskett' OR Digital_terrestrial_channel IS NULL
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.Station_name, t2.Transmitter FROM city_channel_radio t3 JOIN city_channel t1 ON t3.City_channel_ID = t1.ID JOIN radio t2 ON t3.Radio_ID = t2.Radio_ID ORDER BY t1.Owned_Since DESC
SELECT DISTINCT radio.Transmitter FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.City_channel_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT COUNT(*) AS vehicles_count, t3.Driver_ID FROM vehicle_driver AS t3 GROUP BY t3.Driver_ID ORDER BY vehicles_count DESC LIMIT 1
SELECT Driver_ID, COUNT(*) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT DISTINCT driver.Racing_Series FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN ( SELECT Vehicle_ID FROM vehicle_driver )
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN ( SELECT Vehicle_ID FROM vehicle_driver )
SELECT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 JOIN vehicle_driver AS t3 ON t3.Vehicle_ID = t1.Vehicle_ID JOIN driver AS t2 ON t2.Driver_ID = t3.Driver_ID GROUP BY t1.Vehicle_ID, t1.Model HAVING COUNT(DISTINCT t3.Driver_ID) = 2 OR MAX(CASE WHEN t2.Name = 'Ziyang' THEN 1 ELSE 0 END) = 1
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID LEFT JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) = 2 OR MAX(CASE WHEN vehicle.Builder = 'Ziyang' THEN 1 ELSE 0 END) = 1
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT DISTINCT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT event_date FROM Student_Events JOIN Students ON Student_Events.student_id = Students.student_id WHERE Students.bio_data LIKE '%data%' ORDER BY event_date DESC
SELECT event_date FROM Student_Events WHERE student_id LIKE '%data%' ORDER BY event_date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Students.student_details FROM Students LEFT JOIN Students_Addresses ON Students_Addresses.student_id = Students.student_id WHERE Students_Addresses.student_address_id IS NULL
SELECT Student_Assessments.Student_Answer_Text FROM Student_Answers JOIN Valid_Answers ON Student_Answers.Exam_ID = Valid_Answers.Valid_Answer_ID JOIN Student_Assessments ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID WHERE Student_Answers.Comments IN ('Normal','Absent') GROUP BY Student_Assessments.Student_Answer_Text HAVING COUNT(DISTINCT Student_Answers.Comments) = 2
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_color FROM Products WHERE product_name = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_price = (SELECT MAX(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products ORDER BY product_price ASC LIMIT 1
SELECT product_id FROM Products ORDER BY product_price DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name, customer_id FROM Customers WHERE customer_id = ( SELECT customer_id FROM Customers GROUP BY customer_id ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT name FROM Customers WHERE membership_credit = ( SELECT membership_credit FROM Customers GROUP BY membership_credit ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_type_code FROM Products ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT Customers.customer_id, Customers.customer_name FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_name HAVING COUNT(DISTINCT Customer_Orders.order_id) > 2 AND COUNT(*) >= 3
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_phone HAVING COUNT(DISTINCT Customer_Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT customer_name FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Orders )
SELECT Customers.customer_name FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id LEFT JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_type_code FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_type_code HAVING COUNT(Order_Items.product_id) < 2
SELECT t1.product_id AS id, t1.product_name AS product_name, t1.product_price AS price FROM Order_Items AS t5 JOIN Products AS t1 ON t5.product_id = t1.product_id GROUP BY t1.product_id, t1.product_name, t1.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(order_count) FROM ( SELECT COUNT(*) AS order_count FROM Order_Items GROUP BY product_id ) )
SELECT Order_Items.order_id, SUM(Products.product_price) AS sum_product_prices FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Order_Items.order_id ORDER BY sum_product_prices ASC LIMIT 1
SELECT order_item_id, SUM(CAST(order_quantity AS REAL)) AS total_cost FROM Order_Items GROUP BY order_item_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE product_name IS NULL
SELECT COUNT(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_item_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT COUNT(*) FROM Customers WHERE payment_method_code IS NULL OR payment_method_code = ''
SELECT customer_address FROM Customers WHERE customer_email = ( SELECT customer_email FROM Customers GROUP BY customer_email ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT t2.customer_email, t2.customer_address, t2.payment_method_code FROM Customers AS t2 JOIN Customer_Orders AS t3 ON t3.customer_id = t2.customer_id WHERE t3.order_status_code = ( SELECT t3i.order_status_code FROM Customer_Orders AS t3i JOIN Order_Items AS t4i ON t4i.order_id = t3i.order_id GROUP BY t3i.order_status_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE NOT EXISTS ( SELECT 1 FROM program WHERE program.Channel_ID = channel.Channel_ID )
SELECT channel.Name, channel.Internet FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet ORDER BY COUNT(DISTINCT director_admin.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID JOIN director ON director.Director_ID = director_admin.Director_ID GROUP BY channel.Channel_ID, channel.Name HAVING SUM(CASE WHEN director.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN director.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Racing_Series = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS driver LEFT JOIN vehicle_driver AS vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT Model FROM vehicle WHERE Top_Speed > (SELECT AVG(Top_Speed) FROM vehicle)
SELECT Model FROM vehicle WHERE Top_Speed > (SELECT AVG(Top_Speed) FROM vehicle)
SELECT Customers.customer_id, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.customer_id, t1.customer_phone, t1.customer_name, t1.customer_email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id GROUP BY t1.customer_id ORDER BY COUNT(t2.order_id) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Orders AS t2 ON t2.customer_id = t1.customer_id WHERE t2.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id LEFT JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.order_id IS NULL
SELECT DISTINCT Order_Items.order_item_id, Orders.date_order_placed FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE CAST(Products.product_size AS REAL) > 6 OR Order_Items.order_item_id IN ( SELECT T3b.order_item_id FROM Order_Items AS T3b GROUP BY T3b.order_item_id HAVING COUNT(DISTINCT T3b.product_id) > 3 )
SELECT Order_Items.order_id, Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Order_Items.order_id, Customer_Orders.order_date HAVING MAX(CAST(Order_Items.order_quantity AS REAL)) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT region.Area, region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Area, region.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.* FROM Renting_history JOIN Customers ON Renting_history.customer_id = Customers.id JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Customers.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.customer_address FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id, Customers.customer_address ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.customer_phone FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id ORDER BY COUNT(DISTINCT Customer_Orders.order_status_code) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Service_ID) DESC LIMIT 1
SELECT customer_address FROM Customers WHERE customer_email = ( SELECT customer_email FROM Customers GROUP BY customer_email ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT customer_address FROM Customers WHERE customer_number IN ( SELECT customer_number FROM Customers GROUP BY customer_number HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY customer_number ) ) )
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT Service_ID FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' UNION SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good' )
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' UNION SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Services.Service_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID AND Customer_Interactions.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Model, Power, Top_Speed FROM vehicle WHERE Build_Year IN ('2013', '2014')
SELECT vehicle.Model, vehicle.Power, vehicle.Total_Production FROM vehicle WHERE vehicle.Build_Year IN ('2013', '2014')
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.Notes, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Renting_history.vehicles_id ORDER BY SUM(Renting_history.total_hours) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(*) >= 2 INTERSECT SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(*) < 2
SELECT Students.student_details, Students.student_id FROM Students LEFT JOIN Classes ON Classes.student_id = Students.student_id LEFT JOIN Detention ON Detention.student_id = Students.student_id GROUP BY Students.student_id, Students.student_details HAVING COUNT(DISTINCT Classes.class_id) >= 2 OR COUNT(DISTINCT Detention.detention_id) < 2
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT T3b.teacher_id FROM Classes AS T3b WHERE T3b.class_details LIKE 'net%' )
SELECT DISTINCT t2.teacher_details FROM Teachers AS t2 JOIN Classes AS t3 ON t3.teacher_id = t2.teacher_id WHERE t3.class_details LIKE '%data%' AND t2.teacher_id NOT IN ( SELECT t3b.teacher_id FROM Classes AS t3b WHERE t3b.class_details LIKE 'net%' )
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Student_Loans.student_id = Achievements.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN Achievements ON Student_Loans.student_id = Achievements.student_id GROUP BY Student_Loans.student_loan_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT t2.Name, t2.Driver_ID FROM driver AS t2 JOIN vehicle_driver AS t3 ON t3.Driver_ID = t2.Driver_ID GROUP BY t2.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.teacher_id, Classes.class_details FROM Classes GROUP BY Classes.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Students.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) ) AND Students.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_details, Student_Events.event_date, Student_Events.other_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id LEFT JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details)) ) AND Behaviour_Monitoring.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 )
SELECT Student_Events.* FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id JOIN Classes ON Classes.student_id = Students.student_id GROUP BY Students.student_id HAVING MIN(Classes.class_details) = MAX(Classes.class_details) AND MIN(Classes.class_details) = ( SELECT T7b.class_details FROM Classes AS T7b GROUP BY T7b.class_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT Students.student_details FROM Students JOIN Behaviour_Monitoring ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS number, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS number_of_students, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Students_Addresses.address_id) FROM Students_Addresses JOIN Students ON Students_Addresses.student_id = Students.student_id LEFT JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_id IS NULL
SELECT COUNT(DISTINCT t5.teacher_id) FROM Classes AS t5 WHERE t5.student_id IN ( SELECT t1.student_id FROM Students AS t1 WHERE t1.student_id NOT IN ( SELECT t6.student_id FROM Achievements AS t6 ) )
SELECT t2.id, t1.name FROM Renting_history AS t4 JOIN Discount AS t2 ON t4.discount_id = t2.id JOIN Customers AS t1 ON t4.customer_id = t1.id GROUP BY t2.id, t1.name ORDER BY COUNT(*) ASC LIMIT 1
SELECT t4.detention_type_code, t4.detention_type_description FROM Detention AS t5 JOIN Ref_Detention_Type AS t4 ON t5.detention_type_code = t4.detention_type_code GROUP BY t4.detention_type_code, t4.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Student_Loans.other_details, Student_Loans.amount_of_loan FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Teachers.teacher_details FROM Transcripts JOIN Students_Addresses ON Students_Addresses.student_id = Transcripts.student_id JOIN Teachers ON Teachers.teacher_id = Students_Addresses.address_id WHERE Transcripts.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 )
SELECT DISTINCT Teachers.teacher_details FROM Transcripts JOIN Students_Addresses ON Students_Addresses.student_id = Transcripts.student_id JOIN Teachers ON Teachers.teacher_id = Students_Addresses.address_id WHERE Transcripts.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 )
SELECT Students_Addresses.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Students_Addresses.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.address_id, t2.address_details FROM Customers AS t3 JOIN Addresses AS t2 ON t3.customer_id = t2.address_id GROUP BY t2.address_id, t2.address_details ORDER BY COUNT(*) DESC LIMIT 1
