USE cartwise;

-- Query 8: Order Summary and Payment Details
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.customer_id AS customer_id,
    os.order_id,
    os.order_date,
    os.order_status,
    os.shipping_address,
    os.total_amount,
    pd.payment_method,
    pd.billing_address,
    CONCAT('**** **** **** ', RIGHT(pd.account_number, 4)) AS masked_account_number,
    pd.amount AS payment_amount,
    pd.payment_date
FROM 
    customer c
JOIN 
    order_summary os ON c.customer_id = os.customer_id
JOIN 
    payment_detail pd ON os.order_id = pd.order_id
WHERE 
    os.order_id = 1;

-- Query 9: Display order details with product and shipping information
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.customer_id,
    os.order_id,
    od.order_detail_id,
    od.product_id,
    p.product_name,
    od.quantity,
    od.price,
    s.shipping_method,
    s.shipping_cost,
    CAST(s.delivery_date AS DATE) AS expected_delivery_date,
    s.tracking_number,
    CASE 
        WHEN rr.status = 'Refunded' THEN 'Refunded'
        WHEN rr.status = 'Denied' THEN 'Refund Denied'
        ELSE 'None'
    END AS refund_status
FROM
    customer c
JOIN
    order_summary os ON c.customer_id = os.customer_id
JOIN 
    order_detail od ON os.order_id = od.order_id
JOIN 
    product p ON od.product_id = p.product_id
JOIN 
    shipping s ON od.order_detail_id = s.order_detail_id
LEFT JOIN 
    return_refund rr ON od.order_detail_id = rr.order_detail_id
WHERE 
    od.order_id = 1; -- Test with 4

-- Query 12: Get top-rated products with the highest number of reviews
SELECT 
    p.product_id, 
    p.product_name, 
    p.product_brand, 
    AVG(pr.rating) AS avg_rating, 
    COUNT(pr.p_review_id) AS total_reviews
FROM product p
LEFT JOIN product_review pr ON p.product_id = pr.product_id
JOIN product_category c ON p.category_id = c.category_id
WHERE 
    p.product_name LIKE '%laptop%' 
    OR p.product_description LIKE '%laptop%'  
    OR c.category_name LIKE '%laptop%'
    OR p.category_id = 12
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    avg_rating DESC, total_reviews DESC
LIMIT 5;