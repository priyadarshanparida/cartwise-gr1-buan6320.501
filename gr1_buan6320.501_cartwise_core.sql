
-- Create a database for the E-commerce company "Cartwise Inc."
CREATE DATABASE IF NOT EXISTS cartwise;
-- DROP DATABASE IF EXISTS cartwise;
USE cartwise;

-- Module 1. Customer Onboarding
/* Table 1 - CUSTOMER
Purpose: Store customer information for account management and order processing.
1. Customer ID (cid): Unique identifier for each customer.
2. First Name (fname): First name of the customer.
3. Last Name (lname): Last name of the customer.
4. Date of Birth (dob): Date of birth of the customer.
5. Gender (gender): Gender of the customer.
6. Email (email): Email address of the customer.
7. Phone (phone): Phone number of the customer.
8. Address Line 1 (address_line1): First line of the customer's address.
9. Address Line 2 (address_line2): Second line of the customer's address.
10. City (city): City of the customer's address.
11. State (state): State code of the customer's address.
12. ZIP Code (zip): ZIP code of the customer's address.
13. Country (country): Country of the customer's address.
*/

CREATE TABLE customer (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Table 2 - LOGIN
Purpose: Store login information for customer authentication and account management.
1. Customer ID (cid): Unique identifier for each customer.
2. Password Hash (password_hash): Hashed password for customer login.
3. Registration Date (registration_date): Date and time of customer registration.
4. Last Login Date (last_login_date): Date and time of customer's last login.
5. Is Active (is_active): Flag to indicate if the customer account is active.
*/
CREATE TABLE login (
    cid INT,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login_date TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (cid) REFERENCES customer(cid)
);

-- Query 1: Customer login
-- TODO: Implement password hashing for security
SELECT 
    CONCAT('Welcome ', c.fname, ' ', c.lname, '!') AS welcome_message
FROM 
    customer c
JOIN 
    login l ON c.cid = l.cid
WHERE 
    c.email = 'john.doe@example.com' 
    AND l.password_hash = 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f'
    AND l.is_active = TRUE;

-- Module 2. Product Onboarding
/* Table 3 - PRODUCT CATEGORIES
Purpose: Store product categories for organizing and browsing products.
1. Category ID (category_id): Unique identifier for each category.
2. Category Name (category_name): Name of the category.
3. Parent Category ID (parent_category_id): ID of the parent category (if applicable).
4. Description (description): Description of the category.
*/
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    description TEXT,
    FOREIGN KEY (parent_category_id) REFERENCES product_category(category_id)
);

/* Add index to category_name in product_category
 table for improved search performance. */
CREATE INDEX idx_category_name ON product_category(category_name);

