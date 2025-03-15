-- Active: 1739724744769@@127.0.0.1@3306@cartwise

-- Create a database for the E-commerce company Cartwise
CREATE DATABASE cartwise;
-- DROP DATABASE IF EXISTS cartwise;
USE cartwise;

-- Module 1. Customer Onboarding
/* CUSTOMER
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
    gender ENUM('Male', 'Female', 'Other')
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

/* LOGIN
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

-- Query 1: Customer login (Consider converting to a stored procedure)
-- TODO: Implement password hashing for security
SELECT 
    CONCAT('Welcome ', c.fname, ' ', c.lname, '!') AS welcome_message
FROM 
    customer c
JOIN 
    login l ON c.cid = l.cid
WHERE 
    c.email = 'user_email' 
    AND l.password_hash = 'user_password_hash'
    AND l.is_active = TRUE;


-- Create a table for payment methods TODO

-- Module 2. Product Onboarding
/* PRODUCT CATEGORIES
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

/* PRODUCT
1. Product ID (prod_id): Unique identifier for each product.
2. Product Name (prod_name): Name of the product.
3. Description (prod_descr): Description of the product.
4. Price (price): Price of the product.
5. Stock (stock): Available stock of the product.
6. Category ID (category_id): ID of the product category.
7. Inventory ID (inventory_id): ID of the inventory record.
8. Created At (created_at): Timestamp of product creation.
9. Updated At (updated_at): Timestamp of last product update.
*/
CREATE TABLE product (
    prod_id INT PRIMARY KEY AUTO_INCREMENT,
    prod_name VARCHAR(255) NOT NULL,
    prod_descr TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    inventory_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);
-- Add indexes to the product table for improved search performance.
CREATE INDEX idx_product_name ON product(prod_name);
CREATE INDEX idx_description ON product(prod_descr);

/* Query 2: search for products based on keywords in
 product name, description, or category name. */
SELECT 
    p.prod_id,
    p.prod_name,
    p.prod_descr,
    p.price,
    p.stock_quantity,
    c.category_name
FROM 
    product p
JOIN 
    product_category c ON p.category_id = c.category_id
WHERE 
    p.prod_name LIKE '%search_term%' 
    OR p.prod_descr LIKE '%search_term%' 
    OR c.category_name LIKE '%search_term%';

-- Module 3: Inventory management
/* SUPPLIER
1. Manufacturers: Companies that produce goods.
2. Distributors: Companies that buy products from manufacturers and sell them to retailers.
3. Wholesalers: Companies that sell products in bulk, often at a discount.
4. Resellers: Companies or individuals that buy products to resell them.
5. Market Place Sellers: Independent sellers who list their products on the platform.
*/
CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    supplier_type ENUM('Manufacturer', 'Distributor', 'Wholesaler', 'Reseller', 'Market Place Seller') NOT NULL,
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

/* INVENTORY
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
    p.prod_id = 'product_id';

-- Module 4: Order Processing
/* SHOPPING CART
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

/* ORDER SUMMARY
1. Order ID (order_id): Unique identifier for each order.
2. Customer ID (customer_id): ID of the customer who placed the order.
3. Order Date (order_date): Date and time of order placement.
4. Total Amount (total_amount): Total amount of the order.
5. Status (status): Current status of the order (e.g., pending, shipped, delivered).
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
    status ENUM(
            'Pending',
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

/* ORDER DETAIL
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

/* SHIPPING: TODO refactor to account for multiple shipments per order
1. Shipping ID (shipping_id): Unique identifier for each shipping record.
2. Order ID (order_id): ID of the order for which shipping is done.
3. Shipping Method (shipping_method): Method used for shipping (e.g., standard, express).
4. Shipping Cost (shipping_cost): Cost of shipping.
5. Shipping Date (shipping_date): Date and time of shipping.
6. Delivery Date (delivery_date): Expected delivery date.
7. Tracking Number (tracking_number): Tracking number for the shipment.
*/
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    shipping_method VARCHAR(100),
    shipping_cost DECIMAL(10, 2),
    shipping_date TIMESTAMP,
    delivery_date TIMESTAMP,
    tracking_number VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES order_summary(order_id)
);