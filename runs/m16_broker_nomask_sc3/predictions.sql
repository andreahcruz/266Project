SELECT COUNT(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != "Nike"
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT driver.Name, COUNT(*) AS win_count FROM driver GROUP BY driver.Name ORDER BY win_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Manufacturer, COUNT(*) FROM club WHERE Manufacturer IS NOT NULL GROUP BY Manufacturer HAVING COUNT(*) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Club_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT order_quantity) FROM Order_Items
SELECT COUNT(DISTINCT order_status_code) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Order_Items
SELECT COUNT(DISTINCT P.product_id) FROM Products AS P JOIN Shipments AS S ON P.product_id = S.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT city_channel.ID) FROM city_channel JOIN city_channel_radio ON city_channel.ID = city_channel_radio.City_channel_ID WHERE city_channel_radio.Is_online = 0
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
SELECT bio_data FROM Students WHERE bio_data NOT LIKE '%"M"%' AND bio_data LIKE '%last name%'
SELECT bio_data FROM Students WHERE bio_data NOT LIKE '%"M"%' AND bio_data LIKE '%last name%'
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT * FROM Students
SELECT T1.student_id, T1.bio_data, T1.student_details, T2.transcript_id, T2.date_of_transcript, T2.transcript_details, T3.behaviour_monitoring_id, T3.behaviour_monitoring_details, T4.event_id, T4.event_type_code, T4.event_date, T4.other_details, T5.student_loan_id, T5.date_of_loan, T5.amount_of_loan, T5.other_details, T6.class_id, T6.teacher_id, T6.class_details, T7.student_address_id, T7.address_id, T7.address_type_code, T7.date_from, T7.date_to, T8.detention_id, T8.detention_type_code, T8.datetime_detention_start, T8.datetime_detention_end, T8.detention_summary, T9.achievement_id, T9.achievement_type_code, T9.date_achievement, T9.achievement_details, T9.other_details FROM Students AS T1 LEFT JOIN Transcripts AS T2 ON T1.student_id = T2.student_id LEFT JOIN Behaviour_Monitoring AS T3 ON T1.student_id = T3.student_id LEFT JOIN Student_Events AS T4 ON T1.student_id = T4.student_id LEFT JOIN Student_Loans AS T5 ON T1.student_id = T5.student_id LEFT JOIN Classes AS T6 ON T1.student_id = T6.student_id LEFT JOIN Students_Addresses AS T7 ON T1.student_id = T7.student_id LEFT JOIN Detention AS T8 ON T1.student_id = T8.student_id LEFT JOIN Achievements AS T9 ON T1.student_id = T9.student_id
SELECT COUNT(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT count(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT 'No price information available in database schema' AS result
SELECT AVG(product_price) FROM Products WHERE product_name LIKE '%Clothes%'
SELECT AVG(product_price) FROM Products WHERE product_name LIKE '%Clothes%'
SELECT COUNT(*) FROM Products WHERE product_name LIKE "%hardware%"
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT parent_product_id FROM Products GROUP BY parent_product_id HAVING count(*) >= 2
SELECT Builder FROM vehicle GROUP BY Builder HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods
SELECT DISTINCT discount_id FROM Renting_history
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
SELECT Builder, COUNT(DISTINCT Builder) as number_of_clubs FROM vehicle GROUP BY Builder
SELECT Builder, COUNT(DISTINCT Driver_ID) as club_count FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY Builder
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) AS number_of_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) AS product_count FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT O.order_id, O.date_order_placed FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.date_order_placed HAVING COUNT(OI.order_item_id) >= 2
SELECT DISTINCT Customer_Orders.order_id, Customer_Orders.order_date FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_date HAVING count(DISTINCT Order_Items.product_id) >= 2
SELECT 'Gender information not available in schema' AS error_message
SELECT customer_id, COUNT(order_id) as order_count FROM Orders GROUP BY customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers AS c JOIN Customer_Payment_Methods AS cpm ON c.customer_id = cpm.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers c JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT DISTINCT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT Customer_Orders.order_status_code FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id WHERE Customer_Orders.order_status_code = 'shipped'
SELECT DISTINCT co.order_status_code FROM Customer_Orders co JOIN Order_Items oi ON co.order_id = oi.order_id WHERE co.order_status_code IN ('ordered', 'shipped')
SELECT customer_name, customer_phone FROM Customers WHERE customer_phone LIKE '+12%'
SELECT customer_number, customer_name FROM Customers WHERE customer_phone LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT T2.address_details, T1.customer_address, T1.customer_name FROM Customers AS T1 JOIN Addresses AS T2 ON T1.address_id = T2.address_id
SELECT a.address_details, c.customer_address FROM Addresses a JOIN Customers c ON a.address_id = c.address_id
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_item_id) > 3
SELECT P.product_id, P.product_description FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(*) > 3
SELECT DISTINCT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_date HAVING COUNT(T2.order_item_id) >= 2
SELECT DISTINCT co.order_date, co.order_id FROM Customer_Orders co WHERE co.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) >= 2 )
SELECT NULL as shipment_tracking_number, NULL as shipment_date WHERE 1=0
SELECT order_id, order_date FROM Customer_Orders
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT count(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT c.Name, c.Internet FROM channel c WHERE c.Channel_ID IN (SELECT Channel_ID FROM program GROUP BY Channel_ID HAVING count(*) > 1)
SELECT channel.Name, COUNT(program.Program_ID) as number_of_programs FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula'
SELECT program.Title, program.Start_Year FROM program
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
SELECT Racing_Series, COUNT(DISTINCT driver.Driver_ID) FROM driver GROUP BY Racing_Series
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code
SELECT Racing_Series, COUNT(*) as count FROM driver GROUP BY Racing_Series
SELECT Student_Answer_Text, COUNT(*) as answer_count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY answer_count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT s.student_id, s.bio_data, se.event_date FROM Students s LEFT JOIN Student_Events se ON s.student_id = se.student_id
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID
SELECT student_id, event_date FROM Student_Events ORDER BY event_date DESC
SELECT T2.Email_Adress, T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T1.Date_of_Answer DESC
SELECT s.student_details FROM Students s WHERE s.student_id IN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT s.student_id FROM Students s JOIN Transcripts t ON s.student_id = t.student_id GROUP BY s.student_id HAVING COUNT(*) >= 2
SELECT bio_data FROM Students GROUP BY bio_data ORDER BY count(*) DESC
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT c.Name FROM club AS c JOIN player AS p ON p.Club_ID = c.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY AVG(p.Earnings) DESC
SELECT c.Name FROM club AS c JOIN player AS p ON p.Club_ID = c.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY AVG(p.Earnings) DESC
SELECT Builder FROM vehicle GROUP BY Builder ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Player_ID IS NULL
SELECT t1.Name FROM club AS t1 LEFT JOIN player AS t2 ON t1.Club_ID = t2.Club_ID WHERE t2.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 UNION SELECT Country FROM player WHERE Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING SUM(CASE WHEN Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT O.date_order_placed FROM Orders AS O LEFT JOIN Order_Items AS OI ON OI.order_id = O.order_id GROUP BY O.order_id, O.date_order_placed HAVING O.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(OI.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products AS P LEFT JOIN Order_Items AS OI ON OI.product_id = P.product_id GROUP BY P.product_id, P.product_name, P.product_price, P.product_color HAVING COUNT(DISTINCT OI.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT c.gender_code, COUNT(p.product_id) AS number_of_products FROM Customers AS c JOIN Products AS p ON p.product_id = c.customer_id GROUP BY c.gender_code
SELECT product_color AS gender, COUNT(*) AS products_bought FROM Products GROUP BY product_color
SELECT product_name FROM Products
SELECT product_name, product_id FROM Products
SELECT DISTINCT T3.product_name, T3.product_type_code FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id WHERE T1.order_status_code = 'shipped'
SELECT DISTINCT P.product_name, P.product_color FROM Products AS P JOIN Order_Items AS OI ON OI.product_id = P.product_id JOIN Shipment_Items AS SI ON SI.order_item_id = OI.order_item_id JOIN Shipments AS S ON S.shipment_id = SI.shipment_id
SELECT DISTINCT I.invoice_status_code FROM Orders AS O JOIN Shipments AS S ON S.order_id = O.order_id JOIN Invoices AS I ON I.invoice_number = S.invoice_number WHERE O.order_id NOT IN (SELECT order_id FROM Shipments)
SELECT DISTINCT I.invoice_status_code FROM Orders AS O LEFT JOIN Shipments AS S ON S.order_id = O.order_id LEFT JOIN Invoices AS I ON I.invoice_number = S.invoice_number WHERE S.shipment_id IS NULL
SELECT T1.order_id, T1.date_order_placed, SUM(T3.product_price) AS total_cost FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id, T1.date_order_placed
SELECT O.order_id, O.date_order_placed, COALESCE(SUM(P.product_price), 0) AS total_amount_paid FROM Orders AS O LEFT JOIN Order_Items AS OI ON O.order_id = OI.order_id LEFT JOIN Products AS P ON OI.product_id = P.product_id GROUP BY O.order_id, O.date_order_placed
SELECT product_name AS buyer_first_name, product_name AS product_name FROM Products
SELECT product_name FROM Products
SELECT DISTINCT O.date_order_placed FROM Orders AS O JOIN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) >= 2 ) AS CPM ON O.customer_id = CPM.customer_id
SELECT DISTINCT o.date_order_placed FROM Orders AS o JOIN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(DISTINCT payment_method_code) >= 2 ) AS cpm ON o.customer_id = cpm.customer_id
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT DISTINCT c.Channel_ID, c.Name FROM channel AS c WHERE c.Channel_ID NOT IN ( SELECT da.Channel_ID FROM director_admin AS da JOIN director AS d ON da.Director_ID = d.Director_ID WHERE d.Name = 'Hank Baskett' )
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Transmitter, c.Station_name FROM city_channel_radio AS ccr JOIN radio AS r ON ccr.Radio_ID = r.Radio_ID JOIN city_channel AS c ON ccr.City_channel_ID = c.ID ORDER BY CAST(r.ERP_kW AS REAL) DESC
SELECT DISTINCT T1.Transmitter FROM radio AS T1 LEFT JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID WHERE T2.City_channel_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT COUNT(*) AS max_vehicles_driven, Driver_ID FROM vehicle_driver GROUP BY Driver_ID ORDER BY max_vehicles_driven DESC LIMIT 1
SELECT T1.Driver_ID, COUNT(DISTINCT T1.Vehicle_ID) AS vehicle_count FROM vehicle_driver AS T1 GROUP BY T1.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT d.Name FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT DISTINCT d.Name FROM driver AS d JOIN vehicle_driver AS vd ON vd.Driver_ID = d.Driver_ID JOIN vehicle AS v ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Power > 5000
SELECT v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IS NULL
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN ( SELECT Vehicle_ID FROM vehicle_driver )
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' OR Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2 )
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' OR Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2 )
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON vd.Driver_ID = d.Driver_ID JOIN vehicle AS v ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT DISTINCT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT event_date FROM Student_Events WHERE event_type_code LIKE '%data%' ORDER BY event_date DESC
SELECT event_date FROM Student_Events WHERE lower(event_type_code) LIKE '%data%' ORDER BY event_date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT va.Valid_Answer_Text FROM Student_Assessments AS sa JOIN Valid_Answers AS va ON sa.Valid_Answer_ID = va.Valid_Answer_ID GROUP BY va.Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.First_Name FROM Students AS s LEFT JOIN Student_Answers AS sa ON sa.Student_ID = s.Student_ID WHERE sa.Student_ID IS NULL
SELECT student_details FROM Students WHERE student_id NOT IN (SELECT student_id FROM Student_Events)
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_name LIKE '%Clothes%' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_name = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE parent_product_id = "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT parent_product_id FROM Products GROUP BY parent_product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT c.name FROM Customers AS c JOIN Renting_history AS rh ON rh.customer_id = c.id JOIN Discount AS d ON rh.discount_id = d.id WHERE d.name IN ( SELECT d2.name FROM Renting_history AS rh2 JOIN Discount AS d2 ON rh2.discount_id = d2.id GROUP BY d2.name HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Renting_history AS rh3 JOIN Discount AS d3 ON rh3.discount_id = d3.id GROUP BY d3.name ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_name FROM Products AS p LEFT JOIN Order_Items AS oi ON oi.product_id = p.product_id WHERE oi.order_item_id IS NULL
SELECT p.product_name FROM Products AS p LEFT JOIN Order_Items AS oi ON oi.product_id = p.product_id WHERE oi.order_item_id IS NULL
SELECT c.customer_id, substr(c.customer_name, 1, instr(c.customer_name, ' ') - 1) AS first_name, substr(c.customer_name, instr(c.customer_name, ' ') + 1) AS last_name FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id JOIN Order_Items AS oi ON oi.order_id = co.order_id GROUP BY c.customer_id, c.customer_name HAVING COUNT(DISTINCT co.order_id) > 2 AND SUM(CAST(oi.order_quantity AS INTEGER)) >= 3
SELECT c.customer_id, c.customer_name FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id JOIN Order_Items AS oi ON oi.order_id = co.order_id GROUP BY c.customer_id, c.customer_name HAVING COUNT(DISTINCT co.order_id) > 2 AND SUM(CAST(oi.order_quantity AS INTEGER)) >= 3
SELECT customer_name FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Orders )
SELECT customer_name FROM Customers AS C LEFT JOIN Customer_Orders AS O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_type_code FROM Products AS p LEFT JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price, p.product_type_code HAVING COUNT(oi.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items GROUP BY product_id ) AS t )
SELECT T1.order_id, SUM(T3.product_price * CAST(T2.order_quantity AS REAL)) AS total_price FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY total_price ASC LIMIT 1
SELECT oi.order_id, SUM(CAST(oi.order_quantity AS REAL)) AS total_cost FROM Order_Items AS oi JOIN Customer_Orders AS co ON oi.order_id = co.order_id GROUP BY oi.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Customers AS C JOIN Orders AS O ON O.customer_id = C.customer_id JOIN Order_Items AS OI ON OI.order_id = O.order_id JOIN Products AS P ON P.product_id = OI.product_id WHERE C.gender_code = 'Female'
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Customers AS T2 WHERE T2.gender_code = 'F'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE parent_product_id IS NULL
SELECT COUNT(*) AS num_products_not_ordered FROM Products AS P LEFT JOIN Order_Items AS OI ON P.product_id = OI.product_id WHERE OI.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Payment_Methods AS pm ON c.customer_id = pm.customer_id WHERE pm.customer_id IS NULL
SELECT COUNT(*) FROM Customers WHERE payment_method_code IS NULL OR payment_method_code = ''
SELECT customer_email, address_details AS town_and_county FROM Customers JOIN Addresses ON Customers.address_id = Addresses.address_id
SELECT c.customer_email, a.address_details AS city, a.address_details AS county FROM Customers AS c JOIN Addresses AS a ON c.address_id = a.address_id WHERE c.payment_method_code = ( SELECT co.order_status_code FROM Customer_Orders AS co GROUP BY co.order_status_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.Name, d.Age FROM director AS d JOIN program AS p ON p.Director_ID = d.Director_ID GROUP BY d.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM channel AS c LEFT JOIN program AS p ON p.Channel_ID = c.Channel_ID WHERE p.Program_ID IS NULL
SELECT c.Name, c.Internet FROM channel AS c JOIN director_admin AS da ON da.Channel_ID = c.Channel_ID GROUP BY c.Channel_ID ORDER BY COUNT(DISTINCT da.Director_ID) DESC LIMIT 1
SELECT c.Name FROM channel AS c JOIN director_admin AS da ON da.Channel_ID = c.Channel_ID JOIN director AS d ON d.Director_ID = da.Director_ID GROUP BY c.Channel_ID, c.Name HAVING SUM(CASE WHEN d.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN d.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON vd.Vehicle_ID = v.Vehicle_ID LEFT JOIN driver AS d ON d.Driver_ID = vd.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON vd.Vehicle_ID = v.Vehicle_ID JOIN driver AS d ON d.Driver_ID = vd.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver d LEFT JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID WHERE vd.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS d LEFT JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID WHERE vd.Vehicle_ID IS NULL
SELECT Model FROM vehicle WHERE Power > (SELECT AVG(Power) FROM vehicle)
SELECT Model FROM vehicle WHERE Power > (SELECT AVG(Power) FROM vehicle)
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT t1.customer_id, t1.customer_name, t1.customer_phone, t1.customer_email FROM Customers AS t1 JOIN Customer_Orders AS t2 ON t1.customer_id = t2.customer_id GROUP BY t1.customer_id ORDER BY COUNT(t2.order_id) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS C LEFT JOIN Orders AS O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL
SELECT COUNT(*) FROM Customers c LEFT JOIN Customer_Orders co ON co.customer_id = c.customer_id WHERE co.order_id IS NULL
SELECT O.date_order_placed, O.order_id FROM Orders AS O JOIN Order_Items AS OI ON OI.order_id = O.order_id GROUP BY O.order_id, O.date_order_placed HAVING COUNT(*) > 3 OR MAX(( SELECT COUNT(*) FROM Order_Items AS OI2 WHERE OI2.order_id = O.order_id AND OI2.product_id = OI.product_id )) > 6
SELECT DISTINCT CO.order_id, CO.order_date FROM Customer_Orders AS CO JOIN Order_Items AS OI ON OI.order_id = CO.order_id GROUP BY CO.order_id, CO.order_date HAVING MAX(CAST(OI.order_quantity AS INTEGER)) > 6 OR COUNT(DISTINCT OI.product_id) > 3
SELECT r.Capital FROM region AS r JOIN building AS b ON b.Region_ID = r.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.* FROM Customers AS C JOIN Renting_history AS R ON R.customer_id = C.id GROUP BY C.id, C.name, C.age, C.membership_credit ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.* FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id GROUP BY c.customer_id, c.customer_number, c.customer_name, c.customer_address, c.customer_phone, c.customer_email ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT T1.customer_name FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id ORDER BY COUNT(DISTINCT T2.order_status_code) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT * FROM Customers
SELECT DISTINCT customer_id, customer_number, customer_name, customer_address, customer_phone, customer_email FROM Customers WHERE 0
SELECT DISTINCT S.Service_Details FROM Services AS S JOIN Customers_and_Services AS CAS ON CAS.Service_ID = S.Service_ID JOIN Customers AS C ON C.Customer_ID = CAS.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' UNION SELECT DISTINCT S.Service_Details FROM Services AS S JOIN Customer_Interactions AS CI ON CI.Service_ID = S.Service_ID WHERE CI.Status_Code = 'good'
SELECT DISTINCT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' UNION SELECT DISTINCT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T4 ON T1.Service_ID = T4.Service_ID WHERE T4.Status_Code = 'good'
SELECT DISTINCT s.Service_Details FROM Services AS s JOIN Customers_and_Services AS cs ON cs.Service_ID = s.Service_ID JOIN Customers AS c ON c.Customer_ID = cs.Customer_ID JOIN Customer_Interactions AS ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT DISTINCT s.Service_Details FROM Customers c JOIN Customers_and_Services cs ON cs.Customer_ID = c.Customer_ID JOIN Services s ON s.Service_ID = cs.Service_ID JOIN Customer_Interactions ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT Model, Power AS Powertrain_Type, Top_Speed AS Annual_Fuel_Cost FROM vehicle WHERE Build_Year IN ('2013', '2014')
SELECT Model, Power, Build_Year FROM vehicle WHERE Build_Year IN ('2013', '2014')
SELECT V.name, V.Model_year FROM Vehicles AS V JOIN Renting_history AS R ON R.vehicles_id = V.id GROUP BY V.id, V.name, V.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT v.name, v.Model_year FROM Renting_history AS rh JOIN Vehicles AS v ON rh.vehicles_id = v.id GROUP BY rh.vehicles_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.name FROM Discount AS d JOIN Renting_history AS rh ON rh.discount_id = d.id GROUP BY d.id, d.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.name FROM Discount AS D JOIN Renting_history AS R ON R.discount_id = D.id GROUP BY D.id, D.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT S.bio_data, S.student_id FROM Students AS S JOIN Classes AS C ON C.student_id = S.student_id LEFT JOIN Detention AS D ON D.student_id = S.student_id GROUP BY S.student_id, S.bio_data HAVING COUNT(DISTINCT C.class_id) >= 2 AND COUNT(DISTINCT D.detention_id) < 2
SELECT s.bio_data, s.student_id FROM Students AS s LEFT JOIN Classes AS c ON c.student_id = s.student_id LEFT JOIN Detention AS d ON d.student_id = s.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(DISTINCT c.class_id) >= 2 OR COUNT(DISTINCT d.detention_id) < 2
SELECT DISTINCT T.teacher_details FROM Teachers AS T JOIN Classes AS C ON C.teacher_id = T.teacher_id WHERE C.class_details LIKE '%data%' AND T.teacher_id NOT IN ( SELECT C2.teacher_id FROM Classes AS C2 WHERE C2.class_details LIKE 'net%' )
SELECT DISTINCT t.teacher_details FROM Teachers AS t JOIN Classes AS c_data ON c_data.teacher_id = t.teacher_id WHERE c_data.class_details LIKE '%data%' AND NOT EXISTS ( SELECT 1 FROM Classes AS c_net WHERE c_net.teacher_id = t.teacher_id AND c_net.class_details LIKE 'net%' )
SELECT SL.amount_of_loan, SL.date_of_loan FROM Student_Loans AS SL JOIN ( SELECT A.student_id FROM Achievements AS A GROUP BY A.student_id HAVING COUNT(*) >= 2 ) AS T ON SL.student_id = T.student_id
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans AS sl JOIN ( SELECT a.student_id FROM Achievements AS a GROUP BY a.student_id HAVING COUNT(*) >= 2 ) AS s2 ON sl.student_id = s2.student_id
SELECT d.Driver_ID, d.Name, d.Citizenship, d.Racing_Series FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID GROUP BY d.Driver_ID ORDER BY COUNT(vd.Vehicle_ID) DESC LIMIT 1
SELECT T.teacher_id, T.teacher_details FROM Teachers AS T JOIN Classes AS C ON C.teacher_id = T.teacher_id GROUP BY T.teacher_id, T.teacher_details ORDER BY COUNT(DISTINCT C.class_id) DESC LIMIT 1
SELECT s.bio_data, s.student_details FROM Students AS s JOIN Behaviour_Monitoring AS bm ON bm.student_id = s.student_id GROUP BY s.student_id, s.bio_data, s.student_details HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Behaviour_Monitoring GROUP BY student_id)) AND COUNT(*) = 3
SELECT DISTINCT S.bio_data, S.student_details FROM Students AS S JOIN Behaviour_Monitoring AS BM ON BM.student_id = S.student_id WHERE S.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) ) AND S.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT s.bio_data FROM Students AS s JOIN Behaviour_Monitoring AS bm ON bm.student_id = s.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(*) = SUM( CASE WHEN bm.behaviour_monitoring_details = ( SELECT bm2.behaviour_monitoring_details FROM Behaviour_Monitoring AS bm2 GROUP BY bm2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) THEN 1 ELSE 0 END )
SELECT S.bio_data FROM Students AS S JOIN Behaviour_Monitoring AS B ON B.student_id = S.student_id WHERE B.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT T1.student_id) AS number_of_students, T1.event_type_code, T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT SE.student_id) AS number_of_students, SE.event_type_code, RET.event_type_description FROM Student_Events AS SE JOIN Ref_Event_Types AS RET ON SE.event_type_code = RET.event_type_code GROUP BY SE.event_type_code, RET.event_type_description ORDER BY COUNT(DISTINCT SE.student_id) DESC LIMIT 1
SELECT 0 AS teacher_count
SELECT COUNT(DISTINCT c.teacher_id) FROM Classes AS c JOIN Students AS s ON c.student_id = s.student_id LEFT JOIN Achievements AS a ON s.student_id = a.student_id WHERE a.achievement_id IS NULL
SELECT Type_of_powertrain, Notes FROM Vehicles GROUP BY Type_of_powertrain, Notes ORDER BY COUNT(*) ASC LIMIT 1
SELECT r.detention_type_code, r.detention_type_description FROM Ref_Detention_Type AS r JOIN Detention AS d ON d.detention_type_code = r.detention_type_code GROUP BY r.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON sl.student_id = s.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON sl.student_id = s.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Classes c ON c.student_id = tr.student_id JOIN Teachers t ON t.teacher_id = c.teacher_id WHERE tr.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 )
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Classes c ON c.student_id = tr.student_id JOIN Teachers t ON t.teacher_id = c.teacher_id WHERE tr.student_id = ( SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1 )
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.address_id AS address_type_code, a.address_details AS address_type_description FROM Customers AS c JOIN Addresses AS a ON c.address_id = a.address_id GROUP BY c.address_id, a.address_details ORDER BY COUNT(*) DESC LIMIT 1
