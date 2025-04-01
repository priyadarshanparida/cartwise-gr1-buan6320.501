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

-- Insert 14: Insert records into the customer_service table
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

-- Insert 15: Insert records into the contact_seller table
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