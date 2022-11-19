SELECT Name DepartmentName, COUNT(FullName) TotalPeople
FROM
Departments LEFT JOIN Employees E on Departments.ID = E.DepartmentID
GROUP BY Name;
