
-- **************** DATE FUNCTIONS
-- DATE functions to return  - YEAR(), MONTH(), DAY(), HOUR()
-- date functions return integers!  WHOLE NUMBERS-SAMPLE:
		--		YEAR(2/4/2020) = 2020
		--		MONTH(2/4/2020) = 2
		--		DAY(2/4/2020) =

-- display project that end in september
SELECT	* 
FROM	PROJECT
where	MONTH(EndDate)=9;

-- PRACTICE: display projects starting in May or October
select *
from PROJECT
where MONTH(StartDate) = 10 or MONTH(StartDate) = 5;

select *
from PROJECT
where DATEPART(M, startDate) in (5, 10);

-- **** finding the difference between 2 dates using
-- DATEDIFF(
SELECT	projectID,	projectname, Department, StartDate, EndDate,
		DATEDIFF(dd, StartDate, EndDate) as ProjectDuration
FROM	PROJECT;

--current date function: getdate()


-- ************ CALCULATED FIELDS - math expressions
-- with SELECT statement
-- Query displays the maximum project cost based on 
-- $24.50 / hour cost.
SELECT	ProjectID, ProjectName, MaxHours, 
		MaxHours*24.5 AS MaxProjectCost -- NOTE:  AS is optional	
FROM	PROJECT;

-- PRACTICE: Write a query that reduces the maxHours by 10%
select MaxHours
from PROJECT;

select MaxHours,
MaxHours * 0.9 as ReducedHours
from PROJECT;

-- ****concatenating multiple fields together using + character*****
-- Write a query that combines the employee last name and first 
-- name into 1 field

--RTRIM() function removes right side white space
select RTRIM(LastName)+', '+RTRIM(FirstName) as EmployeeName
from EMPLOYEE
order by 1;

/*  **************** AGGREGATE (Summary) FUNCTIONS - BUILT-in functions
	COUNT(*)		-- * that counts all rows in the recordset
	COUNT(fName)	-- counts the number of rows where field IS NOT NULL
	SUM(fName)		-- calculates the sum of all values in a field/column
	AVG(fName)		-- calculates the average of all values in a field/column
	MIN(fname)		-- calculates the minimum value in a field/column
	MAX(fName)		-- calculate the maximum value of all values in field/column
*/

-- display the number of WP projects
SELECT	count(*) 
FROM	project;

-- to create a label for new column created
-- NOTE:  'AS' is optional
SELECT	count(*) as NumProjects
FROM	project;

-- Display the total number of project max hours
select SUM(maxHours) as TotalMaxHours,

-- Can use multiple aggregate functions at one time
-- Add to the query above: the average, minimum, maximum

	   AVG(maxHours) as AverageMaxHours,
	   min(maxHours) as MinMaxHours,
	   max(maxHours) as MaxMaxHours
from PROJECT;

-- ************** GROUP BY clause - Aggregating data by GROUPS
-- GROUP BY clause is required when you want to display a NON-aggregate 
-- field within the SELECT clause

-- Display the number of employees within each department
SELECT 
FROM	EMPLOYEE;


-- *********** HAVING clause - is used to filter AGGREGATED/GROUPED DATA
-- display only departments that have more than 1 employee




-- PRACTICE: How many hours have been worked on each project?


-- PRACTICE:  Display only projects that have had more than 
-- 200 hours of employee work.