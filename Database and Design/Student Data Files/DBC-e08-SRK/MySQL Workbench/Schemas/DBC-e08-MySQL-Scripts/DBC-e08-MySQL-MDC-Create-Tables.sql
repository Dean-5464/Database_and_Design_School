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

CREATE TABLE CUSTOMER(
		CustomerID			Int				NOT NULL,
		FirstName 			Char(25)	    NOT NULL,
		LastName		  	Char(25)	    NOT NULL,
		Phone			    Char(12) 	    NOT NULL,
		EmailAddress	    Char(100)	    NULL,
		CONSTRAINT		CustomerPK    		PRIMARY KEY(CustomerID)
		);


CREATE TABLE SERVICE(
		ServiceID		    Int				NOT NULL,
		ServiceDescription	Char(50)	    NOT NULL,
		UnitPrice		    Numeric(8,2)	NOT NULL,
		CONSTRAINT		ServicePK		 	PRIMARY KEY(ServiceID),
		CONSTRAINT		ServicePrice	 	CHECK
							((UnitPrice >= 1.50) AND (UnitPrice <= 10.00))
  		);


CREATE TABLE INVOICE(
		InvoiceNumber       Int				NOT NULL,
		CustomerID		    Int				NOT NULL,
		DateIn			    Date	   	    NOT NULL,
		DateOut			    Date  	 	    NULL,
		SubTotal		    Numeric(8,2)	NULL,
		Tax				    Numeric(8,2)	NULL,
		TotalAmount			Numeric(8,2)	NULL,
		CONSTRAINT		InvoicePK			PRIMARY KEY (InvoiceNumber),
		CONSTRAINT  	Invoice_Cust_FK 	FOREIGN KEY(CustomerID)
							REFERENCES CUSTOMER(CustomerID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
		);

CREATE TABLE INVOICE_ITEM(
		InvoiceNumber     	Int				NOT NULL,
		ItemNumber		    Int				NOT NULL,
		ServiceID		    Int				NOT NULL,
		Quantity		    Int				NOT NULL DEFAULT 1,
		UnitPrice		    Numeric(8,2)	NULL,
		ExtendedPrice     	Numeric(8,2)	NULL,
		CONSTRAINT		InvoiceItemPK		PRIMARY KEY(InvoiceNumber, ItemNumber),
		CONSTRAINT		Invoice_Item_FK		FOREIGN KEY(InvoiceNumber)
							REFERENCES INVOICE(InvoiceNumber)
								ON UPDATE CASCADE
								ON DELETE CASCADE,
		CONSTRAINT		Item_ServiceFK		FOREIGN KEY(ServiceID)
							REFERENCES Service(ServiceID)
								ON UPDATE CASCADE
    );

/********************************************************************************/




