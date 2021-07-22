--Use Correct Database
use HSD;

go
--Insert Queries

--Customer Insert Queries
insert into Customer 
Values('Jacobs', 'Nancy', 'Nancy.Jacobs@Somewhere.com', 'nf46tG9E', '817-871-8123', '1440 West Palm Drive', 'Fort Worth', 'TX', '76110');
insert into Customer 
Values('Jacobs', 'Chantel', 'Chantel.Jacobs@Somewhere.com', 'nf46tG9E', '817-871-8234', '1550 East Palm Drive', 'Fort Worth', 'TX', '76112');
insert into Customer 
Values('Able', 'Ralph', 'Ralph.Able@Somewhere.com', 'm56fGH08', '210-281-7987', '123 Elm Street', 'San Antonio', 'TX', '78214');
insert into Customer 
Values('Baker', 'Susan', 'Susan.Baker@Somewhere.com', 'PC93fEk9', '210-281-7876', '456 Oak Street', 'San Antonio', 'TX', '78216');
insert into Customer 
Values('Eagleton', 'Sam', 'Sam.Eagleton@Somewhere.com', 'bnvR44W8', '210-281-7765', '789 Pine Street', 'San Antonio', 'TX', '78218');
insert into Customer 
Values('Foxtrot', 'Kathy', 'Kathy.Foxtrot@Somewhere.com', 'aa8tY4GL', '972-233-6234', '11023 Elm Street', 'Dallas', 'TX', '75220');
insert into Customer 
Values('George', 'Sally', 'Sally.George@Somewhere.com', 'LK8G2tyF', '972-233-6345', '12034 San Jacinto', 'Dallas', 'TX', '75223');
insert into Customer 
Values('Hullett', 'Shawn', 'Shawn.Hullett@Elsewhere.com', 'bu78WW3t', '972-233-6456', '13045 Flora', 'Dallas', 'TX', '75224');
insert into Customer 
Values('Pearson', 'Bobbi', 'Bobbi.Pearson@Somewhere.com', 'kq6N2O0p', '512-974-3344', '43 West 23rd Street', 'Austin', 'TX', '78710');
insert into Customer 
Values('Ranger', 'Terry', 'Terry.Ranger@Somewhere.com', 'bv3F9Qc4', '512-974-4455', '56 East 18th Street', 'Austin', 'TX', '78712');
insert into Customer 
Values('Tyler', 'Jenny', 'Jenny.Tyler@Somewhere.com', 'Yu4be77z', '972-233-6567', '14056 South Ervay Street', 'Dallas', 'TX', '75225');
insert into Customer 
Values('Wayne', 'Joan', 'Joan.Wayne@Somewhere.com', 'JW4TX6g', '817-871-8245', '1660 South Aspen Drive', 'Fort Worth', 'TX', '76115');

--Seminar Insert Queries
insert into Seminar
values('2018-10-12', '11:00', 'San Antonio Convention Center', 'Kitchen on a Budget');

insert into Seminar
values('2018-10-26', '16:00', 'Dallas Convention Center', 'Kitchen on a Big D Budget');

insert into Seminar
values('2018-11-02', '08:30', 'Austin Convention Center', 'Kitchen on a Budget');

insert into Seminar
values('2019-03-22', '11:00', 'Dallas Convention Center', 'Kitchen on a Big D Budget');

insert into Seminar
values('2019-03-23', '11:00', 'Dallas Convention Center', 'Kitchen on a Big D Budget');

insert into Seminar
values('2019-04-05', '08:30', 'Austin Convention Center', 'Kitchen on a Budget');

--Seminar_Customer Insert Queries
insert into Seminar_Customer Values(1,1);
insert into Seminar_Customer Values(1,2);
insert into Seminar_Customer Values(1,3);
insert into Seminar_Customer Values(1,4);
insert into Seminar_Customer Values(1,5);
insert into Seminar_Customer Values(2,6);
insert into Seminar_Customer Values(2,7);
insert into Seminar_Customer Values(2,8);
insert into Seminar_Customer Values(3,9);
insert into Seminar_Customer Values(3,10);
insert into Seminar_Customer Values(4,6);
insert into Seminar_Customer Values(4,7);
insert into Seminar_Customer Values(4,11);
insert into Seminar_Customer Values(4,12);

--Contact Insert Queries

--Nancy.Jacobs@Somewhere.com
insert into Contact
values(1, 1, '2018-10-12', 'Seminar', 1);

