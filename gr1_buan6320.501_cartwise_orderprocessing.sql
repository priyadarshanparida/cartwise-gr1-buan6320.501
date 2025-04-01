-- Module 4: Order Processing
USE cartwise;

-- Insert 7: Insert records into the shopping_cart table
INSERT INTO shopping_cart (customer_id, product_id, quantity) VALUES
(1001, 1, 2),  -- Customer 1 adds 2 units of iPhone 14
(1001, 6, 1),  -- Customer 1 adds 1 unit of MacBook Pro 16"
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

-- Insert 8: Insert records into the order_summary table
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

-- Insert 9: Insert records into the payment_detail table
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

-- Insert 10: Insert records into the order_detail table
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

-- Insert 11: Insert records into the shipping table
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


-- Insert 12: Insert records into the return_refund table
-- This is incomplete for now. TODO implement triggers to sync other tables.
INSERT INTO return_refund (order_detail_id, product_id, return_reason, refund_amount, status) VALUES
(12, 36, 'Defective product', CalculateRefund(36, 1, 6.5), 'Pending'); -- Returning 1 Ikea Malm Bed Frame

SELECT * FROM return_refund;