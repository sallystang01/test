--HUNTER DUERR--

USE MASTER
if (select count(*) 
    from sys.databases where name = 'LibraryScript1') > 0
BEGIN
		DROP DATABASE LibraryScript1;
END

create database LibraryScript1 

GO
USE LibraryScript1

exec sp_changedbowner 'sa'

create table supplier

(
supplier_id int not null identity(100, 1),
company_name nchar(100) not null,
contact_name nchar(100) not null,
address_1 nchar(40) null,
address_2 nchar(40) null,
city nchar(20) not null,
region nchar(20) not null,
zip nchar(15) not null,
country nchar(20) not null,
contact_phone nchar(15) null,
primary key (supplier_id)
);

create table categories
(
category_id int not null identity(1, 1),
name nchar(50) not null,
primary key (category_id))
;

create table authors
(
author_id int not null identity (1,1),
first_name nchar(50) not null,
middle_name nchar(50) null,
last_name nchar(50) not null,
primary key (author_id)
);

create table products

(
product_id int not null identity(10, 1),
category_id int foreign key references categories(category_id) not null,
title nchar(50) not null,
genre nchar(20) not null,
author_id int foreign key references authors(author_id) not null,
price smallmoney not null,
lang nchar(20) not null,
supplier_id int foreign key references supplier(supplier_id) not null,
isbn nchar(50) not null,
primary key (product_id)
);



 create table customers

(
customer_id int not null identity(100, 1),
first_name nchar(100) not null,
last_name nchar(100) not null,
address_1 nchar(40) not null,
address_2 nchar(40) null,
city nchar(20) not null,
region nchar(20) not null,
zip nchar(15) not null,
country nchar(20) not null,
homephone nchar(15) null,
cellphone nchar(15) null,
primary key (customer_id)
);

 create table employees

(
employee_id int not null identity(3001, 1),
first_name nchar(100) not null,
last_name nchar(100) not null,
title nchar(50) not null,
salary smallmoney not null,
birthdate smalldatetime not null,
address_1 nchar(40) not null,
address_2 nchar(40) null,
city nchar(20) not null,
region nchar(20) not null,
zip nchar(15) not null,
country nchar(20) not null,
homephone nchar(15) null,
cellphone nchar(15) null,
primary key (employee_id)
);
create table librarykey

(
keys_id int not null identity(5001, 1),
customer_id int foreign key references customers(customer_id) not null,
startdate smalldatetime not null,
enddate smalldatetime null,
primary key (keys_id)

);
create table inventory

(
inventory_id int not null identity(2001, 1),
product_id int foreign key references products(product_id),
keys_id int foreign key references librarykey(keys_id) null,
overdue int not null,
available int not null,
indate smalldatetime null,
outdate smalldatetime null,
location nchar(100) not null,
checkedby int foreign key references employees(employee_id) not null,
condition nchar(20) not null,
reportdate smalldatetime null,
note nchar(200) not null,
primary key (inventory_id)
);

create table inventoryhistory

(

inventory_id int  not null,
outdate smalldatetime not null,
indate smalldatetime not null,
conditionout varchar(20) not null,
conditionin varchar(20) not null,
keys_id int foreign key references librarykey(keys_id) not null


);

create table fees

(
keys_id int foreign key references librarykey(keys_id),
outcount int not null,
overduecount int not null,
duedate smalldatetime null,
dues smallmoney not null

);
ALTER TABLE employees
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifyEmployee
ON employees
AFTER UPDATE
AS
BEGIN

	UPDATE		e
	SET			e.ModifiedDate = GETDATE(), 
				e.ModifiedBy = ORIGINAL_LOGIN()
	FROM		employees e
	

END
GO

ALTER TABLE authors
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifyAuthors
ON authors
AFTER UPDATE
AS
BEGIN

	UPDATE		a
	SET			a.ModifiedDate = GETDATE(), 
				a.ModifiedBy = ORIGINAL_LOGIN()
	FROM		authors a
	

END
GO

ALTER TABLE customers
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifyCustomers
ON customers
AFTER UPDATE
AS
BEGIN

	UPDATE		c
	SET			c.ModifiedDate = GETDATE(), 
				c.ModifiedBy = ORIGINAL_LOGIN()
	FROM		customers c
	

END
GO

ALTER TABLE categories
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifyCategories
ON categories
AFTER UPDATE
AS
BEGIN

	UPDATE		ca
	SET			ca.ModifiedDate = GETDATE(), 
				ca.ModifiedBy = ORIGINAL_LOGIN()
	FROM		categories ca
	

END
GO

