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