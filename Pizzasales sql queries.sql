
--Visualizing the data
select * from pizza_sales$

--Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales$

--Average Order Price Value
select sum(total_price)/count(distinct(order_id)) from pizza_sales$

--Total Pizza Sold
select sum(quantity) from pizza_sales$

--Total Orders
select count(distinct(order_id)) from pizza_sales$

--Average Pizzas Per Order
select cast(sum(quantity)/count(distinct(order_id)) as decimal(10,2)) from pizza_sales$

--DAILY TRENDS
select DATENAME(WEEKDAY, order_date) as DAY,count(distinct(Order_id)) AS Total_Orders from pizza_sales$
group by DATENAME(WEEKDAY, order_date), DATEPART(WEEKDAY,order_date)
order by DATEPART(WEEKDAY, order_date)  ASC

--MONTHLY TRENDS
select DATENAME(MONTH, order_date) as MONTH,count(distinct(Order_id)) AS Total_Orders from pizza_sales$
group by DATENAME(MONTH,order_date), DATEPART(MONTH, order_date)
order by DATEPART(MONTH, order_date) ASC

--Hourly Trends
select DATENAME(HOUR, order_time) as HOUR, count(distinct(Order_id)) AS Total_Orders from pizza_sales$
group by DATENAME(HOUR,order_time), DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time) ASC

--Total Orders, Percentage Revenue Generated by pizza category
select pizza_category,
count(distinct(order_id)) as Total_Orders ,
cast((sum(total_price )/(select sum(total_price) from pizza_sales$))*100 as decimal(10,2)) as Percentage_Total_Price
from pizza_sales$
group by pizza_category

--Pizza Sizes by Total_Revenue, Total Orders, Percentage of Revenue generated
select pizza_size, 
cast(sum(total_price) as decimal(10,2)) as Total_Revenue,
count(distinct(order_id)) as Total_Orders,
cast((sum(total_price )/(select sum(total_price) from pizza_sales$))*100 as decimal(10,2)) as Percentage_Total_Revenue from pizza_sales$
group by pizza_size
order by Percentage_Total_Revenue DESC

--Top 5 best sellers by revenue, total quantity, Total Orders
select top 5 pizza_name, 
cast(sum(total_price) as decimal(10,2)) as Total_Revenue,
count(distinct(order_id)) as Total_Orders,
cast((sum(total_price )/(select sum(total_price) from pizza_sales$))*100 as decimal(10,2)) as Percentage_Total_Revenue from pizza_sales$
group by pizza_name
order by Percentage_Total_Revenue DESC






