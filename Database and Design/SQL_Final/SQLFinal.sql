/* ITEC2120 DB Design & SQL
Final Exam
(100 Total Points – 5 pts each)


Use the Pizza Shop database for all questions! Make sure all columns are labeled properly! */

--1.	Using the least amount of code, list all the information on all of our customers.
select *
from Customers;

/*2.	What cities do our customers come from? Make sure each city only appears once on the list. 
Sort the cities in alphabetical order. */
select distinct City
from Customers
order by City asc;

/* 3.	I would like to call all of our customers and thank them for ordering. 
Create a list that could be used for that purpose. Have the customer name in 
1 column and the phone number in the 2nd column. */
select LastName + ',' + FirstName as 'Name', PhoneNumber
from Customers;

/*4.	Create a list of our customers and their addresses that live in Anoka.
 Use 1 column for the name and another for the address. Sort the list by customer name. */
select LastName + ',' + FirstName as 'Name', Street as 'Street Address'
from Customers
where City = 'Anoka'
order by LastName + ',' + FirstName asc;

/* 5.	Create a list of customers with a last name starting with “T” and 
they live in Ramsey or Coon Rapids. */
select LastName + ',' + FirstName as 'Name', City
from Customers
where City in ('Ramsey', 'Coon Rapids') and LastName like 'T%';

/* 6.	For each order list the following:. (Sort the list by customer, order description, order date)
a.	Customer name
b.	Order id
c.	Order Description (pickup or delivery)
d.	Order date   */
select LastName + ',' + FirstName as 'Name', OrderID, OrderType as 'Order Description', OrderDate
from Customers join Orders on Customers.CustID = Orders.CustID
order by LastName + ',' + FirstName, OrderType, OrderDate;


/*7.	How many delivery orders did we make? */
select count(orderType) as 'Count of Deliveries'
from Orders
where OrderType = 'D';

--8.	Create a list of ingredients and the number of times that each ingredient
-- was used on a pizza. Put the ingredient used most at the top of the list.
select IngredDesc, count(IngredDesc) as 'Count of ingredients'
from Orders join OrderIngredients on Orders.OrderID = OrderIngredients.OrderID
			join PizzaIngredients on OrderIngredients.IngredID = PizzaIngredients.IngredID
group by IngredDesc
order by count(IngredDesc) desc;

--9.	Create a list of customers that have placed more than 20 orders. 
--Sort the list so the customer with the most orders appears at the top.
select Customers.CustID, LastName + ',' + FirstName as 'Name', count(OrderID) as 'Count of Orders'
from Customers join Orders on Customers.CustID = Orders.CustID
group by Customers.CustID, LastName + ',' + FirstName
having count(OrderID) > 20
order by count(OrderID) desc;

--10.	What is the date of the first and last order taken?
select max(OrderDate) as 'Last Order Taken', min(OrderDate) as 'First Order Taken'
from Orders;

/* 11.	Add the following new customer.
a.	Cust_ID:	9999
b.	Name:		Ben Forta
c.	Phone:		555-9999		*/

insert into Customers(CustID, FirstName, LastName, PhoneNumber)
values(9999, 'Ben', 'Forta', '555-9999');

/*12.	Customer 9999 has decided to have his pizza delivered and gave us the following address
a.	Street:		456 Main Street
b.	City:		Anoka
c.	State:		MN
d.	ZipCode:	55303		*/

update Customers
set Street = '456 Main Street', City = 'Anoka', State = 'MN', Zipcode = '55303'
where CustID = 9999;

--13.	Customer 9999 changed his mind again and stated that he will 
--never order from us. Please remove him from the database
delete from Customers
where CustID = 9999;

/* 14.	Create the following table with appropriate integrity constraints:

tblPizzaVendors

VendorID	VendName	VendAddress	VendCity	VendState	VendPhone */
					
create table PizzaVendors(
VendorID				int				Not Null,	--identity(1,1), --(PK)
VendName				varChar(100)	Not Null,
VendAddress				varChar(100)	Null,
VendCity				char(25)		Null,
VendState				char(2)			Null,
VendPhone				VarChar(12)		Null --12 Characters (123-567-9012)

constraint	PizzaVendorsPK	Primary Key (VendorID)
);


/* 15.	Populate the table above with the following records:
VendorID	VendName	VendAddress	VendCity	VendState	VendPhone
100		Crystal Farms	123 First	Anywhere	MN		555-555-1212
150		Morrell Meats	555 Second	NoWhere	MN			555-222-1111			*/
go
insert into PizzaVendors(VendorID, VendName, VendAddress, VendCity, VendState, VendPhone)
values(100, 'Crystal Farms', '123 First', 'Anywhere', 'MN', '555-555-1212');

insert into PizzaVendors(VendorID, VendName, VendAddress, VendCity, VendState, VendPhone)
values(150, 'Morrell Meats', '555 Second', 'NoWhere', 'MN', '555-222-1111');
go

/* 16.	Revise the PizzaShop E-R Diagram that defines how this new table will be
 incorporated into the relational model – use the PizzaShop.vsd  to add the new table.
Note:  Vendors supply the ingredients to make pizzas */

--In ZIP File

/*17.	Create a view that displays the all customer orders (name, order date, size, 
ingredients and delivery type. This will be used to query customers when 
they call in for new orders.  Name the view – CustomerOrders.  */
go
create view CustomerOrders as
select LastName + ', ' + FirstName as 'Name', OrderDate, Orders.SizeID, SizeDesc, IngredDesc, OrderType
from Customers join Orders on Customers.CustID = Orders.CustID
			   join PizzaSize on Orders.SizeId = PizzaSize.SizeID
			   join OrderIngredients on Orders.OrderID = OrderIngredients.OrderID
			   join PizzaIngredients on OrderIngredients.IngredID = PizzaIngredients.IngredID;
go

--18.	Create a list of customers that ordered Anchovies.
select distinct Name
from CustomerOrders
where IngredDesc = 'Anchovies';

--19.	Create a list of customers that do not live in our delivery area.
select CustID, LastName + ', ' + FirstName as 'Name', Street, City, State, PhoneNumber, Customers.Zipcode
from DeliveryArea 
full outer join Customers on DeliveryArea.ZipCode = Customers.Zipcode
where Customers.Zipcode is null or DeliveryArea.ZipCode is null;

--20    Create a query that displays how many pizzas we have sold/ordered by size.  
-- 	Note:  Please include the full description
select Orders.SizeId, SizeDesc, count(Orders.sizeID) as 'Amount Sold'
from PizzaSize join Orders on PizzaSize.SizeID = Orders.SizeId
group by Orders.SizeId, SizeDesc;

/*
EXTRA CREDIT - 2 pts possible
Create a list of customers that have ordered a pizza in 
January 2013 and February 2013, but did NOT order a pizza in March 2013. 
*/

select distinct Customers.CustID, LastName + ', ' + FirstName as 'Name'
from Customers join Orders on Customers.CustID = Orders.CustID
where (OrderDate like '2013-01%' or OrderDate like '2013-02%') and not OrderDate like '2013-03%';