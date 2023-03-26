create table Customer
(
FirstName varchar(50),
LastName varchar(50),
ID INT,
Age int,
Gender varchar(50),
)


Select *
From Customer;

Select *
from Orders;

select *
from Products;

delete Orders;

Alter table Customer
Add CustomerID int;

Update Customer
Set CustomerID=1
where FirstName='Linda';
Update Customer
Set CustomerID=2
where FirstName='Mary';
Update Customer
Set CustomerID=3
where FirstName='Fred';
Update Customer
Set CustomerID=4
where FirstName='Wonder';


drop table Orders;

Create table Orders
(OrderID int primary key identity(1,1),
OrderDate datetime, 
CustomerID int,
ProductID int
)

select *
from Orders;

Insert into Orders
(OrderDate, CustomerID, ProductID) values(GETDATE(), 1,1);

Insert into Orders
(OrderDate, CustomerID, ProductID) values(GETDATE(), 1,3);

Alter table Orders
Add foreign key (customerID) references CustomerID;