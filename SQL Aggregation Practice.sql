CREATE DATABASE StudyDB;

USE StudyDB;

CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);

-- Instructors 
INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); -- Categories 
INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); -- Courses 
INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); -- Students 
INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); -- Enrollments 
INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3); 


--Count total number of students
SELECT COUNT(*) AS TotalStudents
FROM Students;

--Count total number of enrollments
SELECT COUNT(*) AS TotalEnrollments
FROM Enrollments;

--Find average rating of each course
SELECT CourseID, AVG(Rating) AS AverageRating
FROM Enrollments
GROUP BY CourseID;

--Total number of courses per instructor
SELECT InstructorID, COUNT(*) AS TotalCourses
FROM Courses
GROUP BY InstructorID;

--Number of courses in each category
SELECT CategoryID, COUNT(*) AS CourseCount
FROM Courses
GROUP BY CategoryID;

--Number of students enrolled in each course
SELECT CourseID, COUNT(StudentID) AS StudentsEnrolled
FROM Enrollments
GROUP BY CourseID;

--Average course price per category
SELECT CategoryID, AVG(Price) AS AveragePrice
FROM Courses
GROUP BY CategoryID;

--Maximum course price
SELECT MAX(Price) AS MaxCourcePrice
FROM Courses;

--Min, Max, and Avg rating per course
SELECT CourseID, Min(Rating) AS MinRating, MAX(Rating) AS MAXRating, AVG(Rating) AS AvgRating
FROM Enrollments
GROUP BY CourseID;
	
--Count how many students gave rating = 5
SELECT COUNT(*) AS PerfectRatings
FROM Enrollments
WHERE Rating = 5;

--Intermediate Level
--Average completion percent per course
SELECT CourseID, AVG(CompletionPercent)
FROM Enrollments
GROUP BY CourseID;

--Error: Msg 156, Level 15, State 1, Line 119
--Incorrect syntax near the keyword 'FROM'.
--HOW Fixed : Remove Comma after AVG(CompletionPercent)
--Erro: Msg 8120, Level 16, State 1, Line 118
--Column 'Enrollments.EnrollmentID' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
--HOW Fixed : Chnge the Selection statement REPLACE EnrollmentId by CourseId

--Find students enrolled in more than 1 course.
SELECT StudentID
FROM Enrollments
GROUP BY StudentID
HAVING COUNT(*)>1;

--Calculate revenue per course (price * enrollments)
SELECT C.CourseID,COUNT(E.EnrollmentID)*C.Price AS RevenuePerCourse
FROM Courses C
JOIN Enrollments E ON E.CourseID = C.CourseID
GROUP BY C.CourseID, C.Price

--Column 'Courses.Price' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
--HOW Fixed : Add C.Price 

--List instructor name + distinct student count.
SELECT I.FullName, COUNT(DISTINCT E.StudentID) AS DistinctStudent --DISTINCT: remove duplicates, so it will count student only once
FROM Instructors I
JOIN Courses C ON I.InstructorID=C.InstructorID
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY I.FullName;

--art identifier "E.StudentID" could not be bound.
--HOW Fixed: JOIN THE Enrollment E to connect courses with student enrollments

--Average enrollments per category.
SELECT C.CategoryID,Count(E.EnrollmentID)AS CountEnrollment,
(SELECT COUNT(*) FROM Courses C2 
WHERE C2.CategoryID = C.CategoryID) AS CourseCount,
Count(E.EnrollmentID)/
(SELECT COUNT(*) FROM Courses C2 
WHERE C2.CategoryID = C.CategoryID) AS AvgEnrollments
from Courses C
JOIN Enrollments E ON C.CourseID=E.CourseID
GROUP BY C.CategoryID

--Invalid object name 'Courses
--HOW Fixed: Switch to the right Database, where I was on master and then switched to DB

--Average course rating by instructor.
SELECT C.InstructorID ,AVG(Rating) AS AvgCourseRating
FROM Courses C
join Enrollments E ON C.CourseID=E.CourseID
GROUP BY C.InstructorID

--Top 3 courses by enrollment count
SELECT C.CourseID, COUNT(E.EnrollmentID) AS EnrollmentCount
FROM Courses C
JOIN Enrollments E ON C.CourseID=E.CourseID
GROUP BY C.CourseID

--Average days students take to complete 100% (use mock logic).
SELECT AVG(DATEDIFF(DAY, EnrollDate, DATEADD(DAY, 10, EnrollDate))) AS AvgDaysToComplete
FROM Enrollments
WHERE CompletionPercent = 100; --Filters only the students who completed the course fully.

--Percentage of students who completed each course
SELECT E.CourseID,ROUND(100.0 * SUM(IIF(E.CompletionPercent = 100, 1, 0)) / COUNT(*), 2) AS CompletionRate
FROM Enrollments E
GROUP BY E.CourseID;

--Count courses published each year.
SELECT PublishDate AS YearPublished,COUNT(*) AS CourseCount
FROM Courses
GROUP BY PublishDate

