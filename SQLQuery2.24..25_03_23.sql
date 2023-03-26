select * from SalesRecords100m


/*Show revenue and profit generated per region and number of units sold, order by profit, highest to lowest*/
select SalesRecords100m.Region, sum(SalesRecords100m.Units_Sold) as 'Units Sold', round(sum(SalesRecords100m.Total_Revenue),2) as 'Total Revenue', 
round(sum(SalesRecords100m.Total_Profit),2) as 'Total Profit'  from SalesRecords100m
group by Region order by [Total Profit] desc;


/*Show items and their corresponding revenue generated from highest to least revenue*/
select SalesRecords100m.Item_Type, sum(SalesRecords100m.Total_Revenue) as 'Total Revenue per Item Type' from SalesRecords100m
group by Item_Type order by [Total Revenue per Item Type] desc;


/*Show the profit made through sales channels*/
select SalesRecords100m.Sales_Channel, round(sum(SalesRecords100m.Total_Profit),2) as 'Profit per Sales Channel' from SalesRecords100m
group by Sales_Channel order by [Profit per Sales Channel] desc;


/*Show items sold, the units sold, and the corresponding revenue and profit per item from lagest profit to the least*/
select SalesRecords100m.Item_Type, sum(SalesRecords100m.Units_Sold) as 'Total No. of Units Sold', round(sum(SalesRecords100m.Total_Revenue),2) as 'Total Revenue', 
round(sum(SalesRecords100m.Total_Profit),2) as 'Total Profit' from SalesReOrder_Date) as 'Year',
sum(SalesRecords100m.Units_Sold) as 'Units Sold', round(sum(SalesRecords100m.Total_Profit),2) as 'Total Profit per Season'
from SalesRecords100m
group by year(SalesRecords100m.Order_Date) order by year(SalesRecords100m.Order_Date) desc;


/*Show total profit in desc order by month and unit sold */
select month(SalesRecords100m.Order_Date) as 'Month', sum(SalesRecords100m.Units_Sold) as 'Unit Sold', round(sum(SalesRecords100m.Total_Profit),2) as 'Profit'
from SalesRecords100m group by month(Order_Date) order by Profit desc;

/*learning how to get text form of dates and trying fxns*/
select DATENAME(MONTH, dateadd(month, 0, SalesRecords100m.Order_Date)) as 'Month', sum(SalesRecords100m.Total_Profit) as 'Profit' 
from SalesRecords100m Group by DATENAME(MONTH, dateadd(month, 0, SalesRecords100m.Order_Date)) order by Profit desc;

/*This gets the text from of dates*/
select DateName(mm,SalesRecords100m.Order_Date) from SalesRecords100m;

/*The trick in getting date text in an aggregated form is to specify also in grouping*/
select Datename(month, SalesRecords100m.Order_Date) as 'Month', round(sum(SalesRecords100m.Total_Profit),2) as 'Profit', 
sum(SalesRecords100m.Units_Sold) as 'Unit Sold' from SalesRecords100m
Group by datename(month,Order_Date) order by Profit desc;

/*Show items bought in July, unit cost, unit sold, and profit in desc order*/
select SalesRecords100m.Item_Type, round(sum(SalesRecords100m.Unit_Cost),2) as 'Unit Cost', sum(SalesRecords100m.Units_Sold) as 'Unit Sold', 
round(sum(SalesRecords100m.Total_Profit),2) as 'Total Profit' from SalesRecords100m where DateName(mm,Order_Date) = 'July' 
Group by Item_Type order by [Total Profit] desc;