--Chantel.Jacobs@Somewhere.com
insert into Contact
values(2, 1, '2018-10-12', 'Seminar', 1);

--Ralph.Able@Somewere.com
insert into Contact
values(3, 1, '2018-10-12', 'Seminar', 1);

--Susan.Baker@Somewhere.com
insert into Contact
values(4, 1, '2018-10-12', 'Seminar', 1);

--Sam.Eagleton@Somewhere.com
insert into Contact
values(5, 1, '2018-10-12', 'Seminar', 1);


--Nancy.Jacobs@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(1, 2, '2018-10-15', 'EmailSeminarMessage');

--Chantel.Jacobs@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(2, 2, '2018-10-15', 'EmailSeminarMessage');

--Ralph.Able@Somewere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(3, 2, '2018-10-15', 'EmailSeminarMessage');

--Susan.Baker@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(4, 2, '2018-10-15', 'EmailSeminarMessage');

--Sam.Eagleton@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(5, 2, '2018-10-15', 'EmailSeminarMessage');


--Nancy.Jacobs@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(1, 3, '2018-10-15', 'FormLetterSeminar');

--Chantel.Jacobs@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(2, 3, '2018-10-15', 'FormLetterSeminar');

--Ralph.Able@Somewere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(3, 3, '2018-10-15', 'FormLetterSeminar');

--Susan.Baker@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(4, 3, '2018-10-15', 'FormLetterSeminar');

--Sam.Eagleton@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(5, 3, '2018-10-15', 'FormLetterSeminar');


--Kathy.Foxtrot@Somewhere.com
insert into Contact
values(6, 1, '2018-10-26', 'Seminar', 2);

--Sally.George@Somewhere.com
insert into Contact
values(7, 1, '2018-10-26', 'Seminar', 2);

--Shawn.Hullett@Somewere.com
insert into Contact
values(8, 1, '2018-10-26', 'Seminar', 2);


--Kathy.Foxtrot@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(6, 2, '2018-10-30', 'EmailSeminarMessage');

--Sally.George@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(7, 2, '2018-10-30', 'EmailSeminarMessage');

--Shawn.Hullett@Somewere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(8, 2, '2018-10-30', 'EmailSeminarMessage');


--Kathy.Foxtrot@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(6, 3, '2018-10-30', 'FormLetterSeminar');

--Sally.George@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(7, 3, '2018-10-30', 'FormLetterSeminar');

--Shawn.Hullett@Somewere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(8, 3, '2018-10-30', 'FormLetterSeminar');


--Bobbi.Pearson@Somewhere.com
insert into Contact
values(9, 1, '2018-11-02', 'Seminar', 3);

--Terri.Ranger@Somewhere.com
insert into Contact
values(10, 1, '2018-11-02', 'Seminar', 3);


--Bobbi.Pearson@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(9, 2, '2018-11-06', 'EmailSeminarMessage');

--Terri.Ranger@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(10, 2, '2018-11-06', 'EmailSeminarMessage');


--Bobbi.Pearson@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(9, 3, '2018-11-06', 'FormLetterSeminar');

--Terri.Ranger@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(10, 3, '2018-11-06', 'FormLetterSeminar');

--Ralph.Able@Somewere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(3, 4, '2019-02-20', 'WebAccountCreation');

--Ralph.Able@Somewere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(3, 5, '2019-02-20', 'EmailAccountMessage');


--Kathy.Foxtrot@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(6, 4, '2019-02-22', 'WebAccountCreation');

--Kathy.Foxtrot@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(6, 5, '2019-02-22', 'EmailAccountMessage');


--Sally.George@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(7, 4, '2019-02-25', 'WebAccountCreation');


--Shawn.Hullet@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(8, 4, '2019-03-07', 'WebAccountCreation');

--Shawn.Hullet@Somewhere.com
insert into Contact(CustomerID, ContactNumber, ContactDate, ContactType)
values(8, 5, '2019-03-07', 'EmailAccountMessage');


--Kathy.Foxtrot@Somewhere.com
insert into Contact
values(6, 6, '2019-03-22', 'Seminar', 4);

--Sally.George@Somewhere.com
insert into Contact
values(7, 6, '2019-03-22', 'Seminar', 4);

--Jenny.Tyler@Somewhere.com
insert into Contact
values(11, 1, '2019-03-22', 'Seminar', 4);

