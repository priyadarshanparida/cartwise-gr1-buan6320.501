-- Module 3: Inventory Management
USE cartwise;

-- Insert 5: Insert records into the supplier table
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

-- Insert 6: Insert records into the inventory table
-- TODO Insert inventory records for all 200 products.

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