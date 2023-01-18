Use northwind;


-- 1 Calculate average Unit Price for each CustomerId.

select CustomerId, UnitPrice,
avg(UnitPrice) over (partition by CustomerId order by CustomerId) as Avg_unit_price
from orders o
inner join order_details od on od.OrderId=o.OrderId;

-- 2 Calculate average Unit Price for each group of CustomerId AND EmployeeId.

select CustomerId, EmployeeId, UnitPrice,
avg(UnitPrice) over (partition by CustomerId, EmployeeId) as Avg_Unit_Price
from orders o 
inner join order_Details od on od.orderId=o.OrderId;

-- 3 Rank Unit Price in descending order for each CustomerId.

select CustomerId, UnitPrice,
Rank() over (partition by CustomerId order by UnitPrice desc) as UnitPrice_in_Desc
from orders o 
inner join order_details od on od.OrderId=o.OrderId;

-- 4  How can you pull the previous order date’s Quantity for each ProductId.

select OrderDate, ProductId, Quantity,
lag(Quantity) over (partition by ProductId order by OrderDate) as Previous_Date
from orders o
inner join Order_Details od on od.Orderid=o.OrderId;

-- 5 How can you pull the following order date’s Quantity for each ProductId.

select OrderDate, ProductId, Quantity,
Lead(Quantity) over (partition by ProductId order by OrderDAte) as Lead_Order_Date
from orders o
inner join Order_Details od on od.OrderId=o.OrderId;

-- 6 Pull out the very first Quantity ever ordered for each ProductId.

select ProductId, OrderDate, Quantity,
First_value(Quantity) over (partition by ProductId order by OrderDate) as Firs_tValue
from orders o
inner join Order_details od on od.OrderId=o.OrderId;

-- 7  Calculate a cumulative moving average UnitPrice for each CustomerId.

select CustomerId, UnitPrice,
Avg(UnitPrice) over (partition by CustomerId order by Customerid) as Cum_Avg
from orders o 
inner join Order_Details od on od.OrderId=o.OrderId;



 Question.3  How is Metadata expressed and structured?

-- total information about database
select * from information_schema.statistics
where table_schema='northwind' ;

-- information about views
select * from information_schema.views
where table_schema = 'northwind';


-- information about tables
select * from information_schema.tables
where table_schema = 'northwind';

-- is_updatable check
select * from information_schema.views
where table_schema = 'northwind' and is_updatable = 'NO';

-- table type
select table_name,table_type from information_schema.tables
where table_schema = 'northwind';


select table_name,table_type from information_schema.tables
where table_schema = 'northwind'
and table_type = 'BASE TABLE';

-- ount no. of tables in Database
select table_schema, count(*)
from information_schema.tables
where table_schema = 'northwind'
group by table_schema;

-- check table_type
select table_schema, table_name, column_name
from information_schema.columns
where table_schema = 'northwind' and DATA_TYPE = 'set';

-- information about columns in Database
select * from information_schema.columns
where table_schema = 'northwind' and table_name = 'actor';

-- check Deafault Engine
select table_name, engine
from information_schema.tables
where table_schema = 'northwind';




