ALTER TABLE inventory
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifyInventory
ON inventory
AFTER UPDATE
AS
BEGIN

	UPDATE		i
	SET			i.ModifiedDate = GETDATE(), 
				i.ModifiedBy = ORIGINAL_LOGIN()
	FROM		inventory i
	

END
GO

ALTER TABLE librarykey
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifyLK
ON librarykey
AFTER UPDATE
AS
BEGIN

	UPDATE		lk
	SET			lk.ModifiedDate = GETDATE(), 
				lk.ModifiedBy = ORIGINAL_LOGIN()
	FROM		librarykey lk
	

END
GO

ALTER TABLE products
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifyProducts
ON products
AFTER UPDATE
AS
BEGIN

	UPDATE		p
	SET			p.ModifiedDate = GETDATE(), 
				p.ModifiedBy = ORIGINAL_LOGIN()
	FROM		products p
	

END
GO

ALTER TABLE supplier
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()


GO
CREATE TRIGGER trgRecordModifySuppliers
ON supplier
AFTER UPDATE
AS
BEGIN

	UPDATE		s
	SET			s.ModifiedDate = GETDATE(), 
				s.ModifiedBy = ORIGINAL_LOGIN()
	FROM		supplier s
	

END
GO
ALTER TABLE inventoryhistory
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()
GO
CREATE TRIGGER trgRecordModifyInventoryHistory
ON inventoryhistory
AFTER UPDATE
AS
BEGIN

	UPDATE		ih
	SET			ih.ModifiedDate = GETDATE(), 
				ih.ModifiedBy = ORIGINAL_LOGIN()
	FROM		inventoryhistory ih
	

END
GO

ALTER TABLE fees
ADD ModifiedDate datetime DEFAULT GETDATE(), 
ModifiedBy VARCHAR(50) DEFAULT ORIGINAL_LOGIN()
GO
CREATE TRIGGER trgRecordModifyfees
ON fees
AFTER UPDATE
AS
BEGIN

	UPDATE		f
	SET			f.ModifiedDate = GETDATE(), 
				f.ModifiedBy = ORIGINAL_LOGIN()
	FROM		fees f
	

END
GO


--SUPPLIERS

insert into supplier (company_name, contact_name,
	address_1, address_2, city, region, zip, country, contact_phone)

	values ('Amazon', 'Ryan Garfield', '112 City BLVD', null, 'Ocala', 'Florida','34471',
		'United States', '352-111-2211')
insert into supplier (company_name, contact_name,
	address_1, address_2, city, region, zip, country, contact_phone)

	values ('Barns and Noble', 'Jason Aladean', '3340 Highway 40', null, 'Ocala', 'Florida','34471',
		'United States', '352-211-2451')
insert into supplier (company_name, contact_name,
	address_1, address_2, city, region, zip, country, contact_phone)

	values ('Books Inc', 'Mark Landing', '4222 Sunset Avenue', null, 'Ocala', 'Florida','34471',
		'United States', '352-154-2551')

	--EMPLOYEES	

insert into employees 
 (first_name, last_name, title, salary, birthdate, address_1, address_2, city, region,
		zip, country, homephone, cellphone)

	values ('Hunter','Duerr','Manager','97,553.25', '1999-05-21', '124 Whirlwind Loop', null, 'Hawthorne', 'Florida',
		'32640', 'United States', null, '561-307-2954')

insert into employees 
 (first_name, last_name, title, salary, birthdate, address_1, address_2, city, region,
		zip, country, homephone, cellphone)

	values ('Roddy','Tatom','Assistant Manager', '71,399.50', '1993-12-28', '900 Rodger Street', null, 'Ocala', 'Florida',
		'34470', 'United States', null, '352-222-2222')

insert into employees 
 (first_name, last_name, title, salary, birthdate, address_1, address_2, city, region,
		zip, country, homephone, cellphone)

	values ('Arthur','Ammirati','Accountant', '67,190.20', '1973-03-12', '201 Jet Blvd', null, 'Ocala', 'Florida',
		'34470', 'United States', null, '352-113-2422')

insert into employees 
 (first_name, last_name, title, salary, birthdate, address_1, address_2, city, region,
		zip, country, homephone, cellphone)

	values ('Blake','Hoelle','Librarian', '56,880.42', '1996-08-21', '1924 3rd Street', null, 'Ocala', 'Florida',
		'34470', 'United States', null, '352-445-2562')

insert into employees 
 (first_name, last_name, title, salary, birthdate, address_1, address_2, city, region,
		zip, country, homephone, cellphone)

	values ('Cody','Goodluck','Librarian Assistant', '30,000.50', '1993-08-15', '5401 Magnolia Avenue', null, 'Ocala', 'Florida',
		'34470', 'United States', null, '352-125-2462')

--CATEGORIES
insert into categories
	(name)
values ('Book')

