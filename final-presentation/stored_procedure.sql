USE cartwise;

-- Stored Procedure 1: Process Order

-- Test ProcessOrder procedure
-- Set up: Insert test data into the shopping_cart table
INSERT INTO shopping_cart (customer_id, product_id, quantity)
VALUES 
(1014, 1, 2),  -- 2 units of iPhone 14
(1014, 6, 1);  -- 1 unit of MacBook Pro 16"
SET @original_iphone_quantity = NULL;
SET @original_macbook_quantity = NULL;
SELECT quantity INTO @original_iphone_quantity
FROM inventory WHERE product_id = 1;
SELECT quantity INTO @original_macbook_quantity
FROM inventory WHERE product_id = 6;

-- Test: Call the ProcessOrder stored procedure
-- Declare a variable to hold the output
SET @order_id = NULL;

-- Call the ProcessOrder stored procedure
CALL ProcessOrder(
    1014,
    '789 Redwood St, Houston, TX 77004',
    '[{"payment_method": "Credit Card", "account_number": "4111111111111111", "amount": 3499.97}]',
    '789 Redwood St, Houston, TX 77004',
    6.25, -- <-- Add tax rate here
    @order_id
);

-- Check the output
SELECT * FROM order_summary WHERE order_id = @order_id;
SELECT * FROM order_detail WHERE order_id = @order_id;
SELECT * FROM payment_detail WHERE order_id = @order_id;
SELECT * FROM shipping WHERE order_detail_id IN (
    SELECT order_detail_id FROM order_detail WHERE order_id = @order_id
);

-- Teardown: Remove all data so we can run the test again
-- Delete from shipping (depends on order_detail)
DELETE FROM shipping
WHERE order_detail_id IN (
    SELECT order_detail_id FROM order_detail WHERE order_id = @order_id
);
-- Delete from order_detail (depends on order_summary)
DELETE FROM order_detail
WHERE order_id = @order_id;
-- Delete from payment_detail (depends on order_summary)
DELETE FROM payment_detail
WHERE order_id = @order_id;
-- Finally, delete from order_summary
DELETE FROM order_summary
WHERE order_id = @order_id;
-- Restore inventory quantities
UPDATE inventory 
SET quantity = @original_iphone_quantity
WHERE product_id = 1;
UPDATE inventory 
SET quantity = @original_macbook_quantity
WHERE product_id = 6;


-- Stored Procedure 2: Simplified Return Process

-- Test ProcessReturn stored procedure
-- Setup
-- Backup the original order_date
SELECT order_date 
INTO @original_order_date 
FROM order_summary 
WHERE order_id = 11;
-- Set order_date within last 30 days
UPDATE order_summary 
SET order_date = CURDATE() - INTERVAL 5 DAY 
WHERE order_id = 11;

-- Test
-- Declare variables to hold the output
SET @return_id = NULL;
SET @payment_detail_id = NULL;

-- Call the procedure
CALL ProcessReturn(
    23, -- order_detail_id
    1, -- return_quantity
    'Defective', -- return_reason
    6.25, -- tax_rate
    @return_id,
    @payment_detail_id
);
-- Check the output
SELECT @return_id AS return_id, @payment_detail_id AS payment_detail_id;
-- Verify the changes
SELECT * FROM return_refund WHERE return_id = @return_id;
SELECT * FROM payment_detail WHERE payment_detail_id = @payment_detail_id;

-- Teardown
-- Remove test data from return_refund
DELETE FROM return_refund WHERE return_id = @return_id;
-- Remove the refund record from payment_detail
DELETE FROM payment_detail WHERE payment_detail_id = @payment_detail_id;