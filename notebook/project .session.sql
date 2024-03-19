CREATE DATABASE IF NOT EXISTS OLIST;
USE OLIST;


CREATE TABLE customers_dataset (
  customer_id VARCHAR(255) PRIMARY KEY,
  customer_unique_id VARCHAR(255),
  customer_zip_code_prefix INT,
  customer_city VARCHAR(255),
  customer_state VARCHAR(255)
);


CREATE TABLE geolocation_dataset (
  geolocation_zip_code_prefix INT,
  geolocation_lat DECIMAL(10, 7),
  geolocation_lng DECIMAL(10, 7),
  geolocation_city VARCHAR(255),
  geolocation_state VARCHAR(255)
);



CREATE TABLE orders_dataset (
  order_id VARCHAR(255) PRIMARY KEY,
  customer_id VARCHAR(255),
  order_status VARCHAR(50),
  order_purchase_timestamp DATETIME,
  order_approved_at DATETIME,
  order_delivered_carrier_date DATETIME,
  order_delivered_customer_date DATETIME,
  order_estimated_delivery_date DATETIME,
  FOREIGN KEY (customer_id) REFERENCES customers_dataset(customer_id)
);



CREATE TABLE order_items_dataset (
  order_id VARCHAR(255),
  order_item_id INT,
  product_id VARCHAR(255),
  seller_id VARCHAR(255),
  shipping_limit_date DATETIME,
  price DECIMAL(10, 2),
  freight_value DECIMAL(10, 2),
  PRIMARY KEY (order_id, order_item_id),
  FOREIGN KEY (order_id) REFERENCES orders_dataset(order_id)
);


CREATE TABLE order_payments_dataset (
  order_id VARCHAR(255),
  payment_sequential INT,
  payment_type VARCHAR(50),
  payment_installments INT,
  payment_value DECIMAL(10, 2),
  PRIMARY KEY (order_id, payment_sequential),
  FOREIGN KEY (order_id) REFERENCES orders_dataset(order_id)
);


CREATE TABLE order_reviews_dataset (
  review_id VARCHAR(255) PRIMARY KEY,
  order_id VARCHAR(255),
  review_score INT,
  review_comment_message TEXT,
  review_creation_date DATETIME,
  review_answer_timestamp DATETIME,
  FOREIGN KEY (order_id) REFERENCES orders_dataset(order_id)
);


CREATE TABLE product_category_name_translation (
  product_category_name VARCHAR(255),
  product_category_name_english VARCHAR(255)
);

CREATE TABLE products_dataset (
  product_id VARCHAR(255) PRIMARY KEY,
  product_category_name VARCHAR(255),
  product_name_length INT,
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm INT,
  product_height_cm INT,
  product_width_cm INT
);

CREATE TABLE sellers_dataset (
  seller_id VARCHAR(255) PRIMARY KEY,
  seller_zip_code_prefix INT,
  seller_city VARCHAR(255),
  seller_state VARCHAR(255)
);
