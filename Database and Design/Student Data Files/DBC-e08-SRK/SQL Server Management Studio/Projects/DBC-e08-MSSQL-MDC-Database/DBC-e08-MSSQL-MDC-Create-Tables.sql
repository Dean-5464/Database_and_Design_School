/********************************************************************************/
/*																				*/
/*	Kroenk, Auer, Vandenberg & Yoder											*/
/*  Database Concepts (8th Edition) Chapters 06, 07, 08							*/
/*																				*/
/*	Marcia's Dry Cleaning [MDC] Create Tables									*/
/*																				*/
/*	Microsoft SQL Server 2016 code solutions									*/
/*																				*/
/********************************************************************************/

USE MDC
GO

CREATE TABLE CUSTOMER(
		CustomerID			Int					NOT NULL IDENTITY (100,5),
		FirstName 			Char(25)			NOT NULL,
		LastName			Char(25)			NOT NULL,
		Phone				Char(12)			NOT NULL,
		EmailAddress		Char(100)			NULL,
		CONSTRAINT			Customer_PK			PRIMARY KEY(CustomerID)
		);	


CREATE TABLE [SERVICE](
		ServiceID			Int					NOT NULL,
		ServiceDescription	Char(50)			NOT NULL,
		UnitPrice			Numeric(8,2)		NOT NULL,
		CONSTRAINT			Service_PK			PRIMARY KEY(ServiceID),
		CONSTRAINT			ServicePrice		CHECK
								((UnitPrice >= 1.50) AND (UnitPrice <= 10.00))
  		);


CREATE TABLE INVOICE(
		InvoiceNumber		Int					NOT NULL,
		CustomerID			Int					NOT NULL,
		DateIn				Date				NOT NULL,
		DateOut				Date				NULL,
		Subtotal			Numeric(8,2)		NULL,
		Tax					Numeric(8,2)		NULL,
		TotalAmount			Numeric(8,2)		NULL,
		CONSTRAINT			Invoice_PK			PRIMARY KEY (InvoiceNumber),
		CONSTRAINT  		Invoice_Cust_FK 	FOREIGN KEY(CustomerID)
								REFERENCES CUSTOMER(CustomerID)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION
		);

CREATE TABLE INVOICE_ITEM(
		InvoiceNumber		Int					NOT NULL,
		ItemNumber			Int					NOT NULL,
		ServiceID			Int					NOT NULL,
		Quantity			Int					NOT NULL DEFAULT 1,
		UnitPrice			Numeric(8,2)		NULL,
		ExtendedPrice		Numeric(8,2)		NULL,
		CONSTRAINT			InvoiceItem_PK		PRIMARY KEY(InvoiceNumber, ItemNumber),
		CONSTRAINT			Invoice_Item_FK		FOREIGN KEY(InvoiceNumber)
								REFERENCES INVOICE(InvoiceNumber)
									ON UPDATE CASCADE
									ON DELETE CASCADE,
		CONSTRAINT			Item_ServiceFK	FOREIGN KEY(ServiceID)
								REFERENCES [SERVICE](ServiceID)
									ON UPDATE CASCADE
									ON DELETE NO ACTION
		);

/********************************************************************************/





