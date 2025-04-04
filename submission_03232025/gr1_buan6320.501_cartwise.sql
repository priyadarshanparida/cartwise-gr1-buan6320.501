-- Create a database for the E-commerce company "Cartwise Inc."
CREATE DATABASE IF NOT EXISTS cartwise;
USE cartwise;

-- Module 1. Customer Onboarding
/* Table 1 - CUSTOMER
@Author: Soniya Rajappan
Purpose: Store customer information for account management and order processing.
1. Customer ID (cid): Unique identifier for each customer.
2. First Name (fname): First name of the customer.
3. Last Name (lname): Last name of the customer.
4. Date of Birth (dob): Date of birth of the customer.
5. Gender (gender): Gender of the customer.
6. Email (email): Email address of the customer.
7. Phone (phone): Phone number of the customer.
8. Address Line 1 (address_line1): First line of the customer's address.
9. Address Line 2 (address_line2): Second line of the customer's address.
10. City (city): City of the customer's address.
11. State (state): State code of the customer's address.
12. ZIP Code (zip): ZIP code of the customer's address.
13. Country (country): Country of the customer's address.
*/

CREATE TABLE customer (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Table 2 - LOGIN
@Author: Soniya Rajappan
Purpose: Store login information for customer authentication and account management.
1. Customer ID (cid): Unique identifier for each customer.
2. Password Hash (password_hash): Hashed password for customer login.
3. Registration Date (registration_date): Date and time of customer registration.
4. Last Login Date (last_login_date): Date and time of customer's last login.
5. Is Active (is_active): Flag to indicate if the customer account is active.
*/
CREATE TABLE login (
    cid INT,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login_date TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (cid) REFERENCES customer(cid)
);

-- TODO: Implement password hashing for security

/* Insert 1: Insert records into the customer table
@Author: Soniya Rajappan
*/
INSERT INTO customer (cid, fname, lname, dob, gender, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
(1000, 'John', 'Doe', '1985-05-15', 'Male', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'Dallas', 'TX', '75001', 'USA'),
(1001, 'Jane', 'Smith', '1990-07-20', 'Female', 'jane.smith@example.com', '9876543210', '456 Elm St', 'Apt 2B', 'Austin', 'TX', '73301', 'USA'),
(1002, 'Alice', 'Johnson', '1988-03-12', 'Female', 'alice.johnson@example.com', '5551234567', '789 Oak St', NULL, 'Houston', 'TX', '77001', 'USA'),
(1003, 'Bob', 'Brown', '1975-11-05', 'Male', 'bob.brown@example.com', '4449876543', '321 Pine St', 'Suite 300', 'San Antonio', 'TX', '78201', 'USA'),
(1004, 'Charlie', 'Davis', '2000-01-25', 'Other', 'charlie.davis@example.com', '3334567890', '654 Maple St', NULL, 'Dallas', 'TX', '75002', 'USA'),
(1005, 'Emily', 'Wilson', '1995-09-10', 'Female', 'emily.wilson@example.com', '2229876543', '987 Cedar St', 'Apt 1A', 'Austin', 'TX', '73302', 'USA'),
(1006, 'David', 'Taylor', '1982-06-18', 'Male', 'david.taylor@example.com', '1111234567', '123 Birch St', NULL, 'Houston', 'TX', '77002', 'USA'),
(1007, 'Sophia', 'Anderson', '1998-12-30', 'Female', 'sophia.anderson@example.com', '6669876543', '456 Walnut St', 'Suite 400', 'San Antonio', 'TX', '78202', 'USA'),
(1008, 'Michael', 'Thomas', '1978-04-22', 'Male', 'michael.thomas@example.com', '7774567890', '789 Spruce St', NULL, 'Dallas', 'TX', '75003', 'USA'),
(1009, 'Olivia', 'Moore', '1993-08-14', 'Female', 'olivia.moore@example.com', '8881234567', '321 Cherry St', 'Apt 3C', 'Austin', 'TX', '73303', 'USA'),
(1010, 'Ethan', 'Martin', '1987-02-11', 'Male', 'ethan.martin@example.com', '9999876543', '654 Willow St', NULL, 'Houston', 'TX', '77003', 'USA'),
(1011, 'Isabella', 'Jackson', '1992-10-05', 'Female', 'isabella.jackson@example.com', '1114567890', '987 Poplar St', 'Suite 500', 'San Antonio', 'TX', '78203', 'USA'),
(1012, 'James', 'White', '1980-03-30', 'Male', 'james.white@example.com', '2221234567', '123 Ash St', NULL, 'Dallas', 'TX', '75004', 'USA'),
(1013, 'Mia', 'Harris', '1997-07-07', 'Female', 'mia.harris@example.com', '3339876543', '456 Cypress St', 'Apt 4D', 'Austin', 'TX', '73304', 'USA'),
(1014, 'Alexander', 'Clark', '1983-01-19', 'Male', 'alexander.clark@example.com', '4444567890', '789 Redwood St', NULL, 'Houston', 'TX', '77004', 'USA');
SELECT * FROM customer;

/* Insert 2: Insert records into the login table
@Author: Soniya Rajappan
*/
INSERT INTO login (cid, password_hash, registration_date, last_login_date, is_active) VALUES
(1000, SHA2('password123', 256), '2023-01-01 10:00:00', '2025-03-20 15:30:00', TRUE),
(1001, SHA2('password456', 256), '2023-01-02 11:00:00', '2025-03-19 14:20:00', TRUE),
(1002, SHA2('password789', 256), '2023-01-03 12:00:00', '2025-03-18 13:10:00', TRUE),
(1003, SHA2('password321', 256), '2023-01-04 13:00:00', '2025-03-17 12:00:00', TRUE),
(1004, SHA2('password654', 256), '2023-01-05 14:00:00', '2025-03-16 11:50:00', TRUE),
(1005, SHA2('password987', 256), '2023-01-06 15:00:00', '2025-03-15 10:40:00', TRUE),
(1006, SHA2('password111', 256), '2023-01-07 16:00:00', '2025-03-14 09:30:00', TRUE),
(1007, SHA2('password222', 256), '2023-01-08 17:00:00', '2025-03-13 08:20:00', TRUE),
(1008, SHA2('password333', 256), '2023-01-09 18:00:00', '2025-03-12 07:10:00', TRUE),
(1009, SHA2('password444', 256), '2023-01-10 19:00:00', '2025-03-11 06:00:00', TRUE),
(1010, SHA2('password555', 256), '2023-01-11 20:00:00', '2025-03-10 05:50:00', TRUE),
(1011, SHA2('password666', 256), '2023-01-12 21:00:00', '2025-03-09 04:40:00', TRUE),
(1012, SHA2('password777', 256), '2023-01-13 22:00:00', '2025-03-08 03:30:00', TRUE),
(1013, SHA2('password888', 256), '2023-01-14 23:00:00', '2025-03-07 02:20:00', TRUE),
(1014, SHA2('password999', 256), '2023-01-15 09:00:00', '2025-03-06 01:10:00', TRUE);
SELECT * FROM login;

/* Query 1: Customer login
@Author: Soniya Rajappan
*/
SELECT 
    CONCAT('Welcome ', c.fname, ' ', c.lname, '!') AS welcome_message
FROM 
    customer c
JOIN 
    login l ON c.cid = l.cid
WHERE 
    c.email = 'john.doe@example.com' 
    AND l.password_hash = 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f'
    AND l.is_active = TRUE;

-- Module 2. Product Onboarding
/* Table 3 - PRODUCT CATEGORIES
@Author: Sunayana Jana
Purpose: Store product categories for organizing and browsing products.
1. Category ID (category_id): Unique identifier for each category.
2. Category Name (category_name): Name of the category.
3. Parent Category ID (parent_category_id): ID of the parent category (if applicable).
4. Description (description): Description of the category.
*/
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    description TEXT,
    FOREIGN KEY (parent_category_id) REFERENCES product_category(category_id)
);

/* Table 4 - PRODUCT
@Author: Sunayana Jana
Purpose: Store product information for listing, searching, and ordering products.
1. Product ID (prod_id): Unique identifier for each product.
2. Product Name (prod_name): Name of the product.
3. Brand (prod_brand): Brand of the product.
4. Description (prod_descr): Description of the product.
5. Review (prod_review): Review rating of the product (e.g., 1 to 5).
6. Price (price): Price of the product.
7. Stock (stock): Available stock of the product.
8. Category ID (category_id): ID of the product category.
9. Created At (created_at): Timestamp of product creation.
10. Updated At (updated_at): Timestamp of last product update.
*/
CREATE TABLE product (
    prod_id INT PRIMARY KEY AUTO_INCREMENT,
    prod_name VARCHAR(255) NOT NULL,
    prod_brand VARCHAR(50),
    prod_descr TEXT,
    prod_review DECIMAL(2, 1),
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

/* TODO: Add seller field to the product table for tracking
 suppliers or is there a way to do this with supplier_id? */

/* Insert 3: Insert records into the product_category table
@Author: Sunayana Jana
*/
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
-- Parent Categories
(1, 'Electronics', NULL, 'Devices and gadgets for everyday use'),
(2, 'Home Appliances', NULL, 'Appliances for household needs'),
(3, 'Furniture', NULL, 'Furniture for home and office'),
(4, 'Clothing', NULL, 'Apparel for men, women, and kids'),
(5, 'Sports and Outdoors', NULL, 'Equipment and gear for sports and outdoor activities'),
(6, 'Beauty and Personal Care', NULL, 'Products for beauty and personal hygiene'),
(7, 'Toys and Games', NULL, 'Toys and games for children and adults'),
(8, 'Automotive', NULL, 'Products and accessories for vehicles'),
(9, 'Groceries', NULL, 'Everyday food and household items'),
(10, 'Health and Wellness', NULL, 'Products for health and well-being');

-- Subcategories for Electronics
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(11, 'Mobile Phones', 1, 'Smartphones and feature phones'),
(12, 'Laptops', 1, 'Personal and professional laptops'),
(13, 'Cameras', 1, 'Digital and DSLR cameras');

-- Subcategories for Home Appliances
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(14, 'Refrigerators', 2, 'Cooling and storage appliances'),
(15, 'Washing Machines', 2, 'Laundry appliances'),
-- TODO Delete this subcategory and it's products.
(16, 'Air Conditioners', 2, 'Cooling and air purification appliances');

-- Subcategories for Furniture
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(17, 'Sofas', 3, 'Comfortable seating for living rooms'),
(18, 'Beds', 3, 'Beds and mattresses for bedrooms'),
(19, 'Office Chairs', 3, 'Chairs for office use');

-- Subcategories for Clothing
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(20, 'Men''s Clothing', 4, 'Apparel for men'),
(21, 'Women''s Clothing', 4, 'Apparel for women'),
(22, 'Kids'' Clothing', 4, 'Apparel for children');

-- Subcategories for Sports and Outdoors
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(23, 'Fitness Equipment', 5, 'Equipment for fitness and exercise'),
(24, 'Outdoor Gear', 5, 'Gear for outdoor activities'),
(25, 'Sportswear', 5, 'Clothing for sports');

-- Subcategories for Beauty and Personal Care
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(26, 'Skincare', 6, 'Products for skincare routines'),
(27, 'Haircare', 6, 'Products for hair care'),
(28, 'Makeup', 6, 'Cosmetics and makeup products');

-- Subcategories for Toys and Games
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(29, 'Action Figures', 7, 'Collectible and playable action figures'),
(30, 'Board Games', 7, 'Games for family and friends'),
(31, 'Educational Toys', 7, 'Toys for learning and development');

-- Subcategories for Automotive
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(32, 'Car Accessories', 8, 'Accessories for cars'),
(33, 'Motorcycle Gear', 8, 'Gear for motorcycle riders'),
(34, 'Tires', 8, 'Tires for vehicles');

-- Subcategories for Groceries
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(35, 'Fresh Produce', 9, 'Fruits and vegetables'),
(36, 'Packaged Foods', 9, 'Packaged and processed foods'),
(37, 'Beverages', 9, 'Drinks and beverages');

-- Subcategories for Health and Wellness
INSERT INTO product_category (category_id, category_name, parent_category_id, description) VALUES
(38, 'Vitamins & Supplements', 10, 'Health supplements and vitamins'),
(39, 'Medical Equipment', 10, 'Equipment for medical use'),
(40, 'Personal Care', 10, 'Products for personal hygiene');

SELECT * FROM product_category;

/* Insert 4: Insert records into the product table
@Author: Sunayana Jana
*/
-- Electronics: Mobile Phones
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(1, 'iPhone 14', 'Apple', 'Latest Apple smartphone with A15 Bionic chip', 4.8, 999.99, 50, 11),
(2, 'Samsung Galaxy S23', 'Samsung', 'Flagship Samsung smartphone with Snapdragon 8 Gen 2', 4.7, 899.99, 40, 11),
(3, 'Google Pixel 7', 'Google', 'Google smartphone with advanced AI features', 4.6, 599.99, 30, 11),
(4, 'OnePlus 11', 'OnePlus', 'High-performance smartphone with fast charging', 4.5, 699.99, 25, 11),
(5, 'Xiaomi Redmi Note 12', 'Xiaomi', 'Affordable smartphone with great features', 4.3, 299.99, 100, 11);

-- Electronics: Laptops
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(6, 'MacBook Pro 16"', 'Apple', 'Apple laptop with M2 Pro chip', 4.9, 2499.99, 20, 12),
(7, 'Dell XPS 13', 'Dell', 'Compact and powerful ultrabook', 4.8, 1299.99, 15, 12),
(8, 'HP Spectre x360', 'HP', 'Convertible laptop with touchscreen', 4.7, 1399.99, 10, 12),
(9, 'Lenovo ThinkPad X1 Carbon', 'Lenovo', 'Business laptop with robust build', 4.6, 1599.99, 12, 12),
(10, 'Asus ROG Zephyrus G14', 'Asus', 'Gaming laptop with Ryzen 9 processor', 4.5, 1799.99, 8, 12);

-- Electronics: Cameras
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(11, 'Canon EOS R5', 'Canon', 'Professional mirrorless camera with 45MP sensor', 4.9, 3899.99, 5, 13),
(12, 'Sony Alpha a7 IV', 'Sony', 'Full-frame mirrorless camera with 33MP sensor', 4.8, 2499.99, 7, 13),
(13, 'Nikon Z6 II', 'Nikon', 'Versatile mirrorless camera for photography and video', 4.7, 1999.99, 10, 13),
(14, 'Fujifilm X-T4', 'Fujifilm', 'APS-C mirrorless camera with retro design', 4.6, 1699.99, 6, 13),
(15, 'Panasonic Lumix GH6', 'Panasonic', 'Micro Four Thirds camera for video creators', 4.5, 2199.99, 4, 13);

-- Home Appliances: Refrigerators
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(16, 'LG InstaView Refrigerator', 'LG', 'Smart refrigerator with InstaView technology', 4.8, 2999.99, 10, 14),
(17, 'Samsung Family Hub', 'Samsung', 'Refrigerator with touchscreen and smart features', 4.7, 3499.99, 8, 14),
(18, 'Whirlpool Double Door', 'Whirlpool', 'Energy-efficient double-door refrigerator', 4.6, 1299.99, 20, 14),
(19, 'GE French Door Refrigerator', 'GE', 'Spacious refrigerator with French doors', 4.5, 2499.99, 12, 14),
(20, 'Bosch Bottom Freezer', 'Bosch', 'Refrigerator with bottom freezer and energy efficiency', 4.4, 1999.99, 15, 14);

-- Home Appliances: Washing Machines
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(21, 'Bosch Front Load Washer', 'Bosch', 'High-efficiency front-load washing machine', 4.8, 899.99, 15, 15),
(22, 'LG Top Load Washer', 'LG', 'Top-load washing machine with smart features', 4.7, 799.99, 12, 15),
(23, 'Samsung EcoBubble Washer', 'Samsung', 'EcoBubble technology for efficient cleaning', 4.6, 999.99, 10, 15),
(24, 'Whirlpool Semi-Automatic Washer', 'Whirlpool', 'Affordable semi-automatic washing machine', 4.5, 499.99, 25, 15),
(25, 'IFB Fully Automatic Washer', 'IFB', 'Fully automatic washing machine with advanced features', 4.4, 1099.99, 8, 15);

-- Home Appliances: Air Conditioners
-- TODO Delete this subcategory and it's products.
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(26, 'Daikin Split AC', 'Daikin', 'Energy-efficient split air conditioner with inverter technology', 4.8, 1199.99, 10, 16),
(27, 'LG Dual Inverter AC', 'LG', 'Dual inverter air conditioner with fast cooling', 4.7, 1299.99, 8, 16),
(28, 'Samsung Wind-Free AC', 'Samsung', 'Air conditioner with wind-free cooling technology', 4.6, 1399.99, 6, 16),
(29, 'Voltas Window AC', 'Voltas', 'Affordable window air conditioner for small rooms', 4.5, 699.99, 20, 16),
(30, 'Hitachi Split AC', 'Hitachi', 'Premium split air conditioner with advanced features', 4.4, 1499.99, 5, 16);

-- Insert 4: Insert records into the product table
-- Furniture: Sofas
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(31, 'Ikea Ektorp Sofa', 'Ikea', 'Comfortable and stylish sofa for living rooms', 4.8, 499.99, 25, 17),
(32, 'Ashley Recliner Sofa', 'Ashley', 'Recliner sofa with premium comfort', 4.7, 899.99, 10, 17),
(33, 'West Elm Sectional Sofa', 'West Elm', 'Modern sectional sofa for large spaces', 4.6, 1299.99, 5, 17),
(34, 'Wayfair Loveseat', 'Wayfair', 'Compact loveseat for small spaces', 4.5, 399.99, 15, 17),
(35, 'La-Z-Boy Recliner', 'La-Z-Boy', 'Classic recliner with plush comfort', 4.4, 699.99, 8, 17);

-- Furniture: Beds
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(36, 'Ikea Malm Bed Frame', 'Ikea', 'Minimalist bed frame with storage', 4.8, 299.99, 20, 18),
(37, 'Zinus Memory Foam Mattress', 'Zinus', 'Comfortable memory foam mattress', 4.7, 399.99, 30, 18),
(38, 'Ashley King Bed', 'Ashley', 'Spacious king-size bed with headboard', 4.6, 799.99, 10, 18),
(39, 'Wayfair Twin Bed', 'Wayfair', 'Compact twin bed for kids or guests', 4.5, 199.99, 25, 18),
(40, 'Tempur-Pedic Adjustable Bed', 'Tempur-Pedic', 'Adjustable bed frame with premium comfort', 4.4, 1299.99, 5, 18);

-- Furniture: Office Chairs
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(41, 'Herman Miller Aeron Chair', 'Herman Miller', 'Ergonomic office chair with lumbar support', 4.9, 1399.99, 10, 19),
(42, 'Steelcase Leap Chair', 'Steelcase', 'Adjustable office chair with premium comfort', 4.8, 999.99, 8, 19),
(43, 'Ikea Markus Chair', 'Ikea', 'Affordable and comfortable office chair', 4.7, 199.99, 20, 19),
(44, 'AmazonBasics Mesh Chair', 'AmazonBasics', 'Budget-friendly mesh office chair', 4.6, 99.99, 50, 19),
(45, 'Branch Ergonomic Chair', 'Branch', 'Stylish and supportive office chair', 4.5, 349.99, 15, 19);

-- Clothing: Men’s Clothing
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(46, 'Levi’s 501 Jeans', 'Levi’s', 'Classic straight-fit jeans for men', 4.8, 69.99, 100, 20),
(47, 'Nike Dri-FIT T-Shirt', 'Nike', 'Moisture-wicking t-shirt for active men', 4.7, 29.99, 200, 20),
(48, 'Adidas Track Pants', 'Adidas', 'Comfortable track pants for workouts', 4.6, 49.99, 150, 20),
(49, 'Ralph Lauren Polo Shirt', 'Ralph Lauren', 'Classic polo shirt for casual wear', 4.5, 89.99, 50, 20),
(50, 'Under Armour Hoodie', 'Under Armour', 'Warm and lightweight hoodie for men', 4.4, 59.99, 80, 20);

-- Clothing: Women’s Clothing
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(51, 'Zara Summer Dress', 'Zara', 'Lightweight and stylish summer dress', 4.8, 79.99, 50, 21),
(52, 'H&M Blouse', 'H&M', 'Elegant blouse for casual and formal wear', 4.7, 39.99, 80, 21),
(53, 'Uniqlo Ultra Light Down Jacket', 'Uniqlo', 'Warm and lightweight jacket for winter', 4.6, 129.99, 30, 21),
(54, 'Calvin Klein Skinny Jeans', 'Calvin Klein', 'Stylish skinny jeans for women', 4.5, 99.99, 60, 21),
(55, 'Victoria’s Secret Pajama Set', 'Victoria’s Secret', 'Comfortable and stylish pajama set', 4.4, 49.99, 40, 21);

-- Clothing: Kids’ Clothing
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(56, 'Carter’s Baby Onesie', 'Carter’s', 'Soft and comfortable onesie for babies', 4.9, 19.99, 100, 22),
(57, 'Gap Kids Hoodie', 'Gap', 'Warm and stylish hoodie for kids', 4.8, 39.99, 50, 22),
(58, 'Old Navy Kids Jeans', 'Old Navy', 'Durable and comfortable jeans for kids', 4.7, 29.99, 80, 22),
(59, 'Nike Kids T-Shirt', 'Nike', 'Breathable and lightweight t-shirt for kids', 4.6, 24.99, 120, 22),
(60, 'Adidas Kids Track Pants', 'Adidas', 'Comfortable track pants for active kids', 4.5, 34.99, 70, 22);

-- Sports & Outdoors: Fitness Equipment
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(61, 'Peloton Bike', 'Peloton', 'High-tech exercise bike with live classes', 4.9, 2499.99, 10, 23),
(62, 'Bowflex Dumbbells', 'Bowflex', 'Adjustable dumbbells for strength training', 4.8, 399.99, 20, 23),
(63, 'Yoga Mat', 'Manduka', 'Non-slip yoga mat for workouts', 4.7, 19.99, 100, 23),
(64, 'Treadmill', 'NordicTrack', 'High-performance treadmill with incline control', 4.6, 1299.99, 8, 23),
(65, 'Rowing Machine', 'Concept2', 'Rowing machine for full-body workouts', 4.5, 999.99, 12, 23);

-- Sports & Outdoors: Outdoor Gear
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(66, 'Tent', 'Coleman', 'Spacious and durable camping tent', 4.8, 199.99, 30, 24),
(67, 'Sleeping Bag', 'REI', 'Warm and lightweight sleeping bag', 4.7, 99.99, 50, 24),
(68, 'Hiking Backpack', 'Osprey', 'Comfortable and spacious hiking backpack', 4.6, 149.99, 20, 24),
(69, 'Camping Stove', 'Jetboil', 'Portable camping stove for outdoor cooking', 4.5, 89.99, 40, 24),
(70, 'Trekking Poles', 'Black Diamond', 'Lightweight trekking poles for hiking', 4.4, 59.99, 25, 24);

-- Sports & Outdoors: Sportswear
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(71, 'Nike Running Shoes', 'Nike', 'Lightweight and comfortable running shoes', 4.9, 129.99, 50, 25),
(72, 'Adidas Soccer Jersey', 'Adidas', 'Breathable and stylish soccer jersey', 4.8, 79.99, 40, 25),
(73, 'Under Armour Compression Shorts', 'Under Armour', 'Moisture-wicking compression shorts', 4.7, 39.99, 60, 25),
(74, 'Puma Sports Bra', 'Puma', 'Supportive and comfortable sports bra', 4.6, 49.99, 30, 25),
(75, 'Reebok Training Gloves', 'Reebok', 'Durable gloves for weightlifting', 4.5, 29.99, 70, 25);

-- Beauty & Personal Care: Skincare
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(76, 'CeraVe Moisturizing Cream', 'CeraVe', 'Hydrating cream for dry skin', 4.9, 19.99, 200, 26),
(77, 'Neutrogena Sunscreen', 'Neutrogena', 'Broad-spectrum SPF 50 sunscreen', 4.8, 14.99, 150, 26),
(78, 'The Ordinary Niacinamide Serum', 'The Ordinary', 'Serum for reducing blemishes', 4.7, 9.99, 300, 26),
(79, 'La Roche-Posay Cleanser', 'La Roche-Posay', 'Gentle cleanser for sensitive skin', 4.6, 12.99, 100, 26),
(80, 'Aveeno Daily Moisturizer', 'Aveeno', 'Moisturizer with SPF for daily use', 4.5, 15.99, 120, 26);

-- Beauty & Personal Care: Haircare
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(81, 'Pantene Pro-V Shampoo', 'Pantene', 'Shampoo for smooth and shiny hair', 4.8, 6.99, 200, 27),
(82, 'Head & Shoulders Anti-Dandruff Shampoo', 'Head & Shoulders', 'Shampoo for dandruff control', 4.7, 7.99, 150, 27),
(83, 'Moroccanoil Treatment', 'Moroccanoil', 'Hair oil for nourishment and shine', 4.6, 29.99, 80, 27),
(84, 'OGX Coconut Milk Conditioner', 'OGX', 'Conditioner for soft and hydrated hair', 4.5, 8.99, 100, 27),
(85, 'Tresemme Heat Protectant Spray', 'Tresemme', 'Spray for protecting hair from heat damage', 4.4, 5.99, 120, 27);

-- Beauty & Personal Care: Makeup
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(86, 'Maybelline Fit Me Foundation', 'Maybelline', 'Lightweight foundation for natural coverage', 4.8, 7.99, 150, 28),
(87, 'L’Oreal Paris Mascara', 'L’Oreal', 'Volumizing mascara for bold lashes', 4.7, 9.99, 120, 28),
(88, 'MAC Lipstick', 'MAC', 'Long-lasting lipstick in various shades', 4.6, 19.99, 100, 28),
(89, 'NYX Setting Spray', 'NYX', 'Spray for long-lasting makeup', 4.5, 8.99, 80, 28),
(90, 'Revlon Eyeliner', 'Revlon', 'Waterproof eyeliner for precise application', 4.4, 6.99, 90, 28);

-- Toys & Games: Action Figures
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(91, 'Marvel Spider-Man Action Figure', 'Marvel', 'Collectible Spider-Man action figure', 4.9, 19.99, 50, 29),
(92, 'Star Wars Darth Vader Figure', 'Star Wars', 'Detailed Darth Vader action figure', 4.8, 24.99, 40, 29),
(93, 'Transformers Optimus Prime', 'Transformers', 'Transformable Optimus Prime figure', 4.7, 29.99, 30, 29),
(94, 'Batman Action Figure', 'DC Comics', 'Classic Batman action figure', 4.6, 14.99, 60, 29),
(95, 'Pokemon Pikachu Plush', 'Pokemon', 'Soft and cuddly Pikachu plush toy', 4.5, 12.99, 80, 29);

-- Toys & Games: Board Games
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(96, 'Monopoly Classic', 'Hasbro', 'Classic board game for family fun', 4.8, 29.99, 50, 30),
(97, 'Catan', 'Catan Studio', 'Strategy board game for 3-4 players', 4.7, 49.99, 30, 30),
(98, 'Scrabble', 'Mattel', 'Word game for vocabulary building', 4.6, 24.99, 40, 30),
(99, 'Clue', 'Hasbro', 'Mystery-solving board game', 4.5, 19.99, 60, 30),
(100, 'Ticket to Ride', 'Days of Wonder', 'Railroad-building strategy game', 4.4, 39.99, 20, 30);

-- Toys & Games: Educational Toys
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(101, 'LEGO Classic Set', 'LEGO', 'Creative building blocks for kids', 4.9, 49.99, 100, 31),
(102, 'Melissa & Doug Wooden Puzzle', 'Melissa & Doug', 'Educational wooden puzzle for toddlers', 4.8, 14.99, 80, 31),
(103, 'VTech Learning Laptop', 'VTech', 'Interactive learning laptop for kids', 4.7, 29.99, 50, 31),
(104, 'Fisher-Price Shape Sorter', 'Fisher-Price', 'Toy for learning shapes and colors', 4.6, 19.99, 70, 31),
(105, 'Crayola Art Set', 'Crayola', 'Complete art set for creative kids', 4.5, 24.99, 60, 31);

-- Automotive: Car Accessories
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(106, 'Car Phone Mount', 'iOttie', 'Universal phone mount for cars', 4.8, 19.99, 100, 32),
(107, 'Dash Cam', 'Garmin', 'High-definition dash camera for vehicles', 4.7, 99.99, 50, 32),
(108, 'Car Vacuum Cleaner', 'Black+Decker', 'Portable vacuum cleaner for cars', 4.6, 49.99, 80, 32),
(109, 'Car Seat Cover', 'FH Group', 'Durable and stylish seat covers', 4.5, 29.99, 60, 32),
(110, 'Car Air Freshener', 'Little Trees', 'Long-lasting air freshener for cars', 4.4, 5.99, 200, 32);

-- Automotive: Motorcycle Gear
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(111, 'Motorcycle Helmet', 'Shoei', 'High-quality helmet for safety and comfort', 4.9, 299.99, 20, 33),
(112, 'Motorcycle Gloves', 'Alpinestars', 'Durable gloves for motorcycle riders', 4.8, 49.99, 50, 33),
(113, 'Motorcycle Jacket', 'Dainese', 'Protective jacket for motorcycle riders', 4.7, 199.99, 30, 33),
(114, 'Motorcycle Boots', 'TCX', 'Comfortable and protective boots', 4.6, 149.99, 25, 33),
(115, 'Motorcycle Cover', 'XYZCTEM', 'Waterproof cover for motorcycles', 4.5, 29.99, 40, 33);

-- Automotive: Tires
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(116, 'All-Season Tires', 'Michelin', 'Durable all-season tires for cars', 4.9, 129.99, 40, 34),
(117, 'Winter Tires', 'Bridgestone', 'Tires for snowy and icy conditions', 4.8, 149.99, 30, 34),
(118, 'Performance Tires', 'Pirelli', 'High-performance tires for sports cars', 4.7, 199.99, 20, 34),
(119, 'Off-Road Tires', 'BFGoodrich', 'Tires for off-road adventures', 4.6, 179.99, 25, 34),
(120, 'Spare Tire', 'Goodyear', 'Compact spare tire for emergencies', 4.5, 99.99, 50, 34);

-- Groceries: Fresh Produce
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(121, 'Organic Apples', 'Nature’s Best', 'Fresh organic apples by the pound', 4.9, 2.99, 500, 35),
(122, 'Bananas', 'Dole', 'Fresh bananas by the pound', 4.8, 0.99, 1000, 35),
(123, 'Carrots', 'Bolthouse Farms', 'Fresh carrots by the pound', 4.7, 1.49, 800, 35),
(124, 'Spinach', 'Earthbound Farm', 'Organic spinach by the bunch', 4.6, 2.49, 600, 35),
(125, 'Potatoes', 'Idaho', 'Fresh potatoes by the pound', 4.5, 0.79, 700, 35);

-- Groceries: Packaged Foods
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(126, 'Pasta', 'Barilla', 'High-quality pasta for cooking', 4.8, 1.99, 300, 36),
(127, 'Cereal', 'Kellogg’s', 'Breakfast cereal with whole grains', 4.7, 3.99, 200, 36),
(128, 'Peanut Butter', 'Jif', 'Creamy peanut butter for spreads', 4.6, 2.99, 150, 36),
(129, 'Canned Soup', 'Campbell’s', 'Ready-to-eat canned soup', 4.5, 1.49, 250, 36),
(130, 'Rice', 'Uncle Ben’s', 'Long-grain rice for cooking', 4.4, 4.99, 400, 36);

-- Groceries: Beverages
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(131, 'Bottled Water', 'Dasani', 'Purified bottled water', 4.9, 0.99, 1000, 37),
(132, 'Orange Juice', 'Tropicana', 'Fresh orange juice with no pulp', 4.8, 3.99, 500, 37),
(133, 'Coffee', 'Starbucks', 'Ground coffee for brewing', 4.7, 9.99, 300, 37),
(134, 'Tea Bags', 'Lipton', 'Black tea bags for brewing', 4.6, 4.99, 400, 37),
(135, 'Soda', 'Coca-Cola', 'Classic Coca-Cola soda', 4.5, 1.49, 800, 37);

-- Health & Wellness: Vitamins & Supplements
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(136, 'Vitamin D3', 'Nature Made', 'High-potency vitamin D3 supplement', 4.9, 14.99, 200, 38),
(137, 'Omega-3 Fish Oil', 'Nordic Naturals', 'Heart-healthy omega-3 supplement', 4.8, 19.99, 150, 38),
(138, 'Multivitamins', 'Centrum', 'Daily multivitamin supplement', 4.7, 24.99, 300, 38),
(139, 'Probiotics', 'Culturelle', 'Probiotic supplement for gut health', 4.6, 29.99, 100, 38),
(140, 'Calcium Tablets', 'Caltrate', 'Calcium supplement for bone health', 4.5, 12.99, 250, 38);

-- Health & Wellness: Medical Equipment
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(141, 'Blood Pressure Monitor', 'Omron', 'Digital blood pressure monitor for home use', 4.9, 49.99, 100, 39),
(142, 'Thermometer', 'Braun', 'Infrared thermometer for accurate readings', 4.8, 29.99, 150, 39),
(143, 'Pulse Oximeter', 'Zacurate', 'Device for measuring oxygen levels and pulse rate', 4.7, 19.99, 200, 39),
(144, 'Nebulizer', 'Philips', 'Compact nebulizer for respiratory therapy', 4.6, 59.99, 80, 39),
(145, 'First Aid Kit', 'Johnson & Johnson', 'Comprehensive first aid kit for emergencies', 4.5, 24.99, 120, 39);

-- Health & Wellness: Personal Care
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, stock, category_id) VALUES
(146, 'Electric Toothbrush', 'Oral-B', 'Rechargeable electric toothbrush with multiple modes', 4.9, 39.99, 100, 40),
(147, 'Hair Dryer', 'Dyson', 'High-performance hair dryer with advanced technology', 4.8, 299.99, 50, 40),
(148, 'Shaving Kit', 'Gillette', 'Complete shaving kit with razor and foam', 4.7, 19.99, 150, 40),
(149, 'Deodorant', 'Old Spice', 'Long-lasting deodorant for all-day freshness', 4.6, 5.99, 200, 40),
(150, 'Body Lotion', 'Nivea', 'Moisturizing body lotion for dry skin', 4.5, 8.99, 180, 40);

SELECT * FROM product;

/* Add index to category_name in product_category
 table for improved search performance.
 @Author: Priyadarshan Parida
*/
CREATE INDEX idx_category_name ON product_category(category_name);
-- Add indexes to the product table for improved search performance.
CREATE INDEX idx_product_name ON product(prod_name);
CREATE INDEX idx_description ON product(prod_descr(255));

/* Query 2: search for products based on keywords in
 product name, description, or category name.
 @Author: Sunayana Jana
*/
SELECT 
    c.category_name,
    p.prod_id,
    p.prod_name,
    p.prod_descr,
    p.price,
    p.stock
FROM 
    product p
JOIN 
    product_category c ON p.category_id = c.category_id
WHERE 
    p.prod_name LIKE '%Off-Road%' 
    OR p.prod_descr LIKE '%Off-Road%'  
    OR c.category_name LIKE '%Off-Road%';

-- Module 3: Inventory Management
/* Table 5 - SUPPLIER
@Author: Winnie Manyara
Purpose: Store supplier information for managing relationships and inventory.
1. Supplier ID (supplier_id): Unique identifier for each supplier.
2. Supplier Name (supplier_name): Name of the supplier.
3. Supplier Type (supplier_type): Type of supplier (e.g., manufacturer, distributor).
    a. Manufacturers: Companies that produce goods.
    b. Distributors: Companies that buy products from manufacturers and sell them to retailers.
    c. Wholesalers: Companies that sell products in bulk, often at a discount.
    d. Resellers: Companies or individuals that buy products to resell them.
    e. Market Place Sellers: Independent sellers who list their products on the platform.
4. Supplier Rating (supplier_rating): Rating of the supplier (e.g., 1 to 5).
This applies to all types of suppliers exccept Manufacturers. Cartwise is the seller in such cases.
The supplier rating is the average of the ratings from seller reviews.
5. Contact Name (contact_name): Name of the contact person at the supplier.
6. Email (email): Email address of the supplier.
7. Phone (phone): Phone number of the supplier.
8. Address Line 1 (address_line1): First line of the supplier's address.
9. Address Line 2 (address_line2): Second line of the supplier's address.
10. City (city): City of the supplier's address.
11. State (state): State code of the supplier's address.
12. ZIP Code (zip): ZIP code of the supplier's address.
13. Country (country): Country of the supplier's address.
14. Created At (created_at): Timestamp of supplier creation.
15. Updated At (updated_at): Timestamp of last supplier update.
*/
CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    supplier_type ENUM(
        'Manufacturer',
        'Distributor',
        'Wholesaler',
        'Reseller',
        'Market Place Seller'
        ) NOT NULL,
    supplier_rating DECIMAL(2, 1),
    contact_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Table 6 - INVENTORY
@Author: Winnie Manyara
Purpose: Store inventory information for tracking product availability and reordering.
1. Inventory ID (inventory_id): Unique identifier for each inventory record.
2. Product ID (product_id): ID of the product in inventory.
3. Supplier ID (supplier_id): ID of the supplier for the product.
4. Quantity (quantity): Available quantity of the product.
5. Location (location): Location of the inventory (e.g., warehouse, store).
6. Reorder Level (reorder_level): Minimum quantity at which to reorder the product.
7. Created At (created_at): Timestamp of inventory record creation.
8. Updated At (updated_at): Timestamp of last inventory update.
*/
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    supplier_id INT,
    quantity INT NOT NULL,
    location VARCHAR(255),
    reorder_level INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(prod_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

/* Insert 5: Insert records into the supplier table
@Author: Winnie Manyara
*/
-- Electronics and Home Appliances
INSERT INTO supplier (supplier_name, supplier_type, supplier_rating, contact_name, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
('Tech Distributors Inc.', 'Distributor', 4.8, 'John Smith', 'john.smith@techdistributors.com', '123-456-7890', '123 Tech Street', NULL, 'Dallas', 'TX', '75201', 'USA'),
('Global Wholesalers', 'Wholesaler', 4.7, 'Jane Doe', 'jane.doe@globalwholesalers.com', '987-654-3210', '456 Global Ave', 'Suite 200', 'Houston', 'TX', '77002', 'USA');

-- Furniture and Clothing
INSERT INTO supplier (supplier_name, supplier_type, supplier_rating, contact_name, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
('Furniture World', 'Manufacturer', 4.6, 'Mike Johnson', 'mike.johnson@furnitureworld.com', '555-123-4567', '789 Furniture Blvd', NULL, 'Austin', 'TX', '73301', 'USA'),
('Fashion Hub', 'Reseller', 4.5, 'Alice Brown', 'alice.brown@fashionhub.com', '222-333-4444', '321 Fashion Lane', NULL, 'San Antonio', 'TX', '78205', 'USA');

-- Sports, Beauty, and Health
INSERT INTO supplier (supplier_name, supplier_type, supplier_rating, contact_name, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
('Sports Gear Co.', 'Distributor', 4.7, 'Tom Wilson', 'tom.wilson@sportsgear.com', '444-555-6666', '123 Sports Ave', NULL, 'Dallas', 'TX', '75201', 'USA'),
('Beauty Essentials', 'Wholesaler', 4.8, 'Emma Davis', 'emma.davis@beautyessentials.com', '333-444-5555', '456 Beauty St', NULL, 'Houston', 'TX', '77002', 'USA'),
('Health Supplies Inc.', 'Manufacturer', 4.9, 'Chris Lee', 'chris.lee@healthsupplies.com', '111-222-3333', '789 Health Blvd', NULL, 'Austin', 'TX', '73301', 'USA');

SELECT * FROM supplier;

/* Insert 6: Insert records into the inventory table
@Author: Winnie Manyara
TODO Insert inventory records for all 200 products.
*/
-- Electronics
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(1, 1, 50, 'Warehouse A', 10), -- iPhone 14
(2, 1, 40, 'Warehouse A', 10), -- Samsung Galaxy S23
(6, 1, 20, 'Warehouse B', 5),  -- MacBook Pro 16"
(7, 1, 15, 'Warehouse B', 5),  -- Dell XPS 13
(11, 1, 5, 'Warehouse C', 2);  -- Canon EOS R5

-- Home Appliances
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(16, 2, 10, 'Warehouse D', 3), -- LG InstaView Refrigerator
(17, 2, 8, 'Warehouse D', 3),  -- Samsung Family Hub
(21, 2, 15, 'Warehouse E', 5), -- Bosch Front Load Washer
(22, 2, 12, 'Warehouse E', 5), -- LG Top Load Washer
(26, 2, 10, 'Warehouse F', 3); -- Daikin Split AC

-- Furniture
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(31, 3, 25, 'Warehouse G', 5), -- Ikea Ektorp Sofa
(32, 3, 10, 'Warehouse G', 5), -- Ashley Recliner Sofa
(36, 3, 20, 'Warehouse H', 5), -- Ikea Malm Bed Frame
(37, 3, 30, 'Warehouse H', 5), -- Zinus Memory Foam Mattress
(41, 3, 10, 'Warehouse I', 2); -- Herman Miller Aeron Chair

-- Clothing
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(46, 4, 100, 'Warehouse J', 10), -- Levi’s 501 Jeans
(47, 4, 200, 'Warehouse J', 10), -- Nike Dri-FIT T-Shirt
(51, 4, 50, 'Warehouse K', 5),  -- Zara Summer Dress
(52, 4, 80, 'Warehouse K', 5),  -- H&M Blouse
(56, 4, 100, 'Warehouse L', 10); -- Carter’s Baby Onesie

-- Sports, Beauty, and Health
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(61, 5, 10, 'Warehouse M', 12), -- Peloton Bike
(76, 6, 200, 'Warehouse N', 10), -- CeraVe Moisturizing Cream
(81, 6, 200, 'Warehouse N', 10), -- Pantene Pro-V Shampoo
(136, 7, 200, 'Warehouse O', 10), -- Vitamin D3
(141, 7, 100, 'Warehouse O', 5); -- Blood Pressure Monitor

SELECT * FROM inventory;

/* Query 3: Get inventory details for a specific product
@Author: Soniya Rajappan
*/
SELECT 
    i.inventory_id,
    p.prod_name,
    i.quantity AS stock,
    i.location,
    i.reorder_level
FROM
    inventory i
JOIN
    product p ON i.product_id = p.prod_id
WHERE
    p.prod_id = '1';

/* Query 4: Get inventory details for a specific supplier
@Author: Sunayana Jana
*/
SELECT 
    i.supplier_id,
    s.supplier_name,
    i.inventory_id,
    p.prod_name,
    i.quantity AS stock_quantity,
    i.location,
    i.reorder_level
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.prod_id
JOIN
    supplier s ON i.supplier_id = s.supplier_id
WHERE 
    i.supplier_id = 1
ORDER BY 
    p.prod_name;

-- TODO: Implement this by location
/* Query 5: Get products below reorder level
@Author: Winnie Manyara
*/
SELECT 
    s.supplier_name,
    p.prod_name,
    i.quantity AS stock_quantity,
    i.reorder_level
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.prod_id
JOIN 
    supplier s ON i.supplier_id = s.supplier_id
WHERE 
    i.quantity < i.reorder_level
ORDER BY 
    s.supplier_name, p.prod_name;

/* Query 6: Get inventory summary by location
@Author: Winnie Manyara
*/
SELECT 
    i.location,
    p.prod_id,
    p.prod_name,
    COUNT(i.inventory_id) AS total_products,
    SUM(i.quantity) AS total_stock,
    SUM(i.quantity * p.price) AS total_value
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.prod_id
GROUP BY 
    i.location, p.prod_id, p.prod_name;

-- Module 4: Order Processing
/* Table 7 - SHOPPING CART
@Author: Priyadarshan Parida
Purpose: Store shopping cart information for each customer to track selected products.
1. Cart ID (cart_id): Unique identifier for each shopping cart.
2. Customer ID (customer_id): ID of the customer who owns the cart.
3. Product ID (product_id): ID of the product in the cart.
4. Quantity (quantity): Quantity of the product in the cart.
5. Added At (added_at): Timestamp of when the product was added to the cart.
*/

CREATE TABLE shopping_cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid),
    FOREIGN KEY (product_id) REFERENCES product(prod_id)
);

/* Table 8 - ORDER SUMMARY
@Author: Priyadarshan Parida
Purpose: Store order summary information for tracking and managing customer orders.
1. Order ID (order_id): Unique identifier for each order.
2. Customer ID (customer_id): ID of the customer who placed the order.
3. Order Date (order_date): Date and time of order placement.
4. Total Amount (total_amount): Total amount of the order.
5. Status (order_status): Current status of the order (e.g., failed payment, shipped, delivered).
6. Shipping Address (shipping_address): Address to which the order will be shipped.
7. Billing Address (billing_address): Address to which the bill will be sent.
8. Created At (created_at): Timestamp of order creation.
9. Updated At (updated_at): Timestamp of last order update.
*/
CREATE TABLE order_summary (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status ENUM(
            'Failed Payment',
            'Received',
            'Processing', 
            'Shipped', 
            'Delivered', 
            'Cancelled'
        ) NOT NULL,
    shipping_address VARCHAR(255),
    billing_address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid)
);

/* Table 9 - PAYMENT DETAIL
@Author: Priyadarshan Parida
Purpose: Store payment details for each order to track payment methods and amounts.
1. Payment Detail ID (payment_detail_id): Unique identifier for each payment detail.
2. Order ID (order_id): ID of the order to which the payment belongs.
3. Payment Method (payment_method): Method used for payment (e.g., Credit Card, PayPal, Gift Card).
4. Account Number (account_number): Account number used for the payment.
5. Amount (amount): Amount paid using this payment method.
6. Payment Date (payment_date): Date and time of the payment.
*/
CREATE TABLE payment_detail (
    payment_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method ENUM('Credit Card', 'Gift Card', 'Debit Card') NOT NULL,
    account_number VARCHAR(50),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES order_summary(order_id)
);

/* Table 10 - ORDER DETAIL
@Author: Priyadarshan Parida
Purpose: Store order details for each item in an order to track quantities and prices.
1. Order Detail ID (order_detail_id): Unique identifier for each order detail.
2. Order ID (order_id): ID of the order to which the detail belongs.
3. Product ID (product_id): ID of the product in the order.
4. Quantity (quantity): Quantity of the product in the order.
5. Price (price): Price of the product at the time of order.
*/
CREATE TABLE order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_summary(order_id),
    FOREIGN KEY (product_id) REFERENCES product(prod_id)
);

/* Table 11 - SHIPPING
@Author: Priyadarshan Parida
Purpose: Store shipping information for each order to track delivery details and costs.
TODO refactor to account for multiple shipments per order
1. Shipping ID (shipping_id): Unique identifier for each shipping record.
2. Order Detail ID (order_detail_id): ID of the order detail for which shipping is done.
3. Shipping Method (shipping_method): Method used for shipping (e.g., standard, express).
4. Shipping Cost (shipping_cost): Cost of shipping.
5. Shipping Date (shipping_date): Date and time of shipping.
6. Delivery Date (delivery_date): Expected delivery date.
7. Tracking Number (tracking_number): Tracking number for the shipment.
*/
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_detail_id INT,
    shipping_method VARCHAR(100),
    shipping_cost DECIMAL(10, 2),
    shipping_date TIMESTAMP,
    delivery_date TIMESTAMP,
    tracking_number VARCHAR(100),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id)
);

