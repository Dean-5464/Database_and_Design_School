/* ITEC2120 DB Design & SQL
Northwind SQL Lab
64 Points Possible

Write the SQL queries using the database defined.  Upload the .sql file to the appropriate drop box. */
use Northwind;

-- Use Northwind Database
/* 1. For each product list its name, unit price, and how many units we have in stock. */
select ProductName, UnitPrice, UnitsInStock
from Products;



/* 2.List the product name and units in stock for any product that has a units in stock greater than 10 and less than 50. */
select ProductName, UnitsInStock
from Products
where UnitsInStock between 10 and 50;


/* 3.List the product name, unit price for each product with a unit price greater than 
$100. Sort the list with the largest unit price on top. */
select ProductName, UnitPrice
from Products
where UnitPrice > 100 
order by UnitPrice desc;



/*4. Create a list of products that should be re-ordered  (Note:  the products should not be discontinued 
(discontinued: 1=True; 0=False and total on hand and products on order should be less than the reorder level. */
select ProductID, ProductName, ReorderLevel, UnitsInStock, ReorderLevel - UnitsInStock as 'ReorderAmount'
from Products
where ReorderLevel - UnitsInStock > 0 and Discontinued = 0;


/* 5.Create a list of products that have been discontinued */
select ProductID, ProductName, UnitsInStock
from Products
where Discontinued = 1;


/* 6. Create a list of all the products (prod_id and name) if all the following are true    (7 
records)
		Supplierid = 2, 5, 16, 8, or 9
		Categoryid = 1, 2, or 4
		Unitprice > 15.00 */

select *
from Products
where SupplierID in (2, 5, 16, 8, 9) and CategoryID in (1, 2, 4) and UnitPrice > 15.00;



/* 7. Create a list of all the products (prod_id and name) if all the following are true    
(11 records)

		Supplierid = 2, 5, 16, 8, or 9 
		AND Categoryid = 1, 2, or 4 
		AND Unitprice > 15.00   
		OR Supplierid = 1, 4, 8 AND categoryid= 3 or 4  */

select *
from Products
where SupplierID in (2, 5, 16, 8, 9) and CategoryID in (1, 2, 4) and UnitPrice > 15.00
	  or (SupplierID in (1, 4, 8) and CategoryID in (3, 4));


/* 8. Create a list of product names that have the second letter of the name = ‘h’ (8 
records) */

select ProductName
from Products
where ProductName like '_h%';


/* 9. Create a list of product names that have the second letter of the name = ‘a’ and the 
last letter = ‘e’  (2 records) */

select ProductName
from Products
where ProductName like '_h%e';


/* 10. List all the customers that have one of the following fields NULL (Region or Fax). 
Also the title of the contact should be ‘Owner’  Sort the list by contact name (14 records) */

select CustomerID, CompanyName, ContactName as 'OwnerName', ContactTitle as 'OwnerTitle', Address,
	   City, Region, PostalCode, Country, Phone, Fax
from Customers
where Region is null or fax is null;


/* 11. List each employee’s name (first and last in one column) and their birthdate. Sort 
the list by birthdate. */
select LastName + ', ' + FirstName as 'EmployeeName', BirthDate
from Employees
order by BirthDate asc;

/* 12. Which employees were born in 1963? */
select LastName + ', ' + FirstName as 'EmployeeName', BirthDate
from Employees
where BirthDate like '1963%'
order by BirthDate asc;

/* 13. How many employees does Northwind have? */
select distinct count(EmployeeID) as 'EmployeeCount'
from Employees;

/*14. For each customer (customer id) list the date of the first order they placed and the 
date of the last order they placed. */
select CustomerID, max(orderDate) as 'LastOrder', min(orderDate) as 'FirstOrder'
from Orders
group by CustomerID
order by CustomerID asc;

/* 15. Using question 14, only list customers where there last order was in 2011. Sort the 
list by customer. */
select CustomerID, max(orderDate) as 'LastOrder', min(orderDate) as 'FirstOrder'
from Orders
group by CustomerID
having max(orderDate) like '2011%'
order by CustomerID asc;

/* 16. Which employees were born in the month of July? */
select LastName + ', ' + FirstName as 'EmployeeName', BirthDate
from Employees
where BirthDate like '_____07%'
order by BirthDate asc;

/* 17. How many orders has Northwind taken? (Answer 830) */
select count(OrderID) as 'NumberOfOrders'
from Orders;

/* 18. How many orders were placed per year? */
select distinct datepart(year, OrderDate) as 'Year', count(OrderID) as 'NumberOfOrders'
from Orders
group by datepart(year, OrderDate);

/* 19. How many orders by month for each year? Make sure the list is in order by year and month? */
select datepart(year, OrderDate) as 'year', DATEPART(month, OrderDate) as 'Month', count(OrderID) as 'NumberOfOrders'
from Orders
group by datepart(year, OrderDate), DATEPART(month, OrderDate)
order by datepart(year, OrderDate) asc, DATEPART(month, OrderDate) asc;

