USE cartwise;

-- Test the CalculateSubtotal function
SELECT CalculateSubtotal(1) AS subtotal;

-- Test the CalculateTotalAmount function
SELECT CalculateTotalAmount(1, 6.25) AS total_amount;

-- Test the GetCustomerLifetimeValue function
SELECT GetCustomerLifetimeValue(1001) AS lifetime_value;