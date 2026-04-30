SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club
SELECT club.Name FROM club WHERE club.Name IS NOT NULL ORDER BY club.Name ASC
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manager != "Nike"
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT player.Name FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID ORDER BY player.Earnings ASC
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID GROUP BY driver.Name ORDER BY COUNT(driver.Name) ASC
SELECT DISTINCT Name FROM club WHERE Sponsor > 1200000
SELECT player.Name FROM club AS club JOIN player ON club.Club_ID = player.Club_ID WHERE club.Manufacturer > 1200000
SELECT player.Name FROM player WHERE player.Club_ID IN (SELECT club.Club_ID FROM club GROUP BY club.Club_ID HAVING COUNT(club.Club_ID) > 1)
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING COUNT(Club_ID) > 1)
SELECT club.Name FROM club WHERE club.Club_ID IN ( SELECT player.Club_ID FROM player GROUP BY player.Club_ID HAVING COUNT(player.Club_ID) > 1 )
SELECT player.Name FROM player WHERE player.Earnings > 1
SELECT COUNT(DISTINCT player.Name) FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID
SELECT COUNT(DISTINCT player.Name) FROM club AS club JOIN player AS player ON club.Club_ID = player.Club_ID
SELECT COUNT(Order_Items.order_item_id) FROM Order_Items
SELECT count(DISTINCT Order_Items.order_item_id) FROM Order_Items
SELECT COUNT(Order_Items.order_quantity) FROM Order_Items
SELECT DISTINCT order_quantity FROM Order_Items
SELECT COUNT(DISTINCT order_status_code) FROM Orders
SELECT COUNT(DISTINCT Customers.gender_code) FROM Products AS Products INNER JOIN Orders AS Orders ON Products.product_id = Orders.customer_id INNER JOIN Customers AS Customers ON Orders.customer_id = Customers.customer_id
SELECT COUNT(order_item_id) FROM Order_Items
SELECT COUNT(order_id) FROM Orders
SELECT AVG(order_status_code) FROM Orders
SELECT AVG(customer_id) FROM Orders
SELECT avg(customer_id) FROM Orders
SELECT AVG(Orders.customer_id) FROM Orders
SELECT COUNT(DISTINCT RnaG_MHz) FROM radio
SELECT program.Title FROM program ORDER BY program.Start_Year DESC
SELECT channel.Name FROM channel AS channel INNER JOIN program AS program ON channel.Channel_ID = program.Channel_ID INNER JOIN director AS director ON program.Director_ID = director.Director_ID WHERE director.Age BETWEEN 30 AND 60
SELECT count(*) FROM city_channel_tv_show
SELECT tv_show.Next_show_name FROM city_channel AS city_channel JOIN city_channel_tv_show AS city_channel_tv_show ON city_channel.ID = city_channel_tv_show.City_channel_ID JOIN tv_show AS tv_show ON city_channel_tv_show.tv_show_ID = tv_show.tv_show_ID WHERE tv_show.tv_show_name = 'radios' ORDER BY tv_show.Original_Airdate ASC
SELECT Transmitter FROM radio WHERE RnaG_MHz != 'ABC'
SELECT avg(Is_free) FROM city_channel_tv_show WHERE City_channel_ID IN (SELECT ID FROM city_channel WHERE City = 'radio')
SELECT tv_show.tv_show_name FROM tv_show GROUP BY tv_show.tv_show_name HAVING COUNT(tv_show.tv_show_name) > 3
SELECT driver.Name FROM vehicle AS vehicle JOIN vehicle_driver AS vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID JOIN driver AS driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID WHERE driver.Name = 'United States'
SELECT count(*) FROM vehicle WHERE Model = 'NASCAR'
SELECT COUNT(*) FROM vehicle WHERE Model = 'NASCAR'
SELECT AVG(Power) FROM vehicle
SELECT AVG(Power) FROM vehicle
SELECT Model FROM vehicle ORDER BY Model ASC
SELECT driver.Name FROM vehicle_driver AS vehicle JOIN driver ON vehicle.Vehicle_ID = driver.Driver_ID
SELECT count(*) FROM Student_Answers
SELECT COUNT(*) FROM Student_Answers
SELECT DISTINCT Student_Answer_ID FROM Student_Answers
SELECT DISTINCT First_Name FROM Students
SELECT DISTINCT Exams.Subject_Code FROM Exams INNER JOIN Questions_in_Exams ON Exams.Exam_ID = Questions_in_Exams.Exam_ID INNER JOIN Questions ON Questions_in_Exams.Question_ID = Questions.Question_ID WHERE Questions.Type_of_Question_Code = 'Normal'
SELECT DISTINCT Student_Answers.Comments FROM Student_Answers JOIN Questions_in_Exams ON Student_Answers.Exam_ID = Questions_in_Exams.Exam_ID JOIN Exams ON Questions_in_Exams.Exam_ID = Exams.Exam_ID WHERE Exams.Exam_Name = 'Normal'
SELECT count(DISTINCT Student_Answers.Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Satisfactory_YN) FROM Student_Answers
SELECT Students.bio_data FROM Students WHERE Students.student_details != "M"
SELECT Students.bio_data FROM Students INNER JOIN Transcripts ON Students.student_id = Transcripts.student_id WHERE Transcripts.transcript_details != 'M'
SELECT Student_Assessments.Student_Answer_ID FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID JOIN Questions ON Valid_Answers.Question_ID = Questions.Question_ID GROUP BY Student_Assessments.Student_Answer_ID HAVING COUNT(Student_Assessments.Student_Answer_ID) >= 3
SELECT Student_Assessments.Student_Answer_ID FROM Student_Assessments JOIN Valid_Answers ON Student_Assessments.Valid_Answer_ID = Valid_Answers.Valid_Answer_ID GROUP BY Student_Assessments.Student_Answer_ID HAVING COUNT(Student_Assessments.Student_Answer_ID) >= 3
SELECT Students.student_id , Students.bio_data , Students.student_details FROM Students