/* 20. Using question 19, list only the months where Northwind have less than 25 orders. (3 records) */
select datepart(year, OrderDate) as 'year', DATEPART(month, OrderDate) as 'Month', count(OrderID) as 'NumberOfOrders'
from Orders
group by datepart(year, OrderDate), DATEPART(month, OrderDate)
having count(OrderID) > 25
order by datepart(year, OrderDate) asc, DATEPART(month, OrderDate) asc;

/* 21. For each order detail, list the ordered, productid, and the total sale price */
select OrderID, ProductID, sum(unitPrice) as 'TotalPrice'
from Order_Details
group by OrderID, ProductID;

/* 22. List the total amount of sales for all orders.*/
select sum(Quantity * UnitPrice) as 'TotalSales'
from Orders left join Order_Details on Orders.OrderID = Order_Details.OrderID;

/* 23. For each order detail, list the orderid, productid, and the total sale price (include the discount). 
	HINT: If my quantity was 10, each one cost $20 and had a discount of 10%, my formula may appear as (10*(20*(1
-.10)) result would be 180. */
select distinct Orders.OrderID, sum((Order_Details.UnitPrice * Quantity) * (1 - Discount)) as 'TotalSales'
from Orders left join Order_Details on Orders.OrderID = Order_Details.OrderID
group by Orders.OrderID;

/* 24. List the total amount of sales for all orders. (with discounts included).  
	Result:  1265793.03974152 */
select sum(((Quantity * UnitPrice) * (1 - discount))) as 'TotalSales'
from Orders left join Order_Details on Orders.OrderID = Order_Details.OrderID;

/* 25. How old is each employee? List the oldest at the top of the list.  
HINT: Can use DateDiff(interval, date1, date2) function: DATEDIFF(dd, Birthdate, SYSDATETIME())/365 AS Age */
select LastName + ', ' + FirstName  as 'EmployeeName', DATEDIFF(dd, Birthdate, SYSDATETIME())/365 as 'AgeInYears'
from Employees;

/* 26. Create a list of suppliers (companyname, contactname) and the products (product name) they supply. 
Sort the list by supplier, then product (77 Records) */
select CompanyName, ContactName, ProductName
from Suppliers join Products on Suppliers.SupplierID = Products.SupplierID
order by Suppliers.SupplierID, ProductName;

/* 27. Create a list of customers (companyname) and some information about each order 
(orderid, orderdate, shipdate) they have placed. (830 Records) */
select CompanyName as 'CustomerName', OrderID, OrderDate, ShippedDate
from Customers join Orders on Customers.CustomerID = Orders.CustomerID;

/* 28. Create list of products that were shipped to customers on 04/18/2012. (4 Records) */
select ProductName, OrderDate
from Orders join Order_Details on Orders.OrderID = Order_Details.OrderID
			join Products on Order_Details.ProductID = Products.ProductID
where ShippedDate = '04/18/2012';

/* 29. Create a list of customers that have ordered Tofu. Make sure to list each customer only once. (18 Records) */
select distinct Orders.CustomerID, CompanyName, ProductName
from Orders join Order_Details on Orders.OrderID = Order_Details.OrderID
			join Products on Order_Details.ProductID = Products.ProductID
			join Customers on Orders.CustomerID = Customers.CustomerID
where ProductName = 'Tofu';

/*30. Create a list of customers that have placed and order in 2011 and 2012. Sort the list 
by customer contact. (65 Records) */
select distinct Orders.CustomerID, CompanyName,
			--Start Subquery
			(select OrderDate
			from Orders
			where Orders.OrderDate like '2011%' or Orders.OrderDate like '2012%') as 'OrderDate'
				
from Orders join Order_Details on Orders.OrderID = Order_Details.OrderID
			join Products on Order_Details.ProductID = Products.ProductID
			join Customers on Orders.CustomerID = Customers.CustomerID

/* 31. Create a mailing list to send information to all the customers, employees, and 
suppliers. Sort the list by city.  (129 records) */
select Customers.Address, Employees.Address, Suppliers.Address, Customers.PostalCode,
Employees.PostalCode, Suppliers.PostalCode, Customers.Region, Employees.Region, Suppliers.Region
from Customers, Employees, Suppliers;

/* 32. Create a view called NumCustomerOrders which lists all the customers and the 
number of orders they have placed. Be sure to list the customer even if they have 
not placed an order. (91 records) */
go
create view NumCustomerOrders as
select distinct Orders.CustomerID, count(Orders.orderID) as 'AmountOfOrders'
from Orders join Customers on Customers.CustomerID = Orders.CustomerID
group by Orders.CustomerID;