 create database CorporateHybride;

Create table Customers
(ID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
City varchar(50)
)

Select *
from Customers;

Insert into Customers
(ID, FirstName, LastName, Age, City) values(1, 'Ken', 'Wylan', 24, 'Ontario');


Update Customers
Set ID=3
Where FirstName='Lisa';

Alter table Customers
Add Gender varchar(50);

Update Customers
Set Gender='F' 
Where FirstName='Kim';

Update Customers
Set Gender='M' 
Where FirstName='Ken';


Create table Product
(ProductID INT,
ProductName varchar(50),
Category varchar(50),
Price int,
)


Select* from Product;

Insert into Product
(ProductID,	ProductName, Category, Price) values(1, 'PG Tea', 'Breakfast', 27);

Insert into Product
(ProductID, ProductName, Category, Price) values(2, 'Kit Kat', 'Dessert', 15);


Create table AllOrders
(
OrderID INT Primary Key identity(1,1),
OrderDate Datetime,
CustomerID int,
ProductID int
)


Select * from AllOrders;

Insert into AllOrders
(OrderDate, CustomerID, ProductID) values( GETDATE(), 1,2);

Insert into AllOrders
(OrderDate, CustomerID, ProductID) values(GETDATE(), 2,1);

Insert into AllOrders
(OrderDate, CustomerID, ProductID) values(GETDATe(), 1,1);

Select* from Customers;
select* from Product;
select* from AllOrders;

Insert into AllOrders
(OrderDate, CustomerID, ProductID) values(GETDATe(), 3,1);

Insert into AllOrders
(OrderDate, CustomerID, ProductID) values(GETDATe(), 3,2);


alter table AllOrders
Add foreign key (CustomerID) references Customers(ID);