--Joan.Wayne@Somewhere.com
insert into Contact
values(12, 1, '2019-03-22', 'Seminar', 4);


--Product Insert Queries
insert into Product
values('VK001', 'Video', 'Kitchen Remodeling Basics', 14.95, 50); 

insert into Product
values('VK002', 'Video', 'Advanced Kitchen Remodeling', 14.95, 35); 

insert into Product
values('VK003', 'Video', 'Kitchen Remodeling Dallas Style', 19.95, 25);

insert into Product
values('VK004', 'Video', 'Heather Sweeny Seminar Live in Dallas on 25-OCT-17', 24.95, 20); 


insert into Product
values('VB001', 'Video Companion', 'Kitchen Remodeling Basics', 7.99, 50); 

insert into Product
values('VB002', 'Video Companion', 'Advanced Kitchen Remodeling', 7.99, 35); 

insert into Product
values('VB003', 'Video Companion', 'Kitchen Remodeling Dallas Style', 9.99, 25);


insert into Product
values('BK001', 'Book', 'Kitchen Remodeling Basics For Everyone', 24.95, 75);

insert into Product
values('BK002', 'Book', 'Advanced Kitchen Remodeling For Everyone', 24.95, 75);

insert into Product
values('BK003', 'Book', 'Kitchen Remodeling Dallas Style For Everyone', 24.95, 75);


--Invoice and Line_Item Insert queries

--Ralph.Able@Somewhere.com
--Invoice Query
insert into Invoice
values('2018-10-15', 3, 'VISA', 22.94, 5.95, 1.31, 30.20);

--Line_Item Insert Queries
insert into Line_Item
values(35000, 1, 'VK001', 1, 14.95, 14.95);

insert into Line_Item
values(35000, 2, 'VK001', 1, 14.95, 14.95);


--Susan.Baker@Somewhere.com
--Invoice Query
insert into Invoice
values('2018-10-25', 4, 'MasterCard', 47.89, 5.95, 1.31, 30.20);

--Line_Item Insert Queries
insert into Line_Item
values(35001, 1, 'VB001', 1, 14.95, 14.95);

insert into Line_Item
values(35001, 2, 'VB001', 1, 7.99, 7.99);

insert into Line_Item
values(35001, 3, 'VB001', 1, 24.95, 24.95);


--Sally.George@Somewhere.com
--Invoice Query
insert into Invoice
values('2018-12-20', 7, 'VISA', 24.95, 5.95, 1.42, 32.32);

--Line_Item Insert Query
insert into Line_Item
values(35002, 1, 'VK004', 1, 24.95, 24.95);


--Susan.Baker@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-03-25', 4, 'MasterCard', 64.85, 5.95, 3.70, 74.50);

--Line_Item Insert Queries
insert into Line_Item
values(35003, 1, 'VK002', 1, 14.95, 14.95);

insert into Line_Item
values(35003, 2, 'BK002', 1, 24.95, 24.95);

insert into Line_Item
values(35003, 3, 'VK004', 1, 24.95, 24.95);


--Kathy.Foxtrot@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-03-27', 6, 'MasterCard', 94.79, 5.95, 5.40, 106.14);

--Line_Item Insert Queries
insert into Line_Item
values(35004, 1, 'VK002', 1, 14.95, 14.95);

insert into Line_Item
values(35004, 2, 'BK002', 1, 24.95, 24.95);

insert into Line_Item
values(35004, 3, 'VK003', 1, 19.95, 19.95);

insert into Line_Item
values(35004, 4, 'VB003', 1, 9.99, 9.99);

insert into Line_Item
values(35004, 5, 'VK004', 1, 24.95, 24.95);


--Sally.George@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-03-27', 7, 'MasterCard', 94.80, 5.95, 5.40, 106.15);

--Line_Item Insert Queries
insert into Line_Item
values(35005, 1, 'BK001', 1, 24.95, 24.95);

insert into Line_Item
values(35005, 2, 'BK002', 1, 24.95, 24.95);

insert into Line_Item
values(35005, 3, 'VK003', 1, 19.95, 19.95);

insert into Line_Item
values(35005, 4, 'VK004', 1, 24.95, 24.95);


--Bobbi.Pearson@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-03-31', 9, 'VISA', 47.89, 5.95, 2.73, 56.57);

--Line_Item Insert Queries
insert into Line_Item
values(35006, 1, 'BK001', 1, 24.95, 24.95);

insert into Line_Item
values(35006, 2, 'VK001', 1, 14.95, 14.95);

