USE cartwise;

-- Trigger 3: PreventNegativeInventory
-- Test the PreventNegativeInventory trigger
-- This should fail due to the trigger
-- UPDATE inventory
-- SET quantity = -5
-- WHERE product_id = 1;

-- Trigger 4: LogFailedLoginAttempts
-- Test the LogFailedLoginAttempts trigger
SELECT last_login_status
FROM login
WHERE customer_id = 1001;
-- Execution: Update the last_login_status to FALSE
UPDATE login
SET last_login_status = FALSE
WHERE customer_id = 1001;
-- Verify: Check if the number_of_failed_attempts is incremented
SELECT customer_id, number_of_failed_attempts
FROM login_attempt
WHERE customer_id = 1001;
-- Teardown: Remove the test data
UPDATE login
SET last_login_status = TRUE
WHERE customer_id = 1001;

-- Trigger 6: LogAddressChange
-- Test the LogAddressChange trigger
-- Setup: Insert a test customer
SET @original_address_line1 = NULL;
SET @original_address_line2 = NULL;
SET @original_city = NULL;
SET @original_state = NULL;
SET @original_zip = NULL;
SET @original_country = NULL;

SELECT address_line1, address_line2, city, state, zip, country
INTO @original_address_line1, @original_address_line2, @original_city, @original_state, @original_zip, @original_country 
FROM customer 
WHERE customer_id = 1001;

-- Execution: Update the address for the test customer
UPDATE customer
SET address_line1 = '456 Elm St', 
    address_line2 = '',
    city = 'Austin', 
    state = 'TX', 
    zip = '73301', 
    country = 'USA'
WHERE customer_id = 1001;

-- Verify: Check if the changes are logged in the customer_change_log table
SELECT * 
FROM customer_change_log
WHERE customer_id = 1001;

-- Teardown: Remove the test data
UPDATE customer
SET address_line1 = @original_address_line1, 
    address_line2 = @original_address_line2,
    city = @original_city, 
    state = @original_state, 
    zip = @original_zip, 
    country = @original_country
WHERE customer_id = 1001;