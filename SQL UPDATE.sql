-- STEP 3: UPDATE Statements

-- 1. Change department of an employee (e.g., move Jane Smith to IT)
UPDATE Employee
SET DNumber = 1
WHERE SSN = '222222222';

-- 2. Update working hours on a project (e.g., increase John's hours)
UPDATE Work
SET Working_Hours = 45
WHERE SSN = '111111111' AND ProjectID = 101;

-- 3. Assign a manager (SSN) to a department (e.g., John becomes manager of IT)
UPDATE Department
SET SSN = '111111111'
WHERE DNumber = 1;
