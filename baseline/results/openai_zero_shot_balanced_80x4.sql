SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT customer_id) AS customer_count FROM Orders
SELECT COUNT(DISTINCT customer_id) AS customer_count FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) AS item_state_count FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) AS different_item_status_codes FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) AS different_payment_methods FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) AS payment_method_count FROM Customer_Payment_Methods
SELECT COUNT(*) AS shipped_items FROM Shipment_Items
SELECT COUNT(*) AS shipped_products FROM Shipment_Items
SELECT AVG(product_price) AS average_product_price FROM Products
SELECT AVG(product_price) AS average_product_cost FROM Products
SELECT AVG(Products.product_price) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id
SELECT AVG(Products.product_price) AS average_product_price FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT COUNT(*) FROM radio
SELECT Transmitter FROM radio ORDER BY CAST(ERP_kW AS REAL) ASC
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(CAST(ERP_kW AS REAL)) AS average_ERP FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) > 3
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) AS average_top_speed FROM vehicle
SELECT AVG(Top_Speed) AS average_top_speed FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT COUNT(*) AS exam_count FROM Exams
SELECT COUNT(*) AS exam_count FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) AS different_comments_count FROM Student_Answers WHERE Comments IS NOT NULL
SELECT COUNT(DISTINCT Comments) AS different_comments_count FROM Student_Answers
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT * FROM Students
SELECT Student_ID, First_Name, Middle_Name, Last_Name, Gender_MFU, Student_Address, Email_Adress, Cell_Mobile_Phone, Home_Phone FROM Students
SELECT COUNT(*) AS address_count FROM Addresses
SELECT COUNT(*) AS address_count FROM Addresses
SELECT COUNT(*) AS product_count FROM Products
SELECT COUNT(*) AS product_count FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) AS average_price FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) AS average_price FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT COUNT(*) AS customer_count FROM Customers
SELECT COUNT(*) AS customer_count FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(*) AS order_count FROM Customer_Orders
SELECT COUNT(*) AS order_count FROM Customer_Orders
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID WHERE player.Wins_count > 2
SELECT DISTINCT c.Name FROM club AS c JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Wins_count > 2
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT Manufacturer, COUNT(*) AS club_count FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) AS club_count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) AS number_of_products FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) AS product_count FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT o.order_id, o.date_order_placed FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(DISTINCT oi.product_id) >= 2
SELECT o.order_id, o.date_order_placed FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(DISTINCT oi.product_id) >= 2
SELECT c.gender_code, COUNT(o.order_id) AS order_count FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.gender_code
SELECT c.gender_code, COUNT(o.order_id) AS order_count FROM Customers c JOIN Orders o ON o.customer_id = c.customer_id GROUP BY c.gender_code
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers AS c JOIN Customer_Payment_Methods AS cpm ON c.customer_id = cpm.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers AS c JOIN Customer_Payment_Methods AS cpm ON c.customer_id = cpm.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number
SELECT DISTINCT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices LEFT JOIN Shipments ON Shipments.invoice_number = Invoices.invoice_number
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id
SELECT DISTINCT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items AS oi JOIN Shipment_Items AS si ON oi.order_item_id = si.order_item_id JOIN Shipments AS s ON si.shipment_id = s.shipment_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT p.product_id, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_description HAVING COUNT(*) > 3
SELECT p.product_id, p.product_description FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_description HAVING COUNT(*) > 3
SELECT i.invoice_date, i.invoice_number FROM Invoices AS i JOIN Shipments AS s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number, i.invoice_date HAVING COUNT(s.shipment_id) >= 2
SELECT i.invoice_number, i.invoice_date FROM Invoices AS i JOIN Shipments AS s ON s.invoice_number = i.invoice_number GROUP BY i.invoice_number, i.invoice_date HAVING COUNT(s.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE LOWER(Internet) LIKE '%bbc%'
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT c.Name, c.Internet FROM channel AS c JOIN program AS p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name, c.Internet HAVING COUNT(p.Program_ID) > 1
SELECT c.Name, COUNT(p.Program_ID) AS program_count FROM channel AS c LEFT JOIN program AS p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name
SELECT d.Name FROM program AS p JOIN director AS d ON p.Director_ID = d.Director_ID WHERE p.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Transmitter FROM radio WHERE CAST(ERP_kW AS REAL) > 150 OR CAST(ERP_kW AS REAL) < 30
SELECT Transmitter FROM radio ORDER BY CAST(ERP_kW AS REAL) DESC LIMIT 1
SELECT Affiliation, COUNT(*) AS channel_count FROM city_channel GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT r.Transmitter, c.City FROM city_channel AS c JOIN city_channel_radio AS ccr ON c.ID = ccr.City_channel_ID JOIN radio AS r ON ccr.Radio_ID = r.Radio_ID
SELECT r.Transmitter, COUNT(ccr.City_channel_ID) AS city_channel_count FROM radio AS r JOIN city_channel_radio AS ccr ON r.Radio_ID = ccr.Radio_ID GROUP BY r.Radio_ID, r.Transmitter
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS max_power, AVG(Power) AS avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT vd.Driver_ID) FROM vehicle_driver AS vd JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = '2012'
SELECT COUNT(DISTINCT vd.Driver_ID) FROM vehicle_driver AS vd JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = '2012'
SELECT Model FROM vehicle WHERE CAST(Total_Production AS INTEGER) > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE CAST(Total_Production AS INTEGER) > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Racing_Series, COUNT(*) AS driver_count FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(*) AS driver_count FROM driver GROUP BY Racing_Series
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != 'Database'
SELECT Type_of_Question_Code, COUNT(*) AS question_count FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) AS occurrence_count FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text, COUNT(*) AS answer_count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY answer_count DESC
SELECT Student_Answer_Text, COUNT(*) AS frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT s.First_Name, sa.Date_of_Answer FROM Students AS s JOIN Student_Answers AS sa ON s.Student_ID = sa.Student_ID
SELECT s.First_Name, sa.Date_of_Answer FROM Student_Answers AS sa JOIN Students AS s ON sa.Student_ID = s.Student_ID
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Student_Answers JOIN Students ON Student_Answers.Student_ID = Students.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT s.Email_Adress, sa.Date_of_Answer FROM Student_Answers AS sa JOIN Students AS s ON sa.Student_ID = s.Student_ID ORDER BY sa.Date_of_Answer DESC
SELECT s.First_Name FROM Students AS s JOIN Student_Answers AS sa ON s.Student_ID = sa.Student_ID GROUP BY s.Student_ID, s.First_Name HAVING COUNT(*) >= 2
SELECT s.First_Name FROM Students AS s JOIN Student_Answers AS sa ON s.Student_ID = sa.Student_ID GROUP BY s.Student_ID, s.First_Name HAVING COUNT(*) >= 2
SELECT Gender_MFU, COUNT(*) AS student_count FROM Students GROUP BY Gender_MFU
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON player.Club_ID = club.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON c.Club_ID = p.Club_ID WHERE p.Player_ID IS NULL
SELECT c.Name FROM club AS c LEFT JOIN player AS p ON c.Club_ID = p.Club_ID WHERE p.Player_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING MAX(Earnings) > 1400000 AND MIN(Earnings) < 1100000
SELECT DISTINCT o.date_order_placed FROM Orders o LEFT JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING o.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(oi.order_item_id) > 1
SELECT DISTINCT o.date_order_placed FROM Orders o LEFT JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(oi.order_item_id) > 1 OR o.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price, p.product_color HAVING COUNT(DISTINCT oi.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT c.gender_code, COUNT(oi.product_id) AS number_of_products FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.gender_code
SELECT c.gender_code, COUNT(oi.order_item_id) AS products_bought FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.gender_code
SELECT p.product_name, s.shipment_date FROM Shipment_Items si JOIN Shipments s ON si.shipment_id = s.shipment_id JOIN Order_Items oi ON si.order_item_id = oi.order_item_id JOIN Products p ON oi.product_id = p.product_id
SELECT DISTINCT p.product_name, s.shipment_date FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id
SELECT DISTINCT p.product_name, p.product_color FROM Shipment_Items si JOIN Order_Items oi ON si.order_item_id = oi.order_item_id JOIN Products p ON oi.product_id = p.product_id
SELECT DISTINCT p.product_name, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id JOIN Shipments s ON si.shipment_id = s.shipment_id
SELECT DISTINCT i.invoice_status_code FROM Orders o JOIN Shipments s ON s.order_id = o.order_id JOIN Invoices i ON i.invoice_number = s.invoice_number WHERE o.order_id NOT IN ( SELECT order_id FROM Shipments WHERE shipment_date IS NOT NULL )
SELECT DISTINCT i.invoice_status_code FROM Orders o JOIN Shipments s ON s.order_id = o.order_id JOIN Invoices i ON i.invoice_number = s.invoice_number WHERE s.shipment_date IS NULL
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_amount_paid FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id JOIN Products AS p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT DISTINCT c.customer_first_name, p.product_name FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id JOIN Products AS p ON oi.product_id = p.product_id
SELECT c.customer_first_name, p.product_name FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id JOIN Products AS p ON oi.product_id = p.product_id
SELECT DISTINCT o.date_order_placed FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(DISTINCT cpm.payment_method_code) >= 2
SELECT o.date_order_placed FROM Orders o JOIN ( SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) >= 2 ) cpm ON o.customer_id = cpm.customer_id
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT c.Channel_ID, c.Name FROM channel AS c JOIN director_admin AS da ON c.Channel_ID = da.Channel_ID JOIN director AS d ON da.Director_ID = d.Director_ID WHERE d.Name != 'Hank Baskett'
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Transmitter, c.Station_name FROM city_channel AS c JOIN city_channel_radio AS ccr ON c.ID = ccr.City_channel_ID JOIN radio AS r ON ccr.Radio_ID = r.Radio_ID ORDER BY CAST(r.ERP_kW AS REAL) DESC
SELECT DISTINCT r.Transmitter FROM radio AS r LEFT JOIN city_channel_radio AS ccr ON r.Radio_ID = ccr.Radio_ID WHERE ccr.City_channel_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Driver_ID, COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vd.Driver_ID, COUNT(vd.Vehicle_ID) AS vehicle_count FROM vehicle_driver AS vd JOIN driver AS d ON vd.Driver_ID = d.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID GROUP BY vd.Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT vd.Vehicle_ID FROM vehicle_driver AS vd GROUP BY vd.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT vd.Vehicle_ID FROM vehicle_driver AS vd GROUP BY vd.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT d.Name FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT DISTINCT d.Name FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IS NULL
SELECT v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IS NULL
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID, v.Model, v.Builder HAVING COUNT(vd.Driver_ID) = 2 OR v.Builder = 'Ziyang'
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle AS v LEFT JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID, v.Model, v.Builder HAVING COUNT(vd.Driver_ID) = 2 OR v.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT va.Valid_Answer_Text FROM Valid_Answers AS va JOIN Student_Assessments AS sa ON sa.Valid_Answer_ID = va.Valid_Answer_ID GROUP BY va.Valid_Answer_ID, va.Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.First_Name FROM Students AS s LEFT JOIN Student_Answers AS sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT s.First_Name FROM Students AS s LEFT JOIN Student_Answers AS sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT DISTINCT sa1.Student_Answer_Text FROM Student_Answers sa1 JOIN Student_Answers sa2 ON sa1.Student_Answer_Text = sa2.Student_Answer_Text WHERE sa1.Comments = 'Normal' AND sa2.Comments = 'Absent'
SELECT DISTINCT sa1.Student_Answer_Text FROM Student_Answers sa1 JOIN Student_Answers sa2 ON sa1.Student_Answer_Text = sa2.Student_Answer_Text WHERE sa1.Comments = 'Normal' AND sa2.Comments = 'Absent'
SELECT product_name FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_name FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = ( SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_type_code FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id GROUP BY p.product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name, payment_method_code FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code ) ) )
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(method_count) FROM ( SELECT COUNT(*) AS method_count FROM Customers GROUP BY payment_method_code ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_name FROM Products AS p LEFT JOIN Order_Items AS oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL
SELECT p.product_name FROM Products AS p LEFT JOIN Order_Items AS oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name FROM Customers AS c LEFT JOIN Orders AS o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products AS p LEFT JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price, p.product_color HAVING COUNT(oi.order_item_id) < 2
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price HAVING COUNT(*) = ( SELECT MAX(product_order_count) FROM ( SELECT COUNT(*) AS product_order_count FROM Order_Items GROUP BY product_id ) )
SELECT oi.order_id, SUM(p.product_price) AS sum FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id GROUP BY oi.order_id ORDER BY sum ASC LIMIT 1
SELECT o.order_id, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id JOIN Products AS p ON oi.product_id = p.product_id WHERE c.gender_code = 'Female'
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id WHERE c.gender_code = 'Female'
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(*) AS unsold_product_count FROM Products WHERE product_id NOT IN ( SELECT DISTINCT product_id FROM Order_Items WHERE product_id IS NOT NULL )
SELECT COUNT(*) AS number_of_products_not_ordered FROM Products WHERE product_id NOT IN ( SELECT DISTINCT product_id FROM Order_Items WHERE product_id IS NOT NULL )
SELECT COUNT(*) AS customer_count FROM Customers c LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id WHERE cpm.customer_id IS NULL
SELECT COUNT(*) AS customer_count FROM Customers c LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id WHERE cpm.customer_id IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code = ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT c.email_address, c.town_city, c.county FROM Customers c WHERE c.gender_code = ( SELECT c2.gender_code FROM Customers c2 JOIN Orders o ON o.customer_id = c2.customer_id GROUP BY c2.gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT d.Name FROM director AS d JOIN program AS p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID, d.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.Name, d.Age FROM director AS d JOIN program AS p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID, d.Name, d.Age ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Program_ID IS NULL
SELECT c.Name, c.Internet FROM channel AS c JOIN director_admin AS da ON c.Channel_ID = da.Channel_ID GROUP BY c.Channel_ID, c.Name, c.Internet ORDER BY COUNT(da.Director_ID) DESC LIMIT 1
SELECT DISTINCT c.Name FROM channel AS c JOIN program AS p1 ON c.Channel_ID = p1.Channel_ID JOIN director AS d1 ON p1.Director_ID = d1.Director_ID JOIN program AS p2 ON c.Channel_ID = p2.Channel_ID JOIN director AS d2 ON p2.Director_ID = d2.Director_ID WHERE d1.Age < 40 AND d2.Age > 60
SELECT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID LEFT JOIN driver AS d ON vd.Driver_ID = d.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID LEFT JOIN driver AS d ON vd.Driver_ID = d.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT COUNT(*) AS customers_without_order FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT COUNT(*) AS customer_count FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT DISTINCT co.order_date, co.order_id FROM Customer_Orders AS co JOIN Order_Items AS oi ON co.order_id = oi.order_id GROUP BY co.order_id, co.order_date HAVING MAX(CAST(oi.order_quantity AS INTEGER)) > 6 OR COUNT(DISTINCT oi.product_id) > 3
SELECT DISTINCT co.order_id, co.order_date FROM Customer_Orders AS co JOIN Order_Items AS oi ON co.order_id = oi.order_id GROUP BY co.order_id, co.order_date HAVING MAX(CAST(oi.order_quantity AS INTEGER)) > 6 OR COUNT(oi.product_id) > 3
SELECT r.Capital FROM region AS r JOIN building AS b ON b.Region_ID = r.Region_ID GROUP BY r.Region_ID, r.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Capital FROM region AS r JOIN building AS b ON b.Region_ID = r.Region_ID GROUP BY r.Region_ID, r.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID WHERE cs.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(service_count) FROM ( SELECT COUNT(*) AS service_count FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID WHERE cs.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(service_count) FROM ( SELECT COUNT(*) AS service_count FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT s.Service_Details FROM Services s LEFT JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID LEFT JOIN Customers c ON cs.Customer_ID = c.Customer_ID LEFT JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' OR ci.Status_Code = 'good'
SELECT DISTINCT s.Service_Details FROM Services s LEFT JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID LEFT JOIN Customers c ON cs.Customer_ID = c.Customer_ID LEFT JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' OR ci.Status_Code = 'good'
SELECT DISTINCT s.Service_Details FROM Services AS s JOIN Customer_Interactions AS ci ON s.Service_ID = ci.Service_ID JOIN Customers AS c ON ci.Customer_ID = c.Customer_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT DISTINCT s.Service_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID JOIN Services s ON cs.Service_ID = s.Service_ID JOIN Customer_Interactions ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT v.name, v.Model_year FROM Vehicles AS v JOIN Renting_history AS rh ON rh.vehicles_id = v.id GROUP BY v.id, v.name, v.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT v.name, v.Model_year FROM Vehicles v JOIN Renting_history r ON r.vehicles_id = v.id GROUP BY v.id, v.name, v.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.name FROM Discount AS d JOIN Renting_history AS r ON r.discount_id = d.id GROUP BY d.id, d.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.name FROM Discount AS d JOIN Renting_history AS r ON r.discount_id = d.id GROUP BY d.id, d.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT s.bio_data, s.student_id FROM Students s JOIN ( SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2 ) c ON s.student_id = c.student_id JOIN ( SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2 ) d ON s.student_id = d.student_id
SELECT DISTINCT s.bio_data, s.student_id FROM Students s LEFT JOIN ( SELECT student_id, COUNT(*) AS class_count FROM Classes GROUP BY student_id ) c ON s.student_id = c.student_id LEFT JOIN ( SELECT student_id, COUNT(*) AS detention_count FROM Detention GROUP BY student_id ) d ON s.student_id = d.student_id WHERE COALESCE(c.class_count, 0) >= 2 OR COALESCE(d.detention_count, 0) < 2
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.class_details LIKE '%data%' AND t.teacher_id NOT IN ( SELECT c2.teacher_id FROM Classes c2 WHERE c2.class_details LIKE 'net%' )
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE LOWER(c.class_details) LIKE '%data%' AND t.teacher_id NOT IN ( SELECT c2.teacher_id FROM Classes c2 WHERE LOWER(c2.class_details) LIKE 'net%' )
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans AS sl JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS a ON sl.student_id = a.student_id
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans AS sl JOIN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2 ) AS a ON sl.student_id = a.student_id
SELECT t.teacher_id, t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id, t.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT t.teacher_details, t.teacher_id FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id, t.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT s.bio_data, s.student_details FROM Students s JOIN Behaviour_Monitoring bm ON bm.student_id = s.student_id WHERE bm.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) AND bm.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
WITH result_counts AS ( SELECT behaviour_monitoring_details, COUNT(DISTINCT student_id) AS student_count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ), target_results AS ( SELECT behaviour_monitoring_details FROM result_counts WHERE student_count = (SELECT MAX(student_count) FROM result_counts) OR student_count = 3 ) SELECT DISTINCT s.bio_data, s.student_details FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id WHERE bm.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM target_results)
WITH detail_counts AS ( SELECT behaviour_monitoring_details, COUNT(*) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ), most_common AS ( SELECT behaviour_monitoring_details FROM detail_counts WHERE cnt = (SELECT MAX(cnt) FROM detail_counts) ) SELECT s.bio_data FROM Students s JOIN Behaviour_Monitoring bm ON bm.student_id = s.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(*) > 0 AND COUNT(*) = SUM( CASE WHEN bm.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM most_common) THEN 1 ELSE 0 END )
SELECT DISTINCT s.bio_data FROM Students AS s JOIN Behaviour_Monitoring AS bm ON s.student_id = bm.student_id WHERE bm.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT se.student_id) AS number_of_students, se.event_type_code, ret.event_type_description FROM Student_Events se JOIN Ref_Event_Types ret ON se.event_type_code = ret.event_type_code WHERE se.event_type_code = ( SELECT event_type_code FROM Student_Events GROUP BY event_type_code ORDER BY COUNT(*) DESC LIMIT 1 ) GROUP BY se.event_type_code, ret.event_type_description
SELECT COUNT(DISTINCT se.student_id) AS number_of_students, se.event_type_code, ret.event_type_description FROM Student_Events AS se JOIN Ref_Event_Types AS ret ON se.event_type_code = ret.event_type_code GROUP BY se.event_type_code, ret.event_type_description ORDER BY number_of_students DESC LIMIT 1
SELECT COUNT(DISTINCT c.teacher_id) FROM Classes c JOIN Students s ON c.student_id = s.student_id LEFT JOIN Achievements a ON s.student_id = a.student_id WHERE a.achievement_id IS NULL
SELECT COUNT(DISTINCT c.teacher_id) FROM Classes c JOIN Students s ON c.student_id = s.student_id LEFT JOIN Achievements a ON s.student_id = a.student_id WHERE a.student_id IS NULL
SELECT d.detention_type_code, r.detention_type_description FROM Detention AS d JOIN Ref_Detention_Type AS r ON d.detention_type_code = r.detention_type_code GROUP BY d.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT d.detention_type_code, r.detention_type_description FROM Detention AS d JOIN Ref_Detention_Type AS r ON d.detention_type_code = r.detention_type_code GROUP BY d.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON s.student_id = sl.student_id WHERE sl.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON s.student_id = sl.student_id WHERE sl.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id JOIN Transcripts tr ON c.student_id = tr.student_id WHERE tr.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Classes c ON tr.student_id = c.student_id JOIN Teachers t ON c.teacher_id = t.teacher_id WHERE tr.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
