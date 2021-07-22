--**************** joins  ********************************************************
/*	WHERE clause join syntax (implicit SQL join)
	SELECT  f1, f2, f3
	FROM	T1, T2, T3
	WHERE	t1.pk = t2.fk
		AND	t2.pk = t3=fk


OR 
	 FROM clause JOIN	
NOTE: FROM clause join can run faster as tables are joined as they loaded into RAM

	SELECT F1, f2, f3, f4
	FROM	t1 JOIN t2 ON
				t1.key = t2.key 
			JOIN t3 ON
				t2.key=t3.key
*/

-- *******************************************************************************
-- Practice
USE wp;

-- Display department name, phone and the employees
-- that are in each department
-- WHERE clause join
SELECT	departmentName, departmentphone, 			
		LastName+', '+Firstname as Name
FROM	department, Employee
WHERE	department.departmentname = 				
		employee.department

-- FROM clause join
SELECT	departmentName, departmentphone, 			
		LastName+', '+Firstname as Name
FROM	department JOIN Employee ON
			department.departmentname = 				
			employee.department;

-- Display department name, phone and the employees
-- that are in the finance department
select DepartmentName, DepartmentPhone, EmployeeNumber
from department join Employee on department.departmentname = employee.Department
order by EmployeeNumber asc;

-- Display the employee name, project id, and hours worked 
-- using WHERE clause
select trim(LastName) + ', ' + FirstName as EmployeeName, ProjectID, hoursworked
from EMPLOYEE, ASSIGNMENT
where EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
order by 1;

-- Display the employee name, project id, and hours worked 
-- using FROM clause

select trim(LastName) + ', ' + FirstName as EmployeeName, ProjectID, hoursworked
from EMPLOYEE join ASSIGNMENT on EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
order by 1;

-- Display the employee name and total hours worked on all projects
select trim(LastName) + ', ' + FirstName as EmployeeName, sum(hoursworked) as TotalHours
from EMPLOYEE join ASSIGNMENT on EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
group by trim(LastName) + ', ' + FirstName;

-- *************** OUTER JOIN **********************
/* The OUTER JOIN syntax can be used to obtain data 
that exists in one table without matching data in the 
other table. */

-- display ALL departments and the projects that they
-- have lead.

SELECT * 
from	department left join project ON
			department.DepartmentName=
			project.Department;

-- Display only departments that have NOT lead 
-- any projects
select *
from DEPARTMENT left join PROJECT on DEPARTMENT.DepartmentName = PROJECT.Department
where ProjectID is null;

-- Identify all employees and the hours worked. NOTE: 
-- please include all employees even if they have NOT worked on any
-- projects
SELECT	lastName, firstName, department, HoursWorked
from	employee left JOIN assignment ON
			employee.EmployeeNumber=
			assignment.EmployeeNumber;

-- Just display employees that have NOT worked on any 
-- projects
SELECT	lastName, firstName, department, HoursWorked
from	employee left JOIN assignment ON
			employee.EmployeeNumber=
			assignment.EmployeeNumber
where ProjectID is null;

-- Can simplify queries by using Aliases (shorter
-- table names - Example below

SELECT	*
FROM 	Department AS d, Employee AS e, 
		Project p, Assignment a    -- NOTE:  AS is optional
WHERE	d.departmentName=p.department
  AND	p.projectID = a.projectID
  AND   e.employeeNumber = a.employeeNumber
