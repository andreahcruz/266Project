SELECT COUNT(Club_ID) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC;
SELECT Name FROM club ORDER BY Name ASC;
SELECT Name FROM club WHERE Manufacturer != 'Nike';
SELECT Name FROM club WHERE Manufacturer != 'Nike';
SELECT Name FROM player ORDER BY Wins_count ASC;
SELECT Name FROM player ORDER BY Wins_count ASC;
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000;
SELECT Country FROM player WHERE Earnings > 1200000 GROUP BY Country
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1;
SELECT Manufacturer, COUNT(DISTINCT Club_ID) as count FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Club_ID) > 1 ORDER BY count DESC
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1;
SELECT Country FROM player JOIN club ON player.Club_ID = club.Club_ID GROUP BY Country HAVING COUNT(player.Player_ID) > 1 ORDER BY Country;
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT C.customer_id) FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id;
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items;
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods;
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods;
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT T1.product_id) FROM Products T1 INNER JOIN Order_Items T2 ON T1.product_id = T2.product_id INNER JOIN Shipments T3 ON T2.order_item_id = T3.shipment_id WHERE T3.shipment_date IS NOT NULL;
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products;
SELECT AVG(p.product_price) FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id GROUP BY oi.order_id
SELECT AVG(T2.product_price) FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id
SELECT DISTINCT Digital_terrestrial_channel FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC;
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60;
SELECT COUNT(*) FROM radio;
SELECT r.Transmitter FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID ORDER BY r.ERP_kW ASC;
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC';
SELECT AVG(ERP_kW) FROM radio
SELECT c.Affiliation, COUNT(*) as Count FROM city_channel c LEFT JOIN city_channel_radio cr ON c.ID = cr.City_channel_ID LEFT JOIN city_channel_tv_show ct ON c.ID = ct.City_channel_ID GROUP BY c.Affiliation HAVING COUNT(*) > 3
SELECT Name FROM driver WHERE Citizenship = 'United States';
SELECT Name FROM driver WHERE Citizenship = 'United States';
SELECT COUNT(Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR';
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR';
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC;
SELECT Name FROM driver ORDER BY Name ASC;
SELECT COUNT(*) FROM Exams;
SELECT COUNT(Exam_ID) FROM Exams;
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal';
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers WHERE Comments IS NOT NULL;
SELECT COUNT(DISTINCT Comments) FROM Student_Answers;
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M';
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M';
SELECT T1.Type_of_Question_Code FROM Questions T1 JOIN Questions_in_Exams T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T2.Question_ID) >= 3
SELECT Q.Type_of_Question_Code FROM Questions Q JOIN Questions_in_Exams QIE ON Q.Question_ID = QIE.Question_ID GROUP BY Q.Type_of_Question_Code HAVING COUNT(QIE.Question_ID) >= 3
SELECT * FROM Students;
SELECT s.Student_ID, s.First_Name, s.Middle_Name, s.Last_Name, s.Gender_MFU, s.Student_Address, s.Email_Adress, s.Cell_Mobile_Phone, s.Home_Phone, sa.Student_Answer_ID, sa.Exam_ID, sa.Question_ID, sa.Student_ID, sa.Date_of_Answer, sa.Comments, sa.Satisfactory_YN, sa.Student_Answer_Text, saa.Valid_Answer_ID, saa.Student_Answer_Text AS Assessment, saa.Satisfactory_YN AS Assessment_Satisfactory_YN, saa.Assessment AS Assessment_Comment FROM Students s LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID LEFT JOIN Student_Assessments saa ON sa.Student_Answer_ID = saa.Student_Answer_ID
SELECT COUNT(*) FROM Addresses;
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor';
SELECT product_price FROM Products WHERE product_type_code = 'Monitor';
SELECT AVG(product_price) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE product_type_code = 'Clothes';
SELECT AVG(T2.product_price) FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T2.product_type_code = 'Clothes';
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware';
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware';
SELECT product_name FROM Products ORDER BY product_price DESC;
SELECT product_name FROM Products ORDER BY product_price DESC;
SELECT T1.product_type_code FROM Products T1 JOIN ( SELECT product_id, product_type_code, COUNT(*) as product_count FROM Order_Items GROUP BY product_type_code ) T2 ON T1.product_id = T2.product_id GROUP BY T2.product_type_code HAVING COUNT(T2.product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT COUNT(*) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers;
SELECT DISTINCT payment_method_code FROM Customers;
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(order_id) FROM Customer_Orders;
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders;
SELECT Manager, Captain FROM club;
SELECT Manager, Captain FROM club;
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1;
SELECT Name FROM player WHERE Earnings IS NOT NULL ORDER BY Earnings DESC LIMIT 1;
SELECT p.Name, c.Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID;
SELECT p.Name, c.Name AS Club_Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID;
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID HAVING COUNT(CASE WHEN p.Wins_count > 2 THEN 1 END) > 0;
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce';
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce';
SELECT Manufacturer, COUNT(Club_ID) as Club_Count FROM club GROUP BY Manufacturer ORDER BY Club_Count DESC;
SELECT Manufacturer, COUNT(Club_ID) as count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe';
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe';
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS num_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT O.order_id, O.order_status_code, COUNT(OI.order_item_id) AS num_products FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id HAVING COUNT(oi.order_id) >= 2
SELECT O.order_id, O.date_order_placed FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING COUNT(DISTINCT OI.product_id) >= 2 ORDER BY O.order_id;
SELECT C.gender_code, COUNT(O.order_id) AS num_orders FROM Customers C INNER JOIN Orders O ON C.customer_id = O.customer_id GROUP BY C.gender_code ORDER BY C.gender_code;
SELECT C.gender_code, COUNT(O.order_id) AS order_count FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id GROUP BY C.gender_code
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name, PM.payment_method_code FROM Customers C JOIN Customer_Payment_Methods PM ON C.customer_id = PM.customer_id
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name, CMP.payment_method_code FROM Customers C INNER JOIN Customer_Payment_Methods CMP ON C.customer_id = CMP.customer_id
SELECT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number;
SELECT oi.order_item_status_code, si.shipment_tracking_number FROM Order_Items oi JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments sh ON si.shipment_id = sh.shipment_id JOIN Orders o ON sh.order_id = o.order_id ORDER BY sh.shipment_date;
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id WHERE s.shipment_date IS NOT NULL GROUP BY oi.order_item_id ORDER BY oi.order_item_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%';
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%';
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%';
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%';
SELECT order_status_code, date_order_placed FROM Orders GROUP BY order_status_code, date_order_placed
SELECT order_status_code, date_order_placed FROM Orders ORDER BY date_order_placed;
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA';
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States';
SELECT p.product_id, p.product_description FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id GROUP BY p.product_id HAVING COUNT(oi.order_item_id) > 3 ORDER BY p.product_id;
SELECT p.product_id, p.product_description FROM Products p JOIN ( SELECT oi.product_id FROM Order_Items oi JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id GROUP BY oi.product_id HAVING COUNT(DISTINCT si.shipment_id) > 3 ) AS sold_more_than_3_times ON p.product_id = sold_more_than_3_times.product_id;
SELECT i.invoice_date, i.invoice_number FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number HAVING COUNT(s.shipment_id) >= 2
SELECT i.invoice_number, COUNT(s.shipment_id) AS shipment_count FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number HAVING COUNT(s.shipment_id) >= 2 ORDER BY i.invoice_number;
SELECT shipment_tracking_number, shipment_date FROM Shipments ORDER BY shipment_date;
SELECT shipment_tracking_number, shipment_date FROM Shipments;
SELECT Name FROM director ORDER BY Age DESC LIMIT 1;
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%';
with the director table to get the director's name, but this is not necessary for the
SELECT c.Name, c.Internet FROM channel c JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID HAVING COUNT(p.Program_ID) > 1;
SELECT c.Name, COUNT(p.Program_ID) as Program_Count FROM channel c JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Name, c.Channel_ID
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula';
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT T2.Transmitter FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.City_channel_ID = T2.ID JOIN radio AS T3 ON T1.Radio_ID = T3.Radio_ID WHERE T3.ERP_kW > 150 OR T3.ERP_kW < 30;
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1;
SELECT Affiliation, COUNT(*) as count FROM city_channel GROUP BY Affiliation ORDER BY count DESC;
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC;
SELECT r.Transmitter, cc.City FROM city_channel cc JOIN city_channel_radio ccr ON cc.ID = ccr.City_channel_ID JOIN radio r ON ccr.Radio_ID = r.Radio_ID;
SELECT r.Transmitter, COUNT(*) as City_Channel_Count FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID GROUP BY r.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou';
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996';
SELECT v.Top_Speed, v.Power FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID;
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012';
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = '2012';
SELECT Model FROM vehicle WHERE Total_Production > '100' OR Top_Speed > 150;
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150;
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%';
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%';
SELECT Racing_Series, COUNT(*) as Driver_Count FROM driver GROUP BY Racing_Series ORDER BY Driver_Count DESC LIMIT 10;
SELECT Racing_Series, COUNT(Driver_ID) as Driver_Count FROM driver GROUP BY Racing_Series
SELECT E.Exam_Name, E.Exam_Date FROM Exams E JOIN Questions_in_Exams QIE ON E.Exam_ID = QIE.Exam_ID JOIN Questions Q ON QIE.Question_ID = Q.Question_ID WHERE Q.Type_of_Question_Code != 'Database';
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != 'Database';
SELECT Q.Type_of_Question_Code, COUNT(Q.Question_ID) as Question_Count FROM Questions Q JOIN Questions_in_Exams QIE ON Q.Question_ID = QIE.Question_ID GROUP BY Q.Type_of_Question_Code
SELECT q.Type_of_Question_Code, COUNT(qe.Exam_ID) as count FROM Questions q JOIN Questions_in_Exams qe ON q.Question_ID = qe.Question_ID JOIN Exams e ON qe.Exam_ID = e.Exam_ID GROUP BY q.Type_of_Question_Code ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) as count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC;
SELECT Student_Answer_Text, COUNT(*) as frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC;
SELECT S.First_Name, SA.Date_of_Answer FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID
SELECT S.First_Name, SA.Date_of_Answer FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID
SELECT S.Email_Adress, SA.Date_of_Answer FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID ORDER BY SA.Date_of_Answer DESC;
SELECT S.Email_Adress, SA.Date_of_Answer FROM Student_Answers SA JOIN Students S ON SA.Student_ID = S.Student_ID ORDER BY SA.Date_of_Answer DESC;
SELECT S.First_Name FROM Students S JOIN ( SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2 ) AS T ON S.Student_ID = T.Student_ID
SELECT S.First_Name FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID GROUP BY S.Student_ID HAVING COUNT(SA.Student_ID) >= 2
SELECT Gender_MFU, COUNT(*) as Student_Count FROM Students GROUP BY Gender_MFU ORDER BY Student_Count DESC;
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1;
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 GROUP BY T2.Country ORDER BY MAX(T1.Earnings) DESC LIMIT 1;
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c INNER JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID, c.Name ORDER BY avg_earnings DESC;
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY avg_earnings DESC;
SELECT Manufacturer, COUNT(*) as count FROM club GROUP BY Manufacturer ORDER BY count DESC LIMIT 1
SELECT Manufacturer, COUNT(*) as count FROM club GROUP BY Manufacturer ORDER BY count DESC LIMIT 1
SELECT Name FROM club LEFT JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL;
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player );
SELECT CASE WHEN Earnings > 1400000 THEN 'High Earnings' WHEN Earnings < 1100000 THEN 'Low Earnings' END AS Earnings_Group, Country FROM player GROUP BY Earnings_Group, Country ORDER BY Earnings_Group;
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 INTERSECT SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings < 1100000
SELECT date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY date_order_placed HAVING COUNT(*) > 1 OR date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
SELECT MIN(date_order_placed) AS earliest_order_date, date_order_placed FROM Orders WHERE order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods JOIN Customers ON Customer_Payment_Methods.customer_id = Customers.customer_id GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1;
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT C.gender_code, COUNT(OI.order_item_id) AS num_products FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.gender_code ORDER BY C.gender_code
SELECT C.gender_code, COUNT(DISTINCT O.order_id) AS num_products FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.gender_code ORDER BY C.gender_code
SELECT P.product_name, S.shipment_date FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id
SELECT p.product_name, s.shipment_date FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Shipments sh ON o.order_id = sh.order_id JOIN Shipment_Items si ON sh.shipment_id = si.shipment_id WHERE sh.shipment_date IS NOT NULL GROUP BY s.shipment_date ORDER BY s.shipment_date
SELECT P.product_name, P.product_color FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id WHERE SI.shipment_id IS NOT NULL;
SELECT P.product_name, P.product_color FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipments S ON OI.order_id = S.order_id
SELECT i.invoice_status_code FROM Invoices i JOIN Orders o ON i.invoice_number = o.order_id JOIN Shipments s ON o.order_id = s.order_id WHERE s.shipment_id IS NULL;
SELECT i.invoice_status_code FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number JOIN Orders o ON s.order_id = o.order_id WHERE s.shipment_id IS NULL;
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id JOIN Shipments s ON o.order_id = s.order_id JOIN Invoices i ON s.invoice_number = i.invoice_number GROUP BY o.order_id, o.date_order_placed
SELECT o.order_id, o.date_order_placed, SUM(i.invoice_status_code = 'PAID' THEN i.invoice_number * p.product_price ELSE 0 END) AS total_amount_paid FROM Orders o JOIN Shipments s ON o.order_id = s.order_id JOIN Invoices i ON s.invoice_number = i.invoice_number JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT o.date_order_placed FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_id IN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) >= 2 ) GROUP BY o.date_order_placed ORDER BY o.date_order_placed ASC;
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id JOIN ( SELECT customer_id, COUNT(*) as payment_method_count FROM Customer_Payment_Methods GROUP BY customer_id ) AS T3 ON T2.customer_id = T3.customer_id WHERE T3.payment_method_count >= 2 ORDER BY T1.date_order_placed;
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1;
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1;
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director);
SELECT c.Channel_ID, c.Name FROM channel c JOIN director_admin da ON c.Channel_ID = da.Channel_ID JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Name != 'Hank Baskett';
SELECT Affiliation, COUNT(*) as count FROM city_channel GROUP BY Affiliation ORDER BY count DESC LIMIT 1
SELECT r.Transmitter, c.Station_name FROM radio r JOIN city_channel_radio cr ON r.Radio_ID = cr.Radio_ID JOIN city_channel c ON cr.City_channel_ID = c.ID ORDER BY r.ERP_kW DESC;
SELECT DISTINCT T1.Transmitter FROM radio AS T1 LEFT JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID WHERE T2.Radio_ID IS NULL;
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1;
SELECT Model FROM vehicle WHERE Power > 6000 AND Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000 )
SELECT Driver_ID, COUNT(*) as count FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID GROUP BY Driver_ID ORDER BY count DESC LIMIT 1;
SELECT Driver_ID, COUNT(*) as vehicle_count FROM vehicle_driver GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1;
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM ( SELECT Vehicle_ID, COUNT(*) as count FROM vehicle_driver GROUP BY Vehicle_ID ) WHERE count = (SELECT MIN(count) FROM ( SELECT Vehicle_ID, COUNT(*) as count FROM vehicle_driver GROUP BY Vehicle_ID ));
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000;
SELECT D.Name FROM driver D JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Power > 5000;
SELECT Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Driver_ID IS NULL;
SELECT Model FROM vehicle LEFT JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle_driver.Driver_ID IS NULL
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN ( SELECT Driver_ID, Vehicle_ID, COUNT(*) as count FROM vehicle_driver GROUP BY Driver_ID, Vehicle_ID HAVING COUNT(*) > 1 ) vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Builder = 'Ziyang' UNION SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Builder = 'Ziyang'
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2 ) d ON v.Vehicle_ID = d.Vehicle_ID UNION SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle);
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle);
SELECT D.Name, D.Citizenship FROM driver D JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Model = 'DJ1';
SELECT D.Name, D.Citizenship FROM driver D JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Model = 'DJ1';
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC;
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC;
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments JOIN Student_Answers ON Student_Answers.Student_Answer_ID = Student_Assessments.Student_Answer_ID GROUP BY Assessment ORDER BY COUNT(Student_Answer_ID) ASC LIMIT 1;
SELECT Valid_Answer_Text, COUNT(*) as count FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count DESC LIMIT 1
SELECT Valid_Answer_Text, COUNT(*) as count FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count DESC LIMIT 1;
SELECT S.First_Name FROM Students S LEFT JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID WHERE SA.Student_Answer_ID IS NULL
SELECT S.First_Name FROM Students S LEFT JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID WHERE SA.Student_Answer_ID IS NULL;
SELECT DISTINCT sa.Student_Answer_Text FROM Student_Answers sa JOIN Student_Answers sa2 ON sa.Student_Answer_ID = sa2.Student_Answer_ID WHERE sa.Comments = 'Normal' AND sa2.Comments = 'Absent'
SELECT sa1.Student_Answer_Text FROM Student_Answers sa1 JOIN Student_Answers sa2 ON sa1.Student_Answer_ID = sa2.Student_Answer_ID WHERE sa1.Comments = 'Normal' AND sa2.Comments = 'Absent'
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1;
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1;
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1;
SELECT p1.product_id, p1.product_name FROM Products p1 JOIN Products p2 ON p1.product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware') WHERE p1.product_type_code = 'Hardware' AND p1.product_price = p2.product_price
SELECT T1.product_type_code, COUNT(T2.product_id) as product_count FROM Products T1 JOIN Order_Items T2 ON T1.product_id = T2.product_id GROUP BY T1.product_type_code ORDER BY product_count DESC LIMIT 1;
SELECT product_type_code, COUNT(*) as count FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY product_type_code ORDER BY count DESC LIMIT 1;
with
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.customer_name, C.payment_method_code FROM Customers C JOIN ( SELECT payment_method_code, COUNT(*) as count FROM Customers GROUP BY payment_method_code ORDER BY count ASC LIMIT 1 ) AS subquery ON C.payment_method_code = subquery.payment_method_code
SELECT customer_name FROM Customers WHERE payment_method_code = ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_type_code, COUNT(*) as product_count FROM Products GROUP BY product_type_code ORDER BY product_count ASC LIMIT 1
SELECT product_type_code FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code, COUNT(order_status_code) as count FROM Customer_Orders GROUP BY order_status_code ORDER BY count DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) DESC LIMIT 1;
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT product_name FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items )
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_ItemsOI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(DISTINCT OI.order_item_id) >= 3
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(DISTINCT OI.order_item_id) >= 3
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL;
SELECT C.customer_first_name, C.customer_last_name, C.customer_middle_initial FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL;
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id GROUP BY p.product_id ORDER BY COUNT(p.product_id) DESC LIMIT 1;
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN ( SELECT product_id, COUNT(*) as order_count FROM Order_Items GROUP BY product_id ORDER BY order_count DESC ) o ON p.product_id = o.product_id ORDER BY o.order_count DESC
SELECT o.order_id, SUM(p.product_price) AS sum_of_product_prices FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id JOIN Orders o ON oi.order_id = o.order_id GROUP BY o.order_id ORDER BY sum_of_product_prices ASC LIMIT 1;
SELECT order_id, SUM(product_price) AS total_cost FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY order_id ORDER BY total_cost ASC LIMIT 1;
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'F';
SELECT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'F'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);
SELECT COUNT(DISTINCT T1.product_id) FROM Products T1 LEFT JOIN Order_Items T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL;
SELECT COUNT(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items ) AND product_id NOT IN ( SELECT parent_product_id FROM Products WHERE parent_product_id IS NOT NULL AND product_id IN ( SELECT product_id FROM Order_Items ) )
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.payment_method_code IS NULL;
SELECT COUNT(customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL;
SELECT C.email_address, C.town_city, C.county FROM Customers C JOIN ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 ) AS least_common_gender ON C.gender_code = least_common_gender.gender_code
SELECT C.email_address, C.town_city, C.county FROM Customers C JOIN ( SELECT C1.gender_code FROM Customers C1 JOIN Orders O ON C1.customer_id = O.customer_id GROUP BY C1.gender_code ORDER BY COUNT(*) ASC LIMIT 1 ) G ON C.gender_code = G.gender_code
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products);
SELECT product_color, product_description, product_size FROM Products WHERE product_price != ( SELECT MAX(product_price) FROM Products )
SELECT d.Director_ID, d.Name, COUNT(p.Program_ID) as Total_Programs FROM director d JOIN director_admin da ON d.Director_ID = da.Director_ID JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID, d.Name ORDER BY Total_Programs DESC
SELECT d.Name, d.Age FROM director d JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID ORDER BY COUNT(p.Program_ID) DESC LIMIT 1;
SELECT COUNT(Channel_ID) FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Program_ID IS NULL;
SELECT c.Name, c.Internet FROM channel c JOIN director_admin da ON c.Channel_ID = da.Channel_ID GROUP BY c.Channel_ID ORDER BY COUNT(da.Director_ID) DESC LIMIT 1;
SELECT DISTINCT C.Name FROM channel C JOIN director_admin DA ON C.Channel_ID = DA.Channel_ID JOIN director D ON DA.Director_ID = D.Director_ID WHERE D.Age < 40 AND EXISTS ( SELECT 1 FROM director D2 JOIN director_admin DA2 ON D2.Director_ID = DA2.Director_ID WHERE DA2.Channel_ID = DA.Channel_ID AND D2.Age > 60 )
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE vd.Driver_ID IN ( SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon' ) OR vd.Driver_ID IN ( SELECT Driver_ID FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(DISTINCT Vehicle_ID) > 2 )
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' UNION SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) > 2
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN ( SELECT Driver_ID FROM vehicle_driver )
SELECT COUNT(Driver_ID) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Driver_ID IS NULL;
SELECT P1.product_name FROM Products P1 JOIN Products P2 ON P1.product_type_code = P2.product_type_code WHERE P1.product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = P1.product_type_code) AND P1.product_type_code = 'Hardware'
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'Hardware' AND P.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' ) AND P.product_price IS NOT NULL ORDER BY P.product_name LIMIT 10;
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN ( SELECT customer_id, COUNT(*) as order_count FROM Customer_Orders GROUP BY customer_id ORDER BY order_count DESC LIMIT 1 ) o ON c.customer_id = o.customer_id
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY COUNT(co.order_id) DESC LIMIT 1;
SELECT COUNT(customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL;
SELECT COUNT(customer_id) - (SELECT COUNT(order_id) FROM Customer_Orders) AS count FROM Customers
SELECT CO.order_date, CO.order_id FROM Customer_Orders CO JOIN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3 OR MAX(order_quantity) > 6 ) AS subquery ON CO.order_id = subquery.order_id
SELECT CO.order_id, CO.order_date FROM Customer_Orders CO JOIN Order_Items OI ON CO.order_id = OI.order_id WHERE OI.order_quantity > 6 OR OI.order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3 )
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T2.Capital ORDER BY COUNT(T1.Building_ID) DESC LIMIT 1;
SELECT r.Capital FROM region r JOIN building b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(b.Building_ID) DESC LIMIT 1;
SELECT C.Customer_Details, COUNT(CAS.Customers_and_Services_ID) as service_count FROM Customers C JOIN Customers_and_Services CAS ON C.Customer_ID = CAS.Customer_ID GROUP BY C.Customer_ID ORDER BY service_count DESC LIMIT 1;
SELECT C.Customer_Details, COUNT(CAS.Service_ID) as Service_Count FROM Customers C JOIN Customers_and_Services CAS ON C.Customer_ID = CAS.Customer_ID GROUP BY C.Customer_ID ORDER BY Service_Count DESC LIMIT 1;
SELECT C.Customer_Details FROM Customers C INNER JOIN ( SELECT Customer_ID, COUNT(DISTINCT Service_ID) as service_count FROM Customers_and_Services GROUP BY Customer_ID ORDER BY service_count DESC LIMIT 1 ) AS subquery ON C.Customer_ID = subquery.Customer_ID;
SELECT C.Customer_Details, COUNT(DISTINCT CS.Service_ID) as num_services FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID GROUP BY C.Customer_ID, C.Customer_Details ORDER BY num_services DESC LIMIT 1
SELECT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Service_ID = ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID JOIN Services S ON CS.Service_ID = S.Service_ID JOIN ( SELECT Service_ID, COUNT(*) as count FROM Customers_and_Services GROUP BY Service_ID ORDER BY count ASC LIMIT 1 ) AS least_commonly_used_service ON S.Service_ID = least_commonly_used_service.Service_ID
SELECT S.Service_ID, S.Service_Details FROM Services S WHERE S.Service_ID IN ( SELECT CS.Service_ID FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' ) OR S.Service_ID IN ( SELECT CI.Service_ID FROM Customer_Interactions CI WHERE CI.Status_Code = 'good' )
SELECT S.Service_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID JOIN Services S ON CS.Service_ID = S.Service_ID WHERE C.Customer_Details = 'Hardy Kutch' UNION SELECT S.Service_Details FROM Customer_Interactions CI JOIN Services S ON CI.Service_ID = S.Service_ID WHERE CI.Status_Code = 'good'
SELECT T3.Service_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T2.Service_ID = T3.Service_ID JOIN Customer_Interactions AS T4 ON T1.Customer_ID = T4.Customer_ID WHERE T1.Customer_Details = 'Hardy Kutch' AND T4.Status_Code = 'bad'
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customer_Interactions AS T3 ON T2.Customer_ID = T3.Customer_ID AND T1.Service_ID = T3.Service_ID WHERE T3.Status_Code = 'bad' AND T2.Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014;
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014;
SELECT V.name, V.Model_year FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.id ORDER BY COUNT(RH.id) DESC LIMIT 1;
SELECT V.name, V.Model_year FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.id ORDER BY COUNT(RH.id) DESC LIMIT 1;
SELECT D.name FROM Discount D JOIN Renting_history RH ON D.id = RH.discount_id GROUP BY D.name ORDER BY COUNT(RH.id) DESC LIMIT 1;
SELECT D.name FROM Discount D JOIN Renting_history RH ON D.id = RH.discount_id GROUP BY D.id ORDER BY COUNT(RH.id) DESC LIMIT 1;
SELECT S.bio_data, S.student_id FROM Students S JOIN ( SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) >= 2 EXCEPT SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(detention_id) >= 2 ) AS T ON S.student_id = T.student_id;
SELECT S.bio_data, S.student_id FROM Students S JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id HAVING COUNT(C.class_id) >= 2 OR COUNT(D.detention_id) < 2
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details NOT LIKE 'net%' GROUP BY T1.teacher_id HAVING COUNT(CASE WHEN T2.class_details LIKE 'net%' THEN 1 END) = 0
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details NOT LIKE 'net%' AND T1.teacher_id NOT IN ( SELECT T2.teacher_id FROM Classes AS T2 JOIN Teachers AS T1 ON T2.teacher_id = T1.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details LIKE 'net%' )
SELECT SL.amount_of_loan, SL.date_of_loan FROM Student_Loans SL JOIN Students S ON SL.student_id = S.student_id JOIN ( SELECT A.student_id FROM Achievements A GROUP BY A.student_id HAVING COUNT(A.achievement_id) >= 2 ) AS Achieving_Students ON S.student_id = Achieving_Students.student_id
SELECT SL.amount_of_loan, SL.date_of_loan FROM Student_Loans SL JOIN Students S ON SL.student_id = S.student_id JOIN ( SELECT A.student_id FROM Achievements A GROUP BY A.student_id HAVING COUNT(A.achievement_id) >= 2 ) AS Achieving_Students ON S.student_id = Achieving_Students.student_id
SELECT T1.teacher_id, T1.teacher_details, COUNT(*) as course_count FROM Teachers T1 JOIN Classes T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id, T1.teacher_details ORDER BY course_count DESC LIMIT 1
SELECT T1.teacher_id, T1.teacher_details FROM Teachers T1 JOIN Classes T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT S.bio_data, S.student_details FROM Students S JOIN ( SELECT BM.behaviour_monitoring_details FROM Behaviour_Monitoring BM GROUP BY BM.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AS Most_Common_Result ON S.student_id = ( SELECT BM.student_id FROM Behaviour_Monitoring BM JOIN ( SELECT BM.behaviour_monitoring_details FROM Behaviour_Monitoring BM GROUP BY BM.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AS Most_Common_Result ON BM.behaviour_monitoring_details = Most_Common_Result.behaviour_monitoring_details )
SELECT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring BM ON S.student_id = BM.student_id WHERE BM.behaviour_monitoring_details IN ( SELECT BM2.behaviour_monitoring_details FROM Behaviour_Monitoring BM2 GROUP BY BM2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND BM.behaviour_monitoring_details IN ( SELECT BM3.behaviour_monitoring_details FROM Behaviour_Monitoring BM3 GROUP BY BM3.behaviour_monitoring_details HAVING COUNT(*) = 3 )
SELECT S.student_id, S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring BM ON S.student_id = BM.student_id GROUP BY S.student_id HAVING COUNT(BM.behaviour_monitoring_details) = ( SELECT MAX(count) FROM ( SELECT student_id, COUNT(behaviour_monitoring_details) as count FROM Behaviour_Monitoring GROUP BY student_id ) AS subquery )
SELECT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id GROUP BY B.behaviour_monitoring_details ORDER BY COUNT(B.behaviour_monitoring_details) DESC LIMIT 1;
SELECT COUNT(DISTINCT se.student_id) AS num_students, rt.event_type_description, se.event_type_code FROM Student_Events se JOIN Ref_Event_Types rt ON se.event_type_code = rt.event_type_code GROUP BY se.event_type_code ORDER BY COUNT(DISTINCT se.student_id) DESC LIMIT 1
SELECT e.event_type_code, e.event_type_description, COUNT(se.student_id) as num_students FROM Student_Events se JOIN Ref_Event_Types e ON se.event_type_code = e.event_type_code GROUP BY e.event_type_code, e.event_type_description ORDER BY num_students DESC LIMIT 1;
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers T1 JOIN Classes T2 ON T1.teacher_id = T2.teacher_id JOIN Students T3 ON T2.student_id = T3.student_id LEFT JOIN Achievements T4 ON T3.student_id = T4.student_id WHERE T4.achievement_id IS NULL;
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Students AS T3 ON T2.student_id = T3.student_id LEFT JOIN Achievements AS T4 ON T3.student_id = T4.student_id WHERE T4.achievement_id IS NULL;
SELECT dt.detention_type_code, dt.detention_type_description FROM Detention d JOIN Ref_Detention_Type dt ON d.detention_type_code = dt.detention_type_code GROUP BY dt.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1;
SELECT detention_type_code, detention_type_description FROM Ref_Detention_Type ORDER BY COUNT(detention_type_code) ASC LIMIT 1;
SELECT S.bio_data, S.student_details, SL.amount_of_loan FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans) ORDER BY SL.amount_of_loan DESC;
SELECT S.bio_data, S.student_details FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans);
SELECT T2.teacher_details FROM Transcripts T1 JOIN Classes T2 ON T1.student_id = T2.student_id JOIN Teachers T3 ON T2.teacher_id = T3.teacher_id WHERE (T1.student_id, T1.date_of_transcript) = (SELECT T1.student_id, MIN(T1.date_of_transcript) FROM Transcripts T1 GROUP BY T1.student_id)
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id = T3.student_id WHERE T3.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT ra.address_type_code, ra.address_type_description, COUNT(sa.address_type_code) as count FROM Students_Addresses sa JOIN Ref_Address_Types ra ON sa.address_type_code = ra.address_type_code GROUP BY ra.address_type_code ORDER BY count DESC LIMIT 1
SELECT ra.address_type_code, ra.address_type_description, COUNT(sa.address_type_code) as count FROM Students_Addresses sa JOIN Ref_Address_Types ra ON sa.address_type_code = ra.address_type_code GROUP BY ra.address_type_code ORDER BY count DESC LIMIT 1
