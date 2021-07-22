-- Query D:
select * from Contact;
select * from Customer;
select * from Invoice;
select * from Line_Item;
select * from Product;
select * from Seminar;
select * from Seminar_Customer;

--Query E:
select LastName, FirstName, Phone
from Customer
where City = 'Dallas';

--Query F:
select LastName, FirstName, Phone
from Customer
where City = 'Dallas' and LastName like 'T%';

--Query G (Attempted):
select ProductDescription, (select InvoiceNumber from Invoice) as 'InvoiceNumber'
from Product
where  ProductDescription = 'Heather Sweeny Seminar Live in Dallas on 25-OCT-17';

--Query H:
select Invoice.InvoiceNumber
from Product join Line_Item on Product.ProductNumber = Line_Item.ProductNumber
			 join Invoice on Line_Item.InvoiceNumber = Invoice.InvoiceNumber
where ProductDescription = 'Heather Sweeny Seminar Live in Dallas on 25-OCT-17';

--Query I:
select distinct FirstName, LastName, Phone
from Customer join Seminar_Customer on Seminar_Customer.CustomerID = Customer.CustomerID
			  join Seminar on Seminar_Customer.SeminarID = Seminar.SeminarID
where SeminarTitle = 'Kitchen on a Big D Budget';

--Query J:
select distinct FirstName, LastName, Phone, Product.ProductNumber, ProductDescription
from Customer join Invoice on Customer.CustomerID = Invoice.CustomerID
			  join Line_Item on Invoice.InvoiceNumber = Line_Item.InvoiceNumber
			  join Product on Line_Item.ProductNumber = Product.ProductNumber
where ProductType = 'Video'
order by LastName, FirstName, ProductNumber;

--Query K:
select Seminar.SeminarID, SeminarDate, Location, SeminarTitle, Customer.CustomerID, LastName, FirstName
from Customer join Seminar_Customer on Customer.CustomerID = Seminar_Customer.CustomerID
			  full join Seminar on Seminar_Customer.SeminarID = Seminar.SeminarID;

--Query L:
select Customer.CustomerID, LastName, FirstName, Invoice.InvoiceNumber, Product.ProductNumber, ProductType, ProductDescription
from Customer join Invoice on Customer.CustomerID = Invoice.CustomerID
			  join Line_Item on Invoice.InvoiceNumber = Line_Item.InvoiceNumber
			  full join Product on Line_Item.ProductNumber = Product.ProductNumber; 

--Query M:
select sum(SubTotal) as 'SumOfSubTotal'
from Invoice;

--Query N:
select avg(SubTotal) as 'AverageOfSubTotal'
from Invoice;

--Query O:
select sum(SubTotal) as 'SumOfSubTotal', avg(SubTotal) as 'AverageOfSubTotal'
from Invoice;

--Query P:
update Product
set UnitPrice = 34.95
where ProductNumber = 'VK004';

--Query Q:
update Product
set UnitPrice = 24.95
where ProductNumber = 'VK004';

--Query R (WARNING: PURGES DATABASE BUT KEEPS STRUCTURE, AUTO INCREMENT ERROR IMMENENT!)
delete Contact;
delete Customer;
delete Invoice;
delete Line_Item;
delete Product;
delete Seminar;
delete Seminar_Customer;