/* Table 12 - RETURN_REFUND
@Author: Priyadarshan Parida
Purpose: Store return information for tracking and processing product returns.
1. Return ID (return_id): Unique identifier for each return record.
2. Order Detail ID (order_detail_id): ID of the ordered item for which the return is requested.
3. Product ID (product_id): ID of the product being returned.
4. Return Reason (return_reason): Reason for the return.
5. Refund Amount (refund_amount): Amount to be refunded.
6. Status (status): Status of the return (e.g., pending, approved, rejected).
7. Created At (created_at): Timestamp of return request creation.
8. Updated At (updated_at): Timestamp of last return update.
*/
CREATE TABLE return_refund (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    order_detail_id INT,
    product_id INT,
    return_reason VARCHAR(255),
    refund_amount DECIMAL(10, 2),
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id),
    FOREIGN KEY (product_id) REFERENCES product(prod_id)
);

-- TODO Stored Procedure: Process Order
-- TODO Stored Procedure: Process Return
-- TODO Stored Procedure: Calculate and update shipping cost
-- TODO Trigger: Remove the products from shopping cart after order placement
-- TODO Trigger: Update Order Status on Order Placement
-- TODO Trigger: Update Order Status on Payment
-- TODO Trigger: Update Order Status on Shipping
-- TODO Trigger: Update Order Status on Delivery
-- TODO Trigger: Update Order Status on Return
-- TODO Trigger: Update Inventory on Order Placement
-- TODO Trigger: Update Inventory on Order Cancellation
-- TODO Trigger: Update Inventory on Return Approval
-- TODO Trigger: Update product review in Product table on Product Review table update

