CREATE DATABASE Research_Project;

USE Research_Project;


CREATE TABLE Adidas_Sales
(Retailer char(100),
Retailer_ID int,
Invoice_Date text,
Region char(60),
State char(60),
City char(50),
Product char(200),
Price_per_Unit_$ int,
Units_sold int,
Total_Sales_$ int,
Operating_Profit_$ int,
Operating_Margin_percentage int,
Sales_Method char(100)
);

select * from adidas_sales;



/* Top 5 Retailers by total amount of sales*/

SELECT Retailer, sum(Total_Sales_$) 
FROM adidas_sales
GROUP BY Retailer
ORDER BY 2 DESC
LIMIT 5;


/* Sales by Region*/

SELECT Region, sum(Total_Sales_$) 
FROM adidas_sales
GROUP BY Region
ORDER BY 2 DESC;


/* Top 5 states for Sales*/

SELECT State, sum(Total_Sales_$) 
FROM adidas_sales
GROUP BY State
ORDER BY 2 DESC
LIMIT 5;


/* Top 5 City for Sales*/

SELECT city, sum(Total_Sales_$) 
FROM adidas_sales
GROUP BY city
ORDER BY 2 DESC
LIMIT 5;


/* Top 5 product with highest sales*/

SELECT product, sum(Total_Sales_$) 
FROM adidas_sales
GROUP BY product
ORDER BY 2 DESC
limit 5;


/* Method wise sales*/

SELECT Sales_Method, sum(Total_Sales_$) 
FROM adidas_sales
GROUP BY Sales_Method
ORDER BY 2 DESC;


/* Year wise total sales*/

SELECT YEAR(new_date), sum(Total_Sales_$) 
FROM adidas_sales
GROUP BY YEAR(new_date)
ORDER BY 2 DESC;


/* Year wise which product gave the highest profit*/

SELECT product, YEAR(new_date) AS year, sum(Operating_Profit_$) AS Total_profit
FROM adidas_sales
WHERE YEAR(new_date)='2020'
GROUP BY product, YEAR(new_date)
ORDER BY 3 DESC
LIMIT 1;


SELECT product, YEAR(new_date) AS year, sum(Operating_Profit_$) AS Total_profit
FROM adidas_sales
WHERE YEAR(new_date)='2021'
GROUP BY product, YEAR(new_date)
ORDER BY 3 DESC
LIMIT 1;


/* top ranked retailers by region over sales*/

WITH B AS (SELECT Region, retailer, SUM(Total_Sales_$) AS Total_sales,
dense_rank() OVER (Partition by region ORDER by SUM(Total_Sales_$) DESC) AS Rnk
FROM Adidas_sales
GROUP BY Region, retailer
ORDER BY 3 DESC)

SELECT * FROM B
WHERE Rnk=1;


