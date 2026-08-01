-- Change Order_Date Type to DATE

ALTER TABLE swiggy_data 
ALTER COLUMN Order_Date TYPE DATE 
USING TO_DATE(Order_Date, 'DD-MM-YYYY');