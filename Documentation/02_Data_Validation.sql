SELECT * FROM swiggy_data;

-- Data Validation
-------------------------------------------------------------------
-- Null Check

SELECT 
	SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS null_state,
	SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS null_city,
	SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
	SUM(CASE WHEN Restaurant_Name IS NULL THEN 1 ELSE 0 END) AS null_restaurant,
	SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS null_location,
	SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
	SUM(CASE WHEN Dish_Name IS NULL THEN 1 ELSE 0 END) AS null_dish_name,
	SUM(CASE WHEN Price_INR IS NULL THEN 1 ELSE 0 END) AS null_price,
	SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) AS null_rating,
	SUM(CASE WHEN Rating_Count IS NULL THEN 1 ELSE 0 END) AS null_rating_count
FROM swiggy_data;
---------------------------------------------------------------------------------------------------------------------

-- Blank or Empty Strings

SELECT *
FROM swiggy_data
	WHERE 
	State ='' OR City ='' OR Restaurant_Name ='' OR Location ='' OR Category='' OR Dish_Name='';
-------------------------------------------------------------------------------------------------------------------

-- Duplicate Detection

SELECT 
	State, CIty, Order_Date, Restaurant_Name, Location, Category, Dish_Name, Price_INR, Rating,
	Rating_Count, COUNT(*) AS CNT
FROM swiggy_data
GROUP BY 
	State, CIty, Order_Date, Restaurant_Name, Location, Category, Dish_Name, Price_INR, Rating,
	Rating_Count
HAVING COUNT(*)>1;
----------------------------------------------------------------------------------------------------------------

--Delete Duplicates

WITH CTE AS (
SELECT CTID, 
ROW_NUMBER() OVER(
	PARTITION BY State, CIty, Order_Date, Restaurant_Name, Location, Category, Dish_Name, Price_INR, Rating,
	Rating_Count
	ORDER BY CTID
)AS RN
FROM swiggy_data
)
DELETE FROM swiggy_data
WHERE CTID IN(
	SELECT CTID
	FROM CTE
	WHERE  RN>1
);
------------------------------------------------------------------------------------------------------------------

