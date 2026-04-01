SELECT COUNT(Singer_ID) FROM singer
SELECT COUNT(Singer_ID) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT AVG(Age) AS Average, MIN(Age) AS Minimum, MAX(Age) AS Maximum FROM singer WHERE Country = 'France'
SELECT AVG(Age) AS Average, MIN(Age) AS Minimum, MAX(Age) AS Maximum FROM singer WHERE Country = 'France'
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country, COUNT(Singer_ID) FROM singer GROUP BY Country
SELECT Country, COUNT(Singer_ID) FROM singer GROUP BY Country
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity), AVG(Average) FROM stadium
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT COUNT(concert_ID) FROM concert WHERE Year = '2014' OR Year = '2015'
SELECT COUNT(concert_ID) FROM concert WHERE Year = '2014' OR Year = '2015'
SELECT T1.Name, COUNT(T2.concert_ID) FROM stadium AS T1 LEFT JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Name
SELECT T1.Stadium_ID, COUNT(T2.concert_ID) FROM stadium AS T1 LEFT JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Stadium_ID
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year >= '2014' GROUP BY T1.Name, T1.Capacity ORDER BY COUNT(T2.concert_ID) DESC LIMIT 1
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year > '2013' GROUP BY T1.Name, T1.Capacity ORDER BY COUNT(T2.concert_ID) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(concert_ID) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(concert_ID) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT DISTINCT T1.Country FROM singer AS T1 WHERE T1.Age > 40 INTERSECT SELECT DISTINCT T1.Country FROM singer AS T1 WHERE T1.Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT T1.concert_Name, T1.Theme, COUNT(T2.Singer_ID) FROM concert AS T1 LEFT JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID, T1.concert_Name, T1.Theme
SELECT T1.concert_Name, T1.Theme, COUNT(T2.Singer_ID) FROM concert AS T1 LEFT JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID, T1.concert_Name, T1.Theme
SELECT T1.Name, COUNT(T2.concert_ID) FROM singer AS T1 LEFT JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID, T1.Name
SELECT T1.Name, COUNT(T2.concert_ID) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT T3.Name FROM concert AS T1 INNER JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID INNER JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID WHERE T1.Year = '2014'
SELECT T3.Name FROM concert AS T1 INNER JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID INNER JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID WHERE T1.Year = '2014'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year IN ('2014', '2015') AND T2.Stadium_ID IN ( SELECT T2.Stadium_ID FROM concert AS T2 WHERE T2.Year IN ('2014', '2015') GROUP BY T2.Stadium_ID HAVING COUNT(DISTINCT T2.Year) = 2 )
SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year IN ('2014', '2015') AND T1.Stadium_ID IN ( SELECT T2.Stadium_ID FROM concert AS T2 WHERE T2.Year = '2014' INTERSECT SELECT T2.Stadium_ID FROM concert AS T2 WHERE T2.Year = '2015' )
SELECT COUNT(T2.concert_ID) FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Capacity = (SELECT MAX(Capacity) FROM stadium)
SELECT COUNT(T2.concert_ID) FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Capacity = (SELECT MAX(Capacity) FROM stadium)
SELECT COUNT(PetID) FROM Pets WHERE weight > 10
SELECT COUNT(PetID) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT COUNT(T2.PetID) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(T2.PetID) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(T3.PetID) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog'
SELECT COUNT(T3.PetID) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT DISTINCT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' OR P.PetType = 'dog'
SELECT DISTINCT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' OR P.PetType = 'dog'
SELECT DISTINCT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND S.StuID IN ( SELECT S.StuID FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' )
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T1.StuID IN ( SELECT T1.StuID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' )
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT S.Major, S.Age FROM Student S WHERE S.StuID NOT IN (SELECT H.StuID FROM Has_Pet H JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT H.StuID FROM Has_Pet H JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat')
SELECT DISTINCT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND S.StuID NOT IN (SELECT S.StuID FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat')
SELECT DISTINCT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND S.StuID NOT IN (SELECT S2.StuID FROM Student S2 JOIN Has_Pet HP2 ON S2.StuID = HP2.StuID JOIN Pets P2 ON HP2.PetID = P2.PetID WHERE P2.PetType = 'cat')
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT T2.PetType, T2.weight FROM Has_Pet AS T1 INNER JOIN Pets AS T2 ON T1.PetID = T2.PetID ORDER BY T2.pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType
SELECT PetType, AVG(pet_age) AS average_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT DISTINCT S.Fname, S.Age FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID
SELECT DISTINCT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT S.StuID, COUNT(H.PetID) FROM Student S JOIN Has_Pet H ON S.StuID = H.StuID GROUP BY S.StuID
SELECT S.StuID, COUNT(H.PetID) FROM Student S JOIN Has_Pet H ON S.StuID = H.StuID GROUP BY S.StuID
SELECT S.Fname, S.Sex FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING COUNT(HP.PetID) > 1
SELECT S.Fname, S.Sex FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING COUNT(HP.PetID) > 1
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(ContId) FROM continents
SELECT COUNT(ContId) FROM continents
SELECT T1.ContId, T1.Continent, COUNT(T2.CountryId) FROM continents AS T1 LEFT JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId, T1.Continent
SELECT c.ContId, c.Continent, COUNT(co.CountryId) FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent
SELECT COUNT(CountryId) FROM countries
SELECT COUNT(CountryId) FROM countries
SELECT T1.FullName, T1.Id, COUNT(T2.ModelId) FROM car_makers AS T1 LEFT JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.FullName ORDER BY T1.Id
SELECT T1.Id, T1.FullName, COUNT(T2.ModelId) FROM car_makers AS T1 LEFT JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.FullName
SELECT T3.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId ORDER BY T1.Horsepower LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T3 ON T1.Id = T3.MakeId INNER JOIN model_list AS T2 ON T3.Model = T2.ModelId ORDER BY T1.Horsepower LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T3 ON T1.Id = T3.MakeId INNER JOIN model_list AS T2 ON T3.Model = T2.ModelId WHERE T1.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T3 ON T1.Id = T3.MakeId INNER JOIN model_list AS T2 ON T3.Model = T2.ModelId WHERE T1.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT DISTINCT T3.Maker FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN car_makers AS T3 ON T2.Make = T3.FullName WHERE T1.Year = 1970
SELECT DISTINCT T3.Maker FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN car_makers AS T3 ON T2.Make = T3.Maker WHERE T1.Year = 1970
SELECT T1.Make, T2.Year FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year = (SELECT MIN(Year) FROM cars_data)
SELECT T1.Maker, T3.Year FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T4 ON T2.Model = T4.Model JOIN cars_data AS T3 ON T4.MakeId = T3.Id ORDER BY T3.Year LIMIT 1
SELECT DISTINCT T2.Model FROM cars_data AS T1 JOIN car_names AS T3 ON T1.Id = T3.MakeId JOIN model_list AS T2 ON T3.Model = T2.ModelId WHERE T1.Year > 1980
SELECT DISTINCT T3.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T1.Year > 1980
SELECT T1.Continent, COUNT(T3.Id) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent JOIN car_makers AS T3 ON T2.CountryId = T3.Country GROUP BY T1.Continent
SELECT T1.Continent, COUNT(T3.Id) FROM continents AS T1 LEFT JOIN countries AS T2 ON T1.ContId = T2.Continent LEFT JOIN car_makers AS T3 ON T2.CountryId = T3.Country GROUP BY T1.Continent
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT COUNT(ml.ModelId), cm.FullName FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.FullName
SELECT COUNT(T2.ModelId) AS num_models, T1.Id, T1.FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.FullName
SELECT T4.Accelerate FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T1.Maker = 'AMC' AND T3.Model = 'Hornet Sportabout (SW)'
SELECT T4.Accelerate FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.ModelId INNER JOIN car_makers AS T3 ON T2.Maker = T3.Id INNER JOIN cars_data AS T4 ON T1.MakeId = T4.Id WHERE T1.Model = 'amc hornet sportabout (sw)'
SELECT COUNT(DISTINCT T1.Id) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId INNER JOIN continents AS T3 ON T2.Continent = T3.ContId WHERE T2.CountryName = 'France'
SELECT COUNT(DISTINCT T1.Maker) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'France'
SELECT COUNT(DISTINCT T3.Model) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.ModelId = T3.ModelId INNER JOIN countries AS T4 ON T1.Country = T4.CountryId WHERE T4.CountryName = 'USA'
SELECT COUNT(DISTINCT T3.Model) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.MakeId WHERE T1.Country = 'United States'
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT MIN(T1.Weight) FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId INNER JOIN car_makers AS T3 ON T2.Maker = T3.Id WHERE T1.Cylinders = 8 AND T1.Year = 1974
SELECT MIN(T1.Weight) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 8 AND T1.Year = 1974
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId
SELECT DISTINCT T1.CountryId, T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country
SELECT COUNT(Id) FROM cars_data WHERE Horsepower > '150'
SELECT COUNT(cars_data.Id) FROM cars_data WHERE Horsepower > '150'
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT AVG(Weight) AS AverageWeight, Year FROM cars_data GROUP BY Year
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId JOIN continents AS T3 ON T2.Continent = T3.ContId WHERE T3.Continent = 'Europe' GROUP BY T2.CountryName HAVING COUNT(T1.Id) >= 3
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country JOIN continents AS T3 ON T1.Continent = T3.ContId WHERE T3.Continent = 'Europe' GROUP BY T1.CountryName HAVING COUNT(DISTINCT T2.Maker) >= 3
SELECT T2.Horsepower, T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 3 ORDER BY T2.Horsepower DESC LIMIT 1
SELECT T2.Horsepower, T3.Make FROM cars_data AS T1 INNER JOIN cars_data AS T2 ON T1.Id = T2.Id INNER JOIN car_names AS T3 ON T1.Id = T3.MakeId WHERE T1.Cylinders = 3 ORDER BY T2.Horsepower DESC LIMIT 1
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.ModelId = T2.MakeId JOIN cars_data AS T3 ON T2.MakeId = T3.Id ORDER BY T3.MPG DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 JOIN car_names AS T3 ON T1.Id = T3.MakeId JOIN model_list AS T2 ON T3.Model = T2.Model ORDER BY CAST(REPLACE(T1.MPG, ' miles/gal', '') AS REAL) DESC LIMIT 1
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'volvo'
SELECT AVG(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'Volvo'
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.ModelId = T2.ModelId GROUP BY T1.Model ORDER BY COUNT(T2.MakeId) DESC LIMIT 1
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.ModelId = T2.MakeId GROUP BY T1.Model ORDER BY COUNT(T2.MakeId) DESC LIMIT 1
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(Id) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(ml.ModelId) FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker WHERE cm.FullName = 'American Motor Company'
SELECT COUNT(T2.ModelId) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.FullName = 'American Motor Company'
SELECT T1.FullName, T1.Id FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.FullName HAVING COUNT(T2.ModelId) > 3
SELECT T1.Maker, T1.Id FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.ModelId) > 3
SELECT DISTINCT T4.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.MakeId JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T1.FullName = 'General Motors' OR T4.Weight > 3500
SELECT DISTINCT T4.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T1.FullName = 'General Motors' OR T4.Weight > 3500
SELECT DISTINCT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000
SELECT DISTINCT T1.Year FROM cars_data AS T1 WHERE T1.Weight < 4000 AND T1.Year IN (SELECT T2.Year FROM cars_data AS T2 WHERE T2.Weight > 3000)
SELECT T1.Horsepower FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT T4.Cylinders FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.ModelId = T3.MakeId INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T2.Model = 'volvo' ORDER BY T4.Accelerate LIMIT 1
SELECT T1.Cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'Volvo' ORDER BY T1.Accelerate LIMIT 1
SELECT COUNT(cars_data.Id) FROM cars_data WHERE cars_data.Accelerate > (SELECT MAX(cars_data.Horsepower) FROM cars_data)
SELECT COUNT(cars_data.Id) FROM cars_data WHERE cars_data.Accelerate < (SELECT MIN(cars_data.Accelerate) FROM cars_data WHERE cars_data.Horsepower = (SELECT MAX(cars_data.Horsepower) FROM cars_data))
SELECT COUNT(DISTINCT T1.CountryId) FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2)
SELECT COUNT(DISTINCT T1.CountryId) FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T2.Country IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2)
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 6
SELECT T2.Model FROM cars_data AS T1 JOIN car_names AS T3 ON T1.Id = T3.MakeId JOIN model_list AS T2 ON T3.Model = T2.Model WHERE T1.Cylinders = 4 ORDER BY CAST(REPLACE(T1.Horsepower, ' ', '') AS REAL) DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T3 ON T1.Id = T3.MakeId INNER JOIN model_list AS T2 ON T3.Model = T2.ModelId WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T1.MakeId, T1.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND T2.Cylinders <= 3
SELECT T1.MakeId, T1.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders < 4 AND T2.Horsepower NOT IN (SELECT MIN(Horsepower) FROM cars_data)
SELECT MAX(T1.MPG) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 8 OR T1.Year < 1980
SELECT MAX(T1.MPG) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 8 OR T1.Year < 1980
SELECT T3.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.MakeId JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Weight < 3500 AND T1.FullName != 'Ford Motor Company'
SELECT DISTINCT T4.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.MakeId JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Weight < 3500 AND T1.FullName != 'Ford Motor Company'
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.Maker HAVING COUNT(T2.ModelId) > 1 AND T1.Id IN ( SELECT T3.Maker FROM model_list AS T3 GROUP BY T3.Maker HAVING COUNT(T3.ModelId) > 3 )
SELECT T1.Id, T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.Maker HAVING COUNT(T2.ModelId) >= 2 AND COUNT(T2.ModelId) > 3
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T2.Maker = 'fiat' UNION SELECT T1.CountryId, T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(T2.Id) > 3
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 WHERE T1.CountryId IN ( SELECT T2.Country FROM car_makers AS T2 GROUP BY T2.Country HAVING COUNT(T2.Id) > 3 ) OR T1.CountryId IN ( SELECT T4.Country FROM car_makers AS T4 JOIN model_list AS T5 ON T4.Id = T5.Maker WHERE T5.Model = 'fiat' )
SELECT T1.Country FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = "JetBlue Airways"
SELECT T1.Country FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = "JetBlue Airways"
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT T1.Airline, T1.Abbreviation FROM airlines AS T1 INNER JOIN airports AS T2 ON T1.Country = T2.Country WHERE T2.Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(uid) FROM airlines
SELECT COUNT(uid) FROM airlines
SELECT COUNT(AirportCode) FROM airports
SELECT COUNT(AirportCode) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(uid) FROM airlines WHERE Country = 'USA'
SELECT COUNT(DISTINCT T1.Airline) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline INNER JOIN airports AS T3 ON T2.SourceAirport = T3.AirportCode WHERE T3.Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportCode = 'ALN'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS f JOIN airports AS a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(f.FlightNo) FROM flights f JOIN airports a1 ON f.SourceAirport = a1.AirportCode JOIN airports a2 ON f.DestAirport = a2.AirportCode WHERE a1.City = 'Aberdeen' AND a2.City = 'Ashley'
SELECT COUNT(*) FROM flights AS f JOIN airports AS a ON f.SourceAirport = a.AirportCode JOIN airports AS b ON f.DestAirport = b.AirportCode WHERE a.City = 'Aberdeen' AND b.City = 'Ashley'
SELECT COUNT(T2.FlightNo) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.DestAirport = 'ASY'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid JOIN airports AS ap ON f.DestAirport = ap.AirportCode WHERE a.Abbreviation = 'United Airlines' AND ap.AirportCode = 'ASY'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.SourceAirport = 'AHD'
SELECT COUNT(flights.FlightNo) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Abbreviation = 'United Airlines' AND flights.SourceAirport = 'AHD'
SELECT COUNT(T1.FlightNo) FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid INNER JOIN airports AS T3 ON T1.DestAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T3.City = 'Aberdeen'
SELECT COUNT(f.FlightNo) FROM flights f JOIN airlines a ON f.Airline = a.uid JOIN airports ap ON f.DestAirport = ap.AirportCode WHERE a.Airline = 'United Airlines' AND ap.City = 'Aberdeen'
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(T2.FlightNo) DESC LIMIT 1
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(T2.DestAirport) DESC LIMIT 1
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(T2.FlightNo) DESC LIMIT 1
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(T2.SourceAirport) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT AirportCode FROM airports WHERE AirportCode IN ( SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1 ) OR AirportCode IN ( SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) ASC LIMIT 1 ) ORDER BY ( SELECT COUNT(*) FROM flights WHERE SourceAirport = AirportCode OR DestAirport = AirportCode ) ASC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Airline, COUNT(T2.FlightNo) as num_flights FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY num_flights DESC LIMIT 1
SELECT T1.Airline, COUNT(T2.FlightNo) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(T2.FlightNo) DESC LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Abbreviation, T1.Country ORDER BY COUNT(T2.FlightNo) LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Abbreviation, T1.Country ORDER BY COUNT(T2.FlightNo) LIMIT 1
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' AND T1.uid IN (SELECT T4.Airline FROM airlines AS T3 JOIN flights AS T4 ON T3.uid = T4.Airline WHERE T4.SourceAirport = 'CVO') UNION SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'APG' AND T1.uid IN (SELECT T4.Airline FROM airlines AS T3 JOIN flights AS T4 ON T3.uid = T4.Airline WHERE T4.DestAirport = 'CVO') UNION SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' AND T1.uid IN (SELECT T4.Airline FROM airlines AS T3 JOIN flights AS T4 ON T3.uid = T4.Airline WHERE T4.DestAirport = 'CVO') UNION SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'APG' AND T1.uid IN (SELECT T4.Airline FROM airlines AS T3 JOIN flights AS T4 ON T3.uid = T4.Airline WHERE T4.SourceAirport = 'CVO')
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport IN ('APG', 'CVO') GROUP BY T1.Airline HAVING COUNT(DISTINCT T2.SourceAirport) = 2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T1.uid NOT IN (SELECT T2.Airline FROM flights AS T2 WHERE T2.SourceAirport = 'APG')
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T1.uid NOT IN (SELECT T3.Airline FROM flights AS T3 WHERE T3.SourceAirport = 'APG')
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) >= 10
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.FlightNo) < 200
SELECT T2.FlightNo FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = "United Airlines"
SELECT T2.FlightNo FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines'
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.AirportCode = 'APG'
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.AirportCode = 'APG'
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.AirportCode = 'APG'
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.AirportCode = 'APG'
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = "Aberdeen"
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = "Aberdeen"
SELECT T1.FlightNo FROM flights AS T1 INNER JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS f JOIN airports AS a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen' OR a.City = 'Abilene'
SELECT COUNT(*) FROM flights AS f JOIN airports AS a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen' OR a.City = 'Abilene'
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT COUNT(Employee_ID) FROM employee
SELECT COUNT(Employee_ID) FROM employee
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop)
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop)
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products) AS min_products, MAX(Number_products) AS max_products FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Name ORDER BY COUNT(T2.Year_awarded) DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Name ORDER BY COUNT(T2.Year_awarded) DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
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
SELECT name, tonnage FROM ship ORDER BY name DESC
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
SELECT COUNT(ID) FROM Highschooler
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
