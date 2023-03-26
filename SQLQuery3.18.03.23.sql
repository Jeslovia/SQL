Create table Customers
(ID int Primary key identity (1,1),
FirstName varchar(50),
LastName varchar(50),
Age int,
City varchar(50)
)

Select *
from Customers;

Insert into Customers
(FirstName, LastName, Age, City) values('Ken', 'Wylan', 24, 'Ontario');

Insert into Customers
(FirstName, LastName, Age, City) values('Lisa', 'George', 33, 'KC');

Insert into Customers
(FirstName, LastName, Age, City) values('Kim', 'Woo', 19, 'Hong Kong');



Alter table Customers
Add Gender varchar(50);

Update Customers
Set Gender='F' 
Where FirstName='Kim';

Update Customers
Set Gender='M' 
Where FirstName='Ken';


Create table Product
(ProductID INT primary key identity (1,1),
ProductName varchar(50),
Category varchar(50),
Price int,
)


Select* from Product;

Insert into Product
(ProductName, Category, Price) values('PG Tea', 'Breakfast', 27);

Insert into Product
(ProductName, Category, Price) values('Kit Kat', 'Dessert', 15);


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

Update Customers
Set Gender='F' 
Where FirstName='Kim';

Update Customers
Set Gender='F' 
Where FirstName='Lisa';


/*drop table Customers;*/
/*drop table Product;*/

Alter table AllOrders
Add Foreign key (CustomerID) references Customers(ID);

Alter table AllOrders
Add foreign key (ProductID) references Product(ProductID); 

Select o.*, p.*
from AllOrders o
Inner join Product p on o.ProductID=p.ProductID;