/* Insert 7: Insert records into the shopping_cart table
@Author: Priyadarshan Parida
*/

INSERT INTO shopping_cart (customer_id, product_id, quantity) VALUES
(1001, 1, 2),  -- Customer 1 adds 2 units of iPhone 14
(1001, 6, 1),  -- Customer 1 adds 1 unit of MacBook Pro 16"
(1001, 81, 5),  -- Customer 1 adds 5 units of Pantene Pro-V Shampoo
(1001, 76, 3),  -- Customer 1 adds 3 units of CeraVe Moisturizing Cream
(1001, 46, 2),  -- Customer 1 adds 2 units of Levi’s 501 Jeans
(1001, 51, 2),  -- Customer 1 adds 2 units of Zara Summer Dress
(1001, 150, 4),  -- Customer 1 adds 4 units of Body Lotion
(1002, 2, 1),  -- Customer 2 adds 1 unit of Samsung Galaxy S23
(1002, 11, 1), -- Customer 2 adds 1 unit of Canon EOS R5
(1003, 16, 1), -- Customer 3 adds 1 unit of LG InstaView Refrigerator
(1003, 21, 2), -- Customer 3 adds 2 units of Bosch Front Load Washer
(1004, 31, 1), -- Customer 4 adds 1 unit of Ikea Ektorp Sofa
(1004, 36, 1), -- Customer 4 adds 1 unit of Ikea Malm Bed Frame
(1005, 46, 3), -- Customer 5 adds 3 units of Levi’s 501 Jeans
(1005, 51, 2), -- Customer 5 adds 2 units of Zara Summer Dress
(1006, 61, 1), -- Customer 6 adds 1 unit of Peloton Bike
(1006, 76, 5), -- Customer 6 adds 5 units of CeraVe Moisturizing Cream
(1007, 136, 2), -- Customer 7 adds 2 units of Vitamin D3
(1007, 141, 1), -- Customer 7 adds 1 unit of Blood Pressure Monitor
(1008, 150, 4); -- Customer 8 adds 4 units of Body Lotion
SELECT * FROM shopping_cart;

