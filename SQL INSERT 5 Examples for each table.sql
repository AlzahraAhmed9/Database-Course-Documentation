-- INSERT into Department
INSERT INTO Department (DNumber, DName, Location, SSN) VALUES 
(1, 'IT', 'Muscat', NULL),
(2, 'HR', 'Salalah', NULL),
(3, 'Finance', 'Sohar', NULL),
(4, 'Marketing', 'Muscat', NULL),
(5, 'Development', 'Nizwa', NULL);

-- INSERT into Employee
INSERT INTO Employee (SSN, First_Name, Last_Name, Gender, DNumber) VALUES 
('111111111', 'John', 'Doe', 'Male', 1),
('222222222', 'Jane', 'Smith', 'Female', 2),
('333333333', 'Alice', 'Brown', 'Female', 3),
('444444444', 'Bob', 'White', 'Male', 4),
('555555555', 'Charlie', 'Green', 'Male', 5);

-- INSERT into Employee_M
INSERT INTO Employee_M (SSN, First_Name, Last_Name, Gender, SupervisorID) VALUES 
('111111111', 'John', 'Doe', 'Male', NULL),
('222222222', 'Jane', 'Smith', 'Female', '111111111'),
('333333333', 'Alice', 'Brown', 'Female', '222222222'),
('444444444', 'Bob', 'White', 'Male', '222222222'),
('555555555', 'Charlie', 'Green', 'Male', '333333333');

-- INSERT into Locations
INSERT INTO Locations (Location, DNumber) VALUES 
('Muscat', 1),
('Salalah', 2),
('Sohar', 3),
('Muscat', 4),
('Nizwa', 5);

-- INSERT into Project
INSERT INTO Project (ProjectID, PName, City, Location, DNumber) VALUES 
(101, 'AI App', 'Muscat', 'Muscat', 1),
(102, 'HR Portal', 'Salalah', 'Salalah', 2),
(103, 'Finance Tracker', 'Sohar', 'Sohar', 3),
(104, 'Ad Campaign', 'Muscat', 'Muscat', 4),
(105, 'Website Dev', 'Nizwa', 'Nizwa', 5);

-- INSERT into Work
INSERT INTO Work (SSN, ProjectID, Working_Hours) VALUES 
('111111111', 101, 40),
('222222222', 102, 35),
('333333333', 103, 30),
('444444444', 104, 20),
('555555555', 105, 25);

-- INSERT into Dependent
INSERT INTO Dependent (SSN, DependentName, Gender) VALUES 
('111111111', 'Mary', 'Female'),
('222222222', 'Tom', 'Male'),
('333333333', 'Anna', 'Female'),
('444444444', 'Steve', 'Male'),
('555555555', 'Sara', 'Female');
