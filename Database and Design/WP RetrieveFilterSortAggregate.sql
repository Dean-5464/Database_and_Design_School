/* RETRIEVE, FILTER AND SORTING DATA
 The following syntax will be used to teach these concepts */

 /* SQL Clauses
	SELECT			defines fields to be displayed - required
	FROM			defines tables required for query to run - required
	WHERE			row level filter - filters recordset based on criteria using
					comparison (relational) operators - <,>, <=, >=, <>, !=, = 
					BETWEEN, IS NULL, LIKE (used with wild cards)
	ORDER BY		sorts the output; default is ASC (ascending)
					must indicated DESC if want output in descending order
*/
--************************************************************************
 use WP;

 -- Reading specific columns from a single table
 -- display the project id, name, department, max hours, 
 -- date and end date for a project
 SELECT Projectid, ProjectName, Department, MaxHours,
		StartDate, EndDate
 FROM	PROJECT;

 -- PRACTICE: Display the customer first name, last name 

 -- Display ALL project table columns  using the * within the SELECT
 SELECT	*
 FROM	PROJECT;

 -- PRACTICE: display all customer records


 -- column order (output) is defined by how listed in SELECT
 SELECT		Projectname, department, MaxHours
 FROM		PROJECT

 -- PRACTICE:  Display the departments from PROJECT table


 -- use DISTINCT to remove duplicate records

 /* ***** WHERE clause to filter recordset output	****** */
 -- Display all finance project records
 SELECT		*
 FROM		PROJECT
 WHERE		department='finance';	-- Filters recordset on criteria

 -- PRACTICE: display projects that started on May 10, 2017
 -- NOTE: SQL server requires strings and dates enclosed in ' ' single quotes


 -- PRACTICE: Display project records that have max hours greater than 135

 -- PRACTICE: Display projects that have a max hours greater than or equal
 -- to 135 or less than or equal to 140
 


 -- PRACTICE: Provide an Accounting department report that displays the
 -- employee first and last names, department and phone 


 -- ***Sorting records using the ORDER BY clause ***************************
 -- NOTE:  the default sort is ascending order; if descending is 
 -- required use DESC
 
 -- PRACTICE: Display the previous query for ALL employees; sort by department name



 -- PRACTICE: Using the previous query, sort the department name desc and add 
 -- a secondary sort of last name and first name ascending


 -- ******** LOGICAL Operators ************************
 -- AND -- both criteria must be true
 -- OR  -- one of the criteria must be true
 -- NOT -- negates (reverses) the associated operator

 -- Display the accounting department employees that 
 -- have a 360-285-8430 phone number 



 -- display employees that have and employee number greater than 
 -- or equal to 2 and less than or equal to 5


 -- ************ WILD cards - pattern match queries *************
 -- Wild Cards must use with LIKE keyword
-- 			% - wild card for any number of characters
--				 WHERE lastName LIKE 'D%'		
						-- filters data with last names starting with d and any characters following
-- 			_ - wild card that represents one characters
--				 WHERE projectDate LIKE '05/01/201_%'			
						-- filters project dates to include 2010 - 2019 for single char
-- 			[ ]	- can be used to include either a range or multiple values
--				 WHERE lastName LIKE '[ad]%'		
						-- filters data with last names starting with a or d
--				 WHERE lastName LIKE '[a-d]%'		
						-- filters data with last names starting with a range a, b, c or d
--			^ or NOT will negate option
--				 WHERE NOT lastName LIKE '[ad]%'	
						-- filters data with last names starting anything but a or d
--				 WHERE lastName LIKE '[^ad]%'			
						-- filters data with last names starting anything but a or d

-- Display all employees with a last name that starts with J 



-- Display all employees except those with a last name of J


-- Display all 2017 quarterly portfolio analysis projects
SELECT	*
FROM	PROJECT
WHERE	projectName LIKE '2017 Q_ Portfolio Analysis'; 
						-- underscore represents one character

-- display all employees who have 88XX as their last 4 phone digits


-- display all employees who have a last name that starts with L through Z


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


-- **** finding the difference between 2 dates using
-- DATEDIFF(
SELECT	projectID,	projectname, Department, StartDate, EndDate,
		DATEDIFF(dd, StartDate, EndDate) as ProjectDuration
FROM	PROJECT


-- ************ CALCULATED FIELDS - math expressions
-- with SELECT statement
-- Query displays the maximum project cost based on 
-- $24.50 / hour cost.
SELECT	ProjectID, ProjectName, MaxHours, 
		MaxHours*24.5 AS MaxProjectCost -- NOTE:  AS is optional	
FROM	PROJECT;

-- PRACTICE: Write a query that reduces the maxHours by 10%


-- ****concatenating multiple fields together using + character*****
-- Write a query that combines the employee last name and first 
-- name into 1 field


/*  **************** AGGREGATE FUNCTIONS - BUILT-in functions
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


-- Can use multiple aggregate functions at one time
-- Add to the query above: the average, minimum, maximum


-- ************** GROUP BY clause - Aggregating data by GROUPS
-- GROUP BY clause is required when you want to display a NON-aggregate 
-- field within the SELECT clause

-- Display the number of employees within each department
SELECT 
FROM	EMPLOYEE;


-- *********** HAVING clause is used to filter AGGREGATED/GROUPED DATA
-- display only departments that have more than 1 employee




-- PRACTICE: How many hours have been worked on each project?


-- PRACTICE:  Display only projects that have had more than 
-- 200 hours of employee work.