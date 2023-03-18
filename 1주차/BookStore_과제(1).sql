create database BookStore;
use BookStore;

create table Offices
(
 officeCode varchar(10) primary key,
 city varchar(50) not null,
 phone varchar(50) not null,
 addressLine1 varchar(50) not null,
 addressLine2 varchar(50),
 state varchar(50),
 country varchar(50) not null,
 postalCode varchar(15) not null,
 territory varchar(10) not null
) charset = utf8mb4;

create table Employees
(
 employeeNumber int primary key,
 lastName varchar(50) not null,
 firstName varchar(50) not null,
 extension varchar(10) not null,
 email varchar(100) not null,
 officeCode varchar(10) not null,
 foreign key (officeCode) references Offices(officeCode),
 reportsTo int,
 foreign key (reportsTO) references Employees(employeeNumber),
 jobTitle varchar(50) not null
) charset = utf8mb4;

create table Customers
(
 customerNumber int primary key,
 customerName varchar(50) not null,
 contactLastName varchar(50) not null,
 contactFirstName varchar(50) not null,
 phone varchar(50) not null,
 addressLine1 varchar(50) not null,
 addressLine2 varchar(50),
 city varchar(50) not null,
 state varchar(50),
 postalCode varchar(50),
 country varchar(50) not null,
 salesRepEmployeeNumber int,
 foreign key (salesRepEmployeeNumber) references Employees(employeeNumber),
 creditLimit double
) charset = utf8mb4;

create table ProductLines
(
 productLine varchar(50) primary key,
 textDescription varchar(4000),
 htmlDescription mediumtext,
 image mediumblob
) charset = utf8mb4;

create table Products
(
 productCode varchar(15) primary key,
 productName varchar(70) not null,
 productLine varchar(50) not null,
 foreign key (productLine) references ProductLines(productLine),
 productScale varchar(10) not null,
 productVendor varchar(50) not null,
 productDescription text not null,
 quantityInStock smallint not null,
 buyPrice double not null,
 MSRP double not null
) charset = utf8mb4;

create table Orders
(
 orderNumber int primary key,
 
 orderDate datetime not null,
 requiredDate datetime not null,
 shippedDate datetime,
 status varchar(15) not null,
 comments text,
 customerNumber int not null,
 foreign key (customerNumber) references Customers(customerNumber)
) charset = utf8mb4;

create table OrderDetails
(
 orderNumber int,
 productCode varchar(15),
 primary key(orderNumber, productCode),
 quantityOrdered int not null,
 priceEach double not null,
 orderLineNumber smallint not null,
 foreign key (productCode) references Products (productCode),
 foreign key (orderNumber) references Orders (orderNumber)
) charset = utf8mb4;

create table Payments
(
 customerNumber int,
 checkNumber varchar(50),
 primary key(customerNumber, checkNumber),
 paymentDate datetime not null,
 amount double not null,
 foreign key (customerNumber) references Customers (customerNumber)
) charset = utf8mb4;