/* Table 4 - PRODUCT
Purpose: Store product information for listing, searching, and ordering products.
1. Product ID (prod_id): Unique identifier for each product.
2. Product Name (prod_name): Name of the product.
3. Brand (prod_brand): Brand of the product.
4. Description (prod_descr): Description of the product.
5. Review (prod_review): Review rating of the product (e.g., 1 to 5).
6. Price (price): Price of the product.
7. Stock (stock): Available stock of the product.
8. Category ID (category_id): ID of the product category.
9. Created At (created_at): Timestamp of product creation.
10. Updated At (updated_at): Timestamp of last product update.
*/
CREATE TABLE product (
    prod_id INT PRIMARY KEY AUTO_INCREMENT,
    prod_name VARCHAR(255) NOT NULL,
    prod_brand VARCHAR(50),
    prod_descr TEXT,
    prod_review DECIMAL(2, 1),
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

/* TODO: Add seller field to the product table for tracking
 suppliers or is there a way to do this with supplier_id? */

-- Add indexes to the product table for improved search performance.
CREATE INDEX idx_product_name ON product(prod_name);
CREATE INDEX idx_description ON product(prod_descr(255));

/* Query 2: search for products based on keywords in
 product name, description, or category name. */
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
    p.prod_name LIKE '%Off-Road%' 
    OR p.prod_descr LIKE '%Off-Road%'  
    OR c.category_name LIKE '%Off-Road%';

-- Module 3: Inventory Management
/* Table 5 - SUPPLIER
Purpose: Store supplier information for managing relationships and inventory.
1. Supplier ID (supplier_id): Unique identifier for each supplier.
2. Supplier Name (supplier_name): Name of the supplier.
3. Supplier Type (supplier_type): Type of supplier (e.g., manufacturer, distributor).
    a. Manufacturers: Companies that produce goods.
    b. Distributors: Companies that buy products from manufacturers and sell them to retailers.
    c. Wholesalers: Companies that sell products in bulk, often at a discount.
    d. Resellers: Companies or individuals that buy products to resell them.
    e. Market Place Sellers: Independent sellers who list their products on the platform.
4. Supplier Rating (supplier_rating): Rating of the supplier (e.g., 1 to 5).
This applies to all types of suppliers exccept Manufacturers. Cartwise is the seller in such cases.
The supplier rating is the average of the ratings from seller reviews.
5. Contact Name (contact_name): Name of the contact person at the supplier.
6. Email (email): Email address of the supplier.
7. Phone (phone): Phone number of the supplier.
8. Address Line 1 (address_line1): First line of the supplier's address.
9. Address Line 2 (address_line2): Second line of the supplier's address.
10. City (city): City of the supplier's address.
11. State (state): State code of the supplier's address.
12. ZIP Code (zip): ZIP code of the supplier's address.
13. Country (country): Country of the supplier's address.
14. Created At (created_at): Timestamp of supplier creation.
15. Updated At (updated_at): Timestamp of last supplier update.
*/
CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    supplier_type ENUM(
        'Manufacturer',
        'Distributor',
        'Wholesaler',
        'Reseller',
        'Market Place Seller'
        ) NOT NULL,
    supplier_rating DECIMAL(2, 1),
    contact_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Table 6 - INVENTORY
Purpose: Store inventory information for tracking product availability and reordering.
1. Inventory ID (inventory_id): Unique identifier for each inventory record.
2. Product ID (product_id): ID of the product in inventory.
3. Supplier ID (supplier_id): ID of the supplier for the product.
4. Quantity (quantity): Available quantity of the product.
5. Location (location): Location of the inventory (e.g., warehouse, store).
6. Reorder Level (reorder_level): Minimum quantity at which to reorder the product.
7. Created At (created_at): Timestamp of inventory record creation.
8. Updated At (updated_at): Timestamp of last inventory update.
*/
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    supplier_id INT,
    quantity INT NOT NULL,
    location VARCHAR(255),
    reorder_level INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(prod_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

-- Query 3: Get inventory details for a specific product
SELECT 
    i.inventory_id,
    p.prod_name,
    i.quantity,
    i.location,
    i.reorder_level
FROM
    inventory i
JOIN
    product p ON i.product_id = p.prod_id
WHERE
    p.prod_id = '1';

-- Query 4: Get inventory details for a specific supplier
SELECT 
    i.inventory_id,
    p.prod_name,
    i.quantity AS stock_quantity,
    i.location,
    i.reorder_level
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.prod_id
WHERE 
    i.supplier_id = 1
ORDER BY 
    p.prod_name;

-- Query 5: Get products below reorder level
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

-- Query 6: Get inventory summary by location
SELECT 
    i.location,
    COUNT(i.inventory_id) AS total_products,
    SUM(i.quantity) AS total_stock,
    SUM(i.quantity * p.price) AS total_value
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.prod_id
GROUP BY 
    i.location
ORDER BY 
    total_value DESC;

-- Module 4: Order Processing
/* Table 7 - SHOPPING CART
Purpose: Store shopping cart information for each customer to track selected products.
1. Cart ID (cart_id): Unique identifier for each shopping cart.
2. Customer ID (customer_id): ID of the customer who owns the cart.
3. Product ID (product_id): ID of the product in the cart.
4. Quantity (quantity): Quantity of the product in the cart.
5. Added At (added_at): Timestamp of when the product was added to the cart.
*/

CREATE TABLE shopping_cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid),
    FOREIGN KEY (product_id) REFERENCES product(prod_id)
);

/* Table 8 - ORDER SUMMARY
Purpose: Store order summary information for tracking and managing customer orders.
1. Order ID (order_id): Unique identifier for each order.
2. Customer ID (customer_id): ID of the customer who placed the order.
3. Order Date (order_date): Date and time of order placement.
4. Total Amount (total_amount): Total amount of the order.
5. Status (order_status): Current status of the order (e.g., failed payment, shipped, delivered).
6. Shipping Address (shipping_address): Address to which the order will be shipped.
7. Billing Address (billing_address): Address to which the bill will be sent.
8. Created At (created_at): Timestamp of order creation.
9. Updated At (updated_at): Timestamp of last order update.
*/
CREATE TABLE order_summary (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status ENUM(
            'Failed Payment',
            'Received',
            'Processing', 
            'Shipped', 
            'Delivered', 
            'Cancelled',
            'Return Initiated',
            'Refunded'
        ) NOT NULL,
    shipping_address VARCHAR(255),
    billing_address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid)
);

