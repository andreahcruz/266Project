SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Captain FROM club ORDER BY Captain ASC
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Name != 'Nike'
SELECT DISTINCT club.Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE club.Club_ID NOT IN ( SELECT DISTINCT player.Club_ID FROM player WHERE player.Name = 'Nike' )
SELECT player.Name FROM player ORDER BY player.Wins_count ASC
SELECT player.Earnings FROM player ORDER BY player.Wins_count ASC
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Earnings > 1200000
SELECT player.Manufacturer FROM player GROUP BY player.Manufacturer HAVING COUNT(DISTINCT player.Captain) > 1
SELECT Manufacturer FROM player GROUP BY Manufacturer HAVING COUNT(DISTINCT Club_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name HAVING COUNT(player.Player_ID) > 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT shipment_tracking_number) FROM Shipments
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
SELECT radio.Transmitter FROM radio ORDER BY radio.ERP_kW ASC
SELECT DISTINCT city_channel.Station_name FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel.Affiliation != 'ABC'
SELECT AVG(CAST(ERP_kW AS REAL)) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT ID) > 3
SELECT driver.Racing_Series FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Citizenship = 'United States'
SELECT COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE Racing_Series = 'NASCAR') ``` Wait, let me reconsider the schema structure. The hint says "drivers raced" maps to Racing_Series, which should be in the drivers table (driver). Let me correct this: ```sql SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver WHERE driver.Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID ORDER BY driver.Name ASC
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID ORDER BY driver.Name ASC
SELECT count(*) FROM Exams
SELECT COUNT(*) FROM Exams
SELECT DISTINCT Exam_ID FROM Exams ORDER BY Exam_ID ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers WHERE Student_Answers.Student_Answer_Text = "Normal" ``` Wait, let me reconsider. The question asks for "student answer texts that received comments 'Normal'". The hint says Student_Answer_Text is for "distinct student answer texts" and Student_Answers is the "student answer" table. But I need to check if "Normal" is a comment field. Looking at Student_Answers columns: Student_Answer_Text appears to be the answer text itself. I need to find where comments are stored. Student_Assessments has Student_Answer_Text, Satisfactory_YN, Assessment which could be comment fields. Let me trace: Student_Assessments references Valid_Answers (Valid_Answer_ID -> Valid_Answers.Valid_Answer_ID), and Valid_Answers references Questions. Student_Answers references Questions_in_Exams, and Questions_in_Exams references Questions. So Student_Answers and Valid_Answers both connect through Questions. Actually, looking more carefully: Student_Answers.Student_Answer_Text is the student answer text. I need to find comments "Normal" - this could be in Student_Assessments.Student_Answer_Text, Satisfactory_YN, or Assessment. Student_Assessments connects to Valid_Answers, and Valid_Answers connects to Questions. Student_Answers also connects to Questions through Questions_in_Exams. ```sql SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID JOIN Valid_Answers ON Valid_Answers.Question_ID = Questions.Question_ID JOIN Student_Assessments ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID WHERE Student_Assessments.Student_Answer_Text = "Normal" OR Student_Assessments.Satisfactory_YN = "Normal" OR Student_Assessments.Assessment = "Normal"
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Question_Text = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Questions.Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Questions.Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Questions.Question_Text FROM Questions WHERE Questions.Question_ID IN ( SELECT Questions_in_Exams.Question_ID FROM Questions_in_Exams GROUP BY Questions_in_Exams.Question_ID HAVING COUNT(*) >= 3 )
SELECT * FROM Student_Assessments
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Student_Assessments.Assessment FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID JOIN Student_Assessments ON Student_Answers.Exam_ID = Student_Assessments.Valid_Answer_ID
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_name) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT Manager, Captain FROM club
SELECT club.Manager, club.Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Captain FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT DISTINCT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID WHERE player.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Captain = 'Sam Allardyce'
SELECT player.Name, COUNT(*) FROM player GROUP BY player.Name
SELECT Manufacturer, COUNT(*) FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY Manufacturer
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Name = "Australia" OR club.Name = "Zimbabwe"
SELECT player.Earnings FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Country IN ('Australia', 'Zimbabwe')
SELECT Orders.order_id, Orders.order_status_code, COUNT(*) as number FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, COUNT(*) AS product_count, Orders.order_status_code FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT Orders.order_id, Orders.date_order_placed FROM Orders WHERE Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(*) >= 2 )
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT Customers.gender_code, COUNT(*) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Order_Items.product_id, COUNT(*) FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Order_Items.product_id
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Customers.customer_first_name, Customers.gender_code, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT Invoices.invoice_status_code, Orders.date_order_placed, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT DISTINCT Orders.order_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number JOIN Orders ON Shipments.order_id = Orders.order_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT Customers.customer_last_name, Customers.login_password FROM Customers WHERE Customers.phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city FROM Customers WHERE customer_first_name = 'USA'
SELECT email_address, town_city, county FROM Customers WHERE customer_first_name = 'United States'
SELECT Products.product_id, Products.product_description FROM Products WHERE Products.product_name > 3
SELECT Products.product_id, Products.product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id GROUP BY Products.product_id, Products.product_description HAVING COUNT(Orders.order_id) > 3
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number, Invoices.invoice_date HAVING COUNT(Shipments.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices WHERE Invoices.invoice_number IN ( SELECT Shipments.invoice_number FROM Shipments GROUP BY Shipments.invoice_number HAVING COUNT(*) >= 2 )
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Orders.order_id, Orders.date_order_placed, Shipments.shipment_tracking_number, Shipments.shipment_date FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id
SELECT Name FROM director JOIN director_admin ON director.Director_ID = director_admin.Director_ID ORDER BY director_admin.Is_first_director DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program ORDER BY Program_ID DESC LIMIT 1
SELECT channel.Internet, channel.Digital_terrestrial_channel FROM channel WHERE channel.Channel_ID IN ( SELECT program.Channel_ID FROM program GROUP BY program.Channel_ID HAVING COUNT(*) > 1 )
SELECT channel.Name, COUNT(program.Program_ID) FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT radio.Transmitter FROM radio WHERE radio.ERP_kW > 150 OR radio.ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT city_channel_radio.Is_online, COUNT(*) AS number_of_channels FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID GROUP BY city_channel_radio.Is_online
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT radio.Transmitter, city_channel.City FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT radio.Transmitter, COUNT(city_channel.City) AS number_of_city_channels FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID GROUP BY radio.Transmitter
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Model = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Build_Year = '1996'
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT vehicle.Build_Year, vehicle.Model, driver.Name FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012'
SELECT COUNT(DISTINCT driver.Driver_ID) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Build_Year = '2012'
SELECT DISTINCT vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Top_Speed > 150 OR vehicle.Total_Production > 100
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT vehicle.Model, vehicle.Build_Year FROM vehicle WHERE vehicle.Model LIKE '%DJ%'
SELECT vehicle.Model, COUNT(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Model
SELECT vehicle.Vehicle_ID, COUNT(*) FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY vehicle.Vehicle_ID
SELECT Exams.Exam_Name, Exams.Exam_Date FROM Exams WHERE Exams.Exam_ID NOT IN (SELECT Questions.Question_ID FROM Questions WHERE Questions.Type_of_Question_Code = "Database")
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Question_Text, Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Question_Text, Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) AS count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) AS frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(Student_Answers.Student_Answer_ID) >= 2
SELECT Students.First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(*) >= 2
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT player.Country FROM player WHERE player.Wins_count > 2 ORDER BY player.Earnings DESC LIMIT 1
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Captain ORDER BY AVG(player.Earnings) DESC
SELECT club.Captain FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Captain ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT player.Name FROM player GROUP BY player.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT club.Name FROM club WHERE club.Club_ID NOT IN ( SELECT player.Club_ID FROM player )
SELECT t1.Name FROM club AS t1 LEFT JOIN player AS t2 ON t2.Club_ID = t1.Club_ID WHERE t2.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name HAVING SUM(CASE WHEN player.Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN player.Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT Orders.date_order_placed FROM Orders LEFT JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(Order_Items.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(Order_Items.order_item_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customer_Payment_Methods.payment_method_code FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.payment_method_code ORDER BY COUNT(DISTINCT Customer_Payment_Methods.customer_id) DESC LIMIT 1
SELECT t2.gender_code, COUNT(*) AS number_of_products FROM Products AS t1 JOIN Customers AS t2 ON t1.product_id = t2.customer_id GROUP BY t2.gender_code
SELECT product_size, COUNT(*) AS product_count FROM Products GROUP BY product_size
SELECT Products.product_name, Shipments.shipment_date FROM Shipments JOIN Orders ON Shipments.order_id = Orders.order_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT DISTINCT t1.product_name, t4.shipment_date FROM Products AS t1 JOIN Order_Items AS t3 ON t3.product_id = t1.product_id JOIN Shipment_Items AS t5 ON t5.order_item_id = t3.order_item_id JOIN Shipments AS t4 ON t4.shipment_id = t5.shipment_id
SELECT DISTINCT Products.product_name, Products.product_color FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id WHERE Shipments.shipment_date IS NOT NULL
SELECT DISTINCT Products.product_color FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id JOIN Shipment_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Shipments ON Shipments.shipment_id = Shipment_Items.shipment_id
SELECT DISTINCT Invoices.invoice_status_code FROM Orders JOIN Shipments ON Orders.order_id = Shipments.order_id JOIN Invoices ON Shipments.invoice_number = Invoices.invoice_number WHERE Shipments.shipment_date IS NULL
SELECT DISTINCT Invoices.invoice_status_code FROM Orders JOIN Invoices ON Orders.customer_id = Invoices.invoice_number LEFT JOIN Shipments ON Shipments.order_id = Orders.order_id WHERE Shipments.shipment_id IS NULL
SELECT order_id, date_order_placed, SUM(parent_product_id) AS total_cost FROM Orders JOIN Order_Items ON Order_Items.order_id = Orders.order_id JOIN Products ON Products.product_id = Order_Items.product_id GROUP BY order_id, date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, SUM(Invoices.customer_id) AS total_amount_paid FROM Orders JOIN Shipments ON Shipments.order_id = Orders.order_id JOIN Invoices ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Products.product_color, Products.product_name FROM Products
SELECT Products.product_color, Products.product_name FROM Products
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 )
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.customer_id IN ( SELECT Customer_Payment_Methods.customer_id FROM Customer_Payment_Methods GROUP BY Customer_Payment_Methods.customer_id HAVING COUNT(*) >= 2 )
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT channel.Channel_ID, channel.Name FROM channel WHERE channel.Digital_terrestrial_channel <> 'Hank Baskett' OR channel.Digital_terrestrial_channel IS NULL
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT radio.Transmitter, radio.2FM_MHz, city_channel.Station_name FROM city_channel_radio JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID ORDER BY radio.ERP_kW DESC
SELECT DISTINCT radio.Transmitter FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID LEFT JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID WHERE city_channel.ID IS NULL
SELECT vehicle.Model FROM vehicle WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT vehicle.Model FROM vehicle WHERE vehicle.Power > 6000 ORDER BY vehicle.Top_Speed DESC LIMIT 1
SELECT COUNT(*) AS vehicles_count, t3.Driver_ID FROM vehicle_driver AS t3 GROUP BY t3.Driver_ID ORDER BY vehicles_count DESC LIMIT 1
SELECT vehicle_driver.Driver_ID, COUNT(*) AS vehicle_count FROM vehicle_driver GROUP BY vehicle_driver.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID ORDER BY CAST(vehicle.Total_Production AS REAL) ASC LIMIT 1
SELECT vehicle.Vehicle_ID FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT DISTINCT driver.Racing_Series FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Power > 5000
SELECT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver )
SELECT DISTINCT vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID NOT IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver )
SELECT t1.Vehicle_ID, t1.Model FROM vehicle AS t1 WHERE t1.Vehicle_ID IN ( SELECT t3.Vehicle_ID FROM vehicle_driver AS t3 GROUP BY t3.Vehicle_ID HAVING COUNT(DISTINCT t3.Driver_ID) = 2 ) OR t1.Vehicle_ID IN ( SELECT t3.Vehicle_ID FROM vehicle_driver AS t3 JOIN driver AS t2 ON t3.Driver_ID = t2.Driver_ID WHERE t2.Name = 'Ziyang' )
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN ( SELECT vehicle_driver.Vehicle_ID FROM vehicle_driver GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 ) OR vehicle.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON vehicle_driver.Driver_ID = driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT DISTINCT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Exam_ID LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Exam_ID LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Students.First_Name FROM Students LEFT JOIN Student_Answers ON Student_Answers.Student_ID = Students.Student_ID WHERE Student_Answers.Student_Answer_ID IS NULL
SELECT Student_Assessments.Student_Answer_Text FROM Student_Assessments JOIN Student_Answers ON Student_Answers.Exam_ID = Student_Assessments.Valid_Answer_ID GROUP BY Student_Assessments.Student_Answer_Text HAVING SUM(CASE WHEN Student_Answers.Student_Answer_Text = 'Normal' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Student_Answers.Student_Answer_Text = 'Absent' THEN 1 ELSE 0 END) > 0
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_price = (SELECT MAX(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_type_code FROM Products WHERE product_name = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY SUM(product_price) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_id FROM Customers GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name, customer_id FROM Customers WHERE customer_id IN ( SELECT customer_id FROM Customers GROUP BY customer_id HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY customer_id ) ) )
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_name) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT Products.product_name FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id WHERE Order_Items.product_id IS NULL
SELECT Customers.customer_id, Customers.customer_first_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.customer_first_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(DISTINCT Order_Items.order_item_id) >= 3
SELECT Customers.customer_id, Customers.customer_last_name FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Orders.order_id GROUP BY Customers.customer_id, Customers.customer_last_name HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT gender_code, customer_middle_initial, customer_first_name FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders )
SELECT Customers.customer_middle_initial, Customers.customer_last_name FROM Customers LEFT JOIN Orders ON Orders.customer_id = Customers.customer_id WHERE Orders.order_id IS NULL
SELECT Products.product_id, Products.product_name, Products.product_price, Products.product_color FROM Products LEFT JOIN Order_Items ON Order_Items.product_id = Products.product_id LEFT JOIN Orders ON Orders.order_id = Order_Items.order_id GROUP BY Products.product_id, Products.product_name, Products.product_price, Products.product_color HAVING COUNT(Orders.order_id) < 2
SELECT Products.product_id, Products.product_name, Products.product_price FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Order_Items.product_id = Products.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price HAVING COUNT(*) = ( SELECT MAX(order_count) FROM ( SELECT COUNT(*) AS order_count FROM Order_Items GROUP BY product_id ) )
SELECT Orders.order_id, SUM(Products.product_price) AS sum_product_prices FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT date_order_placed, order_status_code FROM Orders ORDER BY order_status_code ASC LIMIT 1
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products JOIN Customers ON Products.product_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_name) FROM Products WHERE product_name IS NULL
SELECT COUNT(*) FROM Products AS Products LEFT JOIN Order_Items AS Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_item_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Payment_Methods AS t2 ON t2.customer_id = t1.customer_id WHERE t2.payment_method_code IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code IN ( SELECT gender_code FROM Customers GROUP BY gender_code HAVING COUNT(*) = ( SELECT MIN(gender_cnt) FROM ( SELECT COUNT(*) AS gender_cnt FROM Customers GROUP BY gender_code ) ) )
SELECT Customers.email_address, Customers.town_city, Customers.county FROM Customers WHERE Customers.gender_code = ( SELECT Customers.gender_code FROM Customers JOIN Orders ON Orders.customer_id = Customers.customer_id GROUP BY Customers.gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT director.Name, director.Age FROM director JOIN program ON program.Director_ID = director.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE channel.Channel_ID NOT IN ( SELECT program.Channel_ID FROM program WHERE program.Channel_ID IS NOT NULL )
SELECT channel.Name, channel.Internet FROM channel JOIN director_admin ON director_admin.Channel_ID = channel.Channel_ID GROUP BY channel.Channel_ID ORDER BY COUNT(DISTINCT director_admin.Director_ID) DESC LIMIT 1
SELECT channel.Name FROM channel JOIN program ON program.Channel_ID = channel.Channel_ID JOIN director ON program.Director_ID = director.Director_ID GROUP BY channel.Channel_ID, channel.Name HAVING SUM(CASE WHEN director.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN director.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID JOIN driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY vehicle.Vehicle_ID, vehicle.Model HAVING COUNT(DISTINCT driver.Driver_ID) > 2 OR SUM(CASE WHEN driver.Racing_Series = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN ( SELECT Driver_ID FROM vehicle_driver )
SELECT COUNT(*) FROM driver AS driver LEFT JOIN vehicle_driver AS vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware' )
SELECT product_type_code FROM Products WHERE product_name = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_name = 'Hardware' )
SELECT Customers.customer_id, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Customers.customer_id, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email ORDER BY COUNT(Customer_Orders.order_id) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS t1 LEFT JOIN Customer_Orders AS t2 ON t2.customer_id = t1.customer_id LEFT JOIN Order_Items AS t3 ON t3.order_id = t2.order_id WHERE t3.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customer_Orders.customer_id = Customers.customer_id LEFT JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id WHERE Order_Items.order_id IS NULL
SELECT DISTINCT Customer_Orders.order_date, Customer_Orders.order_id FROM Customer_Orders JOIN Order_Items ON Order_Items.order_id = Customer_Orders.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_price > 6 OR Customer_Orders.order_id IN ( SELECT Order_Items.order_id FROM Order_Items GROUP BY Order_Items.order_id HAVING COUNT(DISTINCT Order_Items.product_id) > 3 )
SELECT DISTINCT Order_Items.order_id, Customer_Orders.order_date FROM Order_Items JOIN Customer_Orders ON Order_Items.order_id = Customer_Orders.order_id GROUP BY Order_Items.order_id, Customer_Orders.order_date HAVING MAX(CAST(Order_Items.order_quantity AS REAL)) > 6 OR COUNT(DISTINCT Order_Items.product_id) > 3
SELECT region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT region.Area, region.Capital FROM region JOIN building ON building.Region_ID = region.Region_ID GROUP BY region.Region_ID, region.Area, region.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(Customers_and_Services.Customers_and_Services_Details) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(DISTINCT Customers_and_Services.Service_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID GROUP BY Customers.Customer_ID, Customers.Customer_Details ORDER BY COUNT(DISTINCT Customers_and_Services.Service_ID) DESC LIMIT 1
SELECT Customers.Customer_Details FROM Customers JOIN Customers_and_Services ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers_and_Services.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(service_usage_count) FROM ( SELECT COUNT(*) AS service_usage_count FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT Customers.Customer_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers_and_Services.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT Customers_and_Services.Service_ID FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' ) UNION SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT Customer_Interactions.Service_ID FROM Customer_Interactions WHERE Customer_Interactions.Status_Code = 'good' )
SELECT Services.Service_Details FROM Services JOIN Customers_and_Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' UNION SELECT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID WHERE Customer_Interactions.Services_and_Channels_Details = 'good'
SELECT DISTINCT Services.Service_Details FROM Services JOIN Customer_Interactions ON Customer_Interactions.Service_ID = Services.Service_ID JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Services.Service_Details FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Services ON Customers_and_Services.Service_ID = Services.Service_ID JOIN Customer_Interactions ON Customer_Interactions.Customer_ID = Customers.Customer_ID AND Customer_Interactions.Service_ID = Services.Service_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customer_Interactions.Status_Code = 'bad'
SELECT Notes, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Customers.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Renting_history JOIN Customers ON Renting_history.customer_id = Customers.id JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Vehicles.Notes, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Renting_history.vehicles_id ORDER BY SUM(Renting_history.total_hours) DESC LIMIT 1
SELECT Discount.name FROM Renting_history JOIN Discount ON Renting_history.discount_id = Discount.id GROUP BY Renting_history.discount_id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Renting_history.discount_id = Discount.id GROUP BY Discount.id, Discount.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(*) >= 2 ) AND Students.student_id IN ( SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(*) < 2 )
SELECT Students.student_details, Students.student_id FROM Students WHERE Students.student_id IN ( SELECT Classes.student_id FROM Classes GROUP BY Classes.student_id HAVING COUNT(*) >= 2 ) OR Students.student_id IN ( SELECT Detention.student_id FROM Detention GROUP BY Detention.student_id HAVING COUNT(*) < 2 )
SELECT DISTINCT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.class_details LIKE '%data%' AND Teachers.teacher_id NOT IN ( SELECT T3b.teacher_id FROM Classes AS T3b WHERE T3b.class_details LIKE 'net%' )
SELECT DISTINCT t2.teacher_details FROM Teachers AS t2 JOIN Classes AS t3 ON t3.teacher_id = t2.teacher_id WHERE t3.class_details LIKE '%data%' AND t2.teacher_id NOT IN ( SELECT t3b.teacher_id FROM Classes AS t3b WHERE t3b.class_details LIKE 'net%' )
SELECT Student_Loans.amount_of_loan , Student_Loans.date_of_loan FROM Student_Loans JOIN Students ON Student_Loans.student_id = Students.student_id JOIN Achievements ON Achievements.student_id = Students.student_id GROUP BY Students.student_id, Student_Loans.student_loan_id HAVING COUNT(Achievements.achievement_id) >= 2
SELECT Student_Loans.amount_of_loan, Student_Loans.date_of_loan FROM Student_Loans JOIN ( SELECT Achievements.student_id FROM Achievements GROUP BY Achievements.student_id HAVING COUNT(*) >= 2 ) AS A ON A.student_id = Student_Loans.student_id
SELECT t7.class_details, t7.teacher_id FROM Classes AS t7 GROUP BY t7.teacher_id, t7.class_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT Classes.teacher_id, Teachers.teacher_details FROM Classes JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id GROUP BY Classes.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Students.bio_data, Students.student_details, Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring JOIN Students ON Behaviour_Monitoring.student_id = Students.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) AND Behaviour_Monitoring.student_id IN (SELECT student_id FROM Behaviour_Monitoring GROUP BY student_id HAVING SUM(CASE WHEN behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) THEN 1 ELSE 0 END) > 0)
SELECT Students.bio_data, Student_Events.student_details FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id WHERE Students.student_id IN ( SELECT Behaviour_Monitoring.student_id FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.student_id HAVING SUM(CASE WHEN Behaviour_Monitoring.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Behaviour_Monitoring.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) THEN 1 ELSE 0 END) > 0 )
SELECT Student_Events.event_id, Student_Events.event_type_code, Student_Events.student_id, Student_Events.event_date, Student_Events.other_details FROM Students JOIN Student_Events ON Student_Events.student_id = Students.student_id JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan = ( SELECT amount_of_loan FROM Student_Loans GROUP BY amount_of_loan ORDER BY COUNT(*) DESC LIMIT 1 ) GROUP BY Students.student_id HAVING COUNT(*) = SUM(CASE WHEN Student_Loans.amount_of_loan = ( SELECT amount_of_loan FROM Student_Loans GROUP BY amount_of_loan ORDER BY COUNT(*) DESC LIMIT 1 ) THEN 1 ELSE 0 END)
SELECT Students.student_details FROM Students JOIN Behaviour_Monitoring ON Students.student_id = Behaviour_Monitoring.student_id WHERE Behaviour_Monitoring.behaviour_monitoring_details = ( SELECT Behaviour_Monitoring.behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY Behaviour_Monitoring.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(*) AS number, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS number_of_students, Ref_Event_Types.event_type_code AS event_type_code, Ref_Event_Types.event_type_description AS event_type_description FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT Students_Addresses.address_id) FROM Students_Addresses JOIN Students ON Students_Addresses.student_id = Students.student_id LEFT JOIN Achievements ON Achievements.student_id = Students.student_id WHERE Achievements.achievement_id IS NULL
SELECT COUNT(DISTINCT t5.teacher_id) FROM Classes AS t5 JOIN Students AS t1 ON t5.student_id = t1.student_id LEFT JOIN Achievements AS t6 ON t6.student_id = t1.student_id WHERE t6.achievement_id IS NULL
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type JOIN Detention ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description FROM Ref_Detention_Type JOIN Detention ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Ref_Detention_Type.detention_type_code, Ref_Detention_Type.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT Students.bio_data, Student_Loans.other_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT Students.bio_data, Students.student_details FROM Students JOIN Student_Loans ON Student_Loans.student_id = Students.student_id WHERE Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT Teachers.teacher_details FROM Transcripts JOIN Students_Addresses ON Students_Addresses.student_id = Transcripts.student_id JOIN Classes ON Classes.student_id = Transcripts.student_id JOIN Teachers ON Teachers.teacher_id = Classes.teacher_id WHERE Transcripts.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT Teachers.teacher_details FROM Teachers JOIN Classes ON Classes.teacher_id = Teachers.teacher_id WHERE Classes.student_id = ( SELECT Transcripts.student_id FROM Transcripts ORDER BY Transcripts.date_of_transcript ASC LIMIT 1 )
SELECT Students_Addresses.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Students_Addresses.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
