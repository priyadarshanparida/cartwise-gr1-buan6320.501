USE cartwise;

-- Part I: Customer Journey
-- Module 1. Customer Onboarding
/* Table 1 - CUSTOMER
@Author: Soniya Rajappan
*/
-- Step 1
SELECT * FROM customer LIMIT 5;

/* Query 1: Customer login
@Author: Soniya Rajappan
*/
-- Step 2
SELECT 
    CONCAT('Welcome ', c.fname, ' ', c.lname, '!') AS welcome_message
FROM 
    customer c
JOIN 
    login l ON c.cid = l.cid
WHERE 
    c.email = 'jane.smith@example.com' 
    AND l.password_hash = 'c6ba91b90d922e159893f46c387e5dc1b3dc5c101a5a4522f03b987177a24a91'
    AND l.is_active = TRUE;

-- Module 2. Product Onboarding
/* Query 2: search for products based on keywords in
 product name, description, or category name.
 @Author: Sunayana Jana
*/
-- Step 3
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
    p.prod_name LIKE '%iphone%' 
    OR p.prod_descr LIKE '%iphone%'  
    OR c.category_name LIKE '%iphone%';

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
    p.prod_name LIKE '%shampoo%' 
    OR p.prod_descr LIKE '%shampoo%'  
    OR c.category_name LIKE '%shampoo%';


/* Query 7: Get shopping cart details for a specific customer
 @Author: Sunayana Jana
*/
-- Step 4
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

/* Query 8: Order Summary and Payment Details
@Author: Priyadarshan Parida
*/
-- Step 5
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
-- Step 6
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
-- Step 7
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
-- Step 8
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
/* Query 12: Get top-rated products with the highest number of reviews
@Author: Qurrat Ul Ain
*/
-- Step 9
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

/* Query 14: View seller rating
@Author: Sai Vishnu Malladi
*/
-- Step 10
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

-- Part II: Inventory Management

/* Query 5: Get products below reorder level
@Author: Winnie Manyara
*/
-- Part II: Step 1
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
-- Step 2
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

/* Query 3: Get inventory details for a specific product
@Author: Soniya Rajappan
*/
-- Step 3
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
-- Step 4
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

/* Query 13: Get unresolved customer service tickets
@Author: Sai Vishnu Malladi
*/
-- Part III: Step 1
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