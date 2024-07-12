create database activity;
use activity;
create table productlines(
productLine varchar(50) primary key,
textDescription varchar(4000),
htmlDescription varchar(1000),
image mediumblob
);
create table products(
productCode varchar(50) primary key,
productName varchar(70),
productLine varchar(50),
prodcutScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock smallint not null,
buyPrice decimal(10,2) not null,
MSRP decimal(10,2) not null,
constraint fk_productLines foreign key(productLine)
references productLines(productLine)
);
create table employees(
employeeNumber int primary key,
lastName varchar(50),
firstName varchar(50),
extension varchar(10),
email varchar(100),
officeCode varchar(10),
reportsTo int,
jobTitle varchar(50),
constraint fk_offices foreign key(officeCode)
references offices(officeCode)
);
create table offices(
officeCode varchar(10) primary key,
city varchar(50),
phone varchar(50),
adressLine1 varchar(50),
adressLine2 varchar(50),
state varchar(50),
country varchar(50) not null,
postalCode varchar(50) not null,
territory varchar(10) not null
);
create table customers(
customerNumber int primary key,
customerName varchar(50),
contactLastName varchar(50),
contactFirstName varchar(50),
phone varchar(50),
addessLine1 varchar(50),
addessLine2 varchar(50),
city varchar(50),
state varchar(50),
postalCode varchar(50),
country varchar(50) not null,
salesRepEmployeeNumber int,
creditLimit decimal(10,2),
constraint fk_employee foreign key(salesRepEmployeeNumber)
references employees(employeeNumber)
);
create table orders(
orderNumber int primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date,
status varchar(15),
comments text,
customerNumber int,
constraint fk_customer foreign key(customerNumber)
references customers(customerNumber)
);
create table orderdetails(
orderNumber int,
productCode varchar(15),
quantityOrdered int not null,
priceEach decimal(10,2),
orderLineNumber smallint not null,
constraint fk_order foreign key(orderNumber)
references orders(orderNumber),
constraint fk_product foreign key(productCode)
references products(productCode)
);
create table payments(
customerNumber int,
checkNumber varchar(40) primary key,
paymentDate date not null,
amount decimal(10,2) not null,
constraint fk_customers foreign key(customerNumber)
references customers(customerNumber)
);
