Use ReviewSQL;

/* List each customers name (use 1 column) and the order_id 
and date for each order. Sort the list by customer, then order_date */
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

select lastname, firstname, order_id, order_date
from customers join orders on customers.cust_no = orders.cust_no
order by 1, 2, 4 desc;


-- Create a list of customer names that ordered the book
--	War and Peace
-- NOTE:  Please make sure to list each customer only once!
select distinct lastname, firstname, title
from customers join orders on customers.cust_no = orders.cust_no
	 join order_books on order_books.order_id = orders.order_id
	 join books on books.book_id = order_books.book_id
where title = 'War and Peace'
order by lastname, firstname;



-- Display the customers and their order information (CustName, Order Id, Order Date, qty ordered, title, price 
-- and extended price.



-- display customers (Name as one column) that placed orders in both 2012 and 2013


-- display customer name, Order id, order date, sales rep name



-- how many orders has each sales rep placed (please include the sales rep first and last name)



-- display customers and the number of orders placed (include customers that
-- have not placed any orders!