/* Table 9 - PAYMENT DETAIL
Purpose: Store payment details for each order to track payment methods and amounts.
1. Payment Detail ID (payment_detail_id): Unique identifier for each payment detail.
2. Order ID (order_id): ID of the order to which the payment belongs.
3. Payment Method (payment_method): Method used for payment (e.g., Credit Card, PayPal, Gift Card).
4. Account Number (account_number): Account number used for the payment.
5. Amount (amount): Amount paid using this payment method.
6. Payment Date (payment_date): Date and time of the payment.
*/
CREATE TABLE payment_detail (
    payment_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method ENUM('Credit Card', 'Gift Card', 'Debit Card') NOT NULL,
    account_number VARCHAR(50),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES order_summary(order_id)
);

/* Table 10 - ORDER DETAIL
Purpose: Store order details for each item in an order to track quantities and prices.
1. Order Detail ID (order_detail_id): Unique identifier for each order detail.
2. Order ID (order_id): ID of the order to which the detail belongs.
3. Product ID (product_id): ID of the product in the order.
4. Quantity (quantity): Quantity of the product in the order.
5. Price (price): Price of the product at the time of order.
*/
CREATE TABLE order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_summary(order_id),
    FOREIGN KEY (product_id) REFERENCES product(prod_id)
);

/* Table 11 - SHIPPING
Purpose: Store shipping information for each order to track delivery details and costs.
TODO refactor to account for multiple shipments per order
1. Shipping ID (shipping_id): Unique identifier for each shipping record.
2. Order Detail ID (order_detail_id): ID of the order detail for which shipping is done.
3. Shipping Method (shipping_method): Method used for shipping (e.g., standard, express).
4. Shipping Cost (shipping_cost): Cost of shipping.
5. Shipping Date (shipping_date): Date and time of shipping.
6. Delivery Date (delivery_date): Expected delivery date.
7. Tracking Number (tracking_number): Tracking number for the shipment.
*/
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_detail_id INT,
    shipping_method VARCHAR(100),
    shipping_cost DECIMAL(10, 2),
    shipping_date TIMESTAMP,
    delivery_date TIMESTAMP,
    tracking_number VARCHAR(100),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id)
);

/* Table 12 - RETURN_REFUND
Purpose: Store return information for tracking and processing product returns.
1. Return ID (return_id): Unique identifier for each return record.
2. Order Detail ID (order_detail_id): ID of the ordered item for which the return is requested.
3. Product ID (product_id): ID of the product being returned.
4. Return Reason (return_reason): Reason for the return.
5. Refund Amount (refund_amount): Amount to be refunded.
6. Status (status): Status of the return (e.g., pending, approved, rejected).
7. Created At (created_at): Timestamp of return request creation.
8. Updated At (updated_at): Timestamp of last return update.
*/
CREATE TABLE return_refund (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    order_detail_id INT,
    product_id INT,
    return_reason VARCHAR(255),
    refund_amount DECIMAL(10, 2),
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id),
    FOREIGN KEY (product_id) REFERENCES product(prod_id)
);

-- TODO Stored Procedure: Process Order
-- TODO Stored Procedure: Process Return
-- TODO Stored Procedure: Calculate and update shipping cost
-- TODO Trigger: Update Order Status on Order Placement
-- TODO Trigger: Update Order Status on Payment
-- TODO Trigger: Update Order Status on Shipping
-- TODO Trigger: Update Order Status on Delivery
-- TODO Trigger: Update Order Status on Return
-- TODO Trigger: Update Inventory on Order Placement
-- TODO Trigger: Update Inventory on Order Cancellation
-- TODO Trigger: Update Inventory on Return Approval
-- TODO Trigger: Update product review in Product table on Product Review table update

-- TODO add algorithm to determine shipping cost?

-- Function 1: Calculate Order Subtotal (total amount before taxes)
DELIMITER //