/* Query 7: Get shopping cart details for a specific customer
 @Author: Priyadarshan Parida
*/
SELECT
    sc.cart_id,
    c.cid,
    p.prod_id,
    p.prod_name,
    sc.quantity
FROM
    shopping_cart sc
JOIN
    customer c ON sc.customer_id = c.cid
JOIN
    product p ON sc.product_id = p.prod_id
WHERE
    c.cid = 1001
ORDER BY
    sc.cart_id;

/* Insert 8: Insert records into the order_summary table
@Author: Priyadarshan Parida
*/
-- Order 1: Subtotal = $2430.82, Shipping = $50.00, Taxes = $155.05
-- Ordered Items: 2 iPhone 14, 5 Pantene Pro-V Shampoo, 3 CeraVe Moisturizing Cream, 2 Levi’s 501 Jeans, 2 Zara Summer Dress, 4 Body Lotion
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1001, '2025-03-20 10:00:00', 2635.87, 'Processing', '123 Main St, Dallas, TX 75201', '123 Main St, Dallas, TX 75201');

-- Order 2: Subtotal = $4799.98, Shipping = $0.00, Taxes = $300.00
-- Ordered Items: 1 Samsung Galaxy S23, 1 Canon EOS R5
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1002, '2025-03-20 11:00:00', 5099.98, 'Shipped', '456 Elm St, Plano, TX 75024', '456 Elm St, Plano, TX 75024');

