-- Module 2. Product Onboarding
USE cartwise;

-- Insert 3: Insert records into the product_category table
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

-- Insert 4: Insert records into the product table
-- Electronics: Mobile Phones
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(1, 'iPhone 14', 'Apple', 'Latest Apple smartphone with A15 Bionic chip', 4.8, 999.99, 11),
(2, 'Samsung Galaxy S23', 'Samsung', 'Flagship Samsung smartphone with Snapdragon 8 Gen 2', 4.7, 899.99, 11),
(3, 'Google Pixel 7', 'Google', 'Google smartphone with advanced AI features', 4.6, 599.99, 11),
(4, 'OnePlus 11', 'OnePlus', 'High-performance smartphone with fast charging', 4.5, 699.99, 11),
(5, 'Xiaomi Redmi Note 12', 'Xiaomi', 'Affordable smartphone with great features', 4.3, 299.99, 11);

-- Electronics: Laptops
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(6, 'MacBook Pro 16"', 'Apple', 'Apple laptop with M2 Pro chip', 4.9, 2499.99, 12),
(7, 'Dell XPS 13', 'Dell', 'Compact and powerful ultrabook', 4.8, 1299.99, 12),
(8, 'HP Spectre x360', 'HP', 'Convertible laptop with touchscreen', 4.7, 1399.99, 12),
(9, 'Lenovo ThinkPad X1 Carbon', 'Lenovo', 'Business laptop with robust build', 4.6, 1599.99, 12),
(10, 'Asus ROG Zephyrus G14', 'Asus', 'Gaming laptop with Ryzen 9 processor', 4.5, 1799.99, 12);

-- Electronics: Cameras
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(11, 'Canon EOS R5', 'Canon', 'Professional mirrorless camera with 45MP sensor', 4.9, 3899.99, 13),
(12, 'Sony Alpha a7 IV', 'Sony', 'Full-frame mirrorless camera with 33MP sensor', 4.8, 2499.99, 13),
(13, 'Nikon Z6 II', 'Nikon', 'Versatile mirrorless camera for photography and video', 4.7, 1999.99, 13),
(14, 'Fujifilm X-T4', 'Fujifilm', 'APS-C mirrorless camera with retro design', 4.6, 1699.99, 13),
(15, 'Panasonic Lumix GH6', 'Panasonic', 'Micro Four Thirds camera for video creators', 4.5, 2199.99, 13);

-- Home Appliances: Refrigerators
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(16, 'LG InstaView Refrigerator', 'LG', 'Smart refrigerator with InstaView technology', 4.8, 2999.99, 14),
(17, 'Samsung Family Hub', 'Samsung', 'Refrigerator with touchscreen and smart features', 4.7, 3499.99, 14),
(18, 'Whirlpool Double Door', 'Whirlpool', 'Energy-efficient double-door refrigerator', 4.6, 1299.99, 14),
(19, 'GE French Door Refrigerator', 'GE', 'Spacious refrigerator with French doors', 4.5, 2499.99, 14),
(20, 'Bosch Bottom Freezer', 'Bosch', 'Refrigerator with bottom freezer and energy efficiency', 4.4, 1999.99, 14);

-- Home Appliances: Washing Machines
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(21, 'Bosch Front Load Washer', 'Bosch', 'High-efficiency front-load washing machine', 4.8, 899.99, 15),
(22, 'LG Top Load Washer', 'LG', 'Top-load washing machine with smart features', 4.7, 799.99, 15),
(23, 'Samsung EcoBubble Washer', 'Samsung', 'EcoBubble technology for efficient cleaning', 4.6, 999.99, 15),
(24, 'Whirlpool Semi-Automatic Washer', 'Whirlpool', 'Affordable semi-automatic washing machine', 4.5, 499.99, 15),
(25, 'IFB Fully Automatic Washer', 'IFB', 'Fully automatic washing machine with advanced features', 4.4, 1099.99, 15);

-- Furniture: Sofas
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(31, 'Ikea Ektorp Sofa', 'Ikea', 'Comfortable and stylish sofa for living rooms', 4.8, 499.99, 17),
(32, 'Ashley Recliner Sofa', 'Ashley', 'Recliner sofa with premium comfort', 4.7, 899.99, 17),
(33, 'West Elm Sectional Sofa', 'West Elm', 'Modern sectional sofa for large spaces', 4.6, 1299.99, 17),
(34, 'Wayfair Loveseat', 'Wayfair', 'Compact loveseat for small spaces', 4.5, 399.99, 17),
(35, 'La-Z-Boy Recliner', 'La-Z-Boy', 'Classic recliner with plush comfort', 4.4, 699.99, 17);

-- Clothing: Men’s Clothing
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(46, 'Levi’s 501 Jeans', 'Levi’s', 'Classic straight-fit jeans for men', 4.8, 69.99, 20),
(47, 'Nike Dri-FIT T-Shirt', 'Nike', 'Moisture-wicking t-shirt for active men', 4.7, 29.99, 20),
(48, 'Adidas Track Pants', 'Adidas', 'Comfortable track pants for workouts', 4.6, 49.99, 20),
(49, 'Ralph Lauren Polo Shirt', 'Ralph Lauren', 'Classic polo shirt for casual wear', 4.5, 89.99, 20),
(50, 'Under Armour Hoodie', 'Under Armour', 'Warm and lightweight hoodie for men', 4.4, 59.99, 20);

-- Beauty & Personal Care: Skincare
INSERT INTO product (prod_id, prod_name, prod_brand, prod_descr, prod_review, price, category_id) VALUES
(76, 'CeraVe Moisturizing Cream', 'CeraVe', 'Hydrating cream for dry skin', 4.9, 19.99, 26),
(77, 'Neutrogena Sunscreen', 'Neutrogena', 'Broad-spectrum SPF 50 sunscreen', 4.8, 14.99, 26),
(78, 'The Ordinary Niacinamide Serum', 'The Ordinary', 'Serum for reducing blemishes', 4.7, 9.99, 26),
(79, 'La Roche-Posay Cleanser', 'La Roche-Posay', 'Gentle cleanser for sensitive skin', 4.6, 12.99, 26),
(80, 'Aveeno Daily Moisturizer', 'Aveeno', 'Moisturizer with SPF for daily use', 4.5, 15.99, 26);

SELECT * FROM product;

/* 
Index 1: Add index to category_name in product_category.
@Author: Priyadarshan Parida
This index will help in faster searches for categories by name.
*/
CREATE INDEX idx_category_name ON product_category(category_name);

/* 
Index 2: Add index to category_description in product_category.
@Author: Priyadarshan Parida
The index on category_description is limited to 255 characters 
to optimize storage and performance.
*/
CREATE INDEX idx_category_description ON product_category(category_description(255));

/*
Index 3: Add index to prod_name in product.
@Author: Priyadarshan Parida
This index will help in faster searches for products by name.
*/
CREATE INDEX idx_product_name ON product(product_name);

/*
Index 4: Add index to prod_name in product.
@Author: Priyadarshan Parida
This index will help in faster searches for products by description.
*/
CREATE INDEX idx_product_description ON product(product_descr(255));

/*
Index 5: Add index to prod_brand in product.
@Author: Priyadarshan Parida
This index will help in faster searches for products by brand.
*/
CREATE INDEX idx_product_brand ON product(product_brand);