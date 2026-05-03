SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Wins_count ASC
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT T2.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Country HAVING COUNT(T1.Player_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT order_item_id) FROM Shipment_Items
SELECT COUNT(DISTINCT T1.product_id) FROM Products AS T1 JOIN Shipments AS T2 ON T1.product_id = T2.order_id
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(T2.product_price) FROM Orders AS T1 JOIN Products AS T2 ON T1.order_id = T2.product_id
SELECT AVG(T2.product_price) FROM Orders AS T1 JOIN Products AS T2 ON T1.order_id = T2.product_id
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT T1.Title FROM program AS T1 INNER JOIN director AS T2 ON T1.Director_ID = T2.Director_ID ORDER BY T1.Start_Year DESC
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT COUNT(Radio_ID) FROM radio
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID ORDER BY T1.ERP_kW ASC
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(ID) > 3
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
SELECT AVG(T1.Top_Speed) FROM vehicle AS T1
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT COUNT(*) FROM Exams
SELECT COUNT(DISTINCT Exam_ID) FROM Questions_in_Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID WHERE T1.Comments = 'Normal'
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID JOIN Valid_Answers AS T3 ON T2.Valid_Answer_ID = T3.Valid_Answer_ID WHERE T3.Valid_Answer_Text = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT T1.Last_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T1.Gender_MFU != 'M'
SELECT T1.Last_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T1.Gender_MFU != 'M'
SELECT T1.Type_of_Question_Code FROM Questions T1 JOIN Questions_in_Exams T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T1.Question_ID) >= 3
SELECT T1.Type_of_Question_Code FROM Questions T1 JOIN Questions_in_Exams T2 ON T1.Question_ID = T2.Question_ID GROUP BY T1.Type_of_Question_Code HAVING COUNT(T1.Question_ID) >= 3
SELECT * FROM Students
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address FROM Students
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(address_id) FROM Addresses
SELECT COUNT(product_id) FROM Products
SELECT COUNT(product_id) FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT T2.product_price FROM Products AS T1 INNER JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name = 'Monitor'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(T2.product_price) FROM Products AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT T2.product_type_code FROM Products T1 JOIN Products T2 ON T1.product_type_code = T2.product_type_code GROUP BY T2.product_type_code HAVING COUNT(T2.product_id) > 1
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT T1.Manager, T1.Captain FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Manager, T1.Captain FROM club AS T1
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings = ( SELECT MAX(Earnings) FROM player )
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID ORDER BY T1.Earnings DESC LIMIT 1
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name, T2.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT T1.Earnings FROM player AS T1 WHERE T1.Country IN ('Australia', 'Zimbabwe')
SELECT SUM(Earnings) FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT COUNT(DISTINCT T1.product_id), T2.order_status_code, T2.order_id FROM Order_Items AS T1 JOIN Orders AS T2 ON T1.order_id = T2.order_id
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) >= 2
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.order_item_id) >= 2
SELECT T1.gender_code, COUNT(T2.order_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_id, T2.gender, COUNT(T1.order_id) FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.gender
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 INNER JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 INNER JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT T1.invoice_status_code, T1.invoice_date, T3.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 LEFT JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.order_item_status_code, T3.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.order_item_status_code, T3.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id = T3.shipment_id
SELECT T1.login_name, T1.login_password FROM Customers AS T1 WHERE T1.phone_number LIKE '+12%'
SELECT T1.customer_first_name, T1.login_password FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id WHERE T1.phone_number LIKE '+12%'
SELECT T2.product_size FROM Products AS T1 JOIN Products AS T2 ON T1.product_id = T2.parent_product_id WHERE T1.product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE county = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE county = 'United States'
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_item_id) > 3
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Products AS T2 ON T1.product_id = T2.parent_product_id GROUP BY T1.product_id HAVING COUNT(T2.product_id) > 3
SELECT T1.invoice_date, T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT T1.invoice_date, T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT Name FROM director WHERE Age = ( SELECT MAX(Age) FROM director )
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT Title FROM program WHERE Start_Year = ( SELECT MAX(Start_Year) FROM program )
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(T2.Program_ID) > 1
SELECT T1.Name, COUNT(T3.Program_ID) FROM channel AS T1 INNER JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID INNER JOIN program AS T3 ON T1.Channel_ID = T3.Channel_ID GROUP BY T1.Name
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID = T2.Director_ID WHERE T1.Title = 'Dracula'
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID WHERE T1.ERP_kW > '150' OR T1.ERP_kW < '30'
SELECT T1.Transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID ORDER BY T1.ERP_kW DESC LIMIT 1
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT City, Station_name FROM city_channel
SELECT T1.Transmitter, T3.City FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID
SELECT T1.Transmitter, COUNT(T2.City_channel_ID) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID GROUP BY T1.Transmitter
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(T1.Power), AVG(T1.Power) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T1.Builder = 'Zhuzhou'
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = '1996'
SELECT T1.Top_Speed, T1.Power FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Build_Year = '1996'
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT T1.Driver_ID) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Build_Year = '2012'
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE Build_Year = '2012'
SELECT Model FROM vehicle WHERE Total_Production > '100' OR Top_Speed > 150
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Total_Production > '100' OR T1.Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT T1.Model, T1.Build_Year FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Model LIKE '%DJ%'
SELECT Racing_Series, COUNT(*) FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(*) FROM driver GROUP BY Racing_Series
SELECT T2.Exam_Name, T2.Exam_Date FROM Exams AS T1 JOIN Exams AS T2 ON T1.Exam_ID = T2.Exam_ID WHERE T1.Subject_Code != 'Database'
SELECT T2.Exam_Date, T2.Exam_Name FROM Exams AS T1 JOIN Exams AS T2 ON T1.Exam_ID = T2.Exam_ID WHERE T1.Subject_Code != 'Database'
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(Question_ID) FROM Questions GROUP BY Type_of_Question_Code
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT sa.Student_Answer_Text FROM Student_Answers sa JOIN Student_Assessments saa ON sa.Student_Answer_ID = saa.Student_Answer_ID GROUP BY sa.Student_Answer_Text ORDER BY COUNT(sa.Student_Answer_Text) DESC
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 INNER JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 INNER JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 INNER JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.First_Name HAVING COUNT(T2.Student_ID) >= 2
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.First_Name HAVING COUNT(T2.Student_ID) >= 2
SELECT T1.Gender_MFU, COUNT(T1.Student_ID) FROM Students AS T1 GROUP BY T1.Gender_MFU
SELECT T1.Country FROM player AS T1 WHERE T1.Wins_count > 2 ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Wins_count < T2.Wins_count JOIN club ON T2.Club_ID = club.Club_ID WHERE T1.Wins_count > 2 AND T2.Wins_count = (SELECT MAX(Wins_count) FROM player WHERE Wins_count > 2)
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT T1.Name, AVG(T2.Earnings) FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT T1.Country FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Earnings > 1400000 OR T1.Earnings < 1100000
SELECT T2.Country FROM player AS T1 JOIN player AS T2 ON T1.Country = T2.Country JOIN club AS T3 ON T1.Club_ID = T3.Club_ID WHERE T1.Earnings > 1400000 AND T2.Earnings < 1100000
SELECT DISTINCT T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T1.date_order_placed IN (SELECT date_order_placed FROM Orders ORDER BY date_order_placed LIMIT 1) OR T2.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_id) > 1)
SELECT MIN(T1.date_order_placed) AS earliest_order_date, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.date_order_placed HAVING COUNT(T2.order_item_id) > 1
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 JOIN (SELECT product_id, COUNT(*) as order_count FROM Orders GROUP BY product_id) AS T2 ON T1.product_id = T2.product_id WHERE T2.order_count < 2
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT T1.gender_code, COUNT(T3.product_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.gender_code
SELECT T1.product_color, COUNT(*) FROM Products AS T1 INNER JOIN Products AS T2 ON T1.product_id = T2.parent_product_id GROUP BY T1.product_color
SELECT T1.product_name, T2.shipment_date FROM Products AS T1 INNER JOIN Shipments AS T2 ON T1.product_id = T2.order_id
SELECT T1.product_name, T2.shipment_date FROM Products AS T1 JOIN Shipments AS T2 ON T1.product_id = T2.order_id
SELECT T1.product_name, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipments AS T3 ON T2.order_id = T3.order_id
SELECT T1.product_name, T1.product_color FROM Products AS T1 JOIN Shipments AS T2 ON T1.product_id = T2.order_id
SELECT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number WHERE T2.shipment_tracking_number IS NULL
SELECT DISTINCT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number WHERE T2.shipment_date IS NULL
SELECT T1.order_id, T1.date_order_placed, SUM(T3.product_id * T2.order_item_status_code) AS total_cost FROM Orders T1 JOIN Order_Items T2 ON T1.order_id = T2.order_id JOIN Order_Items T3 ON T2.order_item_id = T3.order_item_id GROUP BY T1.order_id, T1.date_order_placed
SELECT O.order_id, O.date_order_placed, SUM(CASE WHEN oi.order_item_status_code = 'SHIPPED' AND S.shipment_date IS NOT NULL THEN 1 ELSE 0 END) * (SELECT AVG(p.price) FROM products p WHERE p.product_id = oi.product_id) AS total_amount_paid FROM Orders O JOIN Order_Items oi ON O.order_id = oi.order_id JOIN Shipments S ON O.order_id = S.order_id GROUP BY O.order_id, O.date_order_placed
SELECT T1.product_name, T2.product_color FROM Products AS T1 INNER JOIN Products AS T2 ON T1.product_id = T2.product_id
SELECT T1.product_name, T2.product_name AS buyer_product_name FROM Products T1 JOIN Products T2 ON T1.product_id = T2.parent_product_id
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) >= 2)
SELECT T2.date_order_placed FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T1.customer_id = T3.customer_id GROUP BY T2.date_order_placed HAVING COUNT(T3.customer_id) >= 2
SELECT order_status_code FROM Orders WHERE order_status_code NOT IN ( SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1 )
SELECT order_status_code FROM Orders WHERE order_id IN (SELECT order_id FROM Orders GROUP BY order_id ORDER BY COUNT(order_id) ASC LIMIT 1)
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT c.Channel_ID, c.Name FROM channel c WHERE c.Channel_ID NOT IN (SELECT da.Channel_ID FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Name = 'Hank Baskett')
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Transmitter, T3.Station_name FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID = T3.ID ORDER BY T1.ERP_kW DESC
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000)
SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Power > 6000 ORDER BY T1.Top_Speed DESC LIMIT 1
SELECT MAX(T1.Total_Production) , T2.Driver_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID
SELECT driver.Driver_ID, COUNT(*) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID GROUP BY driver.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Vehicle_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID ORDER BY COUNT(T2.Driver_ID) ASC LIMIT 1
SELECT T1.Vehicle_ID FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID ORDER BY COUNT(T2.Driver_ID) ASC LIMIT 1
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T1.Model FROM vehicle AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Vehicle_ID IS NULL
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 WHERE T1.Builder = 'Ziyang' OR T1.Vehicle_ID IN (SELECT T2.Vehicle_ID FROM vehicle_driver AS T2 GROUP BY T2.Vehicle_ID HAVING COUNT(T2.Vehicle_ID) > 1)
SELECT DISTINCT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING COUNT(Driver_ID) = 2) OR T1.Builder = 'Ziyang'
SELECT COUNT(*) FROM vehicle AS T1 INNER JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE (T1.Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle))
SELECT COUNT(*) FROM vehicle AS T1 INNER JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T2.Exam_Date FROM Exams AS T1 JOIN Exams AS T2 ON T1.Exam_ID = T2.Exam_ID WHERE T1.Subject_Code LIKE '%data%' ORDER BY T2.Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT T2.Assessment FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID = T2.Student_Answer_ID GROUP BY T2.Assessment ORDER BY COUNT(T2.Assessment) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(Student_Answer_ID) ASC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers JOIN Student_Assessments ON Valid_Answers.Valid_Answer_ID = Student_Assessments.Valid_Answer_ID JOIN Student_Answers ON Student_Answers.Student_Answer_ID = Student_Assessments.Student_Answer_ID GROUP BY Valid_Answer_Text ORDER BY COUNT(Valid_Answers.Valid_Answer_ID) DESC LIMIT 1
SELECT T1.Valid_Answer_Text FROM Valid_Answers AS T1 JOIN ( SELECT Valid_Answer_ID, COUNT(*) as count FROM Student_Assessments GROUP BY Valid_Answer_ID ) AS T2 ON T1.Valid_Answer_ID = T2.Valid_Answer_ID ORDER BY T2.count DESC LIMIT 1
SELECT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_ID IS NULL
SELECT T1.First_Name FROM Students AS T1 LEFT JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_ID IS NULL
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T1.Comments = 'Normal' AND T2.Comments = 'Absent'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent'
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT T1.product_name FROM Products AS T1 JOIN (SELECT product_price, AVG(product_price) AS avg_price FROM Products GROUP BY product_price) AS T2 ON T1.product_price > T2.avg_price
SELECT T2.product_name FROM Products AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Clothes' ORDER BY T2.product_price DESC LIMIT 1
SELECT T2.product_name FROM Products AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Clothes' ORDER BY T1.product_price DESC LIMIT 1
SELECT T1.product_id, T1.product_name FROM Products AS T1 JOIN Products AS T2 ON T1.product_price > T2.product_price JOIN Order_Items AS T3 ON T2.product_id = T3.product_id WHERE T2.product_type_code = 'Hardware'
SELECT T1.product_id, T1.product_name FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Hardware' ORDER BY T1.product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.customer_name FROM Customers AS T1 JOIN ( SELECT payment_method_code, COUNT(customer_id) AS count FROM Customers GROUP BY payment_method_code ORDER BY count LIMIT 1 ) AS T2 ON T1.payment_method_code = T2.payment_method_code
SELECT T1.customer_name FROM Customers AS T1 JOIN (SELECT payment_method_code, COUNT(*) as count FROM Customers GROUP BY payment_method_code ORDER BY count LIMIT 1) AS T2 ON T1.payment_method_code = T2.payment_method_code
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) ASC LIMIT 1
SELECT product_type_code FROM (SELECT product_type_code, COUNT(*) as count FROM Products GROUP BY product_type_code) ORDER BY count LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) DESC LIMIT 1
SELECT T1.order_status_code FROM Customer_Orders AS T1 JOIN (SELECT order_status_code, COUNT(order_status_code) AS count FROM Customer_Orders GROUP BY order_status_code) AS T2 ON T1.order_status_code = T2.order_status_code ORDER BY T2.count DESC LIMIT 1
SELECT T1.product_name FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T2.product_id IS NULL
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id HAVING COUNT(T2.order_id) > 2 AND COUNT(T3.order_item_id) > 3
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id GROUP BY T1.customer_id HAVING COUNT(T3.order_item_id) > 2 AND COUNT(DISTINCT T3.order_item_id) >= 3
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(T2.order_id) DESC LIMIT 1
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products T1 JOIN (SELECT parent_product_id, COUNT(*) as count FROM Products GROUP BY parent_product_id ORDER BY count DESC LIMIT 1) T2 ON T1.parent_product_id = T2.parent_product_id
SELECT T1.order_id, SUM(T2.product_price) FROM Orders AS T1 JOIN Order_Items AS T3 ON T1.order_id = T3.order_id JOIN Products AS T2 ON T3.product_id = T2.product_id GROUP BY T1.order_id ORDER BY SUM(T2.product_price) ASC LIMIT 1
SELECT T1.order_id, SUM(T2.product_id) AS total_cost FROM Orders T1 JOIN Order_Items T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id ORDER BY total_cost ASC LIMIT 1
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Customers AS T2 ON T1.product_id = T2.customer_id WHERE T2.gender_code = 'F'
SELECT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Customers AS T2 ON T1.product_id = T2.customer_id WHERE T2.gender_code = 'F'
SELECT T1.product_price, T1.product_size FROM Products T1 JOIN (SELECT product_price, AVG(product_price) as avg_price FROM Products GROUP BY product_price) T2 ON T1.product_price > T2.avg_price
SELECT T1.product_price, T1.product_size FROM Products T1 JOIN (SELECT product_price, AVG(product_price) AS mean_price FROM Products GROUP BY product_price) T2 ON T1.product_price > T2.mean_price
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT parent_product_id FROM Products)
SELECT COUNT(DISTINCT T1.product_id) FROM Products T1 LEFT JOIN Order_Items T2 ON T1.product_id = T2.product_id WHERE T2.order_item_id IS NULL
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 LEFT JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_id IS NULL
SELECT COUNT(C.customer_id) FROM Customers C LEFT JOIN Customer_Payment_Methods PM ON C.customer_id = PM.customer_id WHERE PM.customer_id IS NULL
SELECT T1.email_address, T1.town_city, T1.county FROM Customers AS T1 JOIN (SELECT gender_code, COUNT(*) as count FROM Customers GROUP BY gender_code ORDER BY count LIMIT 1) AS T2 ON T1.gender_code = T2.gender_code
SELECT T1.email_address, T1.town_city, T1.county FROM Customers AS T1 JOIN (SELECT gender_code, COUNT(*) AS order_count FROM Orders GROUP BY gender_code ORDER BY order_count LIMIT 1) AS T2 ON T1.gender_code = T2.gender_code
SELECT T1.product_color, T1.product_description, T1.product_size FROM Products AS T1 JOIN (SELECT MAX(product_price) AS max_price FROM Products) AS T2 ON T1.product_price < T2.max_price
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT T1.Name FROM director AS T1 INNER JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(T2.Program_ID) DESC LIMIT 1
SELECT T1.Name, T1.Age FROM director AS T1 JOIN director_admin AS T2 ON T1.Director_ID = T2.Director_ID JOIN program AS T3 ON T2.Director_ID = T3.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(T3.Program_ID) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.Channel_ID) FROM channel AS T1 LEFT JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID WHERE T2.Program_ID IS NULL
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID ORDER BY COUNT(DISTINCT T2.Director_ID) DESC LIMIT 1
SELECT T1.Name FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID JOIN director AS T3 ON T2.Director_ID = T3.Director_ID JOIN director_admin AS T4 ON T1.Channel_ID = T4.Channel_ID JOIN director AS T5 ON T4.Director_ID = T5.Director_ID WHERE T5.Age < 40 AND T3.Age > 60
SELECT DISTINCT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon') OR T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING COUNT(Driver_ID) > 2)
SELECT DISTINCT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon') OR T2.Driver_ID IN (SELECT Driver_ID FROM driver GROUP BY Driver_ID HAVING COUNT(Driver_ID) > 2)
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT T2.product_name FROM Products AS T1 JOIN Products AS T2 ON T1.product_type_code = T2.product_type_code WHERE T1.product_type_code IN (SELECT product_type_code FROM Products WHERE product_name LIKE '%hardware%' GROUP BY product_type_code HAVING AVG(product_price) < (SELECT AVG(product_price) FROM Products WHERE product_name LIKE '%hardware%'))
SELECT T2.product_name FROM Products AS T1 JOIN Products AS T2 ON T1.product_type_code = T2.product_type_code WHERE T1.product_type_code = 'Hardware' AND T2.product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers T1 LEFT JOIN Customer_Orders T2 ON T1.customer_id = T2.customer_id WHERE T2.order_id IS NULL
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers T1 LEFT JOIN Customer_Orders T2 ON T1.customer_id = T2.customer_id WHERE T2.order_id IS NULL
SELECT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_quantity > '6' OR T2.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3)
SELECT T1.order_id, T1.order_date FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id WHERE T2.order_quantity > '6' OR T2.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3)
SELECT T1.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(T2.Building_ID) DESC LIMIT 1
SELECT T2.Name, T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T2.Region_ID ORDER BY COUNT(T1.Building_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Customers_and_Services_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Customers_and_Services_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(DISTINCT T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T2.Service_ID = T3.Service_ID JOIN ( SELECT Service_ID, COUNT(*) as count FROM Customer_Interactions GROUP BY Service_ID ) AS T4 ON T3.Service_ID = T4.Service_ID WHERE T4.count = ( SELECT MIN(count) FROM ( SELECT Service_ID, COUNT(*) as count FROM Customer_Interactions GROUP BY Service_ID ) )
SELECT DISTINCT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T2.Service_ID = T3.Service_ID WHERE T3.Service_ID = (SELECT Service_ID FROM Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT DISTINCT T1.Service_ID, T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' OR EXISTS (SELECT 1 FROM Customer_Interactions AS T4 WHERE T4.Status_Code = 'good' AND T4.Service_ID = T1.Service_ID)
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' OR EXISTS (SELECT 1 FROM Customer_Interactions AS T4 WHERE T4.Status_Code = 'good' AND T4.Service_ID = T1.Service_ID)
SELECT T1.Service_ID FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customer_Interactions AS T3 ON T1.Service_ID = T3.Service_ID JOIN Customers AS T4 ON T3.Customer_ID = T4.Customer_ID WHERE T4.Customer_Details = 'Hardy Kutch' AND T3.Status_Code = 'bad'
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customer_Interactions AS T3 ON T1.Service_ID = T3.Service_ID JOIN Customers AS T4 ON T2.Customer_ID = T4.Customer_ID WHERE T4.Customer_Details = 'Hardy Kutch' AND T3.Status_Code = 'bad'
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT T1.name, T1.Type_of_powertrain, T1.Annual_fuel_cost FROM Vehicles AS T1 JOIN Vehicles AS T2 ON T1.id = T2.id WHERE T2.Model_year = 2013 AND T1.Model_year = 2014
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T1.bio_data, T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.class_id) >= 2 INTERSECT SELECT T1.bio_data, T1.student_id FROM Students AS T1 LEFT JOIN Detention AS T3 ON T1.student_id = T3.student_id GROUP BY T1.student_id HAVING COUNT(T3.detention_id) < 2
SELECT T1.student_id, T1.bio_data FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id = T2.student_id JOIN (SELECT student_id, COUNT(class_id) as class_count FROM Classes GROUP BY student_id) AS T3 ON T2.student_id = T3.student_id WHERE T3.class_count >= 2 INTERSECT SELECT T1.student_id, T1.bio_data FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id = T2.student_id JOIN (SELECT student_id, COUNT(detention_id) as detention_count FROM Detention GROUP BY student_id) AS T3 ON T2.student_id = T3.student_id WHERE T3.detention_count < 2
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details NOT LIKE 'net%'
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.class_details LIKE '%data%' AND T2.class_details NOT LIKE 'net%'
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id WHERE T2.student_id IN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN Achievements AS T3 ON T2.student_id = T3.student_id GROUP BY T1.student_id HAVING COUNT(T3.achievement_id) >= 2
SELECT T1.teacher_id, T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(T2.class_id) DESC LIMIT 1
SELECT T1.teacher_id, T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(T2.class_id) DESC LIMIT 1
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id JOIN (SELECT behaviour_monitoring_details, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1) AS T3 ON T2.behaviour_monitoring_details = T3.behaviour_monitoring_details JOIN (SELECT behaviour_monitoring_details, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) AS T4 ON T2.behaviour_monitoring_details = T4.behaviour_monitoring_details
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id WHERE T2.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 OFFSET 0 ) AND T2.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 OFFSET 2 )
SELECT T1.student_id, T1.bio_data, T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id WHERE T2.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id WHERE T2.behaviour_monitoring_details = ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT COUNT(T1.student_id), T2.event_type_description, T1.event_type_code FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code JOIN (SELECT event_type_code, COUNT(*) as count FROM Student_Events GROUP BY event_type_code ORDER BY count DESC LIMIT 1) AS T3 ON T1.event_type_code = T3.event_type_code
SELECT T1.event_type_code, T1.event_type_description, COUNT(T2.student_id) FROM Ref_Event_Types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.student_id) FROM Students AS T1 JOIN Achievements AS T2 ON T1.student_id = T2.student_id WHERE T2.achievement_id IS NULL
SELECT COUNT(DISTINCT T1.student_id) FROM Students AS T1 LEFT JOIN Achievements AS T2 ON T1.student_id = T2.student_id WHERE T2.achievement_id IS NULL
SELECT T1.detention_type_code, T1.detention_type_description FROM Ref_Detention_Type AS T1 JOIN ( SELECT detention_type_code, COUNT(*) as count FROM Detention GROUP BY detention_type_code ) AS T3 ON T1.detention_type_code = T3.detention_type_code ORDER BY T3.count LIMIT 1
SELECT T1.detention_type_code, T1.detention_type_description FROM Ref_Detention_Type AS T1 JOIN (SELECT detention_type_code, COUNT(detention_type_code) as count FROM Detention GROUP BY detention_type_code ORDER BY count LIMIT 1) AS T2 ON T1.detention_type_code = T2.detention_type_code
SELECT S.bio_data, S.student_details FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT T1.bio_data, T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id WHERE T2.amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans )
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id = T3.student_id WHERE T3.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT T1.student_details FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id = T2.student_id WHERE T2.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts )
SELECT T1.address_type_code, T1.address_type_description FROM Ref_Address_Types AS T1 JOIN (SELECT address_type_code, COUNT(*) as count FROM Students_Addresses GROUP BY address_type_code ORDER BY count DESC LIMIT 1) AS T2 ON T1.address_type_code = T2.address_type_code
SELECT T1.address_type_code, T1.address_type_description FROM Ref_Address_Types AS T1 JOIN (SELECT address_type_code, COUNT(*) as count FROM Students_Addresses GROUP BY address_type_code ORDER BY count DESC LIMIT 1) AS T2 ON T1.address_type_code = T2.address_type_code
