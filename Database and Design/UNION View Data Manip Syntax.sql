-- ****************** JOIN review
-- Display the vendors  and their products that have been ordered to date
-- Vend_id, name, prod_id, prod_name, qty and price
select Vendors.vend_id, vend_name, Products.prod_id, prod_name, quantity, item_price
from Products join Vendors on Products.vend_id = Vendors.vend_id
	join OrderItems on Products.prod_id = OrderItems.prod_id;



-- use query above and include all products in the output
select Vendors.vend_id, vend_name, Products.prod_id, prod_name, quantity, item_price
from Products left join Vendors on Products.vend_id = Vendors.vend_id
	left join OrderItems on Products.prod_id = OrderItems.prod_id;



-- GO
-- *************************** Distinct keyword to remove duplicate rows

SELECT 	cust_city
FROM 	Customers;

SELECT	DISTINCT vend_state  -- REMOVES DUPLICATE ROWS
FROM	VENDORS;

--*********************** union QUERIES
-- ALLOWS YOU TO APPEND TO RECORDSETS TOGETHER
-- MUST HAVE SAME NUMBER OF COLUMNS WITHIN EACH SELECT STATEMENT
SELECT	cust_name Name, cust_address as 'Address', 
		cust_city City, cust_state as 'State', 	cust_zip as Zip
FROM	customers
UNION
SELECT	vend_name, vend_address,
 		vend_city, vend_state, 	vend_zip
FROM 	vendors
Order by	1;

-- ************* Views
-- virtual tables that save query syntax 
-- VIEWS CONTAIN NO DATA

-- WRITE A QUERY THAT DISPLAY CUSTOMER ORDER INFO AND THE 
-- PRODUCTS THEY PURCHASED WITH THE EXTENDED PRICE

-- use views to store complex joins
-- use view to store reformatted data or calculations

-- Drop view
-- drop view CustomerOrders;

go
CREATE VIEW CustomerOrders AS
	SELECT	c.cust_id, Cust_name, o.order_num, order_date,
			p.prod_id, prod_NAME, QUANTITY, ITEM_PRICE,
			quantity* item_price AS ExtendedPrice
	FROM	customers c JOIN ORDERS o on
				c.cust_id=o.cust_id
			JOIN OrderItems oi ON
				o.order_num=oi.order_num
			JOIN Products p ON
				oi.prod_id=p.prod_id;
go

-- using the view created above display Order #20005 order info
select *
from CustomerOrders
where order_num = 20005;


-- using the view, display orders that had extended price >250
select *
from CustomerOrders
where ExtendedPrice > 250;



-- using the view, DISPLAY THE TOTAL EXTENDED PRICE FOR ALL ORDERS AND THE NUMBER OF ORDERS
select count(*) as NumberOfItemsOrdered, sum(ExtendedPrice) as TotalExtendedPrice, COUNT(order_num) as AmountOfOrders, sum(quantity) as Quantity
from CustomerOrders;


-- Format the output to DISPLAY THE TOTAL EXTENDED PRICE and # Prod Ordered BY ORDER

GO


-- Create a view that will create a customer mailing labels; note: exclude any address info
-- that may be null

CREATE VIEW CustomerMailingLabels AS
SELECT cust_name,
	cust_address as cust_address1,
	RTRIM(cust_city)+', '+RTRIM(cust_state)+
	'  ' +RTRIM(cust_zip) AS cust_address2
FROM customers
WHERE NOT cust_address is NULL
	AND NOT cust_city is NULL
	AND NOT cust_state is NULL
	AND NOT cust_zip is NULL
GO
	select * from CustomerMailingLabels;


-- ******************* update queries
-- CHANGING VALUES/DATA WITHIN A TABLE
-- Sample syntax:
	/*
	UPDATE    TableName-- defines table being updated
	SET 	  field ='value'  -- new data to be added
	WHERE     condition/criteria; -- defines which record to update
-- NOTE:  Critical to include WHERE clause otherwise ALL records will be updated
	*/
select * from vendors;
--  Update DLL01 vendor address to 890 Doll House Avenue
update Vendors
set vend_address = '890 Doll House Avenue'
where vend_id = 'dll01';
select * from Vendors;


-- The Raggedy Ann doll is now going to be supplied by Vendor FNG01.  
-- Please update the record.
SELECT* FROM PRODUCTS;




-- *** INSERT COMPANY AND YOURSELF AS CONTACT NAME 
-- INTO THE CUSTOMERS TABLE

select * FROM CUSTOMERS;

INSERT INTO Customers VALUES(
	'999999', 'Baumy Toys', '1355 West Highway 10', 'Anoka', 'MN',
	'USA', '55304', 'Vicki Baumgartner', 'vbaumga@baumytoys.com');

--********** DELETE records syntax
-- Sample syntax:
	
	DELETE FROM 	TableName-- defines table being updated
	WHERE     	condition/criteria; -- defines which record to update
-- NOTE:  Critical to include WHERE clause otherwise ALL records will be updated


-- add yourself back to the customers table
INSERT INTO Customers VALUES(
	'999999', 'Baumy Toys', '1355 West Highway 10', 'Anoka', 'MN',
	'USA', '55304', 'Vicki Baumgartner', 'vbaumga@baumytoys.com');

delete from Customers
where cust_id = '999999';

-- write a query to display all customers and the number of
-- orders that they have placed













