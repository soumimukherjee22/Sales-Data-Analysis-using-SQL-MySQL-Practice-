SELECT * FROM sales_sample.sales_data;
-- 1. What is the total sales amount by year?
select YEAR_ID, sum(SALES) AS TOTAL_SALES FROM sales_data GROUP BY YEAR_ID ORDER BY YEAR_ID;
-- 2. Which product line has the highest average sales per order?
SELECT PRODUCTLINE, avg(SALES) AVG_SALES FROM sales_data GROUP BY PRODUCTLINE ORDER BY AVG_SALES DESC;
-- 3. Find the top 5 countries by total quantity ordered.
SELECT COUNTRY, SUM(QUANTITYORDERED) AS total_quantity_ordered FROM sales_data GROUP BY COUNTRY LIMIT 5;
-- 4. What is the total sales for orders in 'Shipped' status during 2004?
SELECT STATUS, SUM(SALES) TOTAL_SALES, YEAR_ID FROM sales_data WHERE STATUS = 'Shipped' AND YEAR_ID = '2004';
-- 5. List customers with more than 10 orders, sorted by total sales descending.
SELECT CUSTOMERNAME, COUNT(ORDERLINENUMBER) AS order_count, SUM(SALES) AS total_sales FROM sales_data GROUP BY CUSTOMERNAME HAVING order_count > 10 ORDER BY total_sales DESC;
-- 6. What is the average deal size (sales) by quarter across all years?
SELECT YEAR_ID, QTR_ID, AVG(SALES) AS avg_sales FROM sales_data GROUP BY YEAR_ID, QTR_ID ORDER BY YEAR_ID, QTR_ID;
-- 7. Find the month with the highest sales in 2005.
select MONTH_ID, sum(SALES) as Total_Sales from sales_data where YEAR_ID = "2005" group by MONTH_ID order by Total_Sales desc limit 1;
-- 8. Calculate the total sales and average price each for products where MSRP > 100.
select sum(SALES) as Total_Sales, avg(PRICEEACH) as avg_price, PRODUCTLINE from sales_data where MSRP>100 group by PRODUCTLINE order by Total_Sales desc;
-- 9. Which city in the USA had the most orders in large deals?
SELECT CITY, COUNT(*) AS order_count FROM sales_data WHERE COUNTRY = 'USA' AND DEALSIZE = 'Large' GROUP BY CITY ORDER BY order_count DESC LIMIT 1;
-- 10. Get the sales growth between 2003 and 2004 by product line.
SELECT PRODUCTLINE,
       SUM(CASE WHEN YEAR_ID = 2003 THEN SALES ELSE 0 END) AS sales_2003,
       SUM(CASE WHEN YEAR_ID = 2004 THEN SALES ELSE 0 END) AS sales_2004,
       (SUM(CASE WHEN YEAR_ID = 2004 THEN SALES ELSE 0 END) - SUM(CASE WHEN YEAR_ID = 2003 THEN SALES ELSE 0 END)) AS growth
FROM sales_data GROUP BY PRODUCTLINE ORDER BY growth DESC;