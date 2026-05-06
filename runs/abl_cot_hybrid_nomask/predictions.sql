SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT 1
SELECT AVG(product_price) FROM Products
SELECT AVG(T2.product_price) FROM Products T1 JOIN Products T2 ON T1.product_id = T2.parent_product_id WHERE T1.parent_product_id IS NOT NULL
SELECT AVG(product_price) FROM Products
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel WHERE Digital_terrestrial_channel IS NOT NULL
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT COUNT(Radio_ID) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(ID) > 3
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT COUNT(Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT COUNT(Exam_ID) FROM Exams
SELECT COUNT(Exam_ID) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Student_Assessments ON Student_Answers.Student_Answer_ID = Student_Assessments.Student_Answer_ID WHERE Student_Assessments.Assessment = 'Normal'
SELECT DISTINCT Student_Answers.Student_Answer_Text FROM Student_Answers JOIN Student_Assessments ON Student_Answers.Student_Answer_ID = Student_Assessments.Student_Answer_ID WHERE Student_Assessments.Assessment = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT COALESCE(Comments, '')) FROM Student_Answers
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M'
SELECT q.Type_of_Question_Code, COUNT(qi.Question_ID) as Question_Count FROM Questions q JOIN Questions_in_Exams qi ON q.Question_ID = qi.Question_ID GROUP BY q.Type_of_Question_Code HAVING COUNT(qi.Question_ID) >= 3
SELECT Type_of_Question_Code FROM Questions JOIN Questions_in_Exams ON Questions.Question_ID = Questions_in_Exams.Question_ID GROUP BY Type_of_Question_Code HAVING COUNT(Questions_in_Exams.Question_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(product_id) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM (SELECT Name FROM player WHERE Earnings IS NOT NULL ORDER BY Earnings DESC LIMIT 1) AS subquery
SELECT p.Name, c.Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID
SELECT p.Name, c.Name AS Club_Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID
SELECT c.Name FROM club c JOIN ( SELECT p.Club_ID FROM player p GROUP BY p.Club_ID HAVING COUNT(CASE WHEN p.Wins_count > 2 THEN 1 END) > 0 ) AS t ON c.Club_ID = t.Club_ID
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name HAVING COUNT(p.Player_ID) > 2
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce'
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce'
SELECT Manufacturer, COUNT(Club_ID) as Club_Count FROM club GROUP BY Manufacturer ORDER BY Club_Count DESC
SELECT Manufacturer, COUNT(Club_ID) as count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT o.order_id, o.order_status_code, COUNT(p.product_id) AS num_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.order_status_code ORDER BY o.order_id
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS num_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(oi.order_item_id) >= 2
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN ( SELECT order_id, COUNT(*) as product_count FROM Order_Items GROUP BY order_id ) oi ON o.order_id = oi.order_id WHERE oi.product_count >= 2 ORDER BY o.order_id, o.date_order_placed
SELECT C.gender_code, COUNT(O.order_id) AS order_count FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id GROUP BY C.gender_code
SELECT c.gender, COUNT(o.order_id) AS order_count FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id GROUP BY c.gender
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name, PPM.payment_method_code FROM Customers C JOIN Customer_Payment_Methods PPM ON C.customer_id = PPM.customer_id
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name, CMP.payment_method_code FROM Customers C INNER JOIN Customer_Payment_Methods CMP ON C.customer_id = CMP.customer_id
SELECT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipments s ON oi.order_item_id = s.shipment_id JOIN Orders o ON s.order_id = o.order_id WHERE oi.order_item_status_code IS NOT NULL ORDER BY s.shipment_date
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipments s ON oi.order_id = s.order_id WHERE s.shipment_date IS NOT NULL
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders ORDER BY date_order_placed
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE county = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE county = 'United States'
SELECT p.product_id, p.product_description FROM Products p JOIN ( SELECT product_id, COUNT(*) as count FROM Order_Items GROUP BY product_id HAVING COUNT(*) > 3 ) oi ON p.product_id = oi.product_id
SELECT p.product_id, p.product_description FROM Products p JOIN ( SELECT product_id, COUNT(*) as count FROM Order_Items GROUP BY product_id HAVING COUNT(*) > 3 ) oi ON p.product_id = oi.product_id
SELECT i.invoice_date, i.invoice_number FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number HAVING COUNT(s.invoice_number) >= 2
SELECT I.invoice_date, I.invoice_number FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number, I.invoice_date HAVING COUNT(S.shipment_id) >= 2 ORDER BY I.invoice_date
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT T1.Title FROM program AS T1 WHERE T1.Start_Year = (SELECT MAX(Start_Year) FROM program)
SELECT c.Name, c.Internet FROM channel c JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID HAVING COUNT(p.Program_ID) > 1
SELECT c.Name, COUNT(p.Program_ID) as Program_Count FROM channel c JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Name
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT r.Transmitter FROM radio r WHERE r.ERP_kW > 150 OR r.ERP_kW < 30
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT Affiliation, COUNT(*) as count FROM city_channel GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT r.Transmitter, cc.City FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel cc ON ccr.City_channel_ID = cc.ID
SELECT r.Transmitter, COUNT(*) as num_city_channels FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel cc ON ccr.City_channel_ID = cc.ID GROUP BY r.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT Driver_ID) FROM (SELECT Driver_ID FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012')
SELECT COUNT(DISTINCT Driver_ID) FROM (SELECT Driver_ID FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012')
SELECT Model FROM vehicle WHERE Total_Production > '100' OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT v.Model, v.Build_Year FROM vehicle v WHERE v.Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT d.Racing_Series, COUNT(*) as Driver_Count FROM driver d GROUP BY d.Racing_Series
SELECT Racing_Series, COUNT(*) as Driver_Count FROM driver GROUP BY Racing_Series
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != 'Database'
SELECT q.Type_of_Question_Code, COUNT(qi.Question_ID) as count FROM Questions_in_Exams qi JOIN Questions q ON qi.Question_ID = q.Question_ID GROUP BY q.Type_of_Question_Code ORDER BY count DESC
SELECT Type_of_Question_Code, COUNT(Question_ID) AS Count FROM Questions GROUP BY Type_of_Question_Code ORDER BY COUNT(Question_ID) DESC
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text, COUNT(*) as Frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT S.First_Name, SA.Date_of_Answer FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID
SELECT S.First_Name, SA.Date_of_Answer FROM Student_Answers SA JOIN Students S ON SA.Student_ID = S.Student_ID
SELECT S.Email_Adress, SA.Date_of_Answer FROM Students S INNER JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID ORDER BY SA.Date_of_Answer DESC
SELECT S.Email_Adress, SA.Date_of_Answer FROM Student_Answers SA JOIN Students S ON SA.Student_ID = S.Student_ID ORDER BY SA.Date_of_Answer DESC
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(T1.Student_ID) >= 2
SELECT s.First_Name FROM Students s JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID GROUP BY s.Student_ID HAVING COUNT(sa.Student_ID) >= 2
SELECT Gender_MFU, COUNT(Student_ID) as Student_Count FROM Students GROUP BY Gender_MFU ORDER BY Student_Count ASC
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT T1.Country FROM player AS T1 WHERE T1.Wins_count > 2 ORDER BY T1.Earnings DESC LIMIT 1
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY AVG(p.Earnings) DESC
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY AVG(p.Earnings) DESC
SELECT Manufacturer, COUNT(*) as count FROM club GROUP BY Manufacturer ORDER BY count DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(Manufacturer) DESC LIMIT 1
SELECT c.Name FROM club c LEFT JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Player_ID IS NULL
SELECT c.Name FROM club c WHERE c.Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings > 1400000 UNION SELECT Country FROM player WHERE Earnings < 1100000 ORDER BY Country ASC
SELECT T1.Country FROM player AS T1 WHERE T1.Earnings > 1400000 INTERSECT SELECT T1.Country FROM player AS T1 WHERE T1.Earnings < 1100000
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR (SELECT COUNT(*) FROM Order_Items WHERE Order_Items.order_id = Orders.order_id) > 1
SELECT MIN(date_order_placed) AS earliest_order_date, date_order_placed FROM Orders WHERE order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1 )
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(DISTINCT oi.order_id) < 2
SELECT payment_method_code, COUNT(customer_id) as count FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT payment_method_code, COUNT(customer_id) as count FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT C.gender_code, COUNT(DISTINCT P.product_id) AS num_products FROM Customers C LEFT JOIN Products P ON C.customer_id = P.product_id GROUP BY C.gender_code
SELECT product_color, COUNT(*) as product_count FROM Products GROUP BY product_color ORDER BY product_count DESC
SELECT P.product_name, S.shipment_date FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id
SELECT P.product_name, S.shipment_date FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id WHERE S.shipment_date IS NOT NULL ORDER BY S.shipment_date, P.product_name
SELECT P.product_name, P.product_color FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id WHERE S.shipment_id IS NOT NULL ORDER BY P.product_name
SELECT P.product_name, P.product_color FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id
SELECT i.invoice_status_code FROM Invoices i WHERE i.invoice_number NOT IN ( SELECT s.invoice_number FROM Shipments s JOIN Orders o ON s.order_id = o.order_id )
SELECT i.invoice_status_code FROM Invoices i WHERE i.invoice_number NOT IN (SELECT s.invoice_number FROM Shipments s)
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_amount_paid FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed ORDER BY o.order_id
SELECT T1.product_name, T1.product_price, T2.product_name AS buyer_first_name FROM Products T1 JOIN Products T2 ON T1.product_id = T2.product_id
SELECT buyer_first_name, product_name FROM Orders, Products WHERE Orders.product_id = Products.product_id
SELECT T2.date_order_placed FROM ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) >= 2 ) AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Customers AS T3 ON T2.customer_id = T3.customer_id ORDER BY T2.date_order_placed ASC
SELECT T2.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id JOIN ( SELECT customer_id, COUNT(*) AS payment_method_count FROM Customer_Payment_Methods GROUP BY customer_id ) AS T3 ON T1.customer_id = T3.customer_id WHERE T3.payment_method_count >= 2
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT c.Channel_ID, c.Name FROM channel c WHERE c.Channel_ID NOT IN ( SELECT da.Channel_ID FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Name = 'Hank Baskett' )
SELECT Affiliation, COUNT(*) as count FROM city_channel GROUP BY Affiliation ORDER BY count DESC LIMIT 1
SELECT r.Transmitter, c.Station_name FROM city_channel c JOIN city_channel_radio cc_r ON c.ID = cc_r.City_channel_ID JOIN radio r ON cc_r.Radio_ID = r.Radio_ID ORDER BY r.ERP_kW DESC
SELECT DISTINCT Transmitter FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID WHERE city_channel_radio.City_channel_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM (SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1) AS subquery
SELECT driver.Driver_ID, MAX(COUNT(vehicle_driver.Driver_ID)) as max_driven FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY COUNT(vehicle_driver.Driver_ID) DESC LIMIT 1
SELECT d.Driver_ID, COUNT(vd.Vehicle_ID) as vehicle_count FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID GROUP BY d.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT v.Vehicle_ID FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID ORDER BY COUNT(vd.Driver_ID) ASC LIMIT 1
SELECT DISTINCT D.Name FROM driver D JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Power > 5000
SELECT D.Name FROM driver D JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Power > 5000
SELECT Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT vehicle.Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN ( SELECT Driver_ID, Vehicle_ID, COUNT(*) as Driver_Count FROM vehicle_driver GROUP BY Driver_ID, Vehicle_ID HAVING COUNT(*) > 1 ) vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Builder = 'Ziyang' UNION SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Builder = 'Ziyang'
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN ( SELECT Vehicle_ID FROM vehicle WHERE Builder = 'Ziyang' UNION SELECT vd.Vehicle_ID FROM vehicle_driver vd GROUP BY vd.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) = 2 ) AS t ON v.Vehicle_ID = t.Vehicle_ID
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT D.Name, D.Citizenship FROM driver D JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Model = 'DJ1'
SELECT D.Name, D.Citizenship FROM driver D JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Assessment FROM Student_Answers JOIN Student_Assessments ON Student_Answers.Student_Answer_ID = Student_Assessments.Student_Answer_ID GROUP BY Assessment ORDER BY COUNT(Assessment) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(Student_Answer_ID) ASC LIMIT 1
SELECT Valid_Answer_Text, COUNT(*) as count FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count DESC LIMIT 1
SELECT va.Valid_Answer_Text, COUNT(sa.Student_Answer_ID) as frequency FROM Valid_Answers va JOIN Student_Answers sa ON va.Question_ID = sa.Question_ID GROUP BY va.Valid_Answer_Text ORDER BY frequency DESC LIMIT 1
SELECT S.First_Name FROM Students S LEFT JOIN Student_Answers A ON S.Student_ID = A.Student_ID WHERE A.Student_Answer_ID IS NULL
SELECT T1.First_Name FROM Students T1 LEFT JOIN Student_Answers T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_ID IS NULL
SELECT DISTINCT sa.Student_Answer_Text FROM Student_Answers sa JOIN Student_Assessments saa ON sa.Student_Answer_ID = saa.Student_Answer_ID WHERE sa.Comments IN ('Normal', 'Absent')
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments LIKE '%Normal%' INTERSECT SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments LIKE '%Absent%'
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM (SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1)
SELECT product_id, product_name FROM (SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1)
SELECT product_type_code FROM ( SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code ORDER BY count DESC ) LIMIT 1
SELECT product_type_code FROM ( SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code ORDER BY count DESC ) LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT payment_method_code FROM (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1) AS subquery
SELECT customer_name FROM ( SELECT payment_method_code, customer_name, COUNT(*) as count FROM Customers GROUP BY payment_method_code ORDER BY count ASC LIMIT 1 ) AS subquery
SELECT customer_name FROM Customers ORDER BY COUNT(DISTINCT payment_method_code) ASC LIMIT 1
SELECT product_type_code FROM ( SELECT product_type_code, COUNT(*) as product_count FROM Products GROUP BY product_type_code ) ORDER BY product_count ASC LIMIT 1
SELECT product_type_code FROM ( SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code ) as subquery ORDER BY count ASC LIMIT 1
SELECT order_status_code, COUNT(*) as count FROM Customer_Orders GROUP BY order_status_code ORDER BY count DESC
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) DESC LIMIT 1
SELECT P.product_name FROM Products P WHERE P.product_id NOT IN (SELECT OI.product_id FROM Order_Items OI)
SELECT P.product_name FROM Products P LEFT JOIN Order_Items OI ON P.product_id = OI.product_id WHERE OI.order_id IS NULL
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id, C.customer_first_name, C.customer_last_name HAVING COUNT(O.order_id) > 2 AND COUNT(OI.order_item_id) >= 3
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN ( SELECT O.customer_id, COUNT(*) as order_count, COUNT(DISTINCT OI.order_item_id) as item_count FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(DISTINCT OI.order_item_id) >= 3 ) AS T ON C.customer_id = T.customer_id
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_last_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN ( SELECT oi.product_id, COUNT(oi.order_id) as order_count FROM Order_Items oi GROUP BY oi.product_id HAVING COUNT(oi.order_id) < 2 ) o ON p.product_id = o.product_id
SELECT p.product_id, p.product_name, p.product_price FROM ( SELECT product_id, COUNT(*) AS count FROM Order_Items GROUP BY product_id ) AS subquery JOIN Products p ON subquery.product_id = p.product_id WHERE subquery.count = ( SELECT MAX(count) FROM ( SELECT product_id, COUNT(*) AS count FROM Order_Items GROUP BY product_id ) AS subquery2 )
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN ( SELECT product_id, COUNT(*) as order_count FROM Order_Items GROUP BY product_id ORDER BY order_count DESC LIMIT 1 ) o ON p.product_id = o.product_id
SELECT order_id, SUM(product_price) AS sum_of_product_prices FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY order_id ORDER BY sum_of_product_prices ASC LIMIT 1
SELECT o.order_id, SUM(CASE WHEN oi.order_item_status_code = 'active' AND oi.product_id = 1 THEN 10 ELSE 0 END) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'F'
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN ( SELECT product_id FROM ( SELECT product_id, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY product_id) as row_num FROM ( SELECT c.customer_id, p.product_id FROM Customers c JOIN Products p ON c.customer_id = p.parent_product_id ) subquery ) subquery2 WHERE row_num = 1 ) subquery ON p.product_id = subquery.product_id JOIN Customers c ON p.product_id = c.customer_id WHERE c.gender_code = 'F'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE parent_product_id IS NULL OR parent_product_id = ''
SELECT COUNT(*) FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_item_id IS NULL
SELECT COUNT(customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customers.customer_id IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code = ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(customer_id) ASC LIMIT 1 )
SELECT C.email_address, C.town_city, C.county FROM Customers C JOIN ( SELECT gender_code FROM ( SELECT gender_code, COUNT(order_id) as order_count FROM Orders GROUP BY gender_code ) subquery WHERE order_count = ( SELECT MIN(order_count) FROM ( SELECT gender_code, COUNT(order_id) as order_count FROM Orders GROUP BY gender_code ) subquery2 ) ) subquery3 ON C.gender_code = subquery3.gender_code
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price != (SELECT MAX(product_price) FROM Products)
SELECT d.Name, COUNT(p.Program_ID) as Program_Count FROM director d JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Name ORDER BY Program_Count DESC LIMIT 1
SELECT d.Name, d.Age FROM director d JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Name, d.Age ORDER BY COUNT(p.Program_ID) DESC LIMIT 1
SELECT COUNT(channel.Channel_ID) FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Program_ID IS NULL
SELECT c.Name, c.Internet FROM channel c JOIN director_admin da ON c.Channel_ID = da.Channel_ID GROUP BY c.Channel_ID ORDER BY COUNT(da.Director_ID) DESC LIMIT 1
SELECT DISTINCT C.Name FROM channel C JOIN director_admin DA ON C.Channel_ID = DA.Channel_ID JOIN director D ON DA.Director_ID = D.Director_ID WHERE EXISTS (SELECT 1 FROM director D2 WHERE D2.Director_ID = DA.Director_ID AND D2.Age < 40) AND EXISTS (SELECT 1 FROM director D3 WHERE D3.Director_ID = DA.Director_ID AND D3.Age > 60)
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IN ( SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon' ) UNION SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID, vd.Driver_ID HAVING COUNT(DISTINCT vd.Driver_ID) > 2
SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Vehicle_ID IN ( SELECT vd.Vehicle_ID FROM vehicle_driver vd JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' UNION SELECT vd.Vehicle_ID FROM vehicle_driver vd GROUP BY vd.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) > 2 )
SELECT COUNT(Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT product_name FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware' )
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN ( SELECT customer_id, COUNT(order_id) as order_count FROM Customer_Orders GROUP BY customer_id ORDER BY order_count DESC LIMIT 1 ) o ON c.customer_id = o.customer_id
SELECT C.customer_id, C.customer_name, C.customer_phone, C.customer_email FROM Customers C JOIN ( SELECT customer_id, COUNT(order_id) as order_count FROM Customer_Orders GROUP BY customer_id ORDER BY order_count DESC LIMIT 1 ) O ON C.customer_id = O.customer_id
SELECT COUNT(Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT COUNT(c.customer_id) FROM Customers c LEFT JOIN Customer_Orders co ON c.customer_id = co.customer_id WHERE co.customer_id IS NULL
SELECT CO.order_date, CO.order_id FROM Customer_Orders CO JOIN Order_Items OI ON CO.order_id = OI.order_id GROUP BY CO.order_id HAVING COUNT(DISTINCT OI.product_id) > 3 OR MAX(OI.order_quantity) > 6 ORDER BY CO.order_date
SELECT CO.order_id, CO.order_date FROM Customer_Orders CO WHERE CO.order_id IN ( SELECT OI.order_id FROM Order_Items OI WHERE OI.order_quantity > 6 UNION SELECT OI.order_id FROM Order_Items OI GROUP BY OI.order_id HAVING COUNT(*) > 3 ) ORDER BY CO.order_id
SELECT T2.Capital FROM region AS T2 JOIN ( SELECT Region_ID, COUNT(Building_ID) AS Count FROM building GROUP BY Region_ID ORDER BY Count DESC LIMIT 1 ) AS T1 ON T1.Region_ID = T2.Region_ID
SELECT r.Name, r.Capital FROM region r JOIN building b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(b.Building_ID) DESC LIMIT 1
SELECT C.Customer_ID, C.Customer_Details FROM Customers C JOIN ( SELECT Customer_ID, COUNT(*) as Service_Count FROM Customers_and_Services GROUP BY Customer_ID ORDER BY Service_Count DESC LIMIT 1 ) AS T ON C.Customer_ID = T.Customer_ID
SELECT c.Customer_Details, COUNT(cs.Customers_and_Services_ID) as service_count FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID ORDER BY service_count DESC LIMIT 1
SELECT C.Customer_Details FROM Customers C JOIN ( SELECT Customer_ID, COUNT(DISTINCT Service_ID) as service_count FROM Customers_and_Services GROUP BY Customer_ID ORDER BY service_count DESC LIMIT 1 ) AS subquery ON C.Customer_ID = subquery.Customer_ID
SELECT C.Customer_Details, COUNT(DISTINCT CS.Service_ID) as num_services FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID GROUP BY C.Customer_ID, C.Customer_Details ORDER BY num_services DESC LIMIT 1
SELECT C.Customer_Details, CAS.Service_ID FROM Customers C JOIN Customers_and_Services CAS ON C.Customer_ID = CAS.Customer_ID JOIN ( SELECT Service_ID, COUNT(*) as count FROM Customers_and_Services GROUP BY Service_ID ORDER BY count ASC LIMIT 1 ) AS subquery ON CAS.Service_ID = subquery.Service_ID
SELECT DISTINCT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID JOIN Services S ON CS.Service_ID = S.Service_ID JOIN ( SELECT Service_ID, COUNT(*) as count FROM Customers_and_Services GROUP BY Service_ID ORDER BY count ASC LIMIT 1 ) AS least_common_service ON S.Service_ID = least_common_service.Service_ID
SELECT Service_ID, Service_Details FROM Services WHERE Service_ID IN ( SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good' ) UNION SELECT Service_ID, Service_Details FROM Services WHERE Service_ID IN ( SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID = ( SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch' ) )
SELECT S.Service_ID, S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' UNION SELECT S.Service_ID, S.Service_Details FROM Services S JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID WHERE CI.Status_Code = 'good'
SELECT T3.Service_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T2.Service_ID = T3.Service_ID JOIN Customer_Interactions AS T4 ON T3.Service_ID = T4.Service_ID WHERE T1.Customer_Details = 'Hardy Kutch' AND T4.Status_Code = 'bad'
SELECT T3.Service_Details FROM Customers_and_Services AS T1 JOIN Customers AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Customer_Interactions AS T4 ON T1.Customer_ID = T4.Customer_ID JOIN Services AS T3 ON T4.Service_ID = T3.Service_ID WHERE T2.Customer_Details = 'Hardy Kutch' AND T4.Status_Code = 'bad'
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT V.name, V.Model_year FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.id, V.name ORDER BY COUNT(RH.id) DESC LIMIT 1
SELECT V.name, V.Model_year FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.id ORDER BY COUNT(RH.id) DESC LIMIT 1
SELECT D.name FROM Discount D JOIN Renting_history RH ON D.id = RH.discount_id GROUP BY D.name ORDER BY COUNT(RH.id) DESC LIMIT 1
SELECT D.name FROM Discount D JOIN Renting_history RH ON D.id = RH.discount_id GROUP BY D.name ORDER BY COUNT(RH.id) DESC LIMIT 1
SELECT S.bio_data, S.student_id FROM Students S JOIN Classes C ON S.student_id = C.student_id JOIN Detention D ON S.student_id = D.student_id GROUP BY S.student_id HAVING COUNT(C.class_id) >= 2 AND COUNT(D.detention_id) < 2
SELECT S.bio_data, S.student_id FROM Students S WHERE S.student_id IN ( SELECT C.student_id FROM Classes C GROUP BY C.student_id HAVING COUNT(C.student_id) >= 2 ) OR S.student_id IN ( SELECT D.student_id FROM Detention D GROUP BY D.student_id HAVING COUNT(D.detention_id) < 2 )
SELECT T.teacher_details FROM Teachers T WHERE T.teacher_id IN ( SELECT C.teacher_id FROM Classes C WHERE C.class_details LIKE '%data%' AND C.class_details NOT LIKE 'net%' GROUP BY C.teacher_id HAVING COUNT(C.class_details) > 0 )
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.teacher_id NOT IN ( SELECT T2.teacher_id FROM Classes AS T2 WHERE T2.class_details LIKE 'net%' )
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(achievement_id) >= 2 ) AS T3 ON T2.student_id = T3.student_id ORDER BY T2.student_id, T1.date_of_loan
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(achievement_id) >= 2 ) AS T3 ON T2.student_id = T3.student_id
SELECT T1.teacher_id, T1.teacher_details, COUNT(*) as class_count FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id, T1.teacher_details ORDER BY class_count DESC LIMIT 1
SELECT T1.teacher_details, T1.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id, T1.teacher_details ORDER BY COUNT(T2.class_id) DESC LIMIT 1
SELECT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring BM ON S.student_id = BM.student_id WHERE BM.behaviour_monitoring_details IN ( SELECT BM2.behaviour_monitoring_details FROM Behaviour_Monitoring BM2 GROUP BY BM2.behaviour_monitoring_details HAVING COUNT(BM2.behaviour_monitoring_details) = ( SELECT MAX(count) FROM ( SELECT behaviour_monitoring_details, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ) T ) INTERSECT SELECT BM3.behaviour_monitoring_details FROM Behaviour_Monitoring BM3 GROUP BY BM3.behaviour_monitoring_details HAVING COUNT(BM3.behaviour_monitoring_details) = 3 )
SELECT S.bio_data, S.student_details FROM Students S JOIN ( SELECT BM.behaviour_monitoring_details FROM Behaviour_Monitoring BM GROUP BY BM.behaviour_monitoring_details ORDER BY COUNT(BM.student_id) DESC LIMIT 1 ) AS T ON S.student_id = T.behaviour_monitoring_details WHERE S.student_id IN ( SELECT BM.student_id FROM Behaviour_Monitoring BM GROUP BY BM.behaviour_monitoring_details HAVING COUNT(BM.student_id) = 3 )
SELECT S.student_id, S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring BM ON S.student_id = BM.student_id GROUP BY S.student_id, BM.behaviour_monitoring_details HAVING COUNT(BM.behaviour_monitoring_details) = ( SELECT MAX(count) FROM ( SELECT student_id, COUNT(behaviour_monitoring_details) as count FROM Behaviour_Monitoring GROUP BY student_id ) AS subquery )
SELECT S.bio_data FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id GROUP BY B.behaviour_monitoring_details ORDER BY COUNT(B.behaviour_monitoring_details) DESC LIMIT 1
SELECT COUNT(DISTINCT se.student_id) AS num_students, rt.event_type_description, se.event_type_code FROM Student_Events se JOIN Ref_Event_Types rt ON se.event_type_code = rt.event_type_code GROUP BY se.event_type_code ORDER BY COUNT(se.student_id) DESC LIMIT 1
SELECT e.event_type_code, e.event_type_description, COUNT(DISTINCT se.student_id) AS num_students FROM Student_Events se JOIN Ref_Event_Types e ON se.event_type_code = e.event_type_code GROUP BY e.event_type_code, e.event_type_description ORDER BY num_students DESC LIMIT 1
SELECT COUNT(DISTINCT T1.student_id) FROM Students T1 JOIN Students_Addresses T2 ON T1.student_id = T2.student_id WHERE T1.student_id NOT IN ( SELECT student_id FROM Achievements )
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers T1 JOIN Classes C ON T1.teacher_id = C.teacher_id JOIN Students S ON C.student_id = S.student_id LEFT JOIN Achievements A ON S.student_id = A.student_id WHERE A.achievement_id IS NULL
SELECT rt.detention_type_code, rt.detention_type_description FROM Ref_Detention_Type rt GROUP BY rt.detention_type_code ORDER BY COUNT(rt.detention_type_code) ASC LIMIT 1
SELECT detention_type_code, detention_type_description FROM Ref_Detention_Type ORDER BY (SELECT COUNT(detention_type_code) FROM Detention WHERE detention_type_code = Ref_Detention_Type.detention_type_code) ASC LIMIT 1
SELECT S.bio_data, S.student_details, SL.amount_of_loan FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT s.bio_data, s.student_details FROM Students s JOIN Student_Loans sl ON s.student_id = sl.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT T4.teacher_details FROM Transcripts T1 JOIN Students T2 ON T1.student_id = T2.student_id JOIN Classes T3 ON T2.student_id = T3.student_id JOIN Teachers T4 ON T3.teacher_id = T4.teacher_id WHERE T1.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT T2.teacher_details FROM Teachers AS T2 JOIN Classes AS T1 ON T2.teacher_id = T1.teacher_id JOIN ( SELECT student_id, MIN(date_of_transcript) AS min_date FROM Transcripts GROUP BY student_id ) AS T3 ON T1.student_id = T3.student_id WHERE T3.min_date = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT ra.address_type_code, ra.address_type_description, COUNT(*) as count FROM Students_Addresses sa JOIN Ref_Address_Types ra ON sa.address_type_code = ra.address_type_code GROUP BY ra.address_type_code ORDER BY count DESC LIMIT 1
SELECT a.address_type_code, a.address_type_description, COUNT(*) as count FROM Students_Addresses sa JOIN Ref_Address_Types a ON sa.address_type_code = a.address_type_code GROUP BY a.address_type_code, a.address_type_description ORDER BY count DESC LIMIT 1
