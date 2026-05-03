SELECT COUNT(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != "Nike"
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Club_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT P.product_id) FROM Products AS P JOIN Shipments AS S ON P.product_id = S.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(CAST(ERP_kW AS REAL)) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING count(*) > 3
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT count(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Assessments AS T1 WHERE T1.Assessment = "Normal"
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Assessments AS T1 WHERE T1.Assessment = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers WHERE Comments IS NOT NULL
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT * FROM Students
SELECT * FROM Students
SELECT COUNT(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT count(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT avg(product_price) FROM Products WHERE product_type_code = "Clothes"
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = "hardware"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT DISTINCT c.Name FROM club AS c JOIN player AS p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT p.Name FROM player AS p JOIN club AS c ON p.Club_ID = c.Club_ID WHERE c.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = "Sam Allardyce"
SELECT Manufacturer, count(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) as club_count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) AS number_of_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.product_id) AS product_count FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT O.order_id, O.date_order_placed FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.date_order_placed HAVING COUNT(OI.order_item_id) >= 2
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING count(*) >= 2
SELECT T1.gender_code, count(T2.order_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT customer_id, COUNT(order_id) as order_count FROM Orders GROUP BY customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers AS c JOIN Customer_Payment_Methods AS cpm ON c.customer_id = cpm.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers c JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT DISTINCT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT DISTINCT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id WHERE oi.order_item_status_code IS NOT NULL AND s.shipment_tracking_number IS NOT NULL
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE county = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE county = 'United States'
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_item_id) > 3
SELECT P.product_id, P.product_description FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(*) > 3
SELECT DISTINCT T1.invoice_number, T1.invoice_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number, T1.invoice_date HAVING COUNT(T2.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number, Invoices.invoice_date HAVING COUNT(Shipments.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT c.Name, c.Internet FROM channel c WHERE c.Channel_ID IN (SELECT Channel_ID FROM program GROUP BY Channel_ID HAVING count(*) > 1)
SELECT channel.Name, COUNT(program.Program_ID) as number_of_programs FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Transmitter FROM radio WHERE CAST(ERP_kW AS REAL) > 150 OR CAST(ERP_kW AS REAL) < 30
SELECT Transmitter FROM radio ORDER BY CAST(ERP_kW AS REAL) DESC LIMIT 1
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT radio.Transmitter, city_channel.City FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT T2.Transmitter, COUNT(T1.City_channel_ID) AS num_city_channels FROM city_channel_radio AS T1 JOIN radio AS T2 ON T1.Radio_ID = T2.Radio_ID GROUP BY T2.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = "1996"
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT d.Driver_ID) FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = '2012'
SELECT COUNT(DISTINCT T2.Driver_ID) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Build_Year = '2012'
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Racing_Series
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) as count FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) as answer_count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY answer_count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT DISTINCT t1.Email_Adress, t3.Date_of_Answer FROM Students AS t1 JOIN Student_Answers AS t3 ON t1.Student_ID = t3.Student_ID ORDER BY t3.Date_of_Answer DESC
SELECT T2.Email_Adress, T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T1.Date_of_Answer DESC
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2)
SELECT S.First_Name FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID GROUP BY S.Student_ID HAVING COUNT(*) >= 2
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT c.Name FROM club AS c JOIN player AS p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID ORDER BY AVG(p.Earnings) DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT DISTINCT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT DISTINCT O.date_order_placed FROM Orders AS O WHERE O.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR O.order_id IN ( SELECT O2.order_id FROM Orders AS O2 JOIN Order_Items AS OI ON O2.order_id = OI.order_id GROUP BY O2.order_id HAVING COUNT(*) > 1 )
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) UNION SELECT o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id HAVING COUNT(oi.order_item_id) > 1
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(DISTINCT OI.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.gender_code, COUNT(p.product_id) AS number_of_products FROM Customers c JOIN Products p ON c.customer_id = p.product_id GROUP BY c.gender_code
SELECT 'Unable to determine - gender information not available in schema' AS result
SELECT DISTINCT p.product_name, s.shipment_date FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id
SELECT DISTINCT p.product_name, s.shipment_date FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id ORDER BY s.shipment_date
SELECT DISTINCT P.product_name, P.product_color FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id
SELECT DISTINCT T1.product_name, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id = T3.order_item_id
SELECT DISTINCT i.invoice_status_code FROM Invoices i WHERE i.invoice_number NOT IN ( SELECT DISTINCT invoice_number FROM Shipments WHERE invoice_number IS NOT NULL )
SELECT DISTINCT i.invoice_status_code FROM Invoices AS i JOIN Shipments AS s ON i.invoice_number = s.invoice_number WHERE s.shipment_id NOT IN (SELECT shipment_id FROM Shipment_Items)
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) as total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_amount_paid FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT product_name FROM Products
SELECT 'No buyers table available' AS first_name, product_name AS product FROM Products WHERE 1=0
SELECT O.date_order_placed FROM Orders AS O JOIN Customers AS C ON O.customer_id = C.customer_id WHERE C.customer_id IN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING count(*) >= 2 )
SELECT o.date_order_placed FROM Orders o WHERE o.customer_id IN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) >= 2 )
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT DISTINCT c.Channel_ID, c.Name FROM channel AS c WHERE c.Channel_ID NOT IN ( SELECT da.Channel_ID FROM director_admin AS da JOIN director AS d ON da.Director_ID = d.Director_ID WHERE d.Name = 'Hank Baskett' )
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY count(*) DESC LIMIT 1
SELECT r.Transmitter, cc.Station_name FROM radio AS r JOIN city_channel_radio AS ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel AS cc ON ccr.City_channel_ID = cc.ID ORDER BY r.ERP_kW DESC
SELECT DISTINCT T1.Transmitter FROM radio AS T1 WHERE T1.Radio_ID NOT IN (SELECT T2.Radio_ID FROM city_channel_radio AS T2)
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT COUNT(Vehicle_ID) AS max_vehicles, Driver_ID FROM vehicle_driver GROUP BY Driver_ID ORDER BY COUNT(Vehicle_ID) DESC LIMIT 1
SELECT Driver_ID, count(*) as vehicle_count FROM vehicle_driver GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT DISTINCT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2 ) OR v.Builder = 'Ziyang'
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2 ) OR v.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers WHERE Valid_Answer_ID IN (SELECT Valid_Answer_ID FROM Student_Assessments GROUP BY Valid_Answer_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT DISTINCT sa.Student_Answer_Text FROM Student_Answers sa WHERE sa.Comments = 'Normal' AND EXISTS ( SELECT 1 FROM Student_Answers sa2 WHERE sa2.Student_ID = sa.Student_ID AND sa2.Comments = 'Absent' )
SELECT DISTINCT sa.Student_Answer_Text FROM Student_Answers sa WHERE sa.Comments = 'Normal' AND sa.Student_ID IN ( SELECT Student_ID FROM Student_Answers WHERE Comments = 'Absent' ) AND sa.Student_ID IN ( SELECT Student_ID FROM Student_Answers WHERE Comments = 'Normal' )
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1)
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT DISTINCT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c WHERE c.customer_id IN ( SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(order_id) > 2 ) AND c.customer_id IN ( SELECT o.customer_id FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.customer_id HAVING COUNT(oi.order_item_id) >= 3 )
SELECT DISTINCT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id, T1.customer_first_name, T1.customer_last_name HAVING COUNT(DISTINCT T2.order_id) > 2 AND COUNT(T3.order_item_id) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_last_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders)
SELECT DISTINCT P.product_id, P.product_name, P.product_price, P.product_color FROM Products AS P LEFT JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id, P.product_name, P.product_price, P.product_color HAVING COUNT(OI.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price, COUNT(*) as frequency FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY frequency DESC LIMIT 1
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orders.order_id, SUM(Products.product_price) AS price_sum FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY price_sum ASC LIMIT 1
SELECT Orders.order_id, COUNT(Order_Items.order_item_id) as item_count FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id ORDER BY item_count ASC LIMIT 1
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'F'
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Customers AS T2 WHERE T2.gender_code = 'F'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT product_id) FROM Products
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id WHERE cpm.customer_id IS NULL
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Payment_Methods)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT c.email_address, c.town_city, c.county FROM Customers c WHERE c.gender_code = ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT max(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY count(*) DESC LIMIT 1
SELECT d.Name, d.Age FROM director d WHERE d.Director_ID = (SELECT Director_ID FROM program GROUP BY Director_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT DISTINCT Channel_ID FROM program)
SELECT c.Name, c.Internet FROM channel c WHERE c.Channel_ID = ( SELECT Channel_ID FROM program GROUP BY Channel_ID ORDER BY COUNT(DISTINCT Director_ID) DESC LIMIT 1 )
SELECT DISTINCT c.Name FROM channel c WHERE c.Channel_ID IN ( SELECT Channel_ID FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age < 40 ) AND c.Channel_ID IN ( SELECT Channel_ID FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age > 60 )
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' OR v.Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) > 2 )
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE v.Vehicle_ID IN ( SELECT vd2.Vehicle_ID FROM vehicle_driver vd2 GROUP BY vd2.Vehicle_ID HAVING COUNT(DISTINCT vd2.Driver_ID) > 2 ) OR d.Name = 'Jeff Gordon'
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c WHERE c.customer_id = (SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY count(*) DESC LIMIT 1)
SELECT t1.customer_id, t1.customer_name, t1.customer_phone, t1.customer_email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t1.customer_id = t2.customer_id GROUP BY t1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Customer_Orders)
SELECT DISTINCT co.order_date, co.order_id FROM Customer_Orders co JOIN Order_Items oi ON co.order_id = oi.order_id WHERE CAST(oi.order_quantity AS INTEGER) > 6 OR co.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3 )
SELECT DISTINCT co.order_id, co.order_date FROM Customer_Orders co JOIN Order_Items oi ON co.order_id = oi.order_id WHERE CAST(oi.order_quantity AS INTEGER) > 6 OR co.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3 )
SELECT t2.Capital FROM building AS t1 JOIN region AS t2 ON t1.Region_ID = t2.Region_ID GROUP BY t1.Region_ID ORDER BY count(*) DESC LIMIT 1
SELECT r.Capital FROM region AS r JOIN building AS b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(b.Building_ID) DESC LIMIT 1
SELECT C.Customer_Details FROM Customers AS C JOIN Customers_and_Services AS CS ON C.Customer_ID = CS.Customer_ID GROUP BY C.Customer_ID ORDER BY COUNT(CS.Customers_and_Services_ID) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cas ON c.Customer_ID = cas.Customer_ID GROUP BY c.Customer_ID ORDER BY COUNT(DISTINCT cas.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY count(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customers_and_Services cas ON c.Customer_ID = cas.Customer_ID JOIN Services s ON cas.Service_ID = s.Service_ID WHERE s.Service_ID = ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID JOIN Services s ON cs.Service_ID = s.Service_ID WHERE s.Service_ID = ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT S.Service_Details FROM Services AS S WHERE S.Service_ID IN ( SELECT CS.Service_ID FROM Customers_and_Services AS CS JOIN Customers AS C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details LIKE '%Hardy Kutch%' ) OR S.Service_ID IN ( SELECT CI.Service_ID FROM Customer_Interactions AS CI WHERE CI.Status_Code = 'good' )
SELECT DISTINCT S.Service_Details FROM Services AS S WHERE S.Service_ID IN ( SELECT CS.Service_ID FROM Customers_and_Services AS CS JOIN Customers AS C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details LIKE '%Hardy Kutch%' ) OR S.Service_ID IN ( SELECT CI.Service_ID FROM Customer_Interactions AS CI WHERE CI.Status_Code = 'good' )
SELECT DISTINCT S.Service_Details FROM Services S JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID JOIN Customers C ON CI.Customer_ID = C.Customer_ID WHERE C.Customer_Details LIKE '%Hardy Kutch%' AND CI.Status_Code = 'bad'
SELECT DISTINCT s.Service_Details FROM Services s JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID JOIN Customers c ON cs.Customer_ID = c.Customer_ID JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID AND c.Customer_ID = ci.Customer_ID WHERE c.Customer_Details LIKE '%Hardy Kutch%' AND ci.Status_Code = 'bad'
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT V.name, V.Model_year FROM Vehicles AS V JOIN Renting_history AS R ON V.id = R.vehicles_id GROUP BY V.id ORDER BY COUNT(R.id) DESC LIMIT 1
SELECT v.name, v.Model_year FROM Vehicles v JOIN Renting_history rh ON v.id = rh.vehicles_id GROUP BY v.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.name FROM Discount AS D JOIN Renting_history AS R ON D.id = R.discount_id GROUP BY D.id, D.name ORDER BY COUNT(R.id) DESC LIMIT 1
SELECT DISTINCT s.student_id, s.bio_data FROM Students s WHERE s.student_id IN ( SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2 ) OR s.student_id IN ( SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2 )
SELECT DISTINCT S.student_id, S.bio_data FROM Students S WHERE S.student_id IN ( SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2 ) OR S.student_id IN ( SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2 )
SELECT DISTINCT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T1.teacher_id NOT IN ( SELECT DISTINCT T3.teacher_id FROM Classes AS T3 WHERE T3.class_details LIKE 'net%' )
SELECT DISTINCT t.teacher_details FROM Teachers t WHERE t.teacher_id IN ( SELECT c.teacher_id FROM Classes c WHERE c.class_details LIKE '%data%' ) AND t.teacher_id NOT IN ( SELECT c.teacher_id FROM Classes c WHERE c.class_details LIKE 'net%' )
SELECT T2.amount_of_loan, T2.date_of_loan FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id WHERE T1.student_id IN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 )
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans sl WHERE sl.student_id IN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 )
SELECT t.teacher_id, t.teacher_details FROM Teachers AS t JOIN Classes AS c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id ORDER BY COUNT(c.class_id) DESC LIMIT 1
SELECT T1.teacher_id, T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(T2.class_id) DESC LIMIT 1
SELECT DISTINCT s.bio_data, s.student_details FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id WHERE bm.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 ) AND bm.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT DISTINCT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring BM ON S.student_id = BM.student_id WHERE S.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) ) AND S.student_id IN ( SELECT student_id FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 )
SELECT s.bio_data FROM Students s WHERE s.student_id IN ( SELECT bm.student_id FROM Behaviour_Monitoring bm GROUP BY bm.student_id HAVING COUNT(DISTINCT bm.behaviour_monitoring_details) = 1 AND bm.behaviour_monitoring_details = ( SELECT bm2.behaviour_monitoring_details FROM Behaviour_Monitoring bm2 GROUP BY bm2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) )
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id WHERE T2.behaviour_monitoring_details = (SELECT T3.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3 GROUP BY T3.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT COUNT(DISTINCT T1.student_id) AS number, T1.event_type_code, T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY COUNT(DISTINCT T1.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.student_id) AS number_of_students, T2.event_type_code, T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY COUNT(DISTINCT T1.student_id) DESC LIMIT 1
SELECT 0
SELECT COUNT(DISTINCT t1.teacher_id) FROM Teachers AS t1 JOIN Classes AS t2 ON t1.teacher_id = t2.teacher_id WHERE t2.student_id IN (SELECT s.student_id FROM Students AS s EXCEPT SELECT a.student_id FROM Achievements AS a)
SELECT t1.detention_type_code, t1.detention_type_description FROM Ref_Detention_Type AS t1 WHERE t1.detention_type_code = (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY count(*) ASC LIMIT 1)
SELECT t1.detention_type_code, t1.detention_type_description FROM Ref_Detention_Type AS t1 WHERE t1.detention_type_code = (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) LIMIT 1)
SELECT s.bio_data, s.student_details FROM Students s WHERE s.student_id IN ( SELECT sl.student_id FROM Student_Loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans) )
SELECT DISTINCT s.bio_data, s.student_details FROM Students s JOIN Student_Loans sl ON s.student_id = sl.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 )
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 )
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types JOIN Students_Addresses ON Ref_Address_Types.address_type_code = Students_Addresses.address_type_code GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types JOIN Students_Addresses ON Ref_Address_Types.address_type_code = Students_Addresses.address_type_code GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
