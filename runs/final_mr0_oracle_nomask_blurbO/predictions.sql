SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
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
SELECT COUNT(DISTINCT p.product_id) FROM Products p JOIN Shipments s ON p.product_id = s.order_id
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
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) > 3
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT count(DISTINCT T1.Driver_ID) FROM driver AS T1 WHERE T1.Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answer_Text FROM Student_Assessments WHERE Assessment = "Normal"
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Assessments AS T1 WHERE T1.Assessment = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers WHERE Comments IS NOT NULL
SELECT COUNT(DISTINCT Comments) FROM Student_Answers WHERE Comments IS NOT NULL
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M'
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT * FROM Students
SELECT * FROM Students
SELECT COUNT(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'hardware'
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
SELECT DISTINCT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = "Sam Allardyce"
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT Manufacturer, count(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(DISTINCT Club_ID) as club_count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) as number_of_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.product_id) AS product_count FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code ORDER BY Orders.order_id
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(oi.order_item_id) >= 2
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(oi.order_item_id) >= 2
SELECT C.gender_code, COUNT(O.order_id) AS number_of_orders FROM Customers AS C LEFT JOIN Orders AS O ON C.customer_id = O.customer_id GROUP BY C.gender_code
SELECT gender, COUNT(DISTINCT o.order_id) FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY gender ``` Since this table is not in the provided schema, I cannot write a valid query using only the available tables.
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers c JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers c LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT DISTINCT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number ORDER BY i.invoice_number
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
SELECT DISTINCT P.product_id, P.product_description FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id, P.product_description HAVING COUNT(OI.order_item_id) > 3
SELECT p.product_id, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_description HAVING COUNT(*) > 3
SELECT DISTINCT T1.invoice_number, T1.invoice_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number, T1.invoice_date HAVING COUNT(T2.shipment_id) >= 2
SELECT Invoices.invoice_number, Invoices.invoice_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number GROUP BY Invoices.invoice_number, Invoices.invoice_date HAVING COUNT(Shipments.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT c.Name, c.Internet FROM channel c WHERE c.Channel_ID IN ( SELECT Channel_ID FROM program GROUP BY Channel_ID HAVING COUNT(*) > 1 )
SELECT channel.Name, COUNT(program.Program_ID) as number_of_programs FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT DISTINCT Transmitter FROM radio WHERE CAST(ERP_kW AS REAL) > 150 OR CAST(ERP_kW AS REAL) < 30
SELECT Transmitter FROM radio ORDER BY CAST(ERP_kW AS REAL) DESC LIMIT 1
SELECT Affiliation, COUNT(*) as count FROM city_channel GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT radio.Transmitter, city_channel.City FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT T2.Transmitter, COUNT(T1.City_channel_ID) AS num_city_channels FROM city_channel_radio AS T1 JOIN radio AS T2 ON T1.Radio_ID = T2.Radio_ID GROUP BY T2.Transmitter
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT d.Driver_ID) FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = '2012'
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
SELECT s.First_Name, sa.Date_of_Answer FROM Student_Answers sa JOIN Students s ON sa.Student_ID = s.Student_ID
SELECT s.Email_Adress, sa.Date_of_Answer FROM Students AS s JOIN Student_Answers AS sa ON s.Student_ID = sa.Student_ID ORDER BY sa.Date_of_Answer DESC
SELECT S.Email_Adress, SA.Date_of_Answer FROM Student_Answers AS SA JOIN Students AS S ON SA.Student_ID = S.Student_ID ORDER BY SA.Date_of_Answer DESC
SELECT First_Name FROM Students WHERE Student_ID IN ( SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2 )
SELECT s.First_Name FROM Students s JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID GROUP BY s.Student_ID HAVING COUNT(sa.Student_Answer_ID) >= 2
SELECT Gender_MFU, COUNT(*) as number_of_students FROM Students GROUP BY Gender_MFU
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T2.Club_ID = T1.Club_ID GROUP BY T1.Club_ID, T1.Name ORDER BY AVG(T2.Earnings) DESC
SELECT c.Name FROM club AS c JOIN player AS p ON p.Club_ID = c.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY AVG(p.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Player_ID IS NULL
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING SUM(CASE WHEN Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT O.date_order_placed FROM Orders AS O LEFT JOIN Order_Items AS OI ON OI.order_id = O.order_id GROUP BY O.order_id, O.date_order_placed HAVING O.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(OI.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products AS P LEFT JOIN Order_Items AS OI ON OI.product_id = P.product_id GROUP BY P.product_id, P.product_name, P.product_price, P.product_color HAVING COUNT(DISTINCT OI.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT gender_code, COUNT(product_id) AS number_of_products FROM Customers CROSS JOIN Products GROUP BY gender_code
SELECT product_color AS gender, COUNT(*) AS products_bought FROM Products GROUP BY product_color
SELECT P.product_name, S.shipment_date FROM Shipment_Items AS SI JOIN Shipments AS S ON SI.shipment_id = S.shipment_id JOIN Order_Items AS OI ON SI.order_item_id = OI.order_item_id JOIN Products AS P ON OI.product_id = P.product_id
SELECT DISTINCT p.product_name, s.shipment_date FROM Shipments AS s JOIN Shipment_Items AS si ON si.shipment_id = s.shipment_id JOIN Order_Items AS oi ON oi.order_item_id = si.order_item_id JOIN Products AS p ON p.product_id = oi.product_id
SELECT DISTINCT P.product_name, P.product_color FROM Products AS P JOIN Order_Items AS OI ON OI.product_id = P.product_id JOIN Shipment_Items AS SI ON SI.order_item_id = OI.order_item_id JOIN Shipments AS S ON S.shipment_id = SI.shipment_id
SELECT DISTINCT P.product_name, P.product_color FROM Products AS P JOIN Order_Items AS OI ON OI.product_id = P.product_id JOIN Shipment_Items AS SI ON SI.order_item_id = OI.order_item_id JOIN Shipments AS S ON S.shipment_id = SI.shipment_id
SELECT DISTINCT I.invoice_status_code FROM Orders AS O JOIN Shipments AS S ON S.order_id = O.order_id JOIN Invoices AS I ON I.invoice_number = S.invoice_number WHERE O.order_id NOT IN (SELECT order_id FROM Shipments)
SELECT DISTINCT I.invoice_status_code FROM Orders AS O JOIN Shipments AS S ON S.order_id = O.order_id JOIN Invoices AS I ON I.invoice_number = S.invoice_number WHERE O.order_id NOT IN (SELECT order_id FROM Shipments)
SELECT O.order_id, O.date_order_placed, SUM(P.product_price) AS total_cost FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id GROUP BY O.order_id, O.date_order_placed
SELECT O.order_id, O.date_order_placed, COALESCE(SUM(P.product_price), 0) AS total_amount_paid FROM Orders AS O LEFT JOIN Order_Items AS OI ON OI.order_id = O.order_id LEFT JOIN Products AS P ON P.product_id = OI.product_id GROUP BY O.order_id, O.date_order_placed
SELECT product_name AS buyer_first_name, product_name FROM Products
SELECT product_name FROM Products
SELECT DISTINCT T2.date_order_placed FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T1.customer_id = T3.customer_id GROUP BY T2.order_id HAVING COUNT(DISTINCT T3.payment_method_code) >= 2
SELECT DISTINCT o.date_order_placed FROM Orders AS o JOIN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(DISTINCT payment_method_code) >= 2 ) AS cpm ON o.customer_id = cpm.customer_id
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Channel_ID, Name FROM channel WHERE Channel_ID NOT IN ( SELECT T1.Channel_ID FROM director_admin AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID WHERE T2.Name = 'Hank Baskett' )
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Transmitter, cc.Station_name FROM city_channel_radio AS ccr JOIN radio AS r ON ccr.Radio_ID = r.Radio_ID JOIN city_channel AS cc ON ccr.City_channel_ID = cc.ID ORDER BY CAST(r.ERP_kW AS REAL) DESC
SELECT DISTINCT T1.Transmitter FROM radio AS T1 LEFT JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID WHERE T2.City_channel_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT MAX(vehicle_count) AS max_vehicles_driven, Driver_ID FROM ( SELECT Driver_ID, COUNT(DISTINCT Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID ) WHERE vehicle_count = ( SELECT MAX(vehicle_count) FROM ( SELECT Driver_ID, COUNT(DISTINCT Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID ) )
SELECT T1.Driver_ID, COUNT(DISTINCT T1.Vehicle_ID) AS vehicle_count FROM vehicle_driver AS T1 GROUP BY T1.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT DISTINCT d.Name FROM driver AS d JOIN vehicle_driver AS vd ON vd.Driver_ID = d.Driver_ID JOIN vehicle AS v ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Power > 5000
SELECT v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IS NULL
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON vd.Vehicle_ID = v.Vehicle_ID GROUP BY v.Vehicle_ID, v.Model, v.Builder HAVING COUNT(DISTINCT vd.Driver_ID) = 2 OR v.Builder = 'Ziyang'
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' OR Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2 )
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON vd.Driver_ID = d.Driver_ID JOIN vehicle AS v ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT DISTINCT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE lower(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT t2.Assessment FROM Student_Answers AS t1 JOIN Student_Assessments AS t2 ON t1.Student_Answer_ID = t2.Student_Answer_ID GROUP BY t2.Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT va.Valid_Answer_Text FROM Student_Assessments AS sa JOIN Valid_Answers AS va ON sa.Valid_Answer_ID = va.Valid_Answer_ID GROUP BY va.Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.First_Name FROM Students AS s LEFT JOIN Student_Answers AS sa ON sa.Student_ID = s.Student_ID WHERE sa.Student_ID IS NULL
SELECT s.First_Name FROM Students AS s LEFT JOIN Student_Answers AS sa ON sa.Student_ID = s.Student_ID WHERE sa.Student_ID IS NULL
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text HAVING SUM(CASE WHEN Comments = 'Normal' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Comments = 'Absent' THEN 1 ELSE 0 END) > 0
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products EXCEPT SELECT P.product_name FROM Products AS P JOIN Order_Items AS OI ON OI.product_id = P.product_id
SELECT p.product_name FROM Products AS p LEFT JOIN Order_Items AS oi ON oi.product_id = p.product_id WHERE oi.product_id IS NULL
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id JOIN Order_Items AS oi ON oi.order_id = o.order_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers AS C JOIN Orders AS O ON O.customer_id = C.customer_id JOIN Order_Items AS OI ON OI.order_id = O.order_id GROUP BY C.customer_id, C.customer_first_name, C.customer_last_name HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(OI.order_item_id) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders )
SELECT customer_first_name, customer_last_name, customer_middle_initial FROM Customers AS C LEFT JOIN Orders AS O ON O.customer_id = C.customer_id WHERE O.order_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products AS p LEFT JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price, p.product_color HAVING COUNT(oi.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items GROUP BY product_id ) AS t )
SELECT OI.order_id, SUM(P.product_price) AS total_price FROM Order_Items AS OI JOIN Products AS P ON OI.product_id = P.product_id GROUP BY OI.order_id ORDER BY total_price ASC LIMIT 1
SELECT o.order_id, COUNT(*) AS total_cost FROM Orders AS o JOIN Order_Items AS oi ON oi.order_id = o.order_id GROUP BY o.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Customers AS C JOIN Orders AS O ON O.customer_id = C.customer_id JOIN Order_Items AS OI ON OI.order_id = O.order_id JOIN Products AS P ON P.product_id = OI.product_id WHERE C.gender_code = 'Female'
SELECT DISTINCT T2.product_name, T2.product_price, T2.product_description FROM Customers AS T1 JOIN Products AS T2 WHERE T1.gender_code = 'F'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE parent_product_id IS NULL
SELECT COUNT(*) AS num_products_not_ordered FROM Products AS P LEFT JOIN Order_Items AS OI ON OI.product_id = P.product_id WHERE OI.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Payment_Methods AS pm ON c.customer_id = pm.customer_id WHERE pm.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Payment_Methods AS pm ON c.customer_id = pm.customer_id WHERE pm.customer_id IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code IN ( SELECT gender_code FROM Customers GROUP BY gender_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY gender_code ) ) )
SELECT c.email_address, c.town_city, c.county FROM Customers AS c WHERE c.gender_code = ( SELECT o_counts.gender_code FROM ( SELECT c2.gender_code, COUNT(o.order_id) AS order_count FROM Customers AS c2 LEFT JOIN Orders AS o ON o.customer_id = c2.customer_id GROUP BY c2.gender_code ) AS o_counts ORDER BY o_counts.order_count ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.Name, d.Age FROM director AS d JOIN program AS p ON p.Director_ID = d.Director_ID GROUP BY d.Director_ID, d.Name, d.Age ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS num_channels_without_programs FROM channel AS c LEFT JOIN program AS p ON p.Channel_ID = c.Channel_ID WHERE p.Program_ID IS NULL
SELECT c.Name, c.Internet FROM channel AS c JOIN director_admin AS da ON da.Channel_ID = c.Channel_ID GROUP BY c.Channel_ID, c.Name, c.Internet ORDER BY COUNT(DISTINCT da.Director_ID) DESC LIMIT 1
SELECT DISTINCT C.Name FROM channel AS C JOIN program AS P1 ON P1.Channel_ID = C.Channel_ID JOIN director AS D1 ON D1.Director_ID = P1.Director_ID JOIN program AS P2 ON P2.Channel_ID = C.Channel_ID JOIN director AS D2 ON D2.Director_ID = P2.Director_ID WHERE D1.Age < 40 AND D2.Age > 60
SELECT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON vd.Vehicle_ID = v.Vehicle_ID JOIN driver AS d ON d.Driver_ID = vd.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON vd.Vehicle_ID = v.Vehicle_ID LEFT JOIN driver AS d ON d.Driver_ID = vd.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver d LEFT JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID WHERE vd.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Vehicle_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware' )
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS customers_without_orders FROM Customers AS c LEFT JOIN Customer_Orders AS o ON o.customer_id = c.customer_id WHERE o.order_id IS NULL
SELECT COUNT(*) FROM Customers c LEFT JOIN Customer_Orders co ON co.customer_id = c.customer_id WHERE co.order_id IS NULL
SELECT DISTINCT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE CAST(T2.order_quantity AS INTEGER) > 6 OR T1.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3 )
SELECT DISTINCT co.order_id, co.order_date FROM Customer_Orders AS co JOIN Order_Items AS oi ON oi.order_id = co.order_id GROUP BY co.order_id, co.order_date HAVING MAX(CAST(oi.order_quantity AS INTEGER)) > 6 OR COUNT(DISTINCT oi.product_id) > 3
SELECT r.Capital FROM region AS r JOIN building AS b ON b.Region_ID = r.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Capital FROM region AS r JOIN building AS b ON b.Region_ID = r.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(b.Building_ID) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers AS c JOIN Customer_Interactions AS ci ON ci.Customer_ID = c.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON cs.Customer_ID = c.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON cs.Customer_ID = c.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON cs.Customer_ID = c.Customer_ID WHERE cs.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(service_usage_count) FROM ( SELECT COUNT(*) AS service_usage_count FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cas ON cas.Customer_ID = c.Customer_ID WHERE cas.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT CAS.Service_ID FROM Customers_and_Services AS CAS JOIN Customers AS C ON CAS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' ) OR Service_ID IN ( SELECT CI.Service_ID FROM Customer_Interactions AS CI WHERE CI.Status_Code = 'good' )
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' UNION SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T4 ON T1.Service_ID = T4.Service_ID WHERE T4.Status_Code = 'good'
SELECT DISTINCT s.Service_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON cs.Customer_ID = c.Customer_ID JOIN Services AS s ON s.Service_ID = cs.Service_ID JOIN Customer_Interactions AS ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT DISTINCT s.Service_Details FROM Customers c JOIN Customers_and_Services cas ON cas.Customer_ID = c.Customer_ID JOIN Services s ON s.Service_ID = cas.Service_ID JOIN Customer_Interactions ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT V.name, V.Model_year FROM Vehicles AS V JOIN Renting_history AS R ON R.vehicles_id = V.id GROUP BY V.id, V.name, V.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT v.name, v.Model_year FROM Vehicles AS v JOIN Renting_history AS rh ON rh.vehicles_id = v.id GROUP BY v.id, v.name, v.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.name FROM Discount AS d JOIN Renting_history AS rh ON rh.discount_id = d.id GROUP BY d.id, d.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.id, T2.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT S.bio_data, S.student_id FROM Students AS S JOIN Classes AS C ON C.student_id = S.student_id LEFT JOIN Detention AS D ON D.student_id = S.student_id GROUP BY S.student_id, S.bio_data HAVING COUNT(DISTINCT C.class_id) >= 2 AND COUNT(DISTINCT D.detention_id) < 2
SELECT s.bio_data, s.student_id FROM Students AS s LEFT JOIN Classes AS c ON c.student_id = s.student_id LEFT JOIN Detention AS d ON d.student_id = s.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(DISTINCT c.class_id) >= 2 OR COUNT(DISTINCT d.detention_id) < 2
SELECT DISTINCT T.teacher_details FROM Teachers AS T JOIN Classes AS C ON C.teacher_id = T.teacher_id WHERE C.class_details LIKE '%data%' AND T.teacher_id NOT IN ( SELECT C2.teacher_id FROM Classes AS C2 WHERE C2.class_details LIKE 'net%' )
SELECT DISTINCT t.teacher_details FROM Teachers AS t JOIN Classes AS c_data ON c_data.teacher_id = t.teacher_id WHERE c_data.class_details LIKE '%data%' AND NOT EXISTS ( SELECT 1 FROM Classes AS c_net WHERE c_net.teacher_id = t.teacher_id AND c_net.class_details LIKE 'net%' )
SELECT L.amount_of_loan, L.date_of_loan FROM Student_Loans AS L JOIN ( SELECT A.student_id FROM Achievements AS A GROUP BY A.student_id HAVING COUNT(*) >= 2 ) AS S ON S.student_id = L.student_id
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans AS sl JOIN ( SELECT a.student_id FROM Achievements AS a GROUP BY a.student_id HAVING COUNT(*) >= 2 ) AS aa ON sl.student_id = aa.student_id
SELECT t.teacher_id, t.teacher_details FROM Teachers AS t JOIN Classes AS c ON c.teacher_id = t.teacher_id GROUP BY t.teacher_id, t.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT T.teacher_id, T.teacher_details FROM Teachers AS T JOIN Classes AS C ON C.teacher_id = T.teacher_id GROUP BY T.teacher_id, T.teacher_details ORDER BY COUNT(C.class_id) DESC LIMIT 1
SELECT s.bio_data, s.student_details FROM Students AS s JOIN Behaviour_Monitoring AS bm ON bm.student_id = s.student_id WHERE bm.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(DISTINCT student_id) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ) ) ) AND bm.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 )
SELECT DISTINCT S.bio_data, S.student_details FROM Students AS S JOIN Behaviour_Monitoring AS BM ON BM.student_id = S.student_id WHERE S.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) ) AND S.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT s.bio_data FROM Students AS s JOIN Behaviour_Monitoring AS bm ON bm.student_id = s.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(*) = SUM(CASE WHEN bm.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) THEN 1 ELSE 0 END)
SELECT DISTINCT S.bio_data FROM Students AS S JOIN Behaviour_Monitoring AS BM ON BM.student_id = S.student_id WHERE BM.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT SE.student_id) AS number_of_students, SE.event_type_code, RET.event_type_description FROM Student_Events AS SE JOIN Ref_Event_Types AS RET ON SE.event_type_code = RET.event_type_code GROUP BY SE.event_type_code, RET.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT SE.student_id) AS number_of_students, SE.event_type_code, RET.event_type_description FROM Student_Events AS SE JOIN Ref_Event_Types AS RET ON SE.event_type_code = RET.event_type_code GROUP BY SE.event_type_code, RET.event_type_description ORDER BY COUNT(DISTINCT SE.student_id) DESC LIMIT 1
SELECT 0 AS teacher_count
SELECT COUNT(DISTINCT c.teacher_id) FROM Classes AS c JOIN Students AS s ON c.student_id = s.student_id LEFT JOIN Achievements AS a ON a.student_id = s.student_id WHERE a.achievement_id IS NULL
SELECT t1.detention_type_code, t2.detention_type_description FROM Detention AS t1 JOIN Ref_Detention_Type AS t2 ON t1.detention_type_code = t2.detention_type_code GROUP BY t1.detention_type_code, t2.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT r.detention_type_code, r.detention_type_description FROM Ref_Detention_Type AS r JOIN Detention AS d ON d.detention_type_code = r.detention_type_code GROUP BY r.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON sl.student_id = s.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON sl.student_id = s.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Classes c ON c.student_id = tr.student_id JOIN Teachers t ON t.teacher_id = c.teacher_id WHERE tr.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Classes c ON c.student_id = tr.student_id JOIN Teachers t ON t.teacher_id = c.teacher_id WHERE tr.student_id IN ( SELECT student_id FROM Transcripts WHERE date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts) )
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
