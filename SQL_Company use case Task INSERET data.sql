-- Insert sample data
INSERT INTO Department (DNumber, DName, Location, SSN) VALUES (1, 'IT', 'HQ', NULL);
INSERT INTO Employee (SSN, First_Name, Last_Name, Gender, DNumber) VALUES ('123456789', 'John', 'Doe', 'Male', 1);
INSERT INTO Employee_M (SSN, First_Name, Last_Name, Gender, SupervisorID) VALUES ('987654321', 'Jane', 'Smith', 'Female', '123456789');
INSERT INTO Project (ProjectID, PName, City, Location, DNumber) VALUES (1001, 'AI Project', 'Muscat', 'HQ', 1);
INSERT INTO Work (SSN, ProjectID, Working_Hours) VALUES ('123456789', 1001, 40);
INSERT INTO Dependent (SSN, DependentName, Gender) VALUES ('123456789', 'Chris', 'Male');
