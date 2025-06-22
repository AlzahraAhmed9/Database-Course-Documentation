
USE CompanyDB;
GO

-- 1. Department (No FK yet)
CREATE TABLE Department (
    DNumber INT PRIMARY KEY,
    DName VARCHAR(100),
    Location VARCHAR(100),
    SSN CHAR(9) -- This will be a FK later (Manager's SSN)
);
GO

-- 2. Locations
CREATE TABLE Locations (
    Location VARCHAR(100),
    DNumber INT
);
GO

-- 3. Employee
CREATE TABLE Employee (
    SSN CHAR(9) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    DNumber INT -- FK to Department
);
GO

-- 4. Employee_M (Supervisor relationship)
CREATE TABLE Employee_M (
    SSN CHAR(9) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    SupervisorID CHAR(9) -- FK to Employee
);
GO

-- 5. Project
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    PName VARCHAR(100),
    City VARCHAR(100),
    Location VARCHAR(100),
    DNumber INT -- FK to Department
);
GO

-- 6. Work (many-to-many)
CREATE TABLE Work (
    SSN CHAR(9),
    ProjectID INT,
    Working_Hours INT,
    CONSTRAINT PK_Work PRIMARY KEY (SSN, ProjectID)
);
GO

-- 7. Dependent
CREATE TABLE Dependent (
    SSN CHAR(9),
    DependentName VARCHAR(100),
    Gender VARCHAR(10),
    CONSTRAINT PK_Dependent PRIMARY KEY (SSN, DependentName)
);
GO

-- =========================================
-- Add Foreign Keys After All Tables Exist
-- =========================================

ALTER TABLE Department
ADD CONSTRAINT FK_Dept_Manager FOREIGN KEY (SSN) REFERENCES Employee(SSN);
GO

ALTER TABLE Locations
ADD CONSTRAINT FK_Location_Dept FOREIGN KEY (DNumber) REFERENCES Department(DNumber);
GO

ALTER TABLE Employee
ADD CONSTRAINT FK_Emp_Dept FOREIGN KEY (DNumber) REFERENCES Department(DNumber);
GO

ALTER TABLE Employee_M
ADD CONSTRAINT FK_EmpM_Supervisor FOREIGN KEY (SupervisorID) REFERENCES Employee(SSN);
GO

ALTER TABLE Project
ADD CONSTRAINT FK_Project_Dept FOREIGN KEY (DNumber) REFERENCES Department(DNumber);
GO

ALTER TABLE Work
ADD CONSTRAINT FK_Work_Emp FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    CONSTRAINT FK_Work_Project FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID);
GO

ALTER TABLE Dependent
ADD CONSTRAINT FK_Dependent_Emp FOREIGN KEY (SSN) REFERENCES Employee(SSN);
GO
