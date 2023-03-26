create database BIG4DA;
Use BIG4DA;

Create table Clients
(FirstName varchar(50),
LastName varchar(50),
OtherNames varchar(50),
ID int primary key identity (1,1),
Age int,
Gender varchar(10),
City varchar(50),
EmpStatus varchar(50)
)

Insert into Clients
(FirstName, LastName, OtherNames, Age, Gender, City, EmpStatus) values('Mar', 'Kan', 'June', 21, 'F', 'L.A.', 'Employed');

Insert into Clients
(FirstName, LastName, OtherNames, Age, Gender, City, EmpStatus) values('Dawn', 'Martin', 'Lily', 24, 'F', 'Manhattan', 'Unemployed');

Insert into Clients
(FirstName, LastName, OtherNames, Age, Gender, City, EmpStatus) values('Tim', 'Jones', 'Peter', 37, 'M', 'London', 'Employed');

Select * from Clients;



Create table Stock
(StockID int primary key identity (1,1),
StName varchar(50),
Category varchar(50),
)

Insert into Stock (StName, Category) values('Toblerone', 'Dessert');
Insert into Stock (StName, Category) values('Kitkat', 'Dessert');
Insert into Stock (StName, Category) values('TAO Tea', 'Breakfast');
Insert into Stock (StName, Category) values('Lipton', 'Breakfast');
Insert into Stock (StName, Category) values('Threadmill', 'Gym Equipment');
Insert into Stock (StName, Category) values('Irish Spring', 'Hygiene');
Insert into Stock (StName, Category) values('Dove Deo Stick', 'Hygiene');

Select * from Stock;

Alter table Stock
Add Price float; 

Update Stock
Set Price=30.99
Where StName='Toblerone';

Update Stock Set Price=14.99 Where StName='Kitkat';
Update Stock Set Price=54.99 Where StName='TAO Tea';
Update Stock Set Price=20.99 Where StName='Lipton';
Update Stock Set Price=1200.99 Where StName='Threadmill';
Update Stock Set Price=23.99 Where StName='Irish Spring';
Update Stock Set Price=18.99 Where StName='Dove Deo Stick';


Create table Transct
(
Transctdate datetime,
TransctID int primary key identity (1,1),
ClientID int,
StockID int, 
Quantity int,
)

Select * from Transct;

/*drop table Transct;*/

insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 1, 2, 3);
insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 2, 2, 1);
insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 3, 4, 3);
insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 1, 5, 1);
insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 1, 2, 3);
insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 3, 6, 2);
insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 2, 7, 1);
insert into Transct (Transctdate, ClientID, StockID, Quantity) values(GETDATE(), 2, 1, 3);

Select * from Clients;
Select * from Transct;
Select * from Stock;

Alter table transct
add foreign key (ClientID) references clients(ID);

Alter table transct
add foreign key (stockID) references stock(StockID);


/*Joined all 3 tables*/
select * from Transct t
inner join Stock s on t.TransctID=s.StockID
inner join Clients c on t.ClientID=c.ID;


/*Extracted columns I want to see*/
select t.Transctdate, t.TransctID, t.Quantity, c.FirstName, c.Gender, c.City, c.EmpStatus, s.StName, s.Price from Transct t
inner join Stock s on t.TransctID=s.StockID
inner join Clients c on t.ClientID=c.ID;


/*Extracted columns I want to see in a particular order*/
select t.Transctdate, t.TransctID, c.FirstName, c.Gender, c.City, c.EmpStatus, s.StName, s.Price, t.Quantity from Transct t
inner join Stock s on t.TransctID=s.StockID
inner join Clients c on t.ClientID=c.ID


/*Total amount spent on entire order*/
select sum(s.Price) from Transct t
inner join Stock s on t.TransctID=s.StockID
inner join Clients c on t.ClientID=c.ID;


/*Total amount spent by each customer - Group "sumed price" by customers*/
select c.FirstName, sum(s.Price) from Transct t
inner join Stock s on t.TransctID=s.StockID
inner join Clients c on t.ClientID=c.ID
Group by c.FirstName;


/*Total amount spent by each customer - Group "sumed price" by customers and Employment status*/
select c.FirstName, c.EmpStatus, sum(s.Price) from Transct t
inner join Stock s on t.TransctID=s.StockID
inner join Clients c on t.ClientID=c.ID
Group by c.EmpStatus, c.FirstName;


/*Total amount spent on each category - Group "sumed price" by category. Named aggregated columns*/
select s.Category, sum(t.Quantity) as 'Total Quantity', sum(s.Price) as 'Total Amount' from Transct t
inner join Stock s on t.TransctID=s.StockID
inner join Clients c on t.ClientID=c.ID
Group by s.Category;

