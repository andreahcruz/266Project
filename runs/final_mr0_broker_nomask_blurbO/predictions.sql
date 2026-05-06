SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
I notice that the current database schema only contains `Customer_Orders` and `Order_Items` tables, which do not include any information about clubs. The schema provided does not have a table containing club names. Since the question asks for club names but no such table exists in the provided schema, I cannot write a valid query that answers this question using only the available tables and columns.
I cannot answer this question because the current database schema does not contain any table with club names or information. The schema only includes `Customer_Orders` and `Order_Items` tables, which contain order and product information but no club data.
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
SELECT * FROM Students WHERE 1=0 ``` This returns an empty result set because the required columns for this query do not exist in the provided schema.
SELECT bio_data FROM Students WHERE student_details NOT LIKE '%"M"%' OR bio_data NOT LIKE '%M%' ``` Note: This query is speculative since the actual schema doesn't contain explicit gender or last_name columns.
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT * FROM Students
SELECT S.student_id, S.bio_data, S.student_details, T.transcript_id, T.date_of_transcript, T.transcript_details, BM.behaviour_monitoring_id, BM.behaviour_monitoring_details, SE.event_id, SE.event_type_code, SE.event_date, SE.other_details, SL.student_loan_id, SL.date_of_loan, SL.amount_of_loan, SL.other_details, C.class_id, C.teacher_id, C.class_details, SA.student_address_id, SA.address_id, SA.address_type_code, SA.date_from, SA.date_to, D.detention_id, D.detention_type_code, D.datetime_detention_start, D.datetime_detention_end, D.detention_summary, A.achievement_id, A.achievement_type_code, A.date_achievement, A.achievement_details, A.other_details FROM Students S LEFT JOIN Transcripts T ON S.student_id = T.student_id LEFT JOIN Behaviour_Monitoring BM ON S.student_id = BM.student_id LEFT JOIN Student_Events SE ON S.student_id = SE.student_id LEFT JOIN Student_Loans SL ON S.student_id = SL.student_id LEFT JOIN Classes C ON S.student_id = C.student_id LEFT JOIN Students_Addresses SA ON S.student_id = SA.student_id LEFT JOIN Detention D ON S.student_id = D.student_id LEFT JOIN Achievements A ON S.student_id = A.student_id
SELECT COUNT(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_name LIKE '%Clothes%'
SELECT AVG(product_price) FROM Products WHERE product_name LIKE '%Clothes%'
SELECT COUNT(*) FROM Products WHERE product_name LIKE '%hardware%'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT parent_product_id FROM Products GROUP BY parent_product_id HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods
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
SELECT Customer_Orders.order_id, Customer_Orders.order_status_code, COUNT(Order_Items.product_id) as number_of_products FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id GROUP BY Customer_Orders.order_id, Customer_Orders.order_status_code
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.product_id) AS product_count FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code ORDER BY Orders.order_id
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(oi.order_item_id) >= 2
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING count(oi.order_item_id) >= 2
SELECT C.gender_code, COUNT(O.order_id) AS number_of_orders FROM Customers AS C LEFT JOIN Orders AS O ON C.customer_id = O.customer_id GROUP BY C.gender_code
SELECT C.gender, COUNT(O.order_id) FROM Orders AS O JOIN Customers AS C ON O.customer_id = C.customer_id GROUP BY C.gender ``` Since this table doesn't exist in the provided schema, I cannot provide a valid query that works with only the Orders and Order_Items tables.
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers c JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers c LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT DISTINCT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number ORDER BY i.invoice_number
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT DISTINCT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id WHERE oi.order_item_status_code IS NOT NULL AND s.shipment_tracking_number IS NOT NULL
SELECT customer_name, customer_phone FROM Customers WHERE customer_phone LIKE '+12%'
SELECT customer_name, customer_phone FROM Customers WHERE customer_phone LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT a.address_details, c.customer_address FROM Customers AS c JOIN Addresses AS a ON c.address_id = a.address_id WHERE a.address_details LIKE '%USA%' OR c.customer_address LIKE '%USA%'
SELECT a.address_details, c.customer_address FROM Customers c JOIN Addresses a ON c.address_id = a.address_id
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
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT s.First_Name, sa.Date_of_Answer FROM Student_Answers sa JOIN Students s ON sa.Student_ID = s.Student_ID
I cannot answer this question because the current database schema does not contain an "email addresses" column or an "answers" table. The schema provided includes tables for Students, Transcripts, Addresses, Student_Events, Student_Loans, Students_Addresses, and Achievements, but none of these tables have columns for email addresses or student answers. To answer this question, I would need a table with email address information and a table tracking student answers with dates, which are not present in the provided schema.
SELECT s.student_id, t.date_of_transcript FROM Students s JOIN Transcripts t ON s.student_id = t.student_id ORDER BY t.date_of_transcript DESC ```
SELECT First_Name FROM Students WHERE Student_ID IN ( SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2 )
SELECT s.First_Name FROM Students s JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID GROUP BY s.Student_ID HAVING COUNT(sa.Student_Answer_ID) >= 2
SELECT bio_data, COUNT(*) as number_of_students FROM Students GROUP BY bio_data ``` But this is not ideal since bio_data is likely a text field containing multiple pieces of information, not just gender. Without a proper gender column in the schema, a precise answer cannot be provided.
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T2.Club_ID = T1.Club_ID GROUP BY T1.Club_ID, T1.Name ORDER BY AVG(T2.Earnings) DESC
SELECT c.Name FROM club AS c JOIN player AS p ON p.Club_ID = c.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY AVG(p.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM club AS T1 LEFT JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Player_ID IS NULL
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING SUM(CASE WHEN Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT O.date_order_placed FROM Orders AS O LEFT JOIN Order_Items AS OI ON OI.order_id = O.order_id GROUP BY O.order_id, O.date_order_placed HAVING O.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(OI.order_item_id) > 1
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products AS P LEFT JOIN Order_Items AS OI ON OI.product_id = P.product_id GROUP BY P.product_id, P.product_name, P.product_price, P.product_color HAVING COUNT(DISTINCT OI.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT gender_code, COUNT(product_id) AS number_of_products FROM Customers JOIN Products ON Customers.customer_id = Products.parent_product_id GROUP BY gender_code
SELECT product_color AS gender, COUNT(*) AS products_bought FROM Products GROUP BY product_color
SELECT P.product_name, S.shipment_date FROM Shipment_Items AS SI JOIN Shipments AS S ON SI.shipment_id = S.shipment_id JOIN Order_Items AS OI ON SI.order_item_id = OI.order_item_id JOIN Products AS P ON OI.product_id = P.product_id
SELECT DISTINCT p.product_name, s.shipment_date FROM Shipments AS s JOIN Shipment_Items AS si ON si.shipment_id = s.shipment_id JOIN Order_Items AS oi ON oi.order_item_id = si.order_item_id JOIN Products AS p ON p.product_id = oi.product_id
SELECT DISTINCT P.product_name, P.product_color FROM Shipment_Items AS SI JOIN Order_Items AS OI ON SI.order_item_id = OI.order_item_id JOIN Products AS P ON OI.product_id = P.product_id
SELECT DISTINCT p.product_name, p.product_color FROM Products AS p JOIN Order_Items AS oi ON oi.product_id = p.product_id JOIN Shipment_Items AS si ON si.order_item_id = oi.order_item_id JOIN Shipments AS s ON s.shipment_id = si.shipment_id
SELECT DISTINCT I.invoice_status_code FROM Orders AS O JOIN Shipments AS S ON S.order_id = O.order_id JOIN Invoices AS I ON I.invoice_number = S.invoice_number WHERE O.order_id NOT IN (SELECT order_id FROM Shipments)
SELECT DISTINCT i.invoice_status_code FROM Orders AS o JOIN Shipments AS s ON s.order_id = o.order_id JOIN Invoices AS i ON i.invoice_number = s.invoice_number WHERE o.order_id NOT IN (SELECT order_id FROM Shipments)
SELECT O.order_id, O.date_order_placed, SUM(P.product_price) AS total_cost FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id GROUP BY O.order_id, O.date_order_placed
SELECT O.order_id, O.date_order_placed, COALESCE(SUM(P.product_price), 0) AS total_amount_paid FROM Orders AS O LEFT JOIN Order_Items AS OI ON OI.order_id = O.order_id LEFT JOIN Products AS P ON P.product_id = OI.product_id GROUP BY O.order_id, O.date_order_placed
SELECT product_name AS buyer_first_name, product_name FROM Products
SELECT product_name FROM Products
SELECT DISTINCT O.date_order_placed FROM Orders AS O JOIN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) >= 2 ) AS CPM ON O.customer_id = CPM.customer_id
SELECT DISTINCT o.date_order_placed FROM Orders AS o JOIN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(DISTINCT payment_method_code) >= 2 ) AS cpm ON o.customer_id = cpm.customer_id
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Channel_ID, Name FROM channel WHERE Channel_ID NOT IN ( SELECT T1.Channel_ID FROM director_admin AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID WHERE T2.Name = 'Hank Baskett' )
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Transmitter, cc.Station_name FROM city_channel_radio AS ccr JOIN radio AS r ON ccr.Radio_ID = r.Radio_ID JOIN city_channel AS cc ON ccr.City_channel_ID = cc.ID ORDER BY CAST(r.ERP_kW AS REAL) DESC
SELECT DISTINCT T1.Transmitter FROM radio AS T1 LEFT JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID WHERE T2.Radio_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT COUNT(*) AS max_vehicles_driven, Driver_ID FROM vehicle_driver GROUP BY Driver_ID ORDER BY max_vehicles_driven DESC LIMIT 1
SELECT T1.Driver_ID, COUNT(DISTINCT T1.Vehicle_ID) AS vehicle_count FROM vehicle_driver AS T1 GROUP BY T1.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT DISTINCT d.Name FROM driver AS d JOIN vehicle_driver AS vd ON vd.Driver_ID = d.Driver_ID JOIN vehicle AS v ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Power > 5000
SELECT v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IS NULL
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN ( SELECT Vehicle_ID FROM vehicle_driver )
SELECT v.Vehicle_ID, v.Model FROM vehicle AS v WHERE v.Builder = 'Ziyang' OR v.Vehicle_ID IN ( SELECT vd.Vehicle_ID FROM vehicle_driver AS vd GROUP BY vd.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) = 2 )
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
SELECT S.First_Name FROM Students AS S LEFT JOIN Student_Answers AS SA ON SA.Student_ID = S.Student_ID WHERE SA.Student_ID IS NULL
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal','Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_name LIKE '%Clothes%' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE parent_product_id = (SELECT product_id FROM Products WHERE product_name = 'Clothes') ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_name LIKE '%Hardware%' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE parent_product_id = "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT p.product_name FROM Products AS p LEFT JOIN Order_Items AS oi ON oi.product_id = p.product_id WHERE oi.order_item_id IS NULL
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers AS c JOIN Orders AS o ON o.customer_id = c.customer_id JOIN Order_Items AS oi ON oi.order_id = o.order_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT C.customer_id, C.customer_name FROM Customers AS C JOIN Customer_Orders AS CO ON CO.customer_id = C.customer_id JOIN Order_Items AS OI ON OI.order_id = CO.order_id GROUP BY C.customer_id, C.customer_name HAVING COUNT(DISTINCT CO.order_id) > 2 AND SUM(CAST(OI.order_quantity AS INTEGER)) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders )
SELECT customer_first_name, customer_last_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products AS p LEFT JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price, p.product_color HAVING COUNT(oi.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON oi.product_id = p.product_id GROUP BY p.product_id, p.product_name, p.product_price HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Order_Items GROUP BY product_id ) AS t )
SELECT OI.order_id, SUM(P.product_price) AS total_price FROM Order_Items AS OI JOIN Products AS P ON OI.product_id = P.product_id GROUP BY OI.order_id ORDER BY total_price ASC LIMIT 1
SELECT o.order_id, COUNT(*) AS total_cost FROM Orders AS o JOIN Order_Items AS oi ON oi.order_id = o.order_id GROUP BY o.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Customers AS C JOIN Orders AS O ON O.customer_id = C.customer_id JOIN Order_Items AS OI ON OI.order_id = O.order_id JOIN Products AS P ON P.product_id = OI.product_id WHERE C.gender_code = 'Female'
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products AS P JOIN Customers AS C ON C.customer_id = P.product_id WHERE C.gender_code = 'F'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE parent_product_id IS NULL
SELECT COUNT(*) AS num_products_not_ordered FROM Products AS P LEFT JOIN Order_Items AS OI ON OI.product_id = P.product_id WHERE OI.order_item_id IS NULL
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Payment_Methods AS pm ON c.customer_id = pm.customer_id WHERE pm.customer_id IS NULL
SELECT COUNT(*) FROM Customers WHERE payment_method_code IS NULL OR payment_method_code = ''
SELECT customer_email, customer_address FROM Customers WHERE customer_number = ( SELECT customer_number FROM Customers GROUP BY customer_number ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT c.customer_email, a.address_details AS cities, a.address_details AS counties FROM Customers AS c JOIN Addresses AS a ON a.address_id = c.address_id WHERE c.payment_method_code = ( SELECT c2.payment_method_code FROM Customers AS c2 JOIN Customer_Orders AS co2 ON co2.customer_id = c2.customer_id GROUP BY c2.payment_method_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.Name, d.Age FROM director AS d JOIN program AS p ON p.Director_ID = d.Director_ID GROUP BY d.Director_ID, d.Name, d.Age ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS num_channels_without_programs FROM channel AS c LEFT JOIN program AS p ON p.Channel_ID = c.Channel_ID WHERE p.Program_ID IS NULL
SELECT c.Name, c.Internet FROM channel AS c JOIN director_admin AS da ON da.Channel_ID = c.Channel_ID GROUP BY c.Channel_ID, c.Name, c.Internet ORDER BY COUNT(DISTINCT da.Director_ID) DESC LIMIT 1
SELECT c.Name FROM channel AS c JOIN program AS p ON p.Channel_ID = c.Channel_ID JOIN director AS d ON d.Director_ID = p.Director_ID GROUP BY c.Channel_ID, c.Name HAVING SUM(CASE WHEN d.Age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN d.Age > 60 THEN 1 ELSE 0 END) > 0
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON vd.Vehicle_ID = v.Vehicle_ID LEFT JOIN driver AS d ON d.Driver_ID = vd.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON vd.Vehicle_ID = v.Vehicle_ID JOIN driver AS d ON d.Driver_ID = vd.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver d LEFT JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID WHERE vd.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Vehicle_ID IS NULL
SELECT product_name FROM Products WHERE parent_product_id IS NOT NULL AND product_price > ( SELECT AVG(product_price) FROM Products WHERE parent_product_id IS NOT NULL )
SELECT product_name FROM Products WHERE parent_product_id = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE parent_product_id = 'Hardware' )
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT t2.customer_id, t2.customer_name, t2.customer_phone, t2.customer_email FROM Customer_Orders AS t1 JOIN Customers AS t2 ON t1.customer_id = t2.customer_id GROUP BY t2.customer_id, t2.customer_name, t2.customer_phone, t2.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS customers_without_orders FROM Customers AS c LEFT JOIN Customer_Orders AS o ON o.customer_id = c.customer_id WHERE o.order_id IS NULL
SELECT COUNT(*) FROM Customers c LEFT JOIN Customer_Orders co ON co.customer_id = c.customer_id WHERE co.order_id IS NULL
SELECT DISTINCT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_date HAVING MAX(CAST(T2.order_quantity AS INTEGER)) > 6 OR COUNT(DISTINCT T2.product_id) > 3
SELECT o.order_id, o.date_order_placed FROM Orders AS o JOIN Order_Items AS oi ON oi.order_id = o.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(oi.order_item_id) > 6 OR COUNT(DISTINCT oi.product_id) > 3
SELECT r.Capital FROM region AS r JOIN building AS b ON b.Region_ID = r.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Capital FROM region AS r JOIN building AS b ON b.Region_ID = r.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.* FROM Customers AS C JOIN Customer_Orders AS CO ON CO.customer_id = C.customer_id GROUP BY C.customer_id, C.customer_number, C.customer_name, C.customer_address, C.customer_phone, C.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.* FROM Customers AS c JOIN Customer_Orders AS co ON co.customer_id = c.customer_id GROUP BY c.customer_id, c.customer_number, c.customer_name, c.customer_address, c.customer_phone, c.customer_email ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T2.Customer_Details FROM Customers_and_Services AS T1 JOIN Customers AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T1.Service_ID) DESC LIMIT 1
SELECT DISTINCT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON cs.Customer_ID = c.Customer_ID WHERE cs.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(service_usage_count) FROM ( SELECT COUNT(*) AS service_usage_count FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT customer_id, customer_number, customer_name, customer_address, customer_phone, customer_email FROM Customers WHERE 0
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT CAS.Service_ID FROM Customers_and_Services AS CAS JOIN Customers AS C ON CAS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' ) OR Service_ID IN ( SELECT CI.Service_ID FROM Customer_Interactions AS CI WHERE CI.Status_Code = 'good' )
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' UNION SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T4 ON T1.Service_ID = T4.Service_ID WHERE T4.Status_Code = 'good'
SELECT DISTINCT s.Service_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON cs.Customer_ID = c.Customer_ID JOIN Services AS s ON s.Service_ID = cs.Service_ID JOIN Customer_Interactions AS ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT DISTINCT s.Service_Details FROM Customers c JOIN Customers_and_Services cs ON cs.Customer_ID = c.Customer_ID JOIN Services s ON s.Service_ID = cs.Service_ID JOIN Customer_Interactions ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT Model AS name, Power AS type_of_powertrain, Total_Production AS annual_fuel_cost FROM vehicle WHERE Build_Year IN ('2013','2014')
SELECT Model AS Name, Power AS Powertrain_Type, Top_Speed AS Yearly_Fuel_Cost FROM vehicle WHERE Build_Year IN ('2013', '2014')
SELECT v.name, v.Model_year FROM Vehicles AS v JOIN Renting_history AS rh ON rh.vehicles_id = v.id GROUP BY v.id, v.name, v.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT v.name, v.Model_year FROM Vehicles AS v JOIN Renting_history AS rh ON rh.vehicles_id = v.id GROUP BY v.id, v.name, v.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.name FROM Discount AS d JOIN Renting_history AS r ON r.discount_id = d.id GROUP BY d.id, d.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.name FROM Discount AS D JOIN Renting_history AS R ON R.discount_id = D.id GROUP BY D.id, D.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT S.bio_data, S.student_id FROM Students AS S JOIN Classes AS C ON C.student_id = S.student_id LEFT JOIN Detention AS D ON D.student_id = S.student_id GROUP BY S.student_id, S.bio_data HAVING COUNT(DISTINCT C.class_id) >= 2 AND COUNT(DISTINCT D.detention_id) < 2
SELECT s.bio_data, s.student_id FROM Students AS s LEFT JOIN Classes AS c ON c.student_id = s.student_id LEFT JOIN Detention AS d ON d.student_id = s.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(DISTINCT c.class_id) >= 2 OR COUNT(DISTINCT d.detention_id) < 2
SELECT DISTINCT T.teacher_details FROM Teachers AS T JOIN Classes AS C ON C.teacher_id = T.teacher_id WHERE C.class_details LIKE '%data%' AND T.teacher_id NOT IN ( SELECT C2.teacher_id FROM Classes AS C2 WHERE C2.class_details LIKE 'net%' )
SELECT DISTINCT t.teacher_details FROM Teachers AS t JOIN Classes AS c_data ON c_data.teacher_id = t.teacher_id WHERE lower(c_data.class_details) LIKE '%data%' AND NOT EXISTS ( SELECT 1 FROM Classes AS c_net WHERE c_net.teacher_id = t.teacher_id AND lower(c_net.class_details) LIKE 'net%' )
SELECT L.amount_of_loan, L.date_of_loan FROM Student_Loans AS L JOIN Achievements AS A ON L.student_id = A.student_id GROUP BY L.student_loan_id HAVING COUNT(A.achievement_id) >= 2
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans AS sl JOIN ( SELECT a.student_id FROM Achievements AS a GROUP BY a.student_id HAVING COUNT(*) >= 2 ) AS aa ON sl.student_id = aa.student_id
SELECT t.teacher_id, t.teacher_details FROM Teachers AS t JOIN Classes AS c ON c.teacher_id = t.teacher_id GROUP BY t.teacher_id, t.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT T.teacher_id, T.teacher_details FROM Teachers AS T JOIN Classes AS C ON C.teacher_id = T.teacher_id GROUP BY T.teacher_id, T.teacher_details ORDER BY COUNT(C.class_id) DESC LIMIT 1
SELECT s.bio_data, s.student_details FROM Students AS s JOIN Behaviour_Monitoring AS bm ON bm.student_id = s.student_id WHERE bm.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(DISTINCT student_id) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ) ) ) AND bm.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) GROUP BY s.student_id, s.bio_data, s.student_details
SELECT DISTINCT S.bio_data, S.student_details FROM Students AS S JOIN Behaviour_Monitoring AS BM ON BM.student_id = S.student_id WHERE BM.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND S.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT s.bio_data FROM Students AS s JOIN Behaviour_Monitoring AS bm ON bm.student_id = s.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(*) > 0 AND SUM(CASE WHEN bm.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) THEN 1 ELSE 0 END) = COUNT(*)
SELECT DISTINCT S.bio_data FROM Students AS S JOIN Behaviour_Monitoring AS BM ON BM.student_id = S.student_id WHERE BM.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT T1.student_id) AS number_of_students, T1.event_type_code, T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code, T2.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT SE.student_id) AS number_of_students, SE.event_type_code, RET.event_type_description FROM Student_Events AS SE JOIN Ref_Event_Types AS RET ON SE.event_type_code = RET.event_type_code GROUP BY SE.event_type_code, RET.event_type_description ORDER BY COUNT(DISTINCT SE.student_id) DESC LIMIT 1
SELECT 0 AS teacher_count
SELECT COUNT(DISTINCT c.teacher_id) FROM Classes AS c JOIN Students AS s ON c.student_id = s.student_id LEFT JOIN Achievements AS a ON a.student_id = s.student_id WHERE a.achievement_id IS NULL
SELECT r.detention_type_code, r.detention_type_description FROM Ref_Detention_Type AS r JOIN Detention AS d ON d.detention_type_code = r.detention_type_code GROUP BY r.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT r.detention_type_code, r.detention_type_description FROM Ref_Detention_Type AS r JOIN Detention AS d ON d.detention_type_code = r.detention_type_code GROUP BY r.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON sl.student_id = s.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON sl.student_id = s.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Classes c ON c.student_id = tr.student_id JOIN Teachers t ON t.teacher_id = c.teacher_id WHERE tr.student_id IN ( SELECT student_id FROM Transcripts WHERE date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts) )
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Classes c ON c.student_id = tr.student_id JOIN Teachers t ON t.teacher_id = c.teacher_id WHERE tr.student_id IN ( SELECT student_id FROM Transcripts WHERE date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts) )
SELECT sa.address_type_code, rat.address_type_description, COUNT(*) AS usage_count FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY usage_count DESC LIMIT 1
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
