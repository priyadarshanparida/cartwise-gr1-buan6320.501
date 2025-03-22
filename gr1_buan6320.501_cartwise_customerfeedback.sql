-- Module 5: Customer Feedback
USE cartwise;

-- Insert 13: Insert records into the product_review table
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

-- Insert 14: Insert records into the customer_service table
INSERT INTO customer_service (customer_id, issue_description, status, created_at, updated_at) VALUES
(1001, 'Order not delivered on time.', 'Open', '2025-03-15 10:00:00', '2025-03-15 10:00:00'),
(1002, 'Received a defective product.', 'Resolved', '2025-03-10 12:00:00', '2025-03-12 14:00:00'),
(1003, 'Refund not processed for returned item.', 'Open', '2025-03-18 09:30:00', '2025-03-18 09:30:00'),
(1004, 'Incorrect item delivered.', 'Closed', '2025-03-05 11:00:00', '2025-03-07 16:00:00'),
(1005, 'Unable to apply discount code during checkout.', 'Resolved', '2025-03-08 08:00:00', '2025-03-09 10:00:00'),
(1006, 'Payment failed but amount deducted.', 'Open', '2025-03-20 14:00:00', '2025-03-20 14:00:00'),
(1007, 'Need assistance with product installation.', 'Open', '2025-03-19 15:30:00', '2025-03-19 15:30:00'),
(1008, 'Order canceled without notification.', 'Closed', '2025-03-01 13:00:00', '2025-03-03 17:00:00'),
(1009, 'Warranty claim for a damaged product.', 'Resolved', '2025-03-11 10:00:00', '2025-03-13 12:00:00'),
(1010, 'Request to change shipping address.', 'Open', '2025-03-21 09:00:00', '2025-03-21 09:00:00');

SELECT * FROM customer_service;

-- Insert 15: Insert records into the contact_seller table
INSERT INTO contact_seller (customer_id, seller_id, message, created_at) VALUES
(1001, 1, 'I would like to know if the iPhone 14 is available in other colors.', '2025-03-15 10:00:00'),
(1002, 2, 'Can you provide more details about the warranty for the LG InstaView Refrigerator?', '2025-03-16 12:30:00'),
(1003, 3, 'Is there a discount available for bulk purchases of Ikea Ektorp Sofa?', '2025-03-17 09:45:00'),
(1004, 4, 'I need assistance with the size chart for Zara Summer Dress.', '2025-03-18 14:20:00'),
(1005, 5, 'Can you confirm the delivery timeline for the Peloton Bike?', '2025-03-19 11:15:00'),
(1006, 6, 'Is the CeraVe Moisturizing Cream suitable for sensitive skin?', '2025-03-20 16:00:00'),
(1007, 7, 'Can you provide the expiration date for the Vitamin D3 supplement?', '2025-03-21 08:30:00'),
(1008, 1, 'I would like to know if the MacBook Pro 16" comes with an extended warranty option.', '2025-03-22 10:10:00'),
(1009, 2, 'Is the Bosch Front Load Washer compatible with 220V power supply?', '2025-03-23 13:50:00'),
(1010, 3, 'Can you provide assembly instructions for the Ikea Malm Bed Frame?', '2025-03-24 15:40:00');

SELECT * FROM contact_seller;

-- Insert 16: Insert records into the seller_review table
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