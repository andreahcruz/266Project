SELECT count(*) FROM club	soccer_3
SELECT count(*) FROM club	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1	soccer_3
SELECT COUNT (DISTINCT Country) FROM player	soccer_3
SELECT COUNT (DISTINCT Country) FROM player	soccer_3
SELECT count(DISTINCT customer_id) FROM Orders	e_commerce
SELECT count(DISTINCT customer_id) FROM Orders	e_commerce
SELECT count(DISTINCT order_item_status_code) FROM Order_items	e_commerce
SELECT count(DISTINCT order_item_status_code) FROM Order_items	e_commerce
SELECT count(DISTINCT Payment_method_code) FROM Customer_Payment_Methods	e_commerce
SELECT count(DISTINCT Payment_method_code) FROM Customer_Payment_Methods	e_commerce
SELECT count(*) FROM Shipment_Items	e_commerce
SELECT count(*) FROM Shipment_Items	e_commerce
SELECT avg(product_price) FROM Products	e_commerce
SELECT avg(product_price) FROM Products	e_commerce
SELECT avg(T1.product_price) FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id	e_commerce
SELECT avg(T1.product_price) FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id	e_commerce
SELECT count(DISTINCT Digital_terrestrial_channel) FROM channel	bbc_channels
SELECT title FROM program ORDER BY start_year DESC	bbc_channels
SELECT name FROM director WHERE age BETWEEN 30 AND 60	bbc_channels
SELECT count(*) FROM radio	tv_shows
select transmitter from radio order by erp_kw asc	tv_shows
SELECT Station_name FROM city_channel WHERE Affiliation != "ABC"	tv_shows
SELECT avg(ERP_kW) FROM radio	tv_shows
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*)  >  3	tv_shows
SELECT name FROM driver WHERE citizenship  =  'United States'	vehicle_driver
SELECT name FROM driver WHERE citizenship  =  'United States'	vehicle_driver
SELECT count(*) FROM driver WHERE Racing_Series  =  'NASCAR'	vehicle_driver
SELECT count(*) FROM driver WHERE Racing_Series  =  'NASCAR'	vehicle_driver
SELECT avg(top_speed) FROM vehicle	vehicle_driver
SELECT avg(top_speed) FROM vehicle	vehicle_driver
SELECT name FROM driver ORDER BY name	vehicle_driver
SELECT name FROM driver ORDER BY name	vehicle_driver
SELECT count(*) FROM Exams	online_exams
SELECT count(*) FROM Exams	online_exams
select distinct subject_code from exams order by subject_code asc	online_exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code	online_exams
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"	online_exams
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"	online_exams
SELECT count(DISTINCT Comments) FROM Student_Answers	online_exams
SELECT count(DISTINCT Comments) FROM Student_Answers	online_exams
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"	online_exams
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"	online_exams
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING count(*)  >=  3	online_exams
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING count(*)  >=  3	online_exams
SELECT * FROM Students	online_exams
SELECT * FROM Students	online_exams
SELECT count(*) FROM Addresses	customers_and_orders
SELECT count(*) FROM Addresses	customers_and_orders
SELECT count(*) FROM Products	customers_and_orders
SELECT count(*) FROM Products	customers_and_orders
SELECT product_price FROM Products WHERE product_name  =  "Monitor"	customers_and_orders
SELECT product_price FROM Products WHERE product_name  =  "Monitor"	customers_and_orders
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"	customers_and_orders
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"	customers_and_orders
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"	customers_and_orders
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"	customers_and_orders
SELECT product_name FROM Products ORDER BY product_price DESC	customers_and_orders
SELECT product_name FROM Products ORDER BY product_price DESC	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2	customers_and_orders
SELECT count(*) FROM Customers	customers_and_orders
SELECT count(*) FROM Customers	customers_and_orders
SELECT DISTINCT payment_method_code FROM Customers	customers_and_orders
SELECT DISTINCT payment_method_code FROM Customers	customers_and_orders
SELECT count(*) FROM Customer_orders	customers_and_orders
SELECT count(*) FROM Customer_orders	customers_and_orders
SELECT count(DISTINCT customer_id) FROM Customer_orders	customers_and_orders
SELECT count(DISTINCT customer_id) FROM Customer_orders	customers_and_orders
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Wins_count  >  2	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Wins_count  >  2	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"	soccer_3
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"	soccer_3
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id	e_commerce
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id	e_commerce
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2	e_commerce
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2	e_commerce
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code	e_commerce
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code	e_commerce
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.Payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id	e_commerce
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.Payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id	e_commerce
SELECT T1.invoice_status_code ,  T1.invoice_date ,  T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number	e_commerce
SELECT T1.invoice_status_code ,  T1.invoice_date ,  T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number	e_commerce
SELECT T1.order_item_status_code ,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id	e_commerce
SELECT T1.order_item_status_code ,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id	e_commerce
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'	e_commerce
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'	e_commerce
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'	e_commerce
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'	e_commerce
SELECT order_status_code ,  date_order_placed FROM Orders	e_commerce
SELECT order_status_code ,  date_order_placed FROM Orders	e_commerce
SELECT address_line_1 ,  town_city ,  county FROM Customers WHERE Country  =  'USA'	e_commerce
SELECT address_line_1 ,  town_city ,  county FROM Customers WHERE Country  =  'USA'	e_commerce
SELECT T1.product_id ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3	e_commerce
SELECT T1.product_id ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3	e_commerce
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2	e_commerce
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2	e_commerce
SELECT shipment_tracking_number ,  shipment_date FROM Shipments	e_commerce
SELECT shipment_tracking_number ,  shipment_date FROM Shipments	e_commerce
SELECT name FROM director ORDER BY age DESC LIMIT 1	bbc_channels
SELECT count(*) FROM channel WHERE internet LIKE "%bbc%"	bbc_channels
SELECT title FROM program ORDER BY start_year DESC LIMIT 1	bbc_channels
SELECT t1.name ,  t1.internet FROM channel AS t1 JOIN program AS t2 ON t1.channel_id  =  t2.channel_id GROUP BY t1.channel_id HAVING count(*)  >  1	bbc_channels
SELECT t1.name ,  count(*) FROM channel AS t1 JOIN program AS t2 ON t1.channel_id  =  t2.channel_id GROUP BY t1.channel_id	bbc_channels
SELECT t2.name FROM program AS t1 JOIN director AS t2 ON t1.director_id  =  t2.director_id WHERE t1.title  =  'Dracula'	bbc_channels
SELECT tv_show_name ,  Original_Airdate FROM tv_show	tv_shows
SELECT Transmitter FROM radio WHERE ERP_kW  >  150 OR ERP_kW  <  30	tv_shows
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1	tv_shows
SELECT Affiliation ,  COUNT(*) FROM city_channel GROUP BY Affiliation	tv_shows
SELECT City ,  Station_name FROM city_channel ORDER BY Station_name ASC	tv_shows
SELECT T3.Transmitter ,  T2.City FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.City_channel_ID  =  T2.ID JOIN radio AS T3 ON T1.Radio_ID  =  T3.Radio_ID	tv_shows
SELECT T2.Transmitter ,  COUNT(*) FROM city_channel_radio AS T1 JOIN radio AS T2 ON T1.Radio_ID  =  T2.Radio_ID GROUP BY T2.Transmitter	tv_shows
SELECT max(power) ,  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'	vehicle_driver
SELECT max(power) ,  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'	vehicle_driver
SELECT top_speed ,  power FROM vehicle WHERE build_year  =  1996	vehicle_driver
SELECT top_speed ,  power FROM vehicle WHERE build_year  =  1996	vehicle_driver
SELECT build_year ,  model ,  builder FROM vehicle	vehicle_driver
SELECT build_year ,  model ,  builder FROM vehicle	vehicle_driver
SELECT count(DISTINCT T1.driver_id) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T2.build_year  =  2012	vehicle_driver
SELECT count(DISTINCT T1.driver_id) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T2.build_year  =  2012	vehicle_driver
SELECT model FROM vehicle WHERE total_production  >  100 OR top_speed  >  150	vehicle_driver
SELECT model FROM vehicle WHERE total_production  >  100 OR top_speed  >  150	vehicle_driver
SELECT model ,  build_year FROM vehicle WHERE model LIKE '%DJ%'	vehicle_driver
SELECT model ,  build_year FROM vehicle WHERE model LIKE '%DJ%'	vehicle_driver
SELECT count(*) ,  racing_series FROM driver GROUP BY racing_series	vehicle_driver
SELECT count(*) ,  racing_series FROM driver GROUP BY racing_series	vehicle_driver
SELECT Exam_Date ,  Exam_Name FROM Exams WHERE Subject_Code != 'Database'	online_exams
SELECT Exam_Date ,  Exam_Name FROM Exams WHERE Subject_Code != 'Database'	online_exams
SELECT Type_of_Question_Code ,  COUNT(*) FROM Questions GROUP BY Type_of_Question_Code	online_exams
SELECT Type_of_Question_Code ,  COUNT(*) FROM Questions GROUP BY Type_of_Question_Code	online_exams
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC	online_exams
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC	online_exams
SELECT T2.First_Name ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID	online_exams
SELECT T2.First_Name ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID	online_exams
SELECT T2.Email_Adress ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC	online_exams
SELECT T2.Email_Adress ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC	online_exams
SELECT T2.First_Name FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(*)  >=  2	online_exams
SELECT T2.First_Name FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(*)  >=  2	online_exams
SELECT Gender_MFU ,  COUNT(*) FROM Students GROUP BY Gender_MFU	online_exams
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1	soccer_3
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	soccer_3
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	soccer_3
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000	soccer_3
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000	soccer_3
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1	e_commerce
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1	e_commerce
select t1.product_id ,  t1.product_name ,  t1.product_price ,  t1.product_color from products as t1 join order_items as t2 on t1.product_id  =  t2.product_id join orders as t3 on t2.order_id  =  t3.order_id group by t1.product_id having count(*) < 2	e_commerce
SELECT Payment_method_code FROM Customer_Payment_Methods GROUP BY Payment_method_code ORDER BY count(*) DESC LIMIT 1	e_commerce
SELECT Payment_method_code FROM Customer_Payment_Methods GROUP BY Payment_method_code ORDER BY count(*) DESC LIMIT 1	e_commerce
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code	e_commerce
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code	e_commerce
SELECT T1.product_name ,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id	e_commerce
SELECT T1.product_name ,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id	e_commerce
SELECT T1.product_name ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id	e_commerce
SELECT T1.product_name ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id	e_commerce
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN ( SELECT invoice_number FROM Shipments )	e_commerce
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN ( SELECT invoice_number FROM Shipments )	e_commerce
select t1.order_id ,  t1.date_order_placed ,  sum(t3.product_price) from orders as t1 join order_items as t2 on t1.order_id  =  t2.order_id join products as t3 on t2.product_id  =  t3.product_id group by t1.order_id	e_commerce
SELECT T1.order_id ,  T1.date_order_placed ,  sum(T3.product_price) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id JOIN Products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id	e_commerce
SELECT T1.customer_first_name ,  T4.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id JOIN Products AS T4 ON T3.product_id  =  T4.product_id	e_commerce
SELECT T1.customer_first_name ,  T4.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id JOIN Products AS T4 ON T3.product_id  =  T4.product_id	e_commerce
SELECT date_order_placed FROM Orders WHERE customer_id IN ( SELECT T1.customer_id FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 )	e_commerce
SELECT date_order_placed FROM Orders WHERE customer_id IN ( SELECT T1.customer_id FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 )	e_commerce
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY count(*) LIMIT 1	e_commerce
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY count(*) LIMIT 1	e_commerce
SELECT name FROM director WHERE age  >  (SELECT avg(age) FROM director)	bbc_channels
SELECT t1.name ,  t1.channel_id FROM channel AS t1 JOIN director_admin AS t2 ON t1.channel_id  =  t2.channel_id JOIN director AS t3 ON t2.director_id  =  t3.director_id WHERE t3.name != "Hank Baskett"	bbc_channels
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1	tv_shows
SELECT T3.Transmitter ,  T2.Station_name FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.City_channel_ID  =  T2.ID JOIN radio AS T3 ON T1.Radio_ID  =  T3.Radio_ID ORDER BY T3.ERP_kW DESC	tv_shows
SELECT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)	tv_shows
SELECT model FROM vehicle WHERE power  >  6000 ORDER BY top_speed DESC LIMIT 1	vehicle_driver
SELECT model FROM vehicle WHERE power  >  6000 ORDER BY top_speed DESC LIMIT 1	vehicle_driver
SELECT count(*) ,  driver_id FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1	vehicle_driver
SELECT count(*) ,  driver_id FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1	vehicle_driver
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) ASC LIMIT 1	vehicle_driver
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) ASC LIMIT 1	vehicle_driver
select distinct t1.name from driver as t1 join vehicle_driver as t2 on t1.driver_id  =  t2.driver_id join vehicle as t3 on t2.vehicle_id  =  t3.vehicle_id where t3.power  >  5000	vehicle_driver
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.driver_id  =  T2.driver_id JOIN vehicle AS T3 ON T2.vehicle_id  =  T3.vehicle_id WHERE T3.power  >  5000	vehicle_driver
SELECT model FROM vehicle EXCEPT SELECT T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id	vehicle_driver
SELECT model FROM vehicle EXCEPT SELECT T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id	vehicle_driver
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T2.vehicle_id HAVING count(*)  =  2 OR T1.builder  =  'Ziyang'	vehicle_driver
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T2.vehicle_id HAVING count(*)  =  2 OR T1.builder  =  'Ziyang'	vehicle_driver
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)	vehicle_driver
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)	vehicle_driver
SELECT T1.name ,  T1.citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.driver_id  =  T2.driver_id JOIN vehicle AS T3 ON T2.vehicle_id  =  T3.vehicle_id WHERE T3.model  =  'DJ1'	vehicle_driver
SELECT T1.name ,  T1.citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.driver_id  =  T2.driver_id JOIN vehicle AS T3 ON T2.vehicle_id  =  T3.vehicle_id WHERE T3.model  =  'DJ1'	vehicle_driver
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC	online_exams
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC	online_exams
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1	online_exams
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1	online_exams
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1	online_exams
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1	online_exams
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)	online_exams
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)	online_exams
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"	online_exams
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"	online_exams
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)	customers_and_orders
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1	customers_and_orders
SELECT product_id ,  product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC LIMIT 1	customers_and_orders
SELECT product_id ,  product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC LIMIT 1	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT customer_name FROM Customers WHERE payment_method_code  =  ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1)	customers_and_orders
SELECT customer_name FROM Customers WHERE payment_method_code  =  ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1)	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1	customers_and_orders
SELECT order_status_code FROM Customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT order_status_code FROM Customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT product_name FROM Products EXCEPT SELECT T1.product_name FROM Products AS t1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id	customers_and_orders
SELECT product_name FROM Products EXCEPT SELECT T1.product_name FROM Products AS t1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id	customers_and_orders
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3	e_commerce
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3	e_commerce
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id	e_commerce
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id	e_commerce
SELECT product_id ,  product_name ,  product_price ,  product_color FROM Products EXCEPT SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.product_id HAVING count(*)  >=  2	e_commerce
SELECT T1.product_id ,  T1.product_name ,  T1.product_price FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1	e_commerce
SELECT T1.product_id ,  T1.product_name ,  T1.product_price FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1	e_commerce
SELECT T1.order_id ,  sum(T2.product_price) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) ASC LIMIT 1	e_commerce
select t1.order_id ,  sum(t2.product_price) from order_items as t1 join products as t2 on t1.product_id  =  t2.product_id group by t1.order_id order by sum(t2.product_price) asc limit 1	e_commerce
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'Female'	e_commerce
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'Female'	e_commerce
SELECT product_price ,  product_size FROM Products WHERE product_price  >  ( SELECT avg(product_price) FROM Products )	e_commerce
SELECT product_price ,  product_size FROM Products WHERE product_price  >  ( SELECT avg(product_price) FROM Products )	e_commerce
SELECT count(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )	e_commerce
SELECT count(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )	e_commerce
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payment_Methods )	e_commerce
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payment_Methods )	e_commerce
SELECT email_address ,  town_city ,  county FROM Customers WHERE gender_code  =  ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1 )	e_commerce
SELECT email_address ,  town_city ,  county FROM Customers WHERE gender_code  =  ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1 )	e_commerce
SELECT product_color ,  product_description ,  product_size FROM Products WHERE product_price  <  ( SELECT max(product_price) FROM products )	e_commerce
select product_color ,  product_description ,  product_size from products where product_price  !=  ( select max(product_price) from products )	e_commerce
SELECT t2.name FROM program AS t1 JOIN director AS t2 ON t1.director_id  =  t2.director_id GROUP BY t1.director_id ORDER BY count(*) DESC LIMIT 1	bbc_channels
SELECT t2.name ,  t2.age FROM program AS t1 JOIN director AS t2 ON t1.director_id  =  t2.director_id GROUP BY t1.director_id ORDER BY count(*) DESC LIMIT 1	bbc_channels
SELECT count(*) FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM program)	bbc_channels
SELECT t1.name ,  t1.internet FROM channel AS t1 JOIN director_admin AS t2 ON t1.channel_id  =  t2.channel_id GROUP BY t1.channel_id ORDER BY count(*) DESC LIMIT 1	bbc_channels
SELECT t1.name FROM channel AS t1 JOIN director_admin AS t2 ON t1.channel_id  =  t2.channel_id JOIN director AS t3 ON t2.director_id  =  t3.director_id WHERE t3.age  <  40 INTERSECT SELECT t1.name FROM channel AS t1 JOIN director_admin AS t2 ON t1.channel_id  =  t2.channel_id JOIN director AS t3 ON t2.director_id  =  t3.director_id WHERE t3.age  >  60	bbc_channels
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id WHERE T3.name  =  'Jeff Gordon' UNION SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T2.vehicle_id HAVING count(*)  >  2	vehicle_driver
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id WHERE T3.name  =  'Jeff Gordon' UNION SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T2.vehicle_id HAVING count(*)  >  2	vehicle_driver
SELECT count(*) FROM driver WHERE driver_id NOT IN ( SELECT driver_id FROM vehicle_driver )	vehicle_driver
SELECT count(*) FROM driver WHERE driver_id NOT IN ( SELECT driver_id FROM vehicle_driver )	vehicle_driver
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")	customers_and_orders
SELECT T1.customer_id ,  T2.customer_name ,  T2.customer_phone ,  T2.customer_email FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT T1.customer_id ,  T2.customer_name ,  T2.customer_phone ,  T2.customer_email FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	customers_and_orders
SELECT count(*) FROM Customers WHERE customer_id NOT IN  ( SELECT customer_id FROM Customer_orders)	customers_and_orders
SELECT count(*) FROM Customers WHERE customer_id NOT IN  ( SELECT customer_id FROM Customer_orders)	customers_and_orders
SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 UNION SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3;	customers_and_orders
SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 UNION SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3;	customers_and_orders
SELECT T2.capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1	region_building
SELECT T2.capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1	region_building
SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_details ORDER BY count(*) DESC LIMIT 1	government_shift
select t1.customer_details from customers as t1 join customers_and_services as t2 on t1.customer_id  =  t2.customer_id group by t1.customer_details order by count(*) desc limit 1	government_shift
select t1.customer_details from customers as t1 join customers_and_services as t2 on t1.customer_id  =  t2.customer_id group by t1.customer_details order by count(*) desc limit 1	government_shift
select t1.customer_details from customers as t1 join customers_and_services as t2 on t1.customer_id  =  t2.customer_id group by t1.customer_details order by count(*) desc limit 1	government_shift
select distinct t1.customer_details from customers as t1 join customers_and_services as t2 on t1.customer_id  =  t2.customer_id where t2.service_id  =  (select service_id from services group by service_id order by count(*) asc limit 1)	government_shift
select distinct t1.customer_details from customers as t1 join customers_and_services as t2 on t1.customer_id  =  t2.customer_id where t2.service_id  =  (select service_id from services group by service_id order by count(*) asc limit 1)	government_shift
SELECT DISTINCT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id JOIN customer_interactions AS t4 ON t3.service_id  =  t4.service_id WHERE t1.customer_details  =  "Hardy Kutch" OR t4.services_and_channels_details  =  "good"	government_shift
SELECT DISTINCT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id JOIN customer_interactions AS t4 ON t3.service_id  =  t4.service_id WHERE t1.customer_details  =  "Hardy Kutch" OR t4.services_and_channels_details  =  "good"	government_shift
SELECT DISTINCT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id JOIN customer_interactions AS t4 ON t3.service_id  =  t4.service_id WHERE t1.customer_details  =  "Hardy Kutch" AND t4.services_and_channels_details  =  "bad"	government_shift
SELECT DISTINCT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id JOIN customer_interactions AS t4 ON t3.service_id  =  t4.service_id WHERE t1.customer_details  =  "Hardy Kutch" AND t4.services_and_channels_details  =  "bad"	government_shift
SELECT name ,  type_of_powertrain ,  annual_fuel_cost FROM vehicles WHERE model_year  =  2013 OR model_year  =  2014	vehicle_rent
SELECT name ,  type_of_powertrain ,  annual_fuel_cost FROM vehicles WHERE model_year  =  2013 OR model_year  =  2014	vehicle_rent
SELECT T2.name ,  T2.model_year FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T2.id ORDER BY count(*) DESC LIMIT 1	vehicle_rent
SELECT T2.name ,  T2.model_year FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T2.id ORDER BY count(*) DESC LIMIT 1	vehicle_rent
SELECT T2.name FROM renting_history AS T1 JOIN discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T2.id ORDER BY count(*) DESC LIMIT 1	vehicle_rent
SELECT T2.name FROM renting_history AS T1 JOIN discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T2.id ORDER BY count(*) DESC LIMIT 1	vehicle_rent
SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 UNION SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2	cre_Students_Information_Systems
SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 UNION SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2	cre_Students_Information_Systems
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'	cre_Students_Information_Systems
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'	cre_Students_Information_Systems
SELECT amount_of_loan ,  date_of_loan FROM Student_Loans WHERE student_id IN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING count(*)  >=  2 )	cre_Students_Information_Systems
SELECT amount_of_loan ,  date_of_loan FROM Student_Loans WHERE student_id IN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING count(*)  >=  2 )	cre_Students_Information_Systems
SELECT T1.teacher_details ,  T1.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1	cre_Students_Information_Systems
SELECT T1.teacher_details ,  T1.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1	cre_Students_Information_Systems
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 ) INTERSECT SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING count(*)  =  3 )	cre_Students_Information_Systems
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 ) INTERSECT SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING count(*)  =  3 )	cre_Students_Information_Systems
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 ) EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details NOT IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 )	cre_Students_Information_Systems
select t1.bio_data from students as t1 join behaviour_monitoring as t2 on t1.student_id  =  t2.student_id where t2.behaviour_monitoring_details in ( select behaviour_monitoring_details from behaviour_monitoring group by behaviour_monitoring_details order by count(*) desc limit 1 ) except select t1.bio_data from students as t1 join behaviour_monitoring as t2 on t1.student_id  =  t2.student_id where t2.behaviour_monitoring_details not in ( select behaviour_monitoring_details from behaviour_monitoring group by behaviour_monitoring_details order by count(*) desc limit 1 )	cre_Students_Information_Systems
SELECT count(*) ,  T2.event_type_code ,  T3.event_type_description FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Event_Types AS T3 ON T2.event_type_code  =  T3.event_type_code GROUP BY T2.event_type_code ORDER BY count(*) DESC LIMIT 1	cre_Students_Information_Systems
SELECT count(*) ,  T2.event_type_code ,  T3.event_type_description FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Event_Types AS T3 ON T2.event_type_code  =  T3.event_type_code GROUP BY T2.event_type_code ORDER BY count(*) DESC LIMIT 1	cre_Students_Information_Systems
SELECT count(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.student_id NOT IN ( SELECT student_id FROM Achievements )	cre_Students_Information_Systems
SELECT count(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.student_id NOT IN ( SELECT student_id FROM Achievements )	cre_Students_Information_Systems
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1	cre_Students_Information_Systems
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1	cre_Students_Information_Systems
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  >  ( SELECT avg(amount_of_loan) FROM Student_Loans )	cre_Students_Information_Systems
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  >  ( SELECT avg(amount_of_loan) FROM Student_Loans )	cre_Students_Information_Systems
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id  =  T3.student_id ORDER BY T3.date_of_transcript ASC LIMIT 1	cre_Students_Information_Systems
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id  =  T3.student_id ORDER BY T3.date_of_transcript ASC LIMIT 1	cre_Students_Information_Systems
SELECT T1.address_type_code ,  T2.address_type_description FROM Students_Addresses AS T1 JOIN Ref_Address_Types AS T2 WHERE T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1	cre_Students_Information_Systems
SELECT T1.address_type_code ,  T2.address_type_description FROM Students_Addresses AS T1 JOIN Ref_Address_Types AS T2 WHERE T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1	cre_Students_Information_Systems
