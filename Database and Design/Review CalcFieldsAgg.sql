-- ************* Calc Fields; Functions and Aggregate Functions ReviewSQL
Use ReviewSQL;

-- 1) List each customers first and last name using only 1 column
select trim(lastname)+', '+trim(firstName) as CustomerName
from customers;

-- 2) For each book, list the title and the total value in stock. 
-- Place the title with the highest value on top of the list.

select title, qty_on_hand * price as TotalValue
from books
order by TotalValue desc;

-- 3) List each order and break apart the date into three columns. (one for the month, day, and year)
select month(order_date) as 'Month', day(order_date) as 'Day', year(order_date) as 'Year'
from orders;

-- 4) What is the average book price?
select avg(price) as 'AvgPrice'
from books;

-- 5) List the date of the first and last order
select MIN(order_Date) as 'FirstOrder', Max(order_Date) as 'LastOrder'
from orders;

-- 6) What is the total inventory value of the books in stock?
select sum(qty_on_hand*price) as 'TotalValueStock'
from books;

-- 7) How many orders were place each year?
select Year(order_Date) as 'Year', COUNT(year(order_date)) as 'AmountOfOrders'
from orders
group by Year(order_date);

-- 8) Create a list of customer numbers and how many orders they placed each year. 
-- Sort the list by customer, then year
select cust_no, year(order_date) as 'OrderYear', count(*) as NumberOfOrders
from orders
group by cust_no, year(order_date)
order by cust_no, YEAR(order_date);



