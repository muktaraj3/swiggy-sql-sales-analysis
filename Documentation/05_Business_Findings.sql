------ Business Requirements
------ KPIs

--- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM fact_swiggy_orders

--- Total Revenue (INR Millions)
SELECT 
	ROUND(SUM(Price_INR)/1000000.0, 2) || 'INR Million'
	AS Total_Revenue
FROM fact_swiggy_orders

--- Average Dish Price
SELECT
	ROUND(AVG(Price_INR),2) || ' INR'
	AS Average_Dish_Price
FROM fact_swiggy_orders

--- Average Rating
SELECT 
	ROUND(AVG(Rating), 1)
	AS Average_Rating
FROM fact_swiggy_orders

--- GRANULAR REQUIREMENTS

--Monthly Order Trends
SELECT
	d.year,
	d.month,
	d.month_name,
	COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
	JOIN dim_date d ON f.Date_Id = d.Date_Id
GROUP BY 
	d.year,
	d.month,
	d.month_name
ORDER BY 
	COUNT(*) DESC;

SELECT
	d.year,
	d.month,
	d.month_name,
	--SUM(Price_INR) AS Total_Revenue
	ROUND(SUM(Price_INR)/1000000.0, 2) || ' INR Million'
	AS Total_Revenue
FROM fact_swiggy_orders f
	JOIN dim_date d ON f.Date_Id = d.Date_Id
GROUP BY 
	d.year,
	d.month,
	d.month_name
ORDER BY 
	SUM(Price_INR) DESC;

--- Quarterly Trend
SELECT
	d.year,
	d.quarter,
	COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
	JOIN dim_date d ON f.Date_Id = d.Date_Id
GROUP BY 
	d.year,
	d.quarter
ORDER BY COUNT(*) DESC;

---Yearly Trend
SELECT
	d.year,
	COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
	JOIN dim_date d ON f.Date_Id = d.Date_Id
GROUP BY d.year
ORDER BY COUNT(*) DESC;

--- Orders by Day of Week (Mon-Sun)
SELECT
	TO_CHAR( d.Full_Date, 'FMDay') AS Day_Name,
	COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
	JOIN dim_date d ON f.date_id = d.date_Id
GROUP BY 
	TO_CHAR( d.Full_Date, 'FMDay'), 
	EXTRACT(ISODOW FROM d.Full_Date)
ORDER BY
	EXTRACT(ISODOW FROM d.Full_Date);
-----------------------------------------------------------------------------------------------------

--------------Location-Based Analysis

--- Top 10 Cities by Order Volume (Number of Orders)
SELECT 
	l.city,
	COUNT(*) AS Total_Orders  
FROM fact_swiggy_orders f
	JOIN dim_location l
	ON l.location_id = f.location_id
GROUP BY l.city
ORDER BY Total_Orders  DESC
LIMIT 10;

-- Top 10 Cities by REVENUE (Financial Earnings)
SELECT 
	l.city,
	--SUM(f.Price_INR) AS Total_Revenue 
	ROUND(SUM(Price_INR)/1000000.0, 2) || ' INR Million'
	AS Total_Revenue
FROM fact_swiggy_orders f
	JOIN dim_location l
	ON l.location_id = f.location_id
GROUP BY l.city
ORDER BY Total_Revenue  DESC
LIMIT 10;

--- Revenue Contribution by States
SELECT 
	l.state,
	ROUND(SUM(Price_INR)/1000000.0, 2) || ' INR MIllion'
	AS Total_Revenue
FROM fact_swiggy_orders f
	JOIN dim_location l
	ON l.location_id = f.location_id
GROUP BY l.state
ORDER BY Total_Revenue  DESC

LIMIT 10;
----------------------------------------------

--------Food Performance

--- Top 10 Restaurants by Orders (Number of Orders)
SELECT
	r.restaurant_name,
	COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
	JOIN dim_restaurant r
	ON r.restaurant_id = f.restaurant_id
GROUP BY r.restaurant_name
ORDER BY Total_Orders DESC

LIMIT 10;

--- Top 10 Restaurants by Orders (Revenue)
SELECT 
	r.restaurant_name,
	ROUND(SUM(Price_INR)/1000000.0 , 2) || ' INR Million' 
	AS Total_Revenue
FROM fact_swiggy_orders f
	JOIN dim_restaurant r
	ON r.restaurant_id = f.restaurant_id
GROUP BY r.restaurant_name
ORDER BY Total_Revenue DESC

LIMIT 10;

--- Top Categories by Order Volume
SELECT
	c.category,
	COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
	JOIN dim_category c ON f.category_id = c.category_id
GROUP BY c.category
ORDER BY Total_Orders DESC;

--- Most Ordered Dishes
SELECT 
	d.dish_name,
	COUNT(*) AS Order_Count
FROM fact_swiggy_orders f
	JOIN dim_dish d ON f.dish_id = d.dish_id
GROUP BY d.dish_name
ORDER BY Order_Count DESC;

--- Cuisine Performance (Orders + Avg Rating)
SELECT 
	c.category,
	COUNT(*) AS Total_Orders,
	ROUND(AVG(Rating), 1) AS Average_Rating
FROM fact_swiggy_orders f
JOIN dim_category c ON f.category_id = c.category_id
GROUP BY c.category
ORDER BY Total_Orders DESC;

--- Total Orders by Price Range
SELECT
	CASE
		WHEN  Price_INR < 100 THEN 'Under 100'
		WHEN  Price_INR BETWEEN 100 AND 199.99 THEN '100-199'
		WHEN  Price_INR BETWEEN 200 AND 299.99 THEN '200-299'
		WHEN  Price_INR BETWEEN 300 AND 499.99 THEN '300-499'
		ELSE '500+'
	END AS Price_Range,
	COUNT(*) AS Total_Orders
FROM fact_swiggy_orders
GROUP BY Price_Range
ORDER BY Total_Orders DESC;

--- Rating Count Distribution
SELECT
	rating,
	COUNT(*) AS Rating_Count
FROM fact_swiggy_orders
GROUP BY Rating
ORDER BY 1 DESC;
	