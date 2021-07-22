--Create Database
--create database HSD;

--Use The Created Database
use HSD;

--Create Table Statements

--Customer Table
create table Customer(
CustomerID			int				Not Null identity(1,1), --Auto Increment For SQL Server (PK)
LastName			char(25)		not null,
FirstName			char(25)		not null,
EmailAddress		varchar(100)	Not Null,
EncryptedPassword	varchar(50)		null,
Phone				char(12)		not null,
StreetAddress		char(35)		null,
City				char(35)		null default 'Dallas',
State				char(2)			null default 'TX',
ZIP					char(10)		null default '75201',

constraint Customer_PK		Primary Key(CustomerID),
constraint Customer_Email	unique(EmailAddress)
);

--Seminar Table
create table Seminar(
SeminarID			int				not null identity(1,1), --Auto Increment (PK)
SeminarDate			date			not null,
SeminarTime			time			not null,
Location			varchar(100)	not null,
SeminarTitle		varchar(100)	not null,

constraint Seminar_PK		Primary Key(SeminarID)
);

--Seminar Customer Table (Linking Table)
create table Seminar_Customer(
SeminarID			int				not null, --(PK, FK)
CustomerID			int				Not Null, --(PK, FK)

constraint S_C_PK	Primary Key(SeminarID, CustomerID),
constraint S_C_Seminar_FK	Foreign Key(SeminarID)
			References Seminar(SeminarID)
				on Update No Action
				on Delete No Action,
constraint S_C_Customer_FK Foreign Key(CustomerID)
			References Customer(CustomerID)
				on Update No Action
				on Delete No Action
);

--Contact Table
create table Contact(
CustomerID			int				Not Null,
ContactNumber		int				Not Null,
ContactDate			date			Not Null,
ContactType			varchar(30)		Not Null,
SeminarID			int				Null,

constraint Contact_PK	Primary Key(CustomerID, ContactNumber),
constraint Contact_ContactType
			Check(ContactType in ('Seminar',
				 'WebAccountCreation', 'WebPurchase',
				 'EmailAccountMessage','EmailSeminarMessage',
				 'EmailPurchaseMessage',
				 'EmailMessageExchange', 'FormLetterSeminar',
				 'PhoneConversation')),
constraint Contact_Seminar_FK Foreign Key(SeminarID)
			References Seminar(SeminarID)
				on Update No Action
				on Delete No Action,
constraint Contact_Customer_FK Foreign Key(CustomerID)
			References Customer(CustomerID)
				on Update No Action
				on Delete No Action
);

--Product Table
create table Product(
ProductNumber		char(35)		Not Null,
ProductType			char(24)		Not Null,
ProductDescription	varchar(100)	Not Null,
UnitPrice			numeric(9,2)	Not Null,
QuantityOnHand		int				Null,

constraint Product_PK	Primary Key(ProductNumber),
constraint Product_ProductType
			Check(ProductType in ('Video',
				 'Video Companion', 'Book'))
);

--Invoice Table
create table Invoice(
InvoiceNumber			int				Not Null identity(35000,1), --Auto Increment, Starts At 35000 (PK)
InvoiceDate				date			Not Null,
CustomerID				int				Not Null,
PaymentType				char(25)		Not Null Default 'Cash',
SubTotal				numeric(9,2)	Null,
Shipping				numeric(9,2)	Null,
Tax						numeric(9,2)	Null,
Total					numeric(9,2)	Null,

constraint Invoice_PK	Primary Key(InvoiceNumber),
constraint Invoice_PaymentType
			Check(PaymentType in ('Visa',
				 'MasterCard', 'American Express',
				 'PayPal', 'Check', 'Cash')),
constraint Invoice_Customer_FK Foreign Key(CustomerID)
			References Customer(CustomerID)
				on Update No Action
				on Delete No Action
);

--Line Item Table (Linking Table)
create table Line_Item(
InvoiceNumber					int				Not Null, --(PK, FK)
LineNumber						int				Not Null, --(PK, FK)
ProductNumber					char(35)		Not Null,
Quantity						int				Not Null,
UnitPrice						Numeric(9,2)	Null,
Total							Numeric(9,2)	Null,

constraint Line_Item_PK		Primary Key(InvoiceNumber, LineNumber),
constraint L_I_Invoice_FK	Foreign Key(InvoiceNumber)
							 References Invoice(InvoiceNumber)
								on Update No Action
								on Delete Cascade,
constraint L_I_Product_FK	 Foreign Key(ProductNumber)
							  References Product(ProductNumber)
								on Update Cascade
								on Delete No Action
);