insert into Line_Item
values(35006, 3, 'VB001', 1, 7.99, 7.99);


--Jenny.Tyler@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-04-03', 11, 'MasterCard', 109.78, 5.95, 6.26, 121.99);

--Line_Item Insert Queries
insert into Line_Item
values(35007, 1, 'VK003', 2, 19.95, 39.90);

insert into Line_Item
values(35007, 2, 'VB003', 2, 9.99, 19.98);

insert into Line_Item
values(35007, 3, 'VK004', 2, 24.95, 49.90);


--Sam.Eagleton@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-04-08', 5, 'MasterCard', 47.89, 5.95, 2.73, 56.57);

--Line_Item Insert Queries
insert into Line_Item
values(35008, 1, 'BK001', 1, 24.95, 24.95);

insert into Line_Item
values(35008, 2, 'VK001', 1, 14.95, 14.95);

insert into Line_Item
values(35008, 3, 'VB001', 1, 7.99, 7.99);


--Nancy.Jacobs@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-04-08', 1, 'VISA', 47.89, 5.95, 2.73, 56.57);

--Line_Item Insert Queries
insert into Line_Item
values(35009, 1, 'BK001', 1, 24.95, 24.95);

insert into Line_Item
values(35009, 2, 'VK001', 1, 14.95, 14.95);

insert into Line_Item
values(35009, 3, 'VB001', 1, 7.99, 7.99);


--Ralph.Able@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-04-23', 3, 'VISA', 24.95, 5.95, 1.42, 32.32);

--Line_Item Insert Query
insert into Line_Item
values(35010, 1, 'BK001', 1, 24.95, 24.95);


--Bobbi.Pearson@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-05-07', 9, 'VISA', 22.94, 5.95, 1.31, 30.20);

--Line_Item Insert Queries
insert into Line_Item
values(35011, 1, 'VK002', 1, 14.95, 14.95);

insert into Line_Item
values(35011, 2, 'VB002', 1, 7.99, 7.99);


--Shawn.Hullett@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-05-21', 8, 'MasterCard', 54.89, 5.95, 3.13, 63.97);

--Line_Item Insert Queries
insert into Line_Item
values(35012, 1, 'VK003', 1, 19.95, 19.95);

insert into Line_Item
values(35012, 2, 'VB003', 1, 9.99, 9.99);

insert into Line_Item
values(35012, 3, 'VK004', 1, 24.95, 24.95);


--Ralph.Able@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-06-05', 3, 'VISA', 47.89, 5.95, 2.73, 56.57);

--Line_Item Insert Queries
insert into Line_Item
values(35013, 1, 'VK002', 1, 14.95, 14.95);

insert into Line_Item
values(35013, 2, 'VB002', 1, 7.99, 7.99);

insert into Line_Item
values(35013, 3, 'BK002', 1, 24.95, 24.95);


--Jenny.Tyler@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-06-05', 11, 'MasterCard', 45.88, 5.95, 2.62, 54.45);

--Line_Item Insert Queries
insert into Line_Item
values(35014, 1, 'VK002', 2, 14.95, 29.90);

insert into Line_Item
values(35014, 2, 'VB002', 2, 7.99, 15.98);


--Joan.Wayne@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-06-05', 12, 'MasterCard', 94.79, 5.95, 5.40, 106.14);

--Line_Item Insert Queries
insert into Line_Item
values(35015, 1, 'VK002', 1, 14.95, 14.95);

insert into Line_Item
values(35015, 2, 'BK002', 1, 24.95, 24.95);

insert into Line_Item
values(35015, 3, 'VK003', 1, 19.95, 19.95);

insert into Line_Item
values(35015, 4, 'VB003', 1, 9.99, 9.99);

insert into Line_Item
values(35015, 5, 'VK004', 1, 24.95, 24.95);


--Ralph.Able@Somewhere.com
--Invoice Query
insert into Invoice
values('2019-06-05', 3, 'VISA', 45.88, 5.95, 2.62, 54.45);

--Line_Item Insert Queries
insert into Line_Item
values(35016, 1, 'VK001', 1, 14.95, 14.95);

insert into Line_Item
values(35016, 2, 'VB001', 1, 7.99, 7.99);

insert into Line_Item
values(35016, 3, 'VK002', 1, 14.95, 14.95);

insert into Line_Item
values(35016, 4, 'VB002', 1, 7.99, 7.99);