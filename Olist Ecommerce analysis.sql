----------------------------------------------------------------------
------------ Olist Ecommerce Analysis Project  ------------
----------------------------------------------------------------------

-- ========================================
-- Create & Load Tables 
-- ========================================

/*
Staging queries used for tables with irrelevant columns that will be excluded from the database
*/

---- Orders Table ----
-- Create staging table and load data
DROP TABLE IF EXISTS olist.orders_staging;

CREATE TABLE olist.orders_staging (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP,
	order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date DATE
);

COPY olist.orders_staging 
FROM '' -- removed path for github
DELIMITER ','
CSV HEADER;


-- Create real table and insert data from staging table
DROP TABLE IF EXISTS olist.orders;

CREATE TABLE olist.orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date DATE
);

INSERT INTO olist.orders (
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
)
SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
FROM olist.orders_staging;


---- Order Items Table ----
DROP TABLE IF EXISTS olist.order_items;

CREATE TABLE olist.order_items (
    order_id VARCHAR,
    order_item_id INT,
    product_id VARCHAR,
    seller_id VARCHAR,
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);

COPY olist.order_items
FROM ''
DELIMITER ','
CSV HEADER;



---- Order Payments Table ----
-- Create staging table and load data
DROP TABLE IF EXISTS olist.payments_staging;

CREATE TABLE olist.payments_staging (
    order_id VARCHAR,
	payment_sequential INT,
    payment_type VARCHAR,
	payment_installments INT,
    payment_value NUMERIC(10,2)
);

COPY olist.payments_staging 
FROM ''
DELIMITER ','
CSV HEADER;

-- Create real table and insert data from staging table
DROP TABLE IF EXISTS olist.payments;

CREATE TABLE olist.payments (
    order_id VARCHAR,
    payment_type VARCHAR,
    payment_value NUMERIC(10,2)
);

INSERT INTO olist.payments (
    order_id,
    payment_type,
    payment_value
)
SELECT
    order_id,
    payment_type,
    payment_value
FROM olist.payments_staging;


---- Reviews Table ----
-- Create staging table and load data
DROP TABLE IF EXISTS olist.reviews_staging;

CREATE TABLE olist.reviews_staging (
    review_id VARCHAR,
    order_id VARCHAR,
    review_score INT,
	review_comment_title VARCHAR,
    review_comment_message VARCHAR,
    review_creation_date DATE,
    review_answer_timestamp TIMESTAMP
);


COPY olist.reviews_staging
FROM ''
DELIMITER ','
CSV HEADER;


-- Create real table and insert data from staging table
DROP TABLE IF EXISTS olist.reviews;

CREATE TABLE olist.reviews (
	review_key SERIAL PRIMARY KEY,
    review_id VARCHAR,
    order_id VARCHAR,
    review_score INT,
    review_creation_date DATE,
    review_answer_timestamp TIMESTAMP
);

INSERT INTO olist.reviews (
    review_id,
    order_id,
    review_score,
    review_creation_date,
    review_answer_timestamp
)
SELECT
    review_id,
    order_id,
    review_score,
    review_creation_date,
    review_answer_timestamp
FROM olist.reviews_staging;


---- Customers Table ----
DROP TABLE IF EXISTS olist.customers;

CREATE TABLE olist.customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_unique_id VARCHAR,
    customer_zip_code_prefix INT,
    customer_city VARCHAR,
    customer_state VARCHAR(2)
);

COPY olist.customers
FROM ''
DELIMITER ','
CSV HEADER;



---- Products Table ----
-- Create staging table and load data
DROP TABLE IF EXISTS olist.products_staging;

CREATE TABLE olist.products_staging (
    product_id VARCHAR PRIMARY KEY,
    product_category_name VARCHAR,
	product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

COPY olist.products_staging 
FROM ''
DELIMITER ','
CSV HEADER;

-- Create real table and insert data from staging table
DROP TABLE IF EXISTS olist.products;

CREATE TABLE olist.products (
    product_id VARCHAR PRIMARY KEY,
    product_category_name VARCHAR,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

INSERT INTO olist.products (
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
SELECT
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM olist.products_staging;


---- Sellers Table ----
DROP TABLE IF EXISTS olist.sellers;

CREATE TABLE olist.sellers (
    seller_id VARCHAR PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR,
    seller_state VARCHAR(2)
);

COPY olist.sellers
FROM ''
DELIMITER ','
CSV HEADER;




---- Translation Table ----
DROP TABLE IF EXISTS olist.product_translation;

CREATE TABLE olist.product_translation (
    product_category_name VARCHAR PRIMARY KEY,
    product_category_name_english VARCHAR
);

COPY olist.product_translation
FROM ''
DELIMITER ','
CSV HEADER;


---- Date Dimension Table ----
DROP table if exists olist.date_dim;

CREATE table olist.date_dim
as
SELECT date::date -- The actual date value for the row
,to_char(date,'yyyymmdd')::int as date_key 
,date_part('day',date)::int as day_of_month
,date_part('doy',date)::int as day_of_year
,date_part('dow',date)::int as day_of_week -- day 0-6 of the week
,trim(to_char(date, 'Day')) as day_name
,trim(to_char(date, 'Dy')) as day_short_name
,date_part('week',date)::int as week_number
,to_char(date,'W')::int as week_of_month
,date_trunc('week',date)::date as week
,date_part('month',date)::int as month_number
,trim(to_char(date, 'Month')) as month_name
,trim(to_char(date, 'Mon')) as month_short_name
,date_trunc('month',date)::date as first_day_of_month
,(date_trunc('month',date) + interval '1 month' - interval '1 day')::date as last_day_of_month
,date_part('quarter',date)::int as quarter_number
,trim('Q' || date_part('quarter',date)::int) as quarter_name
,date_trunc('quarter',date)::date as first_day_of_quarter
,(date_trunc('quarter',date) + interval '3 months' - interval '1 day')::date as last_day_of_quarter
,date_part('year',date)::int as year 
FROM generate_series('2016-01-01'::date, '2018-12-31'::date, '1 day') as date;
-- ^Create one row per day between the two dates given. The data is all from 2016-2018




-- ========================================
-- Data Cleaning & Transformations
-- ========================================
-- Add product category name english translation into the products table
ALTER TABLE olist.products
ADD COLUMN product_category_name_english VARCHAR;

UPDATE olist.products p
SET product_category_name_english = t.product_category_name_english
FROM olist.product_translation t
WHERE p.product_category_name = t.product_category_name;

-- The two category names below were not included in the translation tables and have nulls in the english column
-- Add their english translation to the products table
UPDATE olist.products
SET product_category_name_english = 'gaming computers'
WHERE product_category_name = 'pc_gamer';

UPDATE olist.products
SET product_category_name_english = 'small_appliances_kitchen_and_food_prep'
WHERE product_category_name = 'portateis_cozinha_e_preparadores_de_alimentos';

-- Replace underscores with spaces and capitalize the first letter of every word
-- Also replace nulls with 'unknown'
UPDATE olist.products
SET product_category_name =
    COALESCE(INITCAP(REPLACE(product_category_name, '_', ' ')), 'Desconhecida'),
    product_category_name_english =
    COALESCE(INITCAP(REPLACE(product_category_name_english, '_', ' ')), 'Unknown');

-- Capitalize first letters of cities in the sellers, geolocation, and customers tables
UPDATE olist.sellers
SET seller_city = INITCAP(seller_city);

UPDATE olist.customers
SET customer_city = INITCAP(customer_city);

