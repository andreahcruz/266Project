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
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT T3.product_id) FROM Shipment_Items AS T1 JOIN Order_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Products AS T3 ON T2.product_id = T3.product_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(T1.product_price) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id
SELECT AVG(T2.product_price) FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id
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
SELECT count(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = "Normal"
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT * FROM Students
SELECT * FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
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
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT c.Name FROM club AS c JOIN player AS p ON p.Club_ID = c.Club_ID WHERE p.Wins_count > 2
SELECT DISTINCT c.Name FROM club AS c JOIN player AS p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Manager = "Sam Allardyce"
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Manager = "Sam Allardyce"
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) AS club_count FROM club GROUP BY Manufacturer
SELECT Earnings FROM player WHERE Country = "Australia" OR Country = "Zimbabwe"
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) AS product_count FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) AS product_count FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.date_order_placed HAVING COUNT(DISTINCT T2.product_id) >= 2
SELECT o.order_id, o.date_order_placed FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(DISTINCT oi.product_id) >= 2
SELECT T1.gender_code, COUNT(T2.order_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.gender_code, COUNT(*) AS order_count FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code FROM Customers AS c JOIN Customer_Payment_Methods AS cpm ON c.customer_id = cpm.customer_id
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items AS oi JOIN Shipment_Items AS si ON oi.order_item_id = si.order_item_id JOIN Shipments AS s ON si.shipment_id = s.shipment_id
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT customer_first_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE county = "USA"
SELECT address_line_1, town_city, county FROM Customers WHERE county = 'United States'
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id, T1.product_description HAVING COUNT(*) > 3
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id, T1.product_description HAVING COUNT(*) > 3
SELECT T1.invoice_date, T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number, T1.invoice_date HAVING COUNT(T2.shipment_id) >= 2
SELECT T1.invoice_number, T1.invoice_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number, T1.invoice_date HAVING COUNT(T2.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%' COLLATE NOCASE
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT c.Name, c.Internet FROM channel AS c JOIN program AS p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name, c.Internet HAVING COUNT(p.Program_ID) > 1
SELECT channel.Name, COUNT(program.Program_ID) AS program_count FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID WHERE program.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Transmitter FROM radio WHERE CAST(ERP_kW AS REAL) > 150 OR CAST(ERP_kW AS REAL) < 30
SELECT Transmitter FROM radio ORDER BY CAST(ERP_kW AS REAL) DESC LIMIT 1
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT r.Transmitter, c.City FROM city_channel_radio AS ccr JOIN radio AS r ON ccr.Radio_ID = r.Radio_ID JOIN city_channel AS c ON ccr.City_channel_ID = c.ID
SELECT T1.Transmitter, COUNT(T2.City_channel_ID) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID GROUP BY T1.Radio_ID, T1.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = "1996"
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(*) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Build_Year = '2012'
SELECT COUNT(DISTINCT T1.Driver_ID) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Build_Year = '2012'
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE CAST(Total_Production AS INTEGER) > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Racing_Series, COUNT(*) FROM driver GROUP BY Racing_Series
SELECT Racing_Series, count(*) FROM driver GROUP BY Racing_Series
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != "Database"
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) AS occurrence_count FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.Student_ID, T1.First_Name HAVING COUNT(*) >= 2
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.Student_ID, T1.First_Name HAVING COUNT(*) >= 2
SELECT Gender_MFU, COUNT(*) AS student_count FROM Students GROUP BY Gender_MFU
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT club.Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID, club.Name ORDER BY AVG(player.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player WHERE Club_ID IS NOT NULL)
SELECT Name FROM club WHERE Club_ID NOT IN ( SELECT Club_ID FROM player WHERE Club_ID IS NOT NULL )
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player GROUP BY Country HAVING SUM(CASE WHEN Earnings > 1400000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Earnings < 1100000 THEN 1 ELSE 0 END) > 0
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 1 )
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) UNION SELECT t1.date_order_placed FROM Orders AS t1 JOIN Order_Items AS t2 ON t1.order_id = t2.order_id GROUP BY t1.order_id, t1.date_order_placed HAVING COUNT(t2.order_item_id) > 1
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id, P.product_name, P.product_price, P.product_color HAVING COUNT(DISTINCT OI.order_id) < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(DISTINCT customer_id) DESC LIMIT 1
SELECT c.gender_code, COUNT(oi.product_id) AS number_of_products FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY c.gender_code
SELECT T1.gender_code, COUNT(*) AS product_count FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT DISTINCT p.product_name, s.shipment_date FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id JOIN Shipment_Items AS si ON oi.order_item_id = si.order_item_id JOIN Shipments AS s ON si.shipment_id = s.shipment_id
SELECT DISTINCT p.product_name, s.shipment_date FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id JOIN Shipment_Items AS si ON oi.order_item_id = si.order_item_id JOIN Shipments AS s ON si.shipment_id = s.shipment_id
SELECT DISTINCT P.product_name, P.product_color FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Shipment_Items AS SI ON OI.order_item_id = SI.order_item_id JOIN Shipments AS S ON SI.shipment_id = S.shipment_id
SELECT DISTINCT T1.product_name, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id = T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id = T4.shipment_id
SELECT DISTINCT T2.invoice_status_code FROM Orders AS T1 JOIN Invoices AS T2 ON T1.order_id = T2.invoice_number WHERE T1.order_id NOT IN ( SELECT order_id FROM Shipments )
SELECT DISTINCT T2.invoice_status_code FROM Orders AS T1 JOIN Shipments AS T3 ON T1.order_id = T3.order_id JOIN Invoices AS T2 ON T3.invoice_number = T2.invoice_number WHERE T1.order_id NOT IN ( SELECT order_id FROM Shipments WHERE shipment_date IS NOT NULL )
SELECT order_id, date_order_placed, COUNT(*) AS total_cost FROM Orders GROUP BY order_id, date_order_placed
SELECT O.order_id, O.date_order_placed, SUM(S.invoice_number) AS total_amount_paid FROM Orders AS O JOIN Shipments AS S ON O.order_id = S.order_id GROUP BY O.order_id, O.date_order_placed
SELECT Customers.customer_first_name, Products.product_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT Customers.customer_first_name, Products.product_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT O.date_order_placed FROM Orders AS O JOIN Customers AS C ON O.customer_id = C.customer_id JOIN Customer_Payment_Methods AS CPM ON C.customer_id = CPM.customer_id GROUP BY O.order_id, O.date_order_placed HAVING COUNT(CPM.payment_method_code) >= 2
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Customer_Payment_Methods.payment_method_code) >= 2
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT c.Channel_ID, c.Name FROM channel AS c JOIN director_admin AS da ON c.Channel_ID = da.Channel_ID JOIN director AS d ON da.Director_ID = d.Director_ID WHERE d.Name != 'Hank Baskett'
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Transmitter, c.Station_name FROM city_channel AS c JOIN city_channel_radio AS ccr ON c.ID = ccr.City_channel_ID JOIN radio AS r ON ccr.Radio_ID = r.Radio_ID ORDER BY CAST(r.ERP_kW AS REAL) DESC
SELECT DISTINCT T1.Transmitter FROM radio AS T1 LEFT JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID WHERE T2.City_channel_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Driver_ID, COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT Driver_ID, COUNT(Vehicle_ID) FROM vehicle_driver GROUP BY Driver_ID ORDER BY COUNT(Vehicle_ID) DESC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT driver.Name FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' OR Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2 )
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' OR Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2 )
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT d.Name, d.Citizenship FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID NOT IN ( SELECT Student_ID FROM Student_Answers )
SELECT First_Name FROM Students WHERE Student_ID NOT IN ( SELECT Student_ID FROM Student_Answers )
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent')
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = ( SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes' )
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = ( SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT customer_name FROM Customers WHERE payment_method_code IN ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = ( SELECT MIN(method_count) FROM ( SELECT COUNT(*) AS method_count FROM Customers GROUP BY payment_method_code ) ) )
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_name FROM Products EXCEPT SELECT T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id
SELECT p.product_name FROM Products AS p LEFT JOIN Order_Items AS oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id, T1.customer_first_name, T1.customer_last_name HAVING COUNT(DISTINCT T2.order_id) > 2 AND COUNT(T3.order_item_id) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders )
SELECT customer_first_name, customer_last_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Orders )
SELECT product_id, product_name, product_price, product_color FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(*) >= 2 )
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.product_id, p.product_name, p.product_price FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.order_id, SUM(T3.product_price) AS total_price FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY total_price ASC LIMIT 1
SELECT order_id, COUNT(*) AS total_cost FROM Order_Items GROUP BY order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Orders AS O ON OI.order_id = O.order_id JOIN Customers AS C ON O.customer_id = C.customer_id WHERE C.gender_code = 'Female'
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Orders AS O ON OI.order_id = O.order_id JOIN Customers AS C ON O.customer_id = C.customer_id WHERE C.gender_code = 'Female'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(*) FROM Products AS P LEFT JOIN Order_Items AS OI ON P.product_id = OI.product_id WHERE OI.product_id IS NULL
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Payment_Methods AS cpm ON c.customer_id = cpm.customer_id WHERE cpm.customer_id IS NULL
SELECT COUNT(*) FROM Customers AS C LEFT JOIN Customer_Payment_Methods AS CPM ON C.customer_id = CPM.customer_id WHERE CPM.payment_method_code IS NULL
SELECT email_address, town_city, county FROM Customers WHERE gender_code = ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT c.email_address, c.town_city, c.county FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id WHERE c.gender_code = ( SELECT c2.gender_code FROM Customers AS c2 JOIN Orders AS o2 ON c2.customer_id = o2.customer_id GROUP BY c2.gender_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.Name, d.Age FROM director AS d JOIN program AS p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID, d.Name, d.Age ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT c.Name, c.Internet FROM channel AS c JOIN director_admin AS da ON c.Channel_ID = da.Channel_ID GROUP BY c.Channel_ID, c.Name, c.Internet ORDER BY COUNT(da.Director_ID) DESC LIMIT 1
SELECT DISTINCT T1.Name FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID JOIN director AS T3 ON T2.Director_ID = T3.Director_ID WHERE T1.Channel_ID IN ( SELECT T4.Channel_ID FROM director_admin AS T4 JOIN director AS T5 ON T4.Director_ID = T5.Director_ID WHERE T5.Age < 40 ) AND T1.Channel_ID IN ( SELECT T6.Channel_ID FROM director_admin AS T6 JOIN director AS T7 ON T6.Director_ID = T7.Director_ID WHERE T7.Age > 60 )
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID LEFT JOIN driver AS d ON vd.Driver_ID = d.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(vd.Driver_ID) > 2 OR SUM(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) > 0
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle AS v JOIN vehicle_driver AS vd ON v.Vehicle_ID = vd.Vehicle_ID LEFT JOIN driver AS d ON vd.Driver_ID = d.Driver_ID WHERE v.Vehicle_ID IN ( SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) > 2 ) OR d.Name = 'Jeff Gordon'
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN ( SELECT Driver_ID FROM vehicle_driver )
SELECT COUNT(*) FROM driver AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Vehicle_ID IS NULL
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware' )
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers AS c JOIN Customer_Orders AS co ON c.customer_id = co.customer_id GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.customer_id, T2.customer_name, T2.customer_phone, T2.customer_email FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS T1 LEFT JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_id IS NULL
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.order_id IS NULL
SELECT DISTINCT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_date HAVING MAX(CAST(T2.order_quantity AS INTEGER)) > 6 OR COUNT(T2.product_id) > 3
SELECT DISTINCT T1.order_id, T1.order_date FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_date HAVING MAX(CAST(T2.order_quantity AS INTEGER)) > 6 OR COUNT(DISTINCT T2.product_id) > 3
SELECT r.Capital FROM region AS r JOIN building AS b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID, r.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Capital FROM region AS r JOIN building AS b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID, r.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID, c.Customer_Details ORDER BY COUNT(cs.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID, T1.Customer_Details ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID WHERE cs.Service_ID IN ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = ( SELECT MIN(service_count) FROM ( SELECT COUNT(*) AS service_count FROM Customers_and_Services GROUP BY Service_ID ) ) )
SELECT DISTINCT c.Customer_Details FROM Customers AS c JOIN Customers_and_Services AS cs ON c.Customer_ID = cs.Customer_ID WHERE cs.Service_ID = ( SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT Service_Details FROM Services WHERE Service_ID IN ( SELECT T3.Service_ID FROM Customers AS T1 JOIN Customers_and_Services AS T3 ON T1.Customer_ID = T3.Customer_ID WHERE T1.Customer_Details = 'Hardy Kutch' ) UNION SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID = T2.Service_ID WHERE T2.Status_Code = 'good'
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' UNION SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID = T2.Service_ID WHERE T2.Status_Code = 'good'
SELECT DISTINCT s.Service_Details FROM Services AS s JOIN Customers_and_Services AS cs ON s.Service_ID = cs.Service_ID JOIN Customers AS c ON cs.Customer_ID = c.Customer_ID JOIN Customer_Interactions AS ci ON s.Service_ID = ci.Service_ID AND c.Customer_ID = ci.Customer_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT DISTINCT s.Service_Details FROM Services AS s JOIN Customers_and_Services AS cs ON s.Service_ID = cs.Service_ID JOIN Customers AS c ON cs.Customer_ID = c.Customer_ID JOIN Customer_Interactions AS ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' AND ci.Status_Code = 'bad'
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.id, T1.name, T1.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT v.name, v.Model_year FROM Renting_history AS r JOIN Vehicles AS v ON r.vehicles_id = v.id GROUP BY v.id, v.name, v.Model_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.name FROM Renting_history AS r JOIN Discount AS d ON r.discount_id = d.id GROUP BY d.id, d.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.name FROM Discount AS d JOIN Renting_history AS r ON d.id = r.discount_id GROUP BY d.id, d.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT S.bio_data, S.student_id FROM Students AS S LEFT JOIN Classes AS C ON S.student_id = C.student_id LEFT JOIN Detention AS D ON S.student_id = D.student_id GROUP BY S.student_id, S.bio_data HAVING COUNT(DISTINCT C.class_id) >= 2 OR COUNT(DISTINCT D.detention_id) < 2
SELECT DISTINCT s.bio_data, s.student_id FROM Students AS s LEFT JOIN Classes AS c ON s.student_id = c.student_id LEFT JOIN Detention AS d ON s.student_id = d.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(DISTINCT c.class_id) >= 2 OR COUNT(DISTINCT d.detention_id) < 2
SELECT DISTINCT T.teacher_details FROM Teachers AS T JOIN Classes AS C ON T.teacher_id = C.teacher_id WHERE C.class_details LIKE '%data%' AND T.teacher_id NOT IN ( SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%' )
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.class_details LIKE '%data%' AND t.teacher_id NOT IN ( SELECT c2.teacher_id FROM Classes c2 WHERE c2.class_details LIKE 'net%' )
SELECT T2.amount_of_loan, T2.date_of_loan FROM Achievements AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id GROUP BY T2.student_loan_id HAVING COUNT(T1.achievement_id) >= 2
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans AS sl JOIN Students AS s ON sl.student_id = s.student_id JOIN Achievements AS a ON s.student_id = a.student_id GROUP BY sl.student_loan_id, sl.amount_of_loan, sl.date_of_loan HAVING COUNT(a.achievement_id) >= 2
SELECT t.teacher_details, t.teacher_id FROM Teachers AS t JOIN Classes AS c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id, t.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT teacher_id, teacher_details FROM Teachers WHERE teacher_id = ( SELECT teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Behaviour_Monitoring AS bm ON s.student_id = bm.student_id WHERE bm.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) AND s.student_id IN ( SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3 ) )
SELECT DISTINCT S.bio_data, S.student_details FROM Students AS S JOIN Behaviour_Monitoring AS B ON S.student_id = B.student_id WHERE B.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = ( SELECT MAX(cnt) FROM ( SELECT COUNT(*) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ) ) ) INTERSECT SELECT DISTINCT S.bio_data, S.student_details FROM Students AS S JOIN Behaviour_Monitoring AS B ON S.student_id = B.student_id WHERE B.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 )
SELECT DISTINCT s.bio_data FROM Students AS s JOIN Behaviour_Monitoring AS bm ON s.student_id = bm.student_id WHERE s.student_id IN ( SELECT student_id FROM Behaviour_Monitoring GROUP BY student_id HAVING COUNT(DISTINCT behaviour_monitoring_details) = 1 AND MAX(behaviour_monitoring_details) = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 ) )
SELECT DISTINCT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id WHERE T2.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(DISTINCT T1.student_id), T1.event_type_code, T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code, T2.event_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.student_id) AS number_of_students, T1.event_type_code, T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code, T2.event_type_description ORDER BY number_of_students DESC LIMIT 1
SELECT COUNT(DISTINCT T1.student_id) FROM Students AS T1 LEFT JOIN Achievements AS T2 ON T1.student_id = T2.student_id WHERE T2.student_id IS NULL
SELECT COUNT(DISTINCT t1.student_id) FROM Students AS t1 JOIN Student_Loans AS t2 ON t1.student_id = t2.student_id WHERE t1.student_id NOT IN ( SELECT student_id FROM Achievements )
SELECT t1.detention_type_code, t1.detention_type_description FROM Ref_Detention_Type AS t1 JOIN Detention AS t2 ON t1.detention_type_code = t2.detention_type_code GROUP BY t1.detention_type_code, t1.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT r.detention_type_code, r.detention_type_description FROM Ref_Detention_Type AS r JOIN Detention AS d ON r.detention_type_code = d.detention_type_code GROUP BY r.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON s.student_id = sl.student_id WHERE sl.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT DISTINCT s.bio_data, s.student_details FROM Students AS s JOIN Student_Loans AS sl ON s.student_id = sl.student_id WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT DISTINCT t.teacher_details FROM Transcripts tr JOIN Students s ON tr.student_id = s.student_id JOIN Classes c ON c.student_id = s.student_id JOIN Teachers t ON c.teacher_id = t.teacher_id WHERE tr.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT s.student_details FROM Students AS s JOIN Transcripts AS t ON s.student_id = t.student_id WHERE t.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT sa.address_type_code, rat.address_type_description FROM Students_Addresses AS sa JOIN Ref_Address_Types AS rat ON sa.address_type_code = rat.address_type_code GROUP BY sa.address_type_code, rat.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
