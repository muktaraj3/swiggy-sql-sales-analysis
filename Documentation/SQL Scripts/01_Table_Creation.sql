---- Creation of Table swiggy_data
DROP TABLE IF EXISTS swiggy_data CASCADE;
CREATE TABLE swiggy_data (
	State 	VARCHAR(50),
	City	VARCHAR(50),
	Order_Date	VARCHAR(20),
	Restaurant_Name		VARCHAR(100),
	Location	VARCHAR(50),
	Category 	VARCHAR(60),
	Dish_Name	VARCHAR(200),
	Price_INR NUMERIC(10,2),
	Rating 	FLOAT,
	Rating_Count INTEGER
);
