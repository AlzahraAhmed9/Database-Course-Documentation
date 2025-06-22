USE CompanyDB;
GO
-- 1. Get all female employees
SELECT * 
FROM Employee 
WHERE Gender = 'Female';

-- 2. Show each employee with their department name
SELECT 
    E.First_Name, 
    E.Last_Name, 
    D.DName AS Department
FROM Employee E
JOIN Department D ON E.DNumber = D.DNumber;

-- 3. List projects and how many hours each employee is working
SELECT 
    E.First_Name, 
    E.Last_Name, 
    P.PName AS Project_Name, 
    W.Working_Hours
FROM Work W
JOIN Employee E ON W.SSN = E.SSN
JOIN Project P ON W.ProjectID = P.ProjectID;

-- 4. Count of employees in each department
SELECT 
    D.DName AS Department, 
    COUNT(E.SSN) AS EmployeeCount
FROM Department D
JOIN Employee E ON D.DNumber = E.DNumber
GROUP BY D.DName;

-- 5. Show all female dependents
SELECT * 
FROM Dependent 
WHERE Gender = 'Female';
