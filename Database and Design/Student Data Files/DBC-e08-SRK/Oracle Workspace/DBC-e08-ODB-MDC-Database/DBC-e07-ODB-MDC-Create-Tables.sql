/********************************************************************************/
/*																				*/
/*	Kroenk, Auer, Vandenberg & Yoder											*/
/*  Database Concepts (8th Edition) Chapters 06, 07, 08							*/
/*																				*/
/*	Marcia's Dry Cleaning [MDC] Create Tables									*/
/*																				*/
/*	Oracle Database XE code solutions											*/
/*																				*/
/********************************************************************************/

CREATE TABLE CUSTOMER (
		CustomerID			Int				NOT NULL,
		FirstName 			Char(25)		NOT NULL,
		LastName			Char(25)		NOT NULL,
		Phone				Char(12)		NOT NULL,
		EmailAddress		Char(100)		NULL,
		CONSTRAINT		Customer_PK			PRIMARY KEY (CustomerID)
		);

CREATE SEQUENCE seqCID INCREMENT BY 5 START WITH 100;

CREATE TABLE SERVICE (
		ServiceID		    Int				NOT NULL,
		ServiceDescription	Char(50)		NOT NULL,
		UnitPrice			Number(8,2)		NOT NULL,
		CONSTRAINT		 Service_PK			PRIMARY KEY(ServiceID),
		CONSTRAINT		 ServicePrice		CHECK 
							((UnitPrice >= 1.50) AND (UnitPrice <= 10.00))
		);

CREATE TABLE INVOICE (
		InvoiceNumber		Int				NOT NULL,
		CustomerID			Int				NOT NULL,
		DateIn				Date			NOT NULL,
		DateOut				Date			NULL,
		Subtotal			Number(8,2)		NULL,
		Tax					Number(8,2)		NULL,
		TotalAmount			Number(8,2)		NULL,
		CONSTRAINT		Invoice_PK			PRIMARY KEY (InvoiceNumber),
		CONSTRAINT  	InvoiceCustomerFK	FOREIGN KEY(CustomerID)
								REFERENCES CUSTOMER(CustomerID)
		);

CREATE TABLE INVOICE_ITEM (
		InvoiceNumber		Int				NOT NULL,
		ItemNumber			Int				NOT NULL,
		ServiceID			Int				NOT NULL,
		Quantity			Int				DEFAULT 1 NOT NULL,
		UnitPrice			Number(8,2)		NULL,
		ExtendedPrice		Number(8,2)		NULL,
		CONSTRAINT		InvoiceItem_PK	
								PRIMARY KEY(InvoiceNumber, ItemNumber),
		CONSTRAINT		InvoiceItemFK	FOREIGN KEY(InvoiceNumber)
								REFERENCES INVOICE(InvoiceNumber)
									ON DELETE CASCADE,
		CONSTRAINT		ItemServiceFK	FOREIGN KEY(ServiceID)
								REFERENCES Service(ServiceID)
		);
	

/******************************************************************************/