-- Order 3: Subtotal = $4799.97, Shipping = $25.00, Taxes = $301.56
-- Ordered Items: 1 LG InstaView Refrigerator, 2 Bosch Front Load Washer
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1003, '2025-03-20 12:00:00', 5126.53, 'Processing', '789 Oak St, Frisco, TX 75034', '789 Oak St, Frisco, TX 75034');

-- Order 4: Subtotal = $799.98, Shipping = $10.00, Taxes = $50.62
-- Ordered Items: 1 Ikea Ektorp Sofa, 1 Ikea Malm Bed Frame
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1004, '2025-03-20 13:00:00', 860.60, 'Delivered', '321 Pine St, Irving, TX 75038', '321 Pine St, Irving, TX 75038');

-- Order 5: Subtotal = $369.95, Shipping = $15.00, Taxes = $24.06
-- Ordered Items: 3 Levi’s 501 Jeans, 2 Zara Summer Dress
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1005, '2025-03-20 14:00:00', 409.01, 'Processing', '654 Cedar St, Richardson, TX 75080', '654 Cedar St, Richardson, TX 75080');

-- Order 6: Subtotal = $2599.94, Shipping = $100.00, Taxes = $168.75
-- Ordered Items: 1 Peloton Bike, 5 CeraVe Moisturizing Cream
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1006, '2025-03-20 15:00:00', 2868.69, 'Shipped', '987 Maple St, Addison, TX 75001', '987 Maple St, Addison, TX 75001');

-- Order 7: Subtotal = $79.97, Shipping = $0.00, Taxes = $5.00
-- Ordered Items: 2 Vitamin D3, 1 Blood Pressure Monitor
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1007, '2025-03-20 16:00:00', 84.97, 'Cancelled', '111 Birch St, Carrollton, TX 75006', '111 Birch St, Carrollton, TX 75006');

-- Order 8: Subtotal = $35.96, Shipping = $5.00, Taxes = $2.56
-- Ordered Items: 4 Body Lotion
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1008, '2025-03-20 17:00:00', 43.52, 'Delivered', '222 Spruce St, Garland, TX 75040', '222 Spruce St, Garland, TX 75040');

-- Order 9: Subtotal = $2499.99, Shipping = $50.00, Taxes = $159.37
-- Ordered Items: 1 MacBook Pro 16"
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1009, '2025-03-20 18:00:00', 2709.36, 'Received', '333 Walnut St, McKinney, TX 75070', '333 Walnut St, McKinney, TX 75070');

-- Order 10: Subtotal = $3899.99, Shipping = $75.00, Taxes = $248.44
-- Ordered Items: 1 Canon EOS R5
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1010, '2025-03-20 19:00:00', 4223.43, 'Received', '444 Cypress St, Allen, TX 75013', '444 Cypress St, Allen, TX 75013');

