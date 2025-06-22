

-- Delete dependent named 'Sara'
DELETE FROM Dependent
WHERE DependentName = 'Sara';

-- Delete work record for employee 555555555 on project 105
DELETE FROM Work
WHERE SSN = '555555555' AND ProjectID = 105;