CREATE FUNCTION CalculateSubtotal(
    order_id INT
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE subtotal DECIMAL(10, 2);

    -- Calculate the subtotal (total amount before taxes)
    SELECT SUM(od.quantity * od.price)
    INTO subtotal
    FROM order_detail od
    WHERE od.order_id = order_id;

    RETURN subtotal;
END //

DELIMITER ;

-- Function 2: Calculate Order Total (total amount after shipping and taxes)
DELIMITER //

CREATE FUNCTION CalculateTotalAmount(
    order_id INT,
    tax_rate DECIMAL(5, 2)
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE subtotal DECIMAL(10, 2);
    DECLARE shipping_cost DECIMAL(10, 2);
    DECLARE total_amount DECIMAL(10, 2);

    -- Calculate the subtotal using the CalculateSubtotal function
    SET subtotal = CalculateSubtotal(order_id);

    -- Calculate the total shipping cost
    SELECT SUM(s.shipping_cost)
    INTO shipping_cost
    FROM shipping s
    JOIN order_detail od ON s.order_detail_id = od.order_detail_id
    WHERE od.order_id = order_id;

    -- Calculate the total amount including taxes and shipping cost
    SET total_amount = subtotal + shipping_cost + ((subtotal + shipping_cost) * tax_rate / 100);

    RETURN total_amount;
END //

DELIMITER ;

-- Test the CalculateTotalAmount function
SELECT CalculateTotalAmount(1, 6.25) AS total_amount;

-- Query 7: Order Summary and Payment Details
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

-- Query 8: Display order details with product and shipping information
SELECT 
    od.order_id,
    od.product_id,
    p.prod_name,
    od.quantity,
    od.price,
    s.shipping_method,
    s.shipping_cost,
    s.shipping_date,
    s.delivery_date,
    s.tracking_number
FROM 
    order_detail od
JOIN 
    product p ON od.product_id = p.prod_id
JOIN 
    shipping s ON od.order_detail_id = s.order_detail_id
WHERE 
    od.order_id = 1;

-- Query 9: Get customer order history
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
/* Table 13 - PRODUCT_REVIEW
Purpose: Store product reviews submitted by customers for feedback and ratings.
1. Review ID (p_review_id): Unique identifier for each product review.
2. Product ID (product_id): ID of the product being reviewed.
3. Customer ID (customer_id): ID of the customer who submitted the review.
4. Rating (rating): Rating given to the product (e.g., 1 to 5).
5. Review Text (review_text): Text of the review.
6. Created At (created_at): Timestamp of when the review was submitted.
*/
CREATE TABLE product_review (
    p_review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(prod_id),
    FOREIGN KEY (customer_id) REFERENCES customer(cid)
);

/* Table 14 - CUSTOMER_SERVICE
1. Ticket ID (ticket_id): Unique identifier for each customer service ticket.
2. Customer ID (customer_id): ID of the customer who raised the ticket.
3. Issue Description (issue_description): Description of the issue.
4. Status (status): Status of the ticket (e.g., open, resolved, closed).
5. Created At (created_at): Timestamp of when the ticket was created.
6. Updated At (updated_at): Timestamp of the last update to the ticket.
*/
CREATE TABLE customer_service (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    issue_description TEXT,
    status ENUM('Open', 'Resolved', 'Closed') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid)
);

/* Table 15 - CONTACT_SELLER
1. Contact ID (contact_id): Unique identifier for each contact record.
2. Customer ID (customer_id): ID of the customer who contacted the seller.
3. Seller ID (seller_id): ID of the seller being contacted.
4. Message (message): Message sent by the customer.
5. Created At (created_at): Timestamp of when the message was sent.
*/
CREATE TABLE contact_seller (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    seller_id INT,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(cid),
    FOREIGN KEY (seller_id) REFERENCES supplier(supplier_id)
);

/* Table 16 - SELLER_REVIEW
Purpose: Store seller reviews submitted by customers for feedback and ratings.
1. Review ID (s_review_id): Unique identifier for each seller review.
2. Seller ID (seller_id): ID of the seller being reviewed.
3. Customer ID (customer_id): ID of the customer who submitted the review.
4. Rating (rating): Rating given to the seller (e.g., 1 to 5).
5. Review Text (review_text): Text of the review.
6. Created At (created_at): Timestamp of when the review was submitted.
*/
CREATE TABLE seller_review (
    s_review_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY (customer_id) REFERENCES customer(cid)
);

-- TODO Trigger: Update prod_review in PRODUCT table on PRODUCT_REVIEW table update

-- Query 10: Get top-rated products with the highest number of reviews
SELECT 
    p.prod_id,
    p.prod_name,
    AVG(pr.rating) AS avg_rating,
    COUNT(pr.p_review_id) AS total_reviews
FROM 
    product p
LEFT JOIN 
    product_review pr ON p.prod_id = pr.product_id
GROUP BY 
    p.prod_id, p.prod_name
ORDER BY 
    avg_rating DESC, total_reviews DESC
LIMIT 5;

-- Query 11: Get unresolved customer service tickets
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

-- Query 12: Get seller performance
SELECT 
    s.supplier_id AS seller_id,
    s.supplier_name AS seller_name,
    ROUND(AVG(sr.rating), 1) AS avg_rating,
    COUNT(sr.s_review_id) AS total_reviews
FROM 
    supplier s
JOIN 
    seller_review sr ON s.supplier_id = sr.seller_id
GROUP BY 
    s.supplier_id, s.supplier_name
HAVING 
    total_reviews > 0
ORDER BY 
    avg_rating DESC, total_reviews DESC;