-- Order 11: Subtotal = $1000.00, Shipping = $50.00, Taxes = $39.38
-- Ordered Items: 2 iPhone 14, 1 Zara Summer Dress
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address, billing_address) VALUES
(1001, '2024-12-15 10:00:00', 1089.38, 'Delivered', '123 Main St, Dallas, TX 75201', '123 Main St, Dallas, TX 75201');

SELECT * FROM order_summary;

/* Insert 9: Insert records into the payment_detail table
@Author: Priyadarshan Parida
*/
-- Order 1: Total = $2635.87
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(1, 'Credit Card', '4111111111111111', 2635.87, '2025-03-20 10:05:00');

-- Order 2: Total = $5099.98
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(2, 'Credit Card', '4222222222222222', 5099.98, '2025-03-20 11:05:00');

-- Order 3: Total = $5126.53
-- Paid fully with Debit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(3, 'Debit Card', '5333333333333333', 5126.53, '2025-03-20 12:05:00');

-- Order 4: Total = $860.60
-- Paid fully with Gift Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(4, 'Gift Card', 'GC1001', 860.60, '2025-03-20 13:05:00');

-- Order 5: Total = $409.01
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(5, 'Credit Card', '4111111111111111', 409.01, '2025-03-20 14:05:00');

-- Order 6: Total = $2868.69
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(6, 'Credit Card', '4111111111111111', 2868.69, '2025-03-20 15:05:00');

-- Order 7: Total = $84.97
-- Paid fully with Gift Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(7, 'Gift Card', 'GC1002', 84.97, '2025-03-20 16:05:00');

-- Order 8: Total = $43.52
-- Paid fully with Debit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(8, 'Debit Card', '5333333333333333', 43.52, '2025-03-20 17:05:00');

-- Order 9: Total = $2709.36
-- Split payment: $500.00 with Gift Card, $2209.36 with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(9, 'Gift Card', 'GC1003', 500.00, '2025-03-20 18:05:00'),
(9, 'Credit Card', '4111111111111111', 2209.36, '2025-03-20 18:06:00');

-- Order 10: Total = $4223.43
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(10, 'Credit Card', '4222222222222222', 4223.43, '2025-03-20 19:05:00');

-- Order 11: Total = $1089.38
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date) VALUES
(11, 'Credit Card', '4111111111111111', 1089.38, '2024-12-15 10:05:00');

SELECT * FROM payment_detail;

/* Insert 10: Insert records into the order_detail table
@Author: Priyadarshan Parida
*/
-- Order 1
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 999.99),  -- 2 units of iPhone 14
(1, 81, 5, 6.99),   -- 5 units of Pantene Pro-V Shampoo
(1, 76, 3, 19.99),  -- 3 units of CeraVe Moisturizing Cream
(1, 46, 2, 69.99),  -- 2 units of Levi’s 501 Jeans
(1, 51, 2, 79.99),  -- 2 units of Zara Summer Dress
(1, 150, 4, 8.99);  -- 4 units of Body Lotion

-- Order 2
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(2, 2, 1, 899.99),  -- 1 unit of Samsung Galaxy S23
(2, 11, 1, 3899.99); -- 1 unit of Canon EOS R5

-- Order 3
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(3, 16, 1, 2999.99), -- 1 unit of LG InstaView Refrigerator
(3, 21, 2, 899.99);  -- 2 units of Bosch Front Load Washer

-- Order 4
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(4, 31, 1, 499.99), -- 1 unit of Ikea Ektorp Sofa
(4, 36, 1, 299.99); -- 1 unit of Ikea Malm Bed Frame

-- Order 5
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(5, 46, 3, 69.99),  -- 3 units of Levi’s 501 Jeans
(5, 51, 2, 79.99);  -- 2 units of Zara Summer Dress

-- Order 6
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(6, 61, 1, 2499.99), -- 1 unit of Peloton Bike
(6, 76, 5, 19.99);  -- 5 units of CeraVe Moisturizing Cream

-- Order 7
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(7, 136, 2, 14.99), -- 2 units of Vitamin D3
(7, 141, 1, 49.99); -- 1 unit of Blood Pressure Monitor

-- Order 8
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(8, 150, 4, 8.99);  -- 4 units of Body Lotion

-- Order 9
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(9, 6, 1, 2499.99); -- 1 unit of MacBook Pro 16"

-- Order 10
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(10, 11, 1, 3899.99); -- 1 unit of Canon EOS R5

-- Order 11
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES
(11, 1, 1, 999.99),  -- 1 unit of iPhone 14
(11, 81, 2, 6.99);   -- 2 units of Pantene Pro-V Shampoo

SELECT * FROM order_detail;

/* Insert 11: Insert records into the shipping table
@Author: Priyadarshan Parida
*/
-- Order 1: Total Shipping = $50.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(1, 'Standard', 20.00, '2025-03-20 10:10:00', '2025-03-25 10:00:00', 'TRACK12345'), -- iPhone 14
(2, 'Standard', 10.00, '2025-03-20 10:10:00', '2025-03-25 10:00:00', 'TRACK12346'), -- Pantene Pro-V Shampoo
(3, 'Standard', 5.00, '2025-03-20 10:10:00', '2025-03-25 10:00:00', 'TRACK12347'), -- CeraVe Moisturizing Cream
(4, 'Standard', 5.00, '2025-03-20 10:10:00', '2025-03-25 10:00:00', 'TRACK12348'), -- Levi’s 501 Jeans
(5, 'Standard', 5.00, '2025-03-20 10:10:00', '2025-03-25 10:00:00', 'TRACK12349'), -- Zara Summer Dress
(6, 'Standard', 5.00, '2025-03-20 10:10:00', '2025-03-25 10:00:00', 'TRACK12350'); -- Body Lotion

-- Order 2: Total Shipping = $0.00 (Free Shipping)
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(7, 'Free', 0.00, '2025-03-20 11:10:00', '2025-03-25 11:00:00', 'TRACK22345'), -- Samsung Galaxy S23
(8, 'Free', 0.00, '2025-03-20 11:10:00', '2025-03-25 11:00:00', 'TRACK22346'); -- Canon EOS R5

-- Order 3: Total Shipping = $25.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(9, 'Express', 15.00, '2025-03-20 12:10:00', '2025-03-22 12:00:00', 'TRACK32345'), -- LG InstaView Refrigerator
(10, 'Express', 10.00, '2025-03-20 12:10:00', '2025-03-22 12:00:00', 'TRACK32346'); -- Bosch Front Load Washer

-- Order 4: Total Shipping = $10.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(11, 'Standard', 5.00, '2025-03-20 13:10:00', '2025-03-25 13:00:00', 'TRACK42345'), -- Ikea Ektorp Sofa
(12, 'Standard', 5.00, '2025-03-20 13:10:00', '2025-03-25 13:00:00', 'TRACK42346'); -- Ikea Malm Bed Frame

-- Order 5: Total Shipping = $15.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(13, 'Standard', 10.00, '2025-03-20 14:10:00', '2025-03-25 14:00:00', 'TRACK52345'), -- Levi’s 501 Jeans
(14, 'Standard', 5.00, '2025-03-20 14:10:00', '2025-03-25 14:00:00', 'TRACK52346'); -- Zara Summer Dress

-- Order 6: Total Shipping = $100.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(15, 'Express', 80.00, '2025-03-20 15:10:00', '2025-03-22 15:00:00', 'TRACK62345'), -- Peloton Bike
(16, 'Express', 20.00, '2025-03-20 15:10:00', '2025-03-22 15:00:00', 'TRACK62346'); -- CeraVe Moisturizing Cream

-- Order 7: Total Shipping = $0.00 (Free Shipping)
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(17, 'Free', 0.00, '2025-03-20 16:10:00', '2025-03-25 16:00:00', 'TRACK72345'), -- Vitamin D3
(18, 'Free', 0.00, '2025-03-20 16:10:00', '2025-03-25 16:00:00', 'TRACK72346'); -- Blood Pressure Monitor

-- Order 8: Total Shipping = $5.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(19, 'Standard', 5.00, '2025-03-20 17:10:00', '2025-03-25 17:00:00', 'TRACK82345'); -- Body Lotion

-- Order 9: Total Shipping = $50.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(20, 'Express', 50.00, '2025-03-20 18:10:00', '2025-03-22 18:00:00', 'TRACK92345'); -- MacBook Pro 16"

-- Order 10: Total Shipping = $75.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(21, 'Express', 75.00, '2025-03-20 19:10:00', '2025-03-22 19:00:00', 'TRACK102345'); -- Canon EOS R5

-- Order 11: Total Shipping = $10.00
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(22, 'Standard', 7.00, '2024-12-15 11:00:00', '2024-12-20 10:00:00', 'TRACK112345'); -- iPhone 14
INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number) VALUES
(23, 'Standard', 3.00, '2024-12-15 11:00:00', '2024-12-20 10:00:00', 'TRACK112346'); -- Pantene Pro-V Shampoo

SELECT * FROM shipping;


/* Insert 12: Insert records into the return_refund table
@Author: Priyadarshan Parida
*/
-- This is incomplete for now. TODO implement triggers to sync other tables.
INSERT INTO return_refund (order_detail_id, product_id, return_reason, refund_amount, status) VALUES
(12, 36, 'Defective product', CalculateRefund(36, 1, 6.5), 'Pending'); -- Returning 1 Ikea Malm Bed Frame

SELECT * FROM return_refund;

-- TODO add algorithm to determine shipping cost?

/* Function 1: Calculate Order Subtotal (total amount before taxes)
@Author: Priyadarshan Parida
*/
DELIMITER //

