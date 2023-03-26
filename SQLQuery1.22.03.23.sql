create database DA_MIDLANDS;

USE DA_MIDLANDS;

Create table Shoppers
(
ID int primary key identity (1,1),
FirstName varchar(50),
LastName varchar(50),
Gender varchar(50),
Marital_Status varchar(50),
)

select * from Shoppers;

insert into Shoppers
(FirstName, LastName, Gender, Marital_Status) values('Jane', 'Law', 'F', 'Single')
insert into Shoppers
(FirstName, LastName, Gender, Marital_Status) values('Henry', 'Forrester', 'M', 'Divorced')
insert into Shoppers
(FirstName, LastName, Gender, Marital_Status) values('Mel', 'Levre', 'F', 'Married');

Alter table Shoppers
Add City varchar(50);

Update Shoppers
Set City='Manhattan'
Where FirstName='Jane';

Update Shoppers
Set City='Kumasi'
Where FirstName='Henry';

Update Shoppers
Set City='Paris'
Where LastName='Levre';


Create table Goods
(
ID int primary key identity (001,1),
Name varchar(50),
Category varchar(50),
)

select * from Goods;

Insert into Goods
(Name, Category) values('Yomi', 'Yoghurts');
Insert into Goods
(Name, Category) values('Mentos', 'Sweets');
Insert into Goods
(Name, Category) values('Sadia chiken breast', 'Meat');

Alter table Goods
Add Price float;


Update Goods
Set Price = 11.00 where Name='Yomi';

Update Goods
Set Price = 15.00 where Name='Mentos';
Update Goods
Set Price = 70.00 where Name='Sadia chiken breast';


Create table SALES_TRANSC
(
ID int primary key identity (1,1),
CustomerID int,
PrdtID int,
)

Select * from SALES_TRANSC;

Insert into SALES_TRANSC
(PrdtID, CustomerID) Values(1,1);

/*Drop table SALES_TRANSC;*/

Insert into SALES_TRANSC (PrdtID, CustomerID) Values(1,2);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(2,1);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(3,2);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(1,3);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(3,3);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(1,2);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(2,2);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(2,1);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(3,1);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(1,3);
Insert into SALES_TRANSC (PrdtID, CustomerID) Values(2,1);


Select * from Shoppers;
Select * from Goods;
Select * from SALES_TRANSC;


Alter table SALES_TRANSC
ADD foreign key (CustomerID) references Shoppers(ID);

Alter table SALES_TRANSC
ADD foreign key (PrdtID) references Goods(ID);


Select * from SALES_TRANSC as ST
Inner join Goods as G on ST.CustomerID=G.ID
Inner join Shoppers as S on ST.CustomerID=S.ID;


Select st.ID, g.Name, g.Price, s.FirstName, s.LastName, s.City from SALES_TRANSC as ST
Inner join Goods as G on ST.CustomerID=G.ID
Inner join Shoppers as S on ST.CustomerID=S.ID;

ALTER TABLE SALES_TRANSC
Add TranscDate datetime; 

select * from SALES_TRANSC;

update SALES_TRANSC
set TranscDate= GETDATE();


Select st.ID, g.Name, g.Price, s.FirstName, s.LastName, s.City from SALES_TRANSC as ST
Inner join Goods as G on ST.CustomerID=G.ID
Inner join Shoppers as S on ST.CustomerID=S.ID; 