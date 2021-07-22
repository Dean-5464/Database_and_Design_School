/********************************************************************************/
/*										                                        */
/*	Kroenke, Auer, Vandenberg & Yoder											*/
/*  Database Concepts (8th Edition) Chapters 7 and 8				    		*/
/*										                                      	*/
/*	Marcia's Dry Cleaning [MDC] Project Create Tables	                      	*/
/*													                          	*/
/*	These are the MySQL 5.7 SQL code solutions		                          	*/
/*  Note: MySQL does not support auto_increment with a step besides 1. 			*/
/*  	Thus, customerIDs are inserted manually 100, 105, 110, etc. 			*/
/*										                                        */		
/********************************************************************************/

/***   CUSTOMER Data   **********************************************************/

INSERT INTO CUSTOMER VALUES(
	100, 'Nikki', 'Kaccaton', '723-543-1233',
	'Nikki.Kaccaton@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	105, 'Brenda', 'Catnazaro', '723-543-2344',
	'Brenda.Catnazaro@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	110, 'Bruce', 'LeCat', '723-543-3455',
	'Bruce.LeCat@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	115, 'Betsy', 'Miller', '725-654-3211',
	'Betsy.Miller@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	120, 'George', 'Miller', '725-654-4322',
	'George.Miller@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	125, 'Kathy', 'Miller', '723-514-9877',
	'Kathy.Miller@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	130, 'Betsy', 'Miller', '723-514-8766',
	'Betsy.Miller@elsewhere.com');
  
/***   SERVICE Data   ***********************************************************/

INSERT INTO SERVICE VALUES(10, 'Men''s Shirt', 1.50);
INSERT INTO SERVICE VALUES(11, 'Dress Shirt', 2.50);
INSERT INTO SERVICE VALUES(15, 'Women''s Shirt', 1.50);
INSERT INTO SERVICE VALUES(16, 'Blouse', 3.50);
INSERT INTO SERVICE VALUES(20, 'Slacks-Men''s', 5.00);
INSERT INTO SERVICE VALUES(25, 'Slacks-Women''s', 6.00);
INSERT INTO SERVICE VALUES(30, 'Skirt', 5.00);
INSERT INTO SERVICE VALUES(31, 'Dress Skirt', 6.00);
INSERT INTO SERVICE VALUES(40, 'Suit-Men''s', 9.00);
INSERT INTO SERVICE VALUES(45, 'Suit-Women''s', 8.50);
INSERT INTO SERVICE VALUES(50, 'Tuxedo', 10.00);
INSERT INTO SERVICE VALUES(60, 'Formal Gown', 10.00);

/***   INVOICE Data   ***********************************************************/

INSERT INTO INVOICE VALUES(
		2017001, 100,'2017-10-04','2017-010-06',
		158.50, 12.52, 171.02);
INSERT INTO INVOICE VALUES(
		2017002, 105,'2017-10-04','2017-10-06',
		25.00, 1.98, 26.98);
INSERT INTO INVOICE VALUES(
		2017003, 100,'2017-10-06','2017-10-08',
		49.00, 3.87, 52.87);
INSERT INTO INVOICE VALUES(
		2017004, 115,'2017-10-06', '2017-10-08',
		17.50, 1.38, 18.88);
INSERT INTO INVOICE VALUES(
		2017005, 125,'2017-10-07','2017-10-11',
		12.00, 0.95, 12.95);
INSERT INTO INVOICE VALUES(
		2017006, 110,'2017-10-11','2017-10-13',
		152.50, 12.05, 164.55);
INSERT INTO INVOICE VALUES(
		2017007, 110,'2017-10-11','2017-10-13',
		7.00, 0.55, 7.55);
INSERT INTO INVOICE VALUES(
		2017008, 130, '2017-10-12','2017-10-14',
		140.50, 11.10, 151.60);
INSERT INTO INVOICE VALUES(
		2017009, 120,'2017-10-12','2017-10-14',
		27.00, 2.13, 29.13);
        
/***   INVOICE_ITEM Data   ******************************************************/

INSERT INTO INVOICE_ITEM VALUES(2017001, 1, 16, 2, 3.50, 7.00);
INSERT INTO INVOICE_ITEM VALUES(2017001, 2, 11, 5, 2.50, 12.50);
INSERT INTO INVOICE_ITEM VALUES(2017001, 3, 50, 2, 10.00, 20.00);
INSERT INTO INVOICE_ITEM VALUES(2017001, 4, 20, 10, 5.00, 50.00);
INSERT INTO INVOICE_ITEM VALUES(2017001, 5, 25, 10, 6.00, 60.00);
INSERT INTO INVOICE_ITEM VALUES(2017001, 6, 40, 1, 9.00, 9.00);
INSERT INTO INVOICE_ITEM VALUES(2017002, 1, 11, 10, 2.50, 25.00);
INSERT INTO INVOICE_ITEM VALUES(2017003, 1, 20, 5, 5.00, 25.00);
INSERT INTO INVOICE_ITEM VALUES(2017003, 2, 25, 4, 6.00, 24.00);
INSERT INTO INVOICE_ITEM VALUES(2017004, 1, 11, 7, 2.50, 17.50);
INSERT INTO INVOICE_ITEM VALUES(2017005, 1, 16, 2, 3.50, 7.00);
INSERT INTO INVOICE_ITEM VALUES(2017005, 2, 11, 2, 2.50, 5.00);
INSERT INTO INVOICE_ITEM VALUES(2017006, 1, 16, 5, 3.50, 17.50);
INSERT INTO INVOICE_ITEM VALUES(2017006, 2, 11, 10, 2.50, 25.00);
INSERT INTO INVOICE_ITEM VALUES(2017006, 3, 20, 10, 5.00, 50.00);
INSERT INTO INVOICE_ITEM VALUES(2017006, 4, 25, 10, 6.00, 60.00);
INSERT INTO INVOICE_ITEM VALUES(2017007, 1, 16, 2, 3.50, 7.00);
INSERT INTO INVOICE_ITEM VALUES(2017008, 1, 16, 3, 3.50, 10.50);
INSERT INTO INVOICE_ITEM VALUES(2017008, 2, 11, 12, 2.50, 30.00);
INSERT INTO INVOICE_ITEM VALUES(2017008, 3, 20, 8, 5.00, 40.00);
INSERT INTO INVOICE_ITEM VALUES(2017008, 4, 25, 10, 6.00, 60.00);
INSERT INTO INVOICE_ITEM VALUES(2017009, 1, 40, 3, 9.00, 27.00);