CREATE FUNCTION CalculateSubtotal(
    order_id INT
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE subtotal DECIMAL(10, 2);

    -- Calculate the subtotal (total amount before taxes)
    SELECT SUM(od.quantity * od.price)
    INTO subtotal
    FROM order_detail od
    WHERE od.order_id = order_id;

    RETURN subtotal;
END //

DELIMITER ;

/* Function 2: Calculate Order Total (total amount after shipping and taxes)
@Author: Priyadarshan Parida
*/
DELIMITER //

CREATE FUNCTION CalculateTotalAmount(
    order_id INT,
    tax_rate DECIMAL(5, 2)
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE subtotal DECIMAL(10, 2);
    DECLARE shipping_cost DECIMAL(10, 2);
    DECLARE total_amount DECIMAL(10, 2);

    -- Calculate the subtotal using the CalculateSubtotal function
    SET subtotal = CalculateSubtotal(order_id);

    -- Calculate the total shipping cost
    SELECT SUM(s.shipping_cost)
    INTO shipping_cost
    FROM shipping s
    JOIN order_detail od ON s.order_detail_id = od.order_detail_id
    WHERE od.order_id = order_id;

    -- Calculate the total amount including taxes and shipping cost
    SET total_amount = subtotal + shipping_cost + ((subtotal + shipping_cost) * tax_rate / 100);

    RETURN total_amount;
END //

DELIMITER ;

/* Function 3: Calculate refund amount
@Author: Priyadarshan Parida
*/
DELIMITER //

CREATE FUNCTION CalculateRefund(
    p_pid INT,
    p_qty INT,
    p_tax_rate DECIMAL(5, 2)
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_refund DECIMAL(10, 2);
    DECLARE v_price DECIMAL(10, 2);

    SELECT price
    INTO v_price
    FROM product
    WHERE prod_id = p_pid;

    -- Calculate the refund amount
    SET v_refund = (v_price * p_qty) * (1 + p_tax_rate / 100);
    RETURN v_refund;
END //

DELIMITER ;

-- Test the CalculateTotalAmount function
SELECT CalculateTotalAmount(1, 6.25) AS total_amount;

/* Query 8: Order Summary and Payment Details
 @Author: Priyadarshan Parida
*/
SELECT 
    CONCAT(c.fname, ' ', c.lname) AS customer_name,
    c.cid AS customer_id,
    os.order_id,
    os.order_date,
    os.order_status,
    os.shipping_address,
    os.billing_address,
    os.total_amount,
    pd.payment_method,
    CONCAT('**** **** **** ', RIGHT(pd.account_number, 4)) AS masked_account_number,
    pd.amount AS payment_amount,
    pd.payment_date
FROM 
    customer c
JOIN 
    order_summary os ON c.cid = os.customer_id
JOIN 
    payment_detail pd ON os.order_id = pd.order_id
WHERE 
    os.order_id = 1;

/* Query 9: Display order details with product and shipping information
 @Author: Priyadarshan Parida
*/
SELECT
    CONCAT(c.fname, ' ', c.lname) AS customer_name,
    c.cid,
    os.order_id,
    od.order_detail_id,
    od.product_id,
    p.prod_name,
    od.quantity,
    od.price,
    s.shipping_method,
    s.shipping_cost,
    CAST(s.delivery_date AS DATE) AS expected_delivery_date,
    s.tracking_number
FROM
    customer c
JOIN
    order_summary os ON c.cid = os.customer_id
JOIN 
    order_detail od ON os.order_id = od.order_id
JOIN 
    product p ON od.product_id = p.prod_id
JOIN 
    shipping s ON od.order_detail_id = s.order_detail_id
WHERE 
    od.order_id = 1;

/* Query 10: Display return history for customer
 @Author: Priyadarshan Parida
*/
SELECT
    c.cid,
    CONCAT(c.fname, ' ', c.lname) AS customer_name,
    os.order_id,
    od.order_detail_id,
    p.prod_id,
    p.prod_name,
    p.price,
    od.quantity,
    r.refund_amount,
    r.return_reason,
    r.status AS return_status
FROM
    customer c
JOIN
    order_summary os ON c.cid = os.customer_id
JOIN
    order_detail od ON os.order_id = od.order_id
JOIN
    product p ON od.product_id = p.prod_id
JOIN
    return_refund r ON od.order_detail_id = r.order_detail_id
WHERE
    c.cid = 1004;

/* Query 11: Get customer order history
@Author: Qurrat Ul Ain
*/
SELECT 
    os.order_id,
    os.order_date,
    os.order_status,
    os.total_amount,
    pd.payment_method,
    CONCAT('**** **** **** ', RIGHT(pd.account_number, 4)) AS masked_account_number,
    pd.amount AS payment_amount,
    pd.payment_date
FROM 
    order_summary os
JOIN 
    payment_detail pd ON os.order_id = pd.order_id
WHERE 
    os.customer_id = 1001
ORDER BY 
    os.order_date DESC;

-- Module 5: Customer Feedback
/* Table 13 - PRODUCT_REVIEW
@Author: Qurrat Ul Ain
Purpose: Store product reviews submitted by customers for feedback and ratings.
1. Review ID (p_review_id): Unique identifier for each product review.
2. Product ID (product_id): ID of the product being reviewed.
3. Customer ID (customer_id): ID of the customer who submitted the review.
4. Rating (rating): Rating given to the product (e.g., 1 to 5).
5. Review Text (review_text): Text of the review.
6. Created At (created_at): Timestamp of when the review was submitted.
*/
CREATE TABLE product_review (
    p_review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(prod_id),
    FOREIGN KEY (customer_id) REFERENCES customer(cid)
);

/* Table 14 - CUSTOMER_SERVICE
@Author: Qurrat Ul Ain
1. Ticket ID (ticket_id): Unique identifier for each customer service ticket.
2. Customer ID (customer_id): ID of the customer who raised the ticket.
3. Order Detail ID (order_detail_id): ID of the order detail related to the issue.
4. Issue Type (issue_type): Type of issue (e.g., Product Issue, Order Issue, Payment Issue, Shipping Issue, Other).
5. Issue Description (issue_description): Description of the issue.
6. Conversation (conversation): Conversation history related to the issue.
7. Status (status): Status of the ticket (e.g., Open, Resolved, Closed).
8. Created At (created_at): Timestamp of when the ticket was created.
9. Updated At (updated_at): Timestamp of the last update to the ticket.
*/

CREATE TABLE customer_service (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_detail_id INT,
    issue_type ENUM('Product Issue', 'Order Issue', 'Payment Issue', 'Shipping Issue', 'Other'),
    issue_description TEXT,
    conversation TEXT,
    status ENUM('Open', 'Resolved', 'Closed') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id)
);

/* Table 15 - CONTACT_SELLER
@Author: Sai Vishnu Malladi
Purpose: Store customer-seller communication for inquiries and issues.
1. Issue ID (issue_id): Unique identifier for each contact record.
2. Customer ID (customer_id): ID of the customer who contacted the seller.
3. Order Detail ID (order_detail_id): ID of the order detail related to the issue.
4. Contact Reason (contact_reason): Reason for contacting the seller (e.g., Product Inquiry, Warranty Inquiry, Price Inquiry, Delivery Inquiry, Other).
5. Seller ID (seller_id): ID of the seller being contacted.
6. Conversation (conversation): Conversation history between the customer and the seller.
7. Created At (created_at): Timestamp of when the message was sent.
*/
CREATE TABLE contact_seller (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_detail_id INT,
    contact_reason ENUM('Product Inquiry', 'Warranty Inquiry', 'Price Inquiry', 'Delivery Inquiry', 'Other'),
    seller_id INT,
    conversation TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id),
    FOREIGN KEY (seller_id) REFERENCES supplier(supplier_id)
);

/* Table 16 - SELLER_REVIEW
@Author: Sai Vishnu Malladi
Purpose: Store seller reviews submitted by customers for feedback and ratings.
1. Review ID (s_review_id): Unique identifier for each seller review.
2. Seller ID (seller_id): ID of the seller being reviewed.
3. Customer ID (customer_id): ID of the customer who submitted the review.
4. Rating (rating): Rating given to the seller (e.g., 1 to 5).
5. Review Text (review_text): Text of the review.
6. Created At (created_at): Timestamp of when the review was submitted.
*/
CREATE TABLE seller_review (
    s_review_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY (customer_id) REFERENCES customer(cid)
);

/* Insert 13: Insert records into the product_review table
@Author: Qurrat Ul Ain
*/
-- Product 1: iPhone 14 (prod_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(1, 1001, 5, 'Amazing phone with great performance!'),
(1, 1002, 5, 'The camera quality is outstanding.'),
(1, 1003, 4, 'Good phone but a bit expensive.'),
(1, 1004, 5, 'Battery life is excellent.'),
(1, 1005, 5, 'Best iPhone I have ever used.');

-- Product 2: Samsung Galaxy S23 (prod_review = 4.7)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(2, 1006, 5, 'Great phone with amazing features.'),
(2, 1007, 4, 'Good phone but could be better.'),
(2, 1008, 5, 'The display is stunning.'),
(2, 1009, 5, 'Performance is top-notch.'),
(2, 1010, 4, 'Battery life could be improved.');

-- Product 6: MacBook Pro 16" (prod_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(6, 1001, 5, 'Perfect for professionals.'),
(6, 1002, 5, 'The M2 chip is a game-changer.'),
(6, 1003, 5, 'Build quality is excellent.'),
(6, 1004, 4, 'Very expensive but worth it.'),
(6, 1005, 5, 'Best laptop I have ever used.');

-- Product 7: Dell XPS 13 (prod_review = 4.6)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(7, 1001, 5, 'Great laptop for everyday use.'),
(7, 1002, 4, 'Good performance but a bit heavy.'),
(7, 1003, 5, 'The display is fantastic.'),
(7, 1004, 4, 'Battery life could be better.'),
(7, 1005, 5, 'Highly recommend this laptop.');

-- Product 8: HP Spectre x360 (prod_review = 4.2)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(8, 1006, 4, 'Good laptop but a bit pricey.'),
(8, 1007, 5, 'The design is beautiful.'),
(8, 1008, 4, 'Performance is decent.'),
(8, 1009, 5, 'Great for students.'),
(8, 1010, 4, 'Battery life is average.');

-- Product 9: Lenovo ThinkPad X1 Carbon (prod_review = 4.1)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(9, 1001, 4, 'Good laptop for business use.'),
(9, 1002, 5, 'The keyboard is excellent.'),
(9, 1003, 4, 'Performance is good but a bit heavy.'),
(9, 1004, 5, 'Highly durable and reliable.'),
(9, 1005, 4, 'Battery life could be improved.');

-- Product 10: Asus ROG Zephyrus G14 (prod_review = 4.4)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(10, 1006, 5, 'Great gaming laptop.'),
(10, 1007, 4, 'Performance is top-notch.'),
(10, 1008, 5, 'The design is sleek.'),
(10, 1009, 4, 'Battery life could be better.'),
(10, 1010, 5, 'Highly recommend for gamers.');

-- Product 11: Canon EOS R5 (prod_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(11, 1006, 5, 'Amazing camera for professionals.'),
(11, 1007, 5, 'The image quality is stunning.'),
(11, 1008, 5, 'Great for both photos and videos.'),
(11, 1009, 4, 'A bit heavy to carry around.'),
(11, 1010, 5, 'Worth every penny.');

-- Product 16: LG InstaView Refrigerator (prod_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(16, 1001, 5, 'Very convenient and spacious.'),
(16, 1002, 5, 'The InstaView feature is amazing.'),
(16, 1003, 4, 'A bit noisy at times.'),
(16, 1004, 5, 'Keeps food fresh for a long time.'),
(16, 1005, 5, 'Highly recommend this refrigerator.');

-- Product 46: Levi’s 501 Jeans (prod_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(46, 1006, 5, 'Perfect fit and very comfortable.'),
(46, 1007, 5, 'The quality is excellent.'),
(46, 1008, 4, 'A bit pricey but worth it.'),
(46, 1009, 5, 'Classic jeans that never go out of style.'),
(46, 1010, 5, 'Highly durable and stylish.');

-- Product 51: Zara Summer Dress (prod_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(51, 1001, 5, 'Beautiful and lightweight dress.'),
(51, 1002, 5, 'Perfect for summer outings.'),
(51, 1003, 4, 'The fit could be better.'),
(51, 1004, 5, 'Very comfortable and stylish.'),
(51, 1005, 5, 'Great value for the price.');

-- Product 76: CeraVe Moisturizing Cream (prod_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(76, 1006, 5, 'Best moisturizer for dry skin.'),
(76, 1007, 5, 'Very hydrating and non-greasy.'),
(76, 1008, 5, 'Works wonders for sensitive skin.'),
(76, 1009, 4, 'A bit expensive but effective.'),
(76, 1010, 5, 'Highly recommend this product.');

-- Product 136: Vitamin D3 (prod_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(136, 1001, 5, 'Great supplement for daily use.'),
(136, 1002, 5, 'Easy to swallow and effective.'),
(136, 1003, 5, 'Improved my energy levels.'),
(136, 1004, 4, 'A bit pricey but worth it.'),
(136, 1005, 5, 'Highly recommend this supplement.');

-- Product 141: Blood Pressure Monitor (prod_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(141, 1006, 5, 'Very accurate and easy to use.'),
(141, 1007, 5, 'Compact and portable design.'),
(141, 1008, 5, 'Great for home monitoring.'),
(141, 1009, 4, 'Battery life could be better.'),
(141, 1010, 5, 'Highly reliable and effective.');

SELECT * FROM product_review;

/* Insert 14: Insert records into the customer_service table
@Author: Qurrat Ul Ain
*/
INSERT INTO customer_service (customer_id, order_detail_id, issue_type, issue_description, conversation, status, created_at, updated_at) VALUES
(1001, 1, 'Shipping Issue', 'Order not delivered on time.', 'Customer: When will my order arrive?\nSupport: We are looking into it.', 'Open', '2025-03-15 10:00:00', '2025-03-15 10:00:00'),
(1002, 7, 'Product Issue', 'Received a defective product.', 'Customer: The product is not working.\nSupport: We will replace it.', 'Resolved', '2025-03-10 12:00:00', '2025-03-12 14:00:00'),
(1003, 9, 'Payment Issue', 'Refund not processed for returned item.', 'Customer: I returned the item but no refund yet.\nSupport: Refund will be processed soon.', 'Open', '2025-03-18 09:30:00', '2025-03-18 09:30:00'),
(1004, 11, 'Order Issue', 'Incorrect item delivered.', 'Customer: I received the wrong item.\nSupport: We will arrange a replacement.', 'Closed', '2025-03-05 11:00:00', '2025-03-07 16:00:00'),
(1005, 13, 'Order Issue', 'Unable to apply discount code during checkout.', 'Customer: Discount code is not working.\nSupport: Please try again, it should work now.', 'Resolved', '2025-03-08 08:00:00', '2025-03-09 10:00:00'),
(1006, 15, 'Payment Issue', 'Payment failed but amount deducted.', 'Customer: My payment failed but money was deducted.\nSupport: We are investigating the issue.', 'Open', '2025-03-20 14:00:00', '2025-03-20 14:00:00'),
(1007, 17, 'Product Issue', 'Need assistance with product installation.', 'Customer: How do I install this product?\nSupport: We will send you the installation guide.', 'Open', '2025-03-19 15:30:00', '2025-03-19 15:30:00'),
(1008, 19, 'Order Issue', 'Order canceled without notification.', 'Customer: Why was my order canceled?\nSupport: Apologies, it was a system error.', 'Closed', '2025-03-01 13:00:00', '2025-03-03 17:00:00'),
(1009, 20, 'Product Issue', 'Warranty claim for a damaged product.', 'Customer: My product is damaged, how do I claim warranty?\nSupport: Please provide the purchase details.', 'Resolved', '2025-03-11 10:00:00', '2025-03-13 12:00:00'),
(1010, 21, 'Shipping Issue', 'Request to change shipping address.', 'Customer: I need to update my shipping address.\nSupport: Address updated successfully.', 'Open', '2025-03-21 09:00:00', '2025-03-21 09:00:00');

SELECT * FROM customer_service;

/* Insert 15: Insert records into the contact_seller table
@Author: Sai Vishnu Malladi
*/
INSERT INTO contact_seller (customer_id, order_detail_id, contact_reason, seller_id, conversation, created_at) VALUES
(1001, 1, 'Product Inquiry', 1, 'Customer: I would like to know if the iPhone 14 is available in other colors.\nSeller: Yes, it is available in black, white, and blue.', '2025-03-15 10:00:00'),
(1002, 9, 'Warranty Inquiry', 2, 'Customer: Can you provide more details about the warranty for the LG InstaView Refrigerator?\nSeller: The warranty covers 1 year for parts and labor.', '2025-03-16 12:30:00'),
(1003, 11, 'Price Inquiry', 3, 'Customer: Is there a discount available for bulk purchases of Ikea Ektorp Sofa?', '2025-03-17 09:45:00'),
(1004, 13, 'Delivery Inquiry', 4, 'Customer: I need assistance with the size chart for Zara Summer Dress.\nSeller: Sure, I will email you the size chart shortly.', '2025-03-18 14:20:00'),
(1005, 15, 'Delivery Inquiry', 5, 'Customer: Can you confirm the delivery timeline for the Peloton Bike?\nSeller: The estimated delivery time is 5-7 business days.', '2025-03-19 11:15:00'),
(1006, 16, 'Product Inquiry', 6, 'Customer: Is the CeraVe Moisturizing Cream suitable for sensitive skin?\nSeller: Yes, it is dermatologist-tested and suitable for sensitive skin.', '2025-03-20 16:00:00'),
(1007, 17, 'Product Inquiry', 7, 'Customer: Can you provide the expiration date for the Vitamin D3 supplement?', '2025-03-21 08:30:00'),
(1008, 20, 'Warranty Inquiry', 1, 'Customer: I would like to know if the MacBook Pro 16" comes with an extended warranty option.\nSeller: Yes, you can purchase an extended warranty for up to 3 years.', '2025-03-22 10:10:00'),
(1009, 10, 'Product Inquiry', 2, 'Customer: Is the Bosch Front Load Washer compatible with 220V power supply?\nSeller: Yes, it is compatible with both 110V and 220V power supply.', '2025-03-23 13:50:00'),
(1010, 12, 'Product Inquiry', 3, 'Customer: Can you provide assembly instructions for the Ikea Malm Bed Frame?\nSeller: Sure, I will send you the assembly manual via email.', '2025-03-24 15:40:00');

SELECT * FROM contact_seller;

/* Insert 16: Insert records into the seller_review table
@Author: Sai Vishnu Malladi
*/
-- Seller 1: Tech Distributors Inc. (Average Rating = 4.8)
INSERT INTO seller_review (seller_id, customer_id, rating, review_text, created_at) VALUES
(1, 1001, 5, 'Excellent service and fast delivery.', '2025-03-15 10:00:00'),
(1, 1002, 5, 'Products were delivered in perfect condition.', '2025-03-16 12:30:00'),
(1, 1003, 4, 'Good service but delivery was slightly delayed.', '2025-03-17 09:45:00'),
(1, 1004, 5, 'Very professional and reliable.', '2025-03-18 14:20:00'),
(1, 1005, 5, 'Highly recommend this seller.', '2025-03-19 11:15:00');

-- Seller 2: Global Wholesalers (Average Rating = 4.7)
INSERT INTO seller_review (seller_id, customer_id, rating, review_text, created_at) VALUES
(2, 1006, 5, 'Great prices and excellent customer support.', '2025-03-20 16:00:00'),
(2, 1007, 4, 'Good quality products but packaging could be better.', '2025-03-21 08:30:00'),
(2, 1008, 5, 'Fast delivery and great communication.', '2025-03-22 10:10:00'),
(2, 1009, 5, 'Very satisfied with the service.', '2025-03-23 13:50:00'),
(2, 1010, 4, 'Products were as described but delivery was delayed.', '2025-03-24 15:40:00');

-- Seller 3: Furniture World (Average Rating = 4.6)
INSERT INTO seller_review (seller_id, customer_id, rating, review_text, created_at) VALUES
(3, 1001, 5, 'Beautiful furniture and excellent craftsmanship.', '2025-03-15 10:00:00'),
(3, 1002, 4, 'Good quality but delivery took longer than expected.', '2025-03-16 12:30:00'),
(3, 1003, 5, 'Very happy with the purchase.', '2025-03-17 09:45:00'),
(3, 1004, 4, 'Furniture was slightly damaged during delivery.', '2025-03-18 14:20:00'),
(3, 1005, 5, 'Great customer service and quality.', '2025-03-19 11:15:00');

-- Seller 4: Fashion Hub (Average Rating = 4.5)
INSERT INTO seller_review (seller_id, customer_id, rating, review_text, created_at) VALUES
(4, 1006, 5, 'Stylish clothing and fast delivery.', '2025-03-20 16:00:00'),
(4, 1007, 4, 'Good quality but sizes were slightly off.', '2025-03-21 08:30:00'),
(4, 1008, 5, 'Very satisfied with the purchase.', '2025-03-22 10:10:00'),
(4, 1009, 4, 'Clothing was as described but delivery was delayed.', '2025-03-23 13:50:00'),
(4, 1010, 5, 'Great value for the price.', '2025-03-24 15:40:00');

-- Seller 5: Sports Gear Co. (Average Rating = 4.7)
INSERT INTO seller_review (seller_id, customer_id, rating, review_text, created_at) VALUES
(5, 1001, 5, 'High-quality sports gear and fast delivery.', '2025-03-15 10:00:00'),
(5, 1002, 4, 'Good products but packaging could be better.', '2025-03-16 12:30:00'),
(5, 1003, 5, 'Very satisfied with the service.', '2025-03-17 09:45:00'),
(5, 1004, 5, 'Excellent customer support.', '2025-03-18 14:20:00'),
(5, 1005, 4, 'Products were as described but delivery was delayed.', '2025-03-19 11:15:00');

SELECT * FROM seller_review;

-- TODO Trigger: Update prod_review in PRODUCT table on PRODUCT_REVIEW table update

/* Query 12: Get top-rated products with the highest number of reviews
@Author: Qurrat Ul Ain
*/
SELECT 
    p.prod_id, 
    p.prod_name, 
    p.prod_brand, 
    AVG(pr.rating) AS avg_rating, 
    COUNT(pr.p_review_id) AS total_reviews
FROM product p
LEFT JOIN product_review pr ON p.prod_id = pr.product_id
JOIN product_category c ON p.category_id = c.category_id
WHERE 
    p.prod_name LIKE '%laptop%' 
    OR p.prod_descr LIKE '%laptop%'  
    OR c.category_name LIKE '%laptop%'
    OR p.category_id = 12
GROUP BY 
    p.prod_id, p.prod_name
ORDER BY 
    avg_rating DESC, total_reviews DESC
LIMIT 5;

/* Query 13: Get unresolved customer service tickets
@Author: Sai Vishnu Malladi
*/
SELECT 
    cs.ticket_id,
    cs.issue_description,
    cs.status,
    cs.created_at,
    CONCAT(c.fname, ' ', c.lname) AS customer_name,
    c.email AS customer_email
FROM 
    customer_service cs
JOIN 
    customer c ON cs.customer_id = c.cid
WHERE 
    cs.status = 'Open'
ORDER BY 
    cs.created_at ASC;

/* Query 14: Get seller rating
@Author: Sai Vishnu Malladi
*/
SELECT 
    s.supplier_id AS seller_id,
    s.supplier_name AS seller_name,
    ROUND(AVG(sr.rating), 1) AS avg_rating,
    COUNT(sr.s_review_id) AS total_reviews
FROM 
    supplier s
JOIN 
    seller_review sr ON s.supplier_id = sr.seller_id
WHERE supplier_id = 1
GROUP BY 
    s.supplier_id, s.supplier_name
HAVING 
    total_reviews > 0;