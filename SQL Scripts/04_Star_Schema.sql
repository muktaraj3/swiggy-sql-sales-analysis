-- CREATING SCHEMA
-- DIMENSION TABLES

--DATE TABLE(dim_date)
DROP TABLE IF EXISTS dim_date CASCADE;
CREATE TABLE dim_date(
	Date_Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Full_Date DATE,
	Year INT,
	Month INT,
	Month_Name VARCHAR(20),
	Quarter INT,
	Day INT,
	Week INT
);

--LOCATION TABLE(dim_location)
DROP TABLE IF EXISTS dim_location CASCADE;
CREATE TABLE dim_location(
	Location_Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	State VARCHAR(100),
	City VARCHAR (100),
	Location VARCHAR(200)
);

--RESTAURANT TABLE(dim_restaurant)
DROP TABLE IF EXISTS dim_restaurant CASCADE;
CREATE TABLE dim_restaurant(
	Restaurant_Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Restaurant_Name VARCHAR(200)
);

--CATEGORY TABLE(Dim_Category)
DROP TABLE IF EXISTS dim_category CASCADE;
CREATE TABLE dim_category(
	Category_Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Category VARCHAR(200)
);

--DISH TABLE(Dim_Dish)
DROP TABLE IF EXISTS dim_dish CASCADE;
CREATE TABLE dim_dish(
	Dish_Id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Dish_Name VARCHAR(200)
);

SELECT * FROM dim_date;
SELECT * FROM dim_location;
SELECT * FROM dim_restaurant;
SELECT * FROM dim_category;
SELECT * FROM dim_dish;
------------------------------------------------------------------------------------------------------------------

--FACT TABLE(fact_swiggy_orders)
CREATE TABLE fact_swiggy_orders(
	order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

	Date_Id INT,
	Price_INR DECIMAL(10,2),
	Rating DECIMAL(4,2),
	Rating_Count INT,

	Location_Id INT,
	Restaurant_Id INT,
	Category_Id INT,
	Dish_Id INT,

	FOREIGN KEY (Date_Id) REFERENCES dim_date(Date_Id),
	FOREIGN KEY (Location_Id) REFERENCES dim_location(Location_Id),
	FOREIGN KEY (Restaurant_Id) REFERENCES dim_restaurant(Restaurant_Id),
	FOREIGN KEY (Category_Id) REFERENCES dim_category(Category_Id),
	FOREIGN KEY (Dish_Id) REFERENCES dim_dish(Dish_Id)
);

SELECT * FROM fact_swiggy_orders;
-------------------------------------------------------------------------------------------------------------------
--INSERT DATA IN TABLES

--dim_date
INSERT INTO dim_date(Full_Date, Year, Month, Month_Name, Quarter, Day, Week)
SELECT DISTINCT
	Order_Date,
	EXTRACT (YEAR FROM Order_Date)::INT AS Year,
	EXTRACT (MONTH FROM Order_Date)::INT AS Month,
	TO_CHAR(Order_Date, 'FMMonth') AS Month_Name,
	EXTRACT (QUARTER FROM Order_Date)::INT AS Quarter,
	EXTRACT (DAY FROM Order_Date)::INT AS Day,
	EXTRACT (WEEK FROM Order_Date):: INT AS Week
FROM swiggy_data
WHERE Order_Date IS NOT NULL;

--SELECT * FROM dim_date;

--dim_location
INSERT INTO dim_location(State, City, Location)
SELECT DISTINCT 
	State,
	City,
	Location
FROM swiggy_data;

--SELECT * FROM dim_location;

--dim_restaurant
INSERT INTO dim_restaurant(Restaurant_Name)
SELECT DISTINCT
	Restaurant_Name
FROM swiggy_data;

--SELECT * FROM dim_restaurant;

--dim_category
INSERT INTO dim_category(Category)
SELECT DISTINCT
	Category
FROM swiggy_data;

--SELECT * FROM dim_category;

--dim_dish
INSERT INTO dim_dish(Dish_Name)
SELECT DISTINCT
	Dish_Name
FROM swiggy_data;

--SELECT * FROM dim_dish ;


--fact_table
INSERT INTO fact_swiggy_orders
(
	Date_Id,
	Price_INR,
	Rating,
	Rating_Count,
	Location_Id,
	Restaurant_Id,
	Category_Id,
	Dish_Id
)
SELECT
	dd.Date_Id,
	s.Price_INR,
	s.Rating,
	s.Rating_Count,
	
	dl.Location_Id,
	dr.Restaurant_Id,
	dc.Category_Id,
	di.Dish_Id
FROM swiggy_data s

JOIN dim_date dd
	ON dd.Full_Date = s.Order_Date

JOIN dim_location dl
	ON dl.State = s.State
	AND dl.City = s.City
	AND dl.Location = s.Location

JOIN dim_restaurant dr
	ON dr.Restaurant_Name = s.Restaurant_Name

JOIN dim_category dc
	ON dc.Category = s.Category

JOIN dim_dish di
	ON di.Dish_Name = s.Dish_Name

--SELECT * FROM fact_swiggy_orders;

SELECT * FROM fact_swiggy_orders f
JOIN dim_date d ON f.Date_Id = d.Date_Id
JOIN dim_location l ON f.Location_Id = l.Location_Id
JOIN dim_restaurant r ON f.Restaurant_Id = r.Restaurant_Id
JOIN dim_category c ON f.Category_Id = c.Category_Id
JOIN dim_dish di ON f.Dish_Id = di.Dish_Id;

-----------------------------------------------------------------------------------------------------------------