insert into categories
	(name)
values ('Digital')

insert into categories
	(name)
values ('Magazine')

insert into categories
	(name)
values ('E-Book')

insert into categories
	(name)
values ('Audio Book')

insert into categories
	(name)
values ('Music')


--AUTHORS--

insert into authors

(first_name, middle_name, last_name)

values ('Patrcia', null, 'Aakhus')

insert into authors

(first_name, middle_name, last_name)

values ('Stephen', null, 'King')

--PRODUCTS--

insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'The Voyage of Mael Duin', 'Novel', 1, 15.99, 'English', 100, 0863273092 )


insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'The Voyage of Mael Duin', 'Novel', 1, 15.99, 'English', 100, 0863273092)


insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'The Voyage of Mael Duin', 'Novel', 1, 15.99, 'English', 100, 0863273092 )


insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'Sleeping Beauties', 'Novel', 2, 12.42, 'English', 100, '150116340X')

insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'Sleeping Beauties', 'Novel', 2, 12.42, 'English', 100, '150116340X' )

insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'Sleeping Beauties', 'Novel', 2, 12.42, 'English', 100, '150116340X' )

insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'IT', 'Novel', 2, 6.51, 'English', 100, '1501175467')

insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'IT', 'Novel', 2, 6.51, 'English', 100, '1501175467' )

insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'IT', 'Novel', 2, 6.51, 'English', 100, '1501175467' )

insert into products (category_id, title, genre, author_id, price, lang, supplier_id, isbn)

values (1, 'IT', 'Novel', 2, 6.51, 'English', 100, '1501175467')

--select * from products

--Customer--

insert into customers
 (first_name, last_name, address_1, address_2, city, region, zip, country, homephone, cellphone)
 values
 ('John', 'Brown', '757 Terrace Loop', null, 'Ocala', 'Florida', 34470, 'United States', '352-444-2135', '352-217-4945')

	--select * from customers

--LibraryKey

insert into librarykey
	(customer_id, startdate, enddate)

values	(100, getdate(), null)

--select * from librarykey

--INVENTORY--

insert into inventory
(product_id, available, overdue, keys_id, indate, outdate, location, checkedby, condition, reportdate, note)

values (10, 0, 1, 5001, null, '2017-11-11', 'Out', 3004, 'Good', GETDATE(), 'Overdue')

	insert into inventory
	(available, product_id, overdue, indate, outdate, location, checkedby, condition, reportdate, note)

	values (1, 11, 0, GETDATE(), null, 'Shelf', 3004, 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue,indate, outdate, location, checkedby, condition, reportdate, note)

	values (1, 12, 0, GETDATE(), null, 'Shelf', 3004, 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue,indate, outdate, location, checkedby, condition, reportdate, note)

	values (1, 13, 0, GETDATE(), null, 'Shelf', 3004, 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue,indate, outdate, location, checkedby, condition, reportdate, note)

	values (1, 14, 0, GETDATE(), null, 'Shelf',3004 , 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue,indate, outdate, location, checkedby, condition, reportdate, note)

	values (1, 15, 0, GETDATE(), null, 'Shelf', 3004, 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue, outdate, indate, location, checkedby, condition, reportdate, note)

	values (1, 16, 0, null, getdate(), 'Shelf', 3005, 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue, outdate, indate, location, checkedby, condition, reportdate, note)

	values (1, 17, 0, null, getdate(), 'Shelf', 3005, 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue, outdate, indate, location, checkedby, condition, reportdate, note)

	values (1, 18, 0, null, getdate(), 'Shelf', 3005, 'New', GETDATE(), 'n/a')

	insert into inventory
	(available, product_id, overdue, outdate, indate, location, checkedby, condition, reportdate, note)

	values (1, 19, 0, null, getdate(), 'Shelf', 3005, 'New', GETDATE(), 'n/a')

	

insert into fees
(keys_id, outcount, overduecount, duedate, dues)

values (5001, 1, 1, '2017-11-25', 10.00)

insert into inventoryhistory
(inventory_id, outdate, indate, conditionout, conditionin, keys_id)
values (2001, '2017-04-01', '2017-11-01', 'New', 'Good', 5001)

insert into inventoryhistory
(inventory_id, outdate, indate, conditionout, conditionin, keys_id)
values (2001, '2017-11-07', '2017-11-09', 'Good', 'Good' ,5001)



create unique index idx_Products on Products (product_id, title)
create unique index idx_inventory on Inventory (inventory_id)
create unique index idx_authors on authors (author_id)
create unique index idx_emplyoees on employees (employee_id)
create unique index idx_customers on customers (customer_id)





PRINT 'Database Succesfully Created'

select * from fees