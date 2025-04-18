-- Create a database for the E-commerce company "Cartwise Inc."
CREATE DATABASE IF NOT EXISTS cartwise;
-- DROP DATABASE IF EXISTS cartwise;
USE cartwise;

-- ********************* Step 1: Create Tables *********************
-- Module 1. Customer Onboarding
/* Table 1 - CUSTOMER
@Author: Soniya Rajappan
Purpose: Store customer information for account management and order processing.
1. Customer ID (customer_id): Unique identifier for each customer.
2. First Name (first_name): First name of the customer.
3. Last Name (last_name): Last name of the customer.
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
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
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
@Author: Soniya Rajappan
Purpose: Store login information for customer authentication and account management.
1. Customer ID (customer_id): Unique identifier for each customer.
2. Password Hash (password_hash): Hashed password for customer login.
3. Registration Date (registration_date): Date and time of customer registration.
4. Last Login Status (last_login_status): Flag to indicate if last login was successful.
5. Last Login Date (last_login_date): Date and time of customer's last login.
6. Is Active (is_active): Flag to indicate if the customer account is active.
*/
CREATE TABLE login (
    customer_id INT,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login_status BOOLEAN DEFAULT FALSE,
    last_login_date TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Module 2. Product Onboarding
/* Table 3 - PRODUCT CATEGORIES
@Author: Sunayana Jana
Purpose: Store product categories for organizing and browsing products.
1. Category ID (category_id): Unique identifier for each category.
2. Category Name (category_name): Name of the category.
3. Parent Category ID (parent_category_id): ID of the parent category (if applicable).
4. Category Description (category_description): Description of the category.
*/
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    category_description TEXT,
    FOREIGN KEY (parent_category_id) REFERENCES product_category(category_id)
);

/* Table 4 - PRODUCT
@Author: Sunayana Jana
Purpose: Store product information for listing, searching, and ordering products.
1. Product ID (product_id): Unique identifier for each product.
2. Product Name (product_name): Name of the product.
3. Brand (product_brand): Brand of the product.
4. Description (product_description): Description of the product.
5. Review (product_review): Review rating of the product (e.g., 1 to 5).
6. Price (price): Price of the product.
8. Category ID (category_id): ID of the product category.
9. Created At (created_at): Timestamp of product creation.
10. Updated At (updated_at): Timestamp of last product update.
*/
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_brand VARCHAR(50),
    product_description TEXT,
    product_review DECIMAL(2, 1),
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Module 3: Inventory Management
/* Table 5 - SUPPLIER
@Author: Winnie Manyara
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
@Author: Winnie Manyara
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
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

-- Module 4: Order Processing
/* Table 7 - SHOPPING CART
@Author: Priyadarshan Parida
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
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

/* Table 8 - ORDER SUMMARY
@Author: Priyadarshan Parida
Purpose: Store order summary information for tracking and managing customer orders.
1. Order ID (order_id): Unique identifier for each order.
2. Customer ID (customer_id): ID of the customer who placed the order.
3. Order Date (order_date): Date and time of order placement.
4. Total Amount (total_amount): Total amount of the order.
5. Status (order_status): Current status of the order (e.g., failed payment, shipped, delivered).
6. Shipping Address (shipping_address): Address to which the order will be shipped.
7. Created At (created_at): Timestamp of order creation.
8. Updated At (updated_at): Timestamp of last order update.
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
            'Cancelled'
        ) NOT NULL,
    shipping_address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

/* Table 9 - PAYMENT DETAIL
@Author: Priyadarshan Parida
Purpose: Store payment details for each order to track payment methods and amounts.
1. Payment Detail ID (payment_detail_id): Unique identifier for each payment detail.
2. Order ID (order_id): ID of the order to which the payment belongs.
3. Payment Method (payment_method): Method used for payment (e.g., Credit Card, PayPal, Gift Card).
4. Account Number (account_number): Account number used for the payment.
5. Amount (amount): Amount paid using this payment method.
6. Payment Date (payment_date): Date and time of the payment.
7. Billing Address (billing_address): Address to which the bill will be sent.
*/
CREATE TABLE payment_detail (
    payment_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method ENUM('Credit Card', 'Gift Card', 'Debit Card') NOT NULL,
    account_number VARCHAR(50),
    billing_address VARCHAR(255),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES order_summary(order_id)
);

/* Table 10 - ORDER DETAIL
@Author: Priyadarshan Parida
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
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

/* Table 11 - SHIPPING
@Author: Priyadarshan Parida
Purpose: Store shipping information for each order to track delivery details and costs.
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
@Author: Priyadarshan Parida
Purpose: Store return information for tracking and processing product returns.
1. Return ID (return_id): Unique identifier for each return record.
2. Order Detail ID (order_detail_id): ID of the ordered item for which the return is requested.
3. Product ID (product_id): ID of the product being returned.
4. Return Quantity (return_quantity): Quantity of the product being returned.
5. Return Reason (return_reason): Reason for the return.
6. Refund Amount (refund_amount): Amount to be refunded.
7. Status (status): Status of the return (e.g., pending, approved, rejected).
8. Created At (created_at): Timestamp of return request creation.
9. Updated At (updated_at): Timestamp of last return update.
*/
CREATE TABLE return_refund (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    order_detail_id INT,
    product_id INT,
    return_quantity INT,
    return_reason ENUM('Defective', 'Damaged', 'Wrong Item', 'No Longer Needed', 'Other'),
    refund_amount DECIMAL(10, 2),
    status ENUM('Refunded', 'Denied') DEFAULT 'Denied',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Module 5: Customer Feedback
/* Table 13 - PRODUCT_REVIEW
@Author: Qurrat Ul Ain
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
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

/* Table 14 - CUSTOMER_SERVICE
@Author: Qurrat Ul Ain
1. Ticket ID (ticket_id): Unique identifier for each customer service ticket.
2. Customer ID (customer_id): ID of the customer who raised the ticket.
3. Order Detail ID (order_detail_id): ID of the order detail related to the issue.
4. Issue Type (issue_type): Type of issue (e.g., Product Issue, Order Issue, Payment Issue, Shipping Issue, Other).
5. Issue Description (issue_description): Description of the issue.
6. Conversation (conversation): Conversation history related to the issue.
7. Status (status): Status of the ticket (e.g., Open, Resolved, Closed).
8. Created At (created_at): Timestamp of when the ticket was created.
9. Updated At (updated_at): Timestamp of the last update to the ticket.
*/

CREATE TABLE customer_service (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_detail_id INT,
    issue_type ENUM('Product Issue', 'Order Issue', 'Payment Issue', 'Shipping Issue', 'Other'),
    issue_description TEXT,
    conversation TEXT,
    status ENUM('Open', 'Resolved', 'Closed') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id)
);

/* Table 15 - CONTACT_SELLER
@Author: Sai Vishnu Malladi
Purpose: Store customer-seller communication for inquiries and issues.
1. Issue ID (issue_id): Unique identifier for each contact record.
2. Customer ID (customer_id): ID of the customer who contacted the seller.
3. Order Detail ID (order_detail_id): ID of the order detail related to the issue.
4. Contact Reason (contact_reason): Reason for contacting the seller (e.g., Product Inquiry, Warranty Inquiry, Price Inquiry, Delivery Inquiry, Other).
5. Seller ID (seller_id): ID of the seller being contacted.
6. Conversation (conversation): Conversation history between the customer and the seller.
7. Created At (created_at): Timestamp of when the message was sent.
*/
CREATE TABLE contact_seller (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_detail_id INT,
    contact_reason ENUM('Product Inquiry', 'Warranty Inquiry', 'Price Inquiry', 'Delivery Inquiry', 'Other'),
    seller_id INT,
    conversation TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id),
    FOREIGN KEY (seller_id) REFERENCES supplier(supplier_id)
);

/* Table 16 - SELLER_REVIEW
@Author: Sai Vishnu Malladi
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
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


-- Module 6: Audits
/* TABLE 17: CUSTOMER_CHANGE_LOG
@Author: Priyadarshan Parida
Purpose: Log changes to customer address and email before and after updates.
1. Log ID (log_id): Unique identifier for each log entry.
2. Customer ID (customer_id): ID of the customer whose data was changed.
3. Field Changed (field_changed): The field that was updated (e.g., email, address_line1, city, etc.).
4. Old Value (old_value): The value of the field before the update.
5. New Value (new_value): The value of the field after the update.
6. Changed At (changed_at): Timestamp of when the change occurred.
7. Changed By (changed_by): User or system that made the change (optional).
*/

CREATE TABLE customer_change_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    field_changed VARCHAR(50) NOT NULL,
    old_value VARCHAR(255),
    new_value VARCHAR(255),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(50) DEFAULT 'System',
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

/* TABLE 18: ARCHIVED_CUSTOMER
@Author: Priyadarshan Parida
Purpose: Store details of customers who are deleted from the customer table.
1. Archived ID (archived_id): Unique identifier for each archived record.
2. Customer ID (customer_id): ID of the deleted customer.
3. First Name (first_name): First name of the customer.
4. Last Name (last_name): Last name of the customer.
5. Email (email): Email address of the customer.
6. Phone (phone): Phone number of the customer.
7. Address Line 1 (address_line1): First line of the customer's address.
8. Address Line 2 (address_line2): Second line of the customer's address.
9. City (city): City of the customer's address.
10. State (state): State code of the customer's address.
11. ZIP Code (zip): ZIP code of the customer's address.
12. Country (country): Country of the customer's address.
13. Archived At (archived_at): Timestamp of when the customer was archived.
*/

CREATE TABLE archived_customer (
    archived_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(30) NOT NULL,
    archived_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* TABLE 19: LOGIN_ATTEMPT
@Author: Priyadarshan Parida
Purpose: Log failed login attempts for security and auditing purposes.
1. Attempt ID (attempt_id): Unique identifier for each login attempt.
2. Customer ID (customer_id): ID of the customer attempting to log in.
3. Number of Failed Attempts (number_of_failed_attempts): Number of failed login attempts.
*/
CREATE TABLE login_attempt (
    attempt_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    number_of_failed_attempts INT DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Module 7: Location Lookup
/* TABLE 20: STATE_LOOKUP
@Author: Priyadarshan Parida
Purpose: Store state codes and their corresponding state names.
1. State Code (state_code): Unique code for each state.
2. State Name (state_name): Name of the state.
*/

CREATE TABLE state_lookup (
    state_code CHAR(2) PRIMARY KEY,
    state_name VARCHAR(50) NOT NULL
);

/* TABLE 21: CITY_LOOKUP
@Author: Priyadarshan Parida
Purpose: Store city names and their corresponding state codes.
1. City ID (city_id): Unique identifier for each city.
2. City Name (city_name): Name of the city.
3. State Code (state_code): Code of the state to which the city belongs.
*/

CREATE TABLE city_lookup (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    state_code CHAR(2) NOT NULL,
    FOREIGN KEY (state_code) REFERENCES state_lookup(state_code)
);

/* TABLE 22: ZIP_LOOKUP
@Author: Priyadarshan Parida
Purpose: Store zip codes and their corresponding city and state.
1. Zip Code (zip_code): Unique zip code.
2. City ID (city_id): ID of the city to which the zip code belongs.
*/

CREATE TABLE zip_lookup (
    zip_code VARCHAR(10) PRIMARY KEY,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city_lookup(city_id)
);

-- ********************* Step 2: Populate Tables *********************
-- Module 1. Customer Onboarding
USE cartwise;

-- Insert 1: Insert records into the customer table
-- @Author: Soniya Rajappan
INSERT INTO customer (customer_id, first_name, last_name, dob, gender, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
(1000, 'John', 'Doe', '1985-05-15', 'Male', 'john.doe@example.com', '1234567890', '123 Main St', NULL, 'Dallas', 'TX', '75001', 'USA'),
(1001, 'Jane', 'Smith', '1990-07-20', 'Female', 'jane.smith@example.com', '9876543210', '456 Elm St', 'Apt 2B', 'Austin', 'TX', '73301', 'USA'),
(1002, 'Alice', 'Johnson', '1988-03-12', 'Female', 'alice.johnson@example.com', '5551234567', '789 Oak St', NULL, 'Houston', 'TX', '77001', 'USA'),
(1003, 'Bob', 'Brown', '1975-11-05', 'Male', 'bob.brown@example.com', '4449876543', '321 Pine St', 'Suite 300', 'San Antonio', 'TX', '78201', 'USA'),
(1004, 'Charlie', 'Davis', '2000-01-25', 'Other', 'charlie.davis@example.com', '3334567890', '654 Maple St', NULL, 'Dallas', 'TX', '75002', 'USA'),
(1005, 'Emily', 'Wilson', '1995-09-10', 'Female', 'emily.wilson@example.com', '2229876543', '987 Cedar St', 'Apt 1A', 'Austin', 'TX', '73302', 'USA'),
(1006, 'David', 'Taylor', '1982-06-18', 'Male', 'david.taylor@example.com', '1111234567', '123 Birch St', NULL, 'Houston', 'TX', '77002', 'USA'),
(1007, 'Sophia', 'Anderson', '1998-12-30', 'Female', 'sophia.anderson@example.com', '6669876543', '456 Walnut St', 'Suite 400', 'San Antonio', 'TX', '78202', 'USA'),
(1008, 'Michael', 'Thomas', '1978-04-22', 'Male', 'michael.thomas@example.com', '7774567890', '789 Spruce St', NULL, 'Dallas', 'TX', '75003', 'USA'),
(1009, 'Olivia', 'Moore', '1993-08-14', 'Female', 'olivia.moore@example.com', '8881234567', '321 Cherry St', 'Apt 3C', 'Austin', 'TX', '73303', 'USA'),
(1010, 'Ethan', 'Martin', '1987-02-11', 'Male', 'ethan.martin@example.com', '9999876543', '654 Willow St', NULL, 'Houston', 'TX', '77003', 'USA'),
(1011, 'Isabella', 'Jackson', '1992-10-05', 'Female', 'isabella.jackson@example.com', '1114567890', '987 Poplar St', 'Suite 500', 'San Antonio', 'TX', '78203', 'USA'),
(1012, 'James', 'White', '1980-03-30', 'Male', 'james.white@example.com', '2221234567', '123 Ash St', NULL, 'Dallas', 'TX', '75004', 'USA'),
(1013, 'Mia', 'Harris', '1997-07-07', 'Female', 'mia.harris@example.com', '3339876543', '456 Cypress St', 'Apt 4D', 'Austin', 'TX', '73304', 'USA'),
(1014, 'Alexander', 'Clark', '1983-01-19', 'Male', 'alexander.clark@example.com', '4444567890', '789 Redwood St', NULL, 'Houston', 'TX', '77004', 'USA');
SELECT * FROM customer;

-- Insert 2: Insert records into the login table
-- @Author: Soniya Rajappan
INSERT INTO login (customer_id, password_hash, registration_date, last_login_status, last_login_date, is_active) VALUES
(1000, SHA2('password123', 256), '2023-01-01 10:00:00', TRUE, '2025-03-20 15:30:00', TRUE),
(1001, SHA2('password456', 256), '2023-01-02 11:00:00', TRUE, '2025-03-19 14:20:00', TRUE),
(1002, SHA2('password789', 256), '2023-01-03 12:00:00', TRUE, '2025-03-18 13:10:00', TRUE),
(1003, SHA2('password321', 256), '2023-01-04 13:00:00', TRUE, '2025-03-17 12:00:00', TRUE),
(1004, SHA2('password654', 256), '2023-01-05 14:00:00', TRUE, '2025-03-16 11:50:00', TRUE),
(1005, SHA2('password987', 256), '2023-01-06 15:00:00', TRUE, '2025-03-15 10:40:00', TRUE),
(1006, SHA2('password111', 256), '2023-01-07 16:00:00', TRUE, '2025-03-14 09:30:00', TRUE),
(1007, SHA2('password222', 256), '2023-01-08 17:00:00', TRUE, '2025-03-13 08:20:00', TRUE),
(1008, SHA2('password333', 256), '2023-01-09 18:00:00', TRUE, '2025-03-12 07:10:00', TRUE),
(1009, SHA2('password444', 256), '2023-01-10 19:00:00', TRUE, '2025-03-11 06:00:00', TRUE),
(1010, SHA2('password555', 256), '2023-01-11 20:00:00', TRUE, '2025-03-10 05:50:00', TRUE),
(1011, SHA2('password666', 256), '2023-01-12 21:00:00', TRUE, '2025-03-09 04:40:00', TRUE),
(1012, SHA2('password777', 256), '2023-01-13 22:00:00', TRUE, '2025-03-08 03:30:00', TRUE),
(1013, SHA2('password888', 256), '2023-01-14 23:00:00', TRUE, '2025-03-07 02:20:00', TRUE),
(1014, SHA2('password999', 256), '2023-01-15 09:00:00', TRUE, '2025-03-06 01:10:00', TRUE);
SELECT * FROM login;

-- Module 2. Product Onboarding
USE cartwise;

-- Insert 3: Insert records into the product_category table
-- @Author: Sunayana Jana
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
-- Parent Categories
(1, 'Electronics', NULL, 'Devices and gadgets for everyday use'),
(2, 'Home Appliances', NULL, 'Appliances for household needs'),
(3, 'Furniture', NULL, 'Furniture for home and office'),
(4, 'Clothing', NULL, 'Apparel for men, women, and kids'),
(5, 'Sports and Outdoors', NULL, 'Equipment and gear for sports and outdoor activities'),
(6, 'Beauty and Personal Care', NULL, 'Products for beauty and personal hygiene'),
(7, 'Toys and Games', NULL, 'Toys and games for children and adults'),
(8, 'Automotive', NULL, 'Products and accessories for vehicles'),
(9, 'Groceries', NULL, 'Everyday food and household items'),
(10, 'Health and Wellness', NULL, 'Products for health and well-being');

-- Subcategories for Electronics
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(11, 'Mobile Phones', 1, 'Smartphones and feature phones'),
(12, 'Laptops', 1, 'Personal and professional laptops'),
(13, 'Cameras', 1, 'Digital and DSLR cameras');

-- Subcategories for Home Appliances
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(14, 'Refrigerators', 2, 'Cooling and storage appliances'),
(15, 'Washing Machines', 2, 'Laundry appliances'),
-- TODO Delete this subcategory and it's products.
(16, 'Air Conditioners', 2, 'Cooling and air purification appliances');

-- Subcategories for Furniture
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(17, 'Sofas', 3, 'Comfortable seating for living rooms'),
(18, 'Beds', 3, 'Beds and mattresses for bedrooms'),
(19, 'Office Chairs', 3, 'Chairs for office use');

-- Subcategories for Clothing
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(20, 'Men''s Clothing', 4, 'Apparel for men'),
(21, 'Women''s Clothing', 4, 'Apparel for women'),
(22, 'Kids'' Clothing', 4, 'Apparel for children');

-- Subcategories for Sports and Outdoors
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(23, 'Fitness Equipment', 5, 'Equipment for fitness and exercise'),
(24, 'Outdoor Gear', 5, 'Gear for outdoor activities'),
(25, 'Sportswear', 5, 'Clothing for sports');

-- Subcategories for Beauty and Personal Care
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(26, 'Skincare', 6, 'Products for skincare routines'),
(27, 'Haircare', 6, 'Products for hair care'),
(28, 'Makeup', 6, 'Cosmetics and makeup products');

-- Subcategories for Toys and Games
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(29, 'Action Figures', 7, 'Collectible and playable action figures'),
(30, 'Board Games', 7, 'Games for family and friends'),
(31, 'Educational Toys', 7, 'Toys for learning and development');

-- Subcategories for Automotive
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(32, 'Car Accessories', 8, 'Accessories for cars'),
(33, 'Motorcycle Gear', 8, 'Gear for motorcycle riders'),
(34, 'Tires', 8, 'Tires for vehicles');

-- Subcategories for Groceries
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(35, 'Fresh Produce', 9, 'Fruits and vegetables'),
(36, 'Packaged Foods', 9, 'Packaged and processed foods'),
(37, 'Beverages', 9, 'Drinks and beverages');

-- Subcategories for Health and Wellness
INSERT INTO product_category (category_id, category_name, parent_category_id, category_description) VALUES
(38, 'Vitamins & Supplements', 10, 'Health supplements and vitamins'),
(39, 'Medical Equipment', 10, 'Equipment for medical use'),
(40, 'Personal Care', 10, 'Products for personal hygiene');

SELECT * FROM product_category;

/* Insert 4: Insert records into the product table
@Author: Sunayana Jana
*/
-- Electronics: Mobile Phones
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(1, 'iPhone 14', 'Apple', 'Latest Apple smartphone with A15 Bionic chip', 4.8, 999.99, 11),
(2, 'Samsung Galaxy S23', 'Samsung', 'Flagship Samsung smartphone with Snapdragon 8 Gen 2', 4.7, 899.99, 11),
(3, 'Google Pixel 7', 'Google', 'Google smartphone with advanced AI features', 4.6, 599.99, 11),
(4, 'OnePlus 11', 'OnePlus', 'High-performance smartphone with fast charging', 4.5, 699.99, 11),
(5, 'Xiaomi Redmi Note 12', 'Xiaomi', 'Affordable smartphone with great features', 4.3, 299.99, 11);

-- Electronics: Laptops
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(6, 'MacBook Pro 16"', 'Apple', 'Apple laptop with M2 Pro chip', 4.9, 2499.99, 12),
(7, 'Dell XPS 13', 'Dell', 'Compact and powerful ultrabook', 4.8, 1299.99, 12),
(8, 'HP Spectre x360', 'HP', 'Convertible laptop with touchscreen', 4.7, 1399.99, 12),
(9, 'Lenovo ThinkPad X1 Carbon', 'Lenovo', 'Business laptop with robust build', 4.6, 1599.99, 12),
(10, 'Asus ROG Zephyrus G14', 'Asus', 'Gaming laptop with Ryzen 9 processor', 4.5, 1799.99, 12);

-- Electronics: Cameras
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(11, 'Canon EOS R5', 'Canon', 'Professional mirrorless camera with 45MP sensor', 4.9, 3899.99, 13),
(12, 'Sony Alpha a7 IV', 'Sony', 'Full-frame mirrorless camera with 33MP sensor', 4.8, 2499.99, 13),
(13, 'Nikon Z6 II', 'Nikon', 'Versatile mirrorless camera for photography and video', 4.7, 1999.99, 13),
(14, 'Fujifilm X-T4', 'Fujifilm', 'APS-C mirrorless camera with retro design', 4.6, 1699.99, 13),
(15, 'Panasonic Lumix GH6', 'Panasonic', 'Micro Four Thirds camera for video creators', 4.5, 2199.99, 13);

-- Home Appliances: Refrigerators
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(16, 'LG InstaView Refrigerator', 'LG', 'Smart refrigerator with InstaView technology', 4.8, 2999.99, 14),
(17, 'Samsung Family Hub', 'Samsung', 'Refrigerator with touchscreen and smart features', 4.7, 3499.99, 14),
(18, 'Whirlpool Double Door', 'Whirlpool', 'Energy-efficient double-door refrigerator', 4.6, 1299.99, 14),
(19, 'GE French Door Refrigerator', 'GE', 'Spacious refrigerator with French doors', 4.5, 2499.99, 14),
(20, 'Bosch Bottom Freezer', 'Bosch', 'Refrigerator with bottom freezer and energy efficiency', 4.4, 1999.99, 14);

-- Home Appliances: Washing Machines
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(21, 'Bosch Front Load Washer', 'Bosch', 'High-efficiency front-load washing machine', 4.8, 899.99, 15),
(22, 'LG Top Load Washer', 'LG', 'Top-load washing machine with smart features', 4.7, 799.99, 15),
(23, 'Samsung EcoBubble Washer', 'Samsung', 'EcoBubble technology for efficient cleaning', 4.6, 999.99, 15),
(24, 'Whirlpool Semi-Automatic Washer', 'Whirlpool', 'Affordable semi-automatic washing machine', 4.5, 499.99, 15),
(25, 'IFB Fully Automatic Washer', 'IFB', 'Fully automatic washing machine with advanced features', 4.4, 1099.99, 15);

-- Home Appliances: Air Conditioners
-- TODO Delete this subcategory and its products.
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(26, 'Daikin Split AC', 'Daikin', 'Energy-efficient split air conditioner with inverter technology', 4.8, 1199.99, 16),
(27, 'LG Dual Inverter AC', 'LG', 'Dual inverter air conditioner with fast cooling', 4.7, 1299.99, 16),
(28, 'Samsung Wind-Free AC', 'Samsung', 'Air conditioner with wind-free cooling technology', 4.6, 1399.99, 16),
(29, 'Voltas Window AC', 'Voltas', 'Affordable window air conditioner for small rooms', 4.5, 699.99, 16),
(30, 'Hitachi Split AC', 'Hitachi', 'Premium split air conditioner with advanced features', 4.4, 1499.99, 16);

-- Furniture: Sofas
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(31, 'Ikea Ektorp Sofa', 'Ikea', 'Comfortable and stylish sofa for living rooms', 4.8, 499.99, 17),
(32, 'Ashley Recliner Sofa', 'Ashley', 'Recliner sofa with premium comfort', 4.7, 899.99, 17),
(33, 'West Elm Sectional Sofa', 'West Elm', 'Modern sectional sofa for large spaces', 4.6, 1299.99, 17),
(34, 'Wayfair Loveseat', 'Wayfair', 'Compact loveseat for small spaces', 4.5, 399.99, 17),
(35, 'La-Z-Boy Recliner', 'La-Z-Boy', 'Classic recliner with plush comfort', 4.4, 699.99, 17);

-- Furniture: Beds
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(36, 'Ikea Malm Bed Frame', 'Ikea', 'Minimalist bed frame with storage', 4.8, 299.99, 18),
(37, 'Zinus Memory Foam Mattress', 'Zinus', 'Comfortable memory foam mattress', 4.7, 399.99, 18),
(38, 'Ashley King Bed', 'Ashley', 'Spacious king-size bed with headboard', 4.6, 799.99, 18),
(39, 'Wayfair Twin Bed', 'Wayfair', 'Compact twin bed for kids or guests', 4.5, 199.99, 18),
(40, 'Tempur-Pedic Adjustable Bed', 'Tempur-Pedic', 'Adjustable bed frame with premium comfort', 4.4, 1299.99, 18);

-- Furniture: Office Chairs
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(41, 'Herman Miller Aeron Chair', 'Herman Miller', 'Ergonomic office chair with lumbar support', 4.9, 1399.99, 19),
(42, 'Steelcase Leap Chair', 'Steelcase', 'Adjustable office chair with premium comfort', 4.8, 999.99, 19),
(43, 'Ikea Markus Chair', 'Ikea', 'Affordable and comfortable office chair', 4.7, 199.99, 19),
(44, 'AmazonBasics Mesh Chair', 'AmazonBasics', 'Budget-friendly mesh office chair', 4.6, 99.99, 19),
(45, 'Branch Ergonomic Chair', 'Branch', 'Stylish and supportive office chair', 4.5, 349.99, 19);

-- Clothing: Men’s Clothing
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(46, 'Levi’s 501 Jeans', 'Levi’s', 'Classic straight-fit jeans for men', 4.8, 69.99, 20),
(47, 'Nike Dri-FIT T-Shirt', 'Nike', 'Moisture-wicking t-shirt for active men', 4.7, 29.99, 20),
(48, 'Adidas Track Pants', 'Adidas', 'Comfortable track pants for workouts', 4.6, 49.99, 20),
(49, 'Ralph Lauren Polo Shirt', 'Ralph Lauren', 'Classic polo shirt for casual wear', 4.5, 89.99, 20),
(50, 'Under Armour Hoodie', 'Under Armour', 'Warm and lightweight hoodie for men', 4.4, 59.99, 20);

-- Clothing: Women’s Clothing
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(51, 'Zara Summer Dress', 'Zara', 'Lightweight and stylish summer dress', 4.8, 79.99, 21),
(52, 'H&M Blouse', 'H&M', 'Elegant blouse for casual and formal wear', 4.7, 39.99, 21),
(53, 'Uniqlo Ultra Light Down Jacket', 'Uniqlo', 'Warm and lightweight jacket for winter', 4.6, 129.99, 21),
(54, 'Calvin Klein Skinny Jeans', 'Calvin Klein', 'Stylish skinny jeans for women', 4.5, 99.99, 21),
(55, 'Victoria’s Secret Pajama Set', 'Victoria’s Secret', 'Comfortable and stylish pajama set', 4.4, 49.99, 21);

-- Clothing: Kids’ Clothing
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(56, 'Carter’s Baby Onesie', 'Carter’s', 'Soft and comfortable onesie for babies', 4.9, 19.99, 22),
(57, 'Gap Kids Hoodie', 'Gap', 'Warm and stylish hoodie for kids', 4.8, 39.99, 22),
(58, 'Old Navy Kids Jeans', 'Old Navy', 'Durable and comfortable jeans for kids', 4.7, 29.99, 22),
(59, 'Nike Kids T-Shirt', 'Nike', 'Breathable and lightweight t-shirt for kids', 4.6, 24.99, 22),
(60, 'Adidas Kids Track Pants', 'Adidas', 'Comfortable track pants for active kids', 4.5, 34.99, 22);

-- Sports & Outdoors: Fitness Equipment
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(61, 'Peloton Bike', 'Peloton', 'High-tech exercise bike with live classes', 4.9, 2499.99, 23),
(62, 'Bowflex Dumbbells', 'Bowflex', 'Adjustable dumbbells for strength training', 4.8, 399.99, 23),
(63, 'Yoga Mat', 'Manduka', 'Non-slip yoga mat for workouts', 4.7, 19.99, 23),
(64, 'Treadmill', 'NordicTrack', 'High-performance treadmill with incline control', 4.6, 1299.99, 23),
(65, 'Rowing Machine', 'Concept2', 'Rowing machine for full-body workouts', 4.5, 999.99, 23);

-- Sports & Outdoors: Outdoor Gear
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(66, 'Tent', 'Coleman', 'Spacious and durable camping tent', 4.8, 199.99, 24),
(67, 'Sleeping Bag', 'REI', 'Warm and lightweight sleeping bag', 4.7, 99.99, 24),
(68, 'Hiking Backpack', 'Osprey', 'Comfortable and spacious hiking backpack', 4.6, 149.99, 24),
(69, 'Camping Stove', 'Jetboil', 'Portable camping stove for outdoor cooking', 4.5, 89.99, 24),
(70, 'Trekking Poles', 'Black Diamond', 'Lightweight trekking poles for hiking', 4.4, 59.99, 24);

-- Sports & Outdoors: Sportswear
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(71, 'Nike Running Shoes', 'Nike', 'Lightweight and comfortable running shoes', 4.9, 129.99, 25),
(72, 'Adidas Soccer Jersey', 'Adidas', 'Breathable and stylish soccer jersey', 4.8, 79.99, 25),
(73, 'Under Armour Compression Shorts', 'Under Armour', 'Moisture-wicking compression shorts', 4.7, 39.99, 25),
(74, 'Puma Sports Bra', 'Puma', 'Supportive and comfortable sports bra', 4.6, 49.99, 25),
(75, 'Reebok Training Gloves', 'Reebok', 'Durable gloves for weightlifting', 4.5, 29.99, 25);

-- Beauty & Personal Care: Skincare
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(76, 'CeraVe Moisturizing Cream', 'CeraVe', 'Hydrating cream for dry skin', 4.9, 19.99, 26),
(77, 'Neutrogena Sunscreen', 'Neutrogena', 'Broad-spectrum SPF 50 sunscreen', 4.8, 14.99, 26),
(78, 'The Ordinary Niacinamide Serum', 'The Ordinary', 'Serum for reducing blemishes', 4.7, 9.99, 26),
(79, 'La Roche-Posay Cleanser', 'La Roche-Posay', 'Gentle cleanser for sensitive skin', 4.6, 12.99, 26),
(80, 'Aveeno Daily Moisturizer', 'Aveeno', 'Moisturizer with SPF for daily use', 4.5, 15.99, 26);

-- Beauty & Personal Care: Haircare
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(81, 'Pantene Pro-V Shampoo', 'Pantene', 'Shampoo for smooth and shiny hair', 4.8, 6.99, 27),
(82, 'Head & Shoulders Anti-Dandruff Shampoo', 'Head & Shoulders', 'Shampoo for dandruff control', 4.7, 7.99, 27),
(83, 'Moroccanoil Treatment', 'Moroccanoil', 'Hair oil for nourishment and shine', 4.6, 29.99, 27),
(84, 'OGX Coconut Milk Conditioner', 'OGX', 'Conditioner for soft and hydrated hair', 4.5, 8.99, 27),
(85, 'Tresemme Heat Protectant Spray', 'Tresemme', 'Spray for protecting hair from heat damage', 4.4, 5.99, 27);

-- Beauty & Personal Care: Makeup
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(86, 'Maybelline Fit Me Foundation', 'Maybelline', 'Lightweight foundation for natural coverage', 4.8, 7.99, 28),
(87, 'L’Oreal Paris Mascara', 'L’Oreal', 'Volumizing mascara for bold lashes', 4.7, 9.99, 28),
(88, 'MAC Lipstick', 'MAC', 'Long-lasting lipstick in various shades', 4.6, 19.99, 28),
(89, 'NYX Setting Spray', 'NYX', 'Spray for long-lasting makeup', 4.5, 8.99, 28),
(90, 'Revlon Eyeliner', 'Revlon', 'Waterproof eyeliner for precise application', 4.4, 6.99, 28);

-- Toys & Games: Action Figures
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(91, 'Marvel Spider-Man Action Figure', 'Marvel', 'Collectible Spider-Man action figure', 4.9, 19.99, 29),
(92, 'Star Wars Darth Vader Figure', 'Star Wars', 'Detailed Darth Vader action figure', 4.8, 24.99, 29),
(93, 'Transformers Optimus Prime', 'Transformers', 'Transformable Optimus Prime figure', 4.7, 29.99, 29),
(94, 'Batman Action Figure', 'DC Comics', 'Classic Batman action figure', 4.6, 14.99, 29),
(95, 'Pokemon Pikachu Plush', 'Pokemon', 'Soft and cuddly Pikachu plush toy', 4.5, 12.99, 29);

-- Toys & Games: Board Games
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(96, 'Monopoly Classic', 'Hasbro', 'Classic board game for family fun', 4.8, 29.99, 30),
(97, 'Catan', 'Catan Studio', 'Strategy board game for 3-4 players', 4.7, 49.99, 30),
(98, 'Scrabble', 'Mattel', 'Word game for vocabulary building', 4.6, 24.99, 30),
(99, 'Clue', 'Hasbro', 'Mystery-solving board game', 4.5, 19.99, 30),
(100, 'Ticket to Ride', 'Days of Wonder', 'Railroad-building strategy game', 4.4, 39.99, 30);

-- Toys & Games: Educational Toys
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(101, 'LEGO Classic Set', 'LEGO', 'Creative building blocks for kids', 4.9, 49.99, 31),
(102, 'Melissa & Doug Wooden Puzzle', 'Melissa & Doug', 'Educational wooden puzzle for toddlers', 4.8, 14.99, 31),
(103, 'VTech Learning Laptop', 'VTech', 'Interactive learning laptop for kids', 4.7, 29.99, 31),
(104, 'Fisher-Price Shape Sorter', 'Fisher-Price', 'Toy for learning shapes and colors', 4.6, 19.99, 31),
(105, 'Crayola Art Set', 'Crayola', 'Complete art set for creative kids', 4.5, 24.99, 31);

-- Automotive: Car Accessories
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(106, 'Car Phone Mount', 'iOttie', 'Universal phone mount for cars', 4.8, 19.99, 32),
(107, 'Dash Cam', 'Garmin', 'High-definition dash camera for vehicles', 4.7, 99.99, 32),
(108, 'Car Vacuum Cleaner', 'Black+Decker', 'Portable vacuum cleaner for cars', 4.6, 49.99, 32),
(109, 'Car Seat Cover', 'FH Group', 'Durable and stylish seat covers', 4.5, 29.99, 32),
(110, 'Car Air Freshener', 'Little Trees', 'Long-lasting air freshener for cars', 4.4, 5.99, 32);

-- Automotive: Motorcycle Gear
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(111, 'Motorcycle Helmet', 'Shoei', 'High-quality helmet for safety and comfort', 4.9, 299.99, 33),
(112, 'Motorcycle Gloves', 'Alpinestars', 'Durable gloves for motorcycle riders', 4.8, 49.99, 33),
(113, 'Motorcycle Jacket', 'Dainese', 'Protective jacket for motorcycle riders', 4.7, 199.99, 33),
(114, 'Motorcycle Boots', 'TCX', 'Comfortable and protective boots', 4.6, 149.99, 33),
(115, 'Motorcycle Cover', 'XYZCTEM', 'Waterproof cover for motorcycles', 4.5, 29.99, 33);

-- Automotive: Tires
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(116, 'All-Season Tires', 'Michelin', 'Durable all-season tires for cars', 4.9, 129.99, 34),
(117, 'Winter Tires', 'Bridgestone', 'Tires for snowy and icy conditions', 4.8, 149.99, 34),
(118, 'Performance Tires', 'Pirelli', 'High-performance tires for sports cars', 4.7, 199.99, 34),
(119, 'Off-Road Tires', 'BFGoodrich', 'Tires for off-road adventures', 4.6, 179.99, 34),
(120, 'Spare Tire', 'Goodyear', 'Compact spare tire for emergencies', 4.5, 99.99, 34);

-- Groceries: Fresh Produce
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(121, 'Organic Apples', 'Nature’s Best', 'Fresh organic apples by the pound', 4.9, 2.99, 35),
(122, 'Bananas', 'Dole', 'Fresh bananas by the pound', 4.8, 0.99, 35),
(123, 'Carrots', 'Bolthouse Farms', 'Fresh carrots by the pound', 4.7, 1.49, 35),
(124, 'Spinach', 'Earthbound Farm', 'Organic spinach by the bunch', 4.6, 2.49, 35),
(125, 'Potatoes', 'Idaho', 'Fresh potatoes by the pound', 4.5, 0.79, 35);

-- Groceries: Packaged Foods
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(126, 'Pasta', 'Barilla', 'High-quality pasta for cooking', 4.8, 1.99, 36),
(127, 'Cereal', 'Kellogg’s', 'Breakfast cereal with whole grains', 4.7, 3.99, 36),
(128, 'Peanut Butter', 'Jif', 'Creamy peanut butter for spreads', 4.6, 2.99, 36),
(129, 'Canned Soup', 'Campbell’s', 'Ready-to-eat canned soup', 4.5, 1.49, 36),
(130, 'Rice', 'Uncle Ben’s', 'Long-grain rice for cooking', 4.4, 4.99, 36);

-- Groceries: Beverages
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(131, 'Bottled Water', 'Dasani', 'Purified bottled water', 4.9, 0.99, 37),
(132, 'Orange Juice', 'Tropicana', 'Fresh orange juice with no pulp', 4.8, 3.99, 37),
(133, 'Coffee', 'Starbucks', 'Ground coffee for brewing', 4.7, 9.99, 37),
(134, 'Tea Bags', 'Lipton', 'Black tea bags for brewing', 4.6, 4.99, 37),
(135, 'Soda', 'Coca-Cola', 'Classic Coca-Cola soda', 4.5, 1.49, 37);

-- Health & Wellness: Vitamins & Supplements
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(136, 'Vitamin D3', 'Nature Made', 'High-potency vitamin D3 supplement', 4.9, 14.99, 38),
(137, 'Omega-3 Fish Oil', 'Nordic Naturals', 'Heart-healthy omega-3 supplement', 4.8, 19.99, 38),
(138, 'Multivitamins', 'Centrum', 'Daily multivitamin supplement', 4.7, 24.99, 38),
(139, 'Probiotics', 'Culturelle', 'Probiotic supplement for gut health', 4.6, 29.99, 38),
(140, 'Calcium Tablets', 'Caltrate', 'Calcium supplement for bone health', 4.5, 12.99, 38);

-- Health & Wellness: Medical Equipment
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(141, 'Blood Pressure Monitor', 'Omron', 'Digital blood pressure monitor for home use', 4.9, 49.99, 39),
(142, 'Thermometer', 'Braun', 'Infrared thermometer for accurate readings', 4.8, 29.99, 39),
(143, 'Pulse Oximeter', 'Zacurate', 'Device for measuring oxygen levels and pulse rate', 4.7, 19.99, 39),
(144, 'Nebulizer', 'Philips', 'Compact nebulizer for respiratory therapy', 4.6, 59.99, 39),
(145, 'First Aid Kit', 'Johnson & Johnson', 'Comprehensive first aid kit for emergencies', 4.5, 24.99, 39);

-- Health & Wellness: Personal Care
INSERT INTO product (product_id, product_name, product_brand, product_description, product_review, price, category_id) VALUES
(146, 'Electric Toothbrush', 'Oral-B', 'Rechargeable electric toothbrush with multiple modes', 4.9, 39.99, 40),
(147, 'Hair Dryer', 'Dyson', 'High-performance hair dryer with advanced technology', 4.8, 299.99, 40),
(148, 'Shaving Kit', 'Gillette', 'Complete shaving kit with razor and foam', 4.7, 19.99, 40),
(149, 'Deodorant', 'Old Spice', 'Long-lasting deodorant for all-day freshness', 4.6, 5.99, 40),
(150, 'Body Lotion', 'Nivea', 'Moisturizing body lotion for dry skin', 4.5, 8.99, 40);

SELECT * FROM product;

-- Module 3: Inventory Management
USE cartwise;

-- Insert 5: Insert records into the supplier table
-- @Author: Winnie Manyara

-- Electronics and Home Appliances
INSERT INTO supplier (supplier_name, supplier_type, supplier_rating, contact_name, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
('Tech Distributors Inc.', 'Distributor', 4.8, 'John Smith', 'john.smith@techdistributors.com', '123-456-7890', '123 Tech Street', NULL, 'Dallas', 'TX', '75201', 'USA'),
('Global Wholesalers', 'Wholesaler', 4.7, 'Jane Doe', 'jane.doe@globalwholesalers.com', '987-654-3210', '456 Global Ave', 'Suite 200', 'Houston', 'TX', '77002', 'USA');

-- Furniture and Clothing
INSERT INTO supplier (supplier_name, supplier_type, supplier_rating, contact_name, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
('Furniture World', 'Manufacturer', 4.6, 'Mike Johnson', 'mike.johnson@furnitureworld.com', '555-123-4567', '789 Furniture Blvd', NULL, 'Austin', 'TX', '73301', 'USA'),
('Fashion Hub', 'Reseller', 4.5, 'Alice Brown', 'alice.brown@fashionhub.com', '222-333-4444', '321 Fashion Lane', NULL, 'San Antonio', 'TX', '78205', 'USA');

-- Sports, Beauty, and Health
INSERT INTO supplier (supplier_name, supplier_type, supplier_rating, contact_name, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
('Sports Gear Co.', 'Distributor', 4.7, 'Tom Wilson', 'tom.wilson@sportsgear.com', '444-555-6666', '123 Sports Ave', NULL, 'Dallas', 'TX', '75201', 'USA'),
('Beauty Essentials', 'Wholesaler', 4.8, 'Emma Davis', 'emma.davis@beautyessentials.com', '333-444-5555', '456 Beauty St', NULL, 'Houston', 'TX', '77002', 'USA'),
('Health Supplies Inc.', 'Manufacturer', 4.9, 'Chris Lee', 'chris.lee@healthsupplies.com', '111-222-3333', '789 Health Blvd', NULL, 'Austin', 'TX', '73301', 'USA');

-- Automotive
INSERT INTO supplier (supplier_name, supplier_type, supplier_rating, contact_name, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
('Auto Parts Co.', 'Distributor', 4.7, 'Robert Johnson', 'robert.johnson@autopartsco.com', '555-678-1234', '123 Auto Lane', NULL, 'Dallas', 'TX', '75201', 'USA'),
('Tire World', 'Wholesaler', 4.8, 'Laura Smith', 'laura.smith@tireworld.com', '555-987-6543', '456 Tire Blvd', NULL, 'Houston', 'TX', '77002', 'USA'),
('Motorcycle Gear Inc.', 'Reseller', 4.6, 'David Brown', 'david.brown@motorcyclegear.com', '555-321-9876', '789 Gear Street', NULL, 'Austin', 'TX', '73301', 'USA');

SELECT * FROM supplier;

-- Insert 6: Insert records into the inventory table
-- @Author: Winnie Manyara

-- TODO Insert inventory records for all 200 products.

-- Electronics
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(1, 1, 50, 'Warehouse A', 10), -- iPhone 14
(2, 1, 40, 'Warehouse A', 10), -- Samsung Galaxy S23
(6, 1, 20, 'Warehouse B', 5),  -- MacBook Pro 16"
(7, 1, 15, 'Warehouse B', 5),  -- Dell XPS 13
(11, 1, 5, 'Warehouse C', 2);  -- Canon EOS R5

-- Home Appliances
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(16, 2, 10, 'Warehouse D', 3), -- LG InstaView Refrigerator
(17, 2, 8, 'Warehouse D', 3),  -- Samsung Family Hub
(21, 2, 15, 'Warehouse E', 5), -- Bosch Front Load Washer
(22, 2, 12, 'Warehouse E', 5), -- LG Top Load Washer
(25, 2, 10, 'Warehouse F', 3); -- IFB Fully Automatic Washer

-- Furniture
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(31, 3, 25, 'Warehouse G', 5), -- Ikea Ektorp Sofa
(32, 3, 10, 'Warehouse G', 5), -- Ashley Recliner Sofa
(36, 3, 20, 'Warehouse H', 5), -- Ikea Malm Bed Frame
(37, 3, 30, 'Warehouse H', 5), -- Zinus Memory Foam Mattress
(41, 3, 10, 'Warehouse I', 2); -- Herman Miller Aeron Chair

-- Clothing
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(46, 4, 100, 'Warehouse J', 10), -- Levi’s 501 Jeans
(47, 4, 200, 'Warehouse J', 10), -- Nike Dri-FIT T-Shirt
(51, 4, 50, 'Warehouse K', 5),  -- Zara Summer Dress
(52, 4, 80, 'Warehouse K', 5),  -- H&M Blouse
(56, 4, 100, 'Warehouse L', 10); -- Carter’s Baby Onesie

-- Sports, Beauty, and Health
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(61, 5, 10, 'Warehouse M', 12), -- Peloton Bike
(76, 6, 200, 'Warehouse N', 10), -- CeraVe Moisturizing Cream
(81, 6, 200, 'Warehouse N', 10), -- Pantene Pro-V Shampoo
(136, 7, 200, 'Warehouse O', 10), -- Vitamin D3
(141, 7, 100, 'Warehouse O', 5); -- Blood Pressure Monitor

-- Automotive: Tires
INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level) VALUES
(116, 8, 50, 'Warehouse P', 10), -- All-Season Tires
(117, 8, 30, 'Warehouse P', 10), -- Winter Tires
(118, 8, 20, 'Warehouse Q', 5),  -- Performance Tires
(119, 8, 15, 'Warehouse Q', 5),  -- Off-Road Tires
(120, 8, 25, 'Warehouse R', 5); -- Spare Tire

SELECT * FROM inventory;

-- Module 4: Order Processing
USE cartwise;

-- Insert 7: Insert records into the shopping_cart table
-- @Author: Priyadarshan Parida
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
-- @Author: Priyadarshan Parida

-- Order 1: Subtotal = $2430.82, Shipping = $50.00, Taxes = $155.05
-- Ordered Items: 2 iPhone 14, 5 Pantene Pro-V Shampoo, 3 CeraVe Moisturizing Cream, 2 Levi’s 501 Jeans, 2 Zara Summer Dress, 4 Body Lotion
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1001, '2025-03-20 10:00:00', 2635.87, 'Processing', '123 Main St, Dallas, TX 75201');

-- Order 2: Subtotal = $4799.98, Shipping = $0.00, Taxes = $300.00
-- Ordered Items: 1 Samsung Galaxy S23, 1 Canon EOS R5
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1002, '2025-03-20 11:00:00', 5099.98, 'Shipped', '456 Elm St, Plano, TX 75024');

-- Order 3: Subtotal = $4799.97, Shipping = $25.00, Taxes = $301.56
-- Ordered Items: 1 LG InstaView Refrigerator, 2 Bosch Front Load Washer
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1003, '2025-03-20 12:00:00', 5126.53, 'Processing', '789 Oak St, Frisco, TX 75034');

-- Order 4: Subtotal = $799.98, Shipping = $10.00, Taxes = $50.62
-- Ordered Items: 1 Ikea Ektorp Sofa, 1 Ikea Malm Bed Frame
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1004, '2025-03-20 13:00:00', 860.60, 'Delivered', '321 Pine St, Irving, TX 75038');

-- Order 5: Subtotal = $369.95, Shipping = $15.00, Taxes = $24.06
-- Ordered Items: 3 Levi’s 501 Jeans, 2 Zara Summer Dress
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1005, '2025-03-20 14:00:00', 409.01, 'Processing', '654 Cedar St, Richardson, TX 75080');

-- Order 6: Subtotal = $2599.94, Shipping = $100.00, Taxes = $168.75
-- Ordered Items: 1 Peloton Bike, 5 CeraVe Moisturizing Cream
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1006, '2025-03-20 15:00:00', 2868.69, 'Shipped', '987 Maple St, Addison, TX 75001');

-- Order 7: Subtotal = $79.97, Shipping = $0.00, Taxes = $5.00
-- Ordered Items: 2 Vitamin D3, 1 Blood Pressure Monitor
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1007, '2025-03-20 16:00:00', 84.97, 'Cancelled', '111 Birch St, Carrollton, TX 75006');

-- Order 8: Subtotal = $35.96, Shipping = $5.00, Taxes = $2.56
-- Ordered Items: 4 Body Lotion
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1008, '2025-03-20 17:00:00', 43.52, 'Delivered', '222 Spruce St, Garland, TX 75040');

-- Order 9: Subtotal = $2499.99, Shipping = $50.00, Taxes = $159.37
-- Ordered Items: 1 MacBook Pro 16"
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1009, '2025-03-20 18:00:00', 2709.36, 'Received', '333 Walnut St, McKinney, TX 75070');

-- Order 10: Subtotal = $3899.99, Shipping = $75.00, Taxes = $248.44
-- Ordered Items: 1 Canon EOS R5
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1010, '2025-03-20 19:00:00', 4223.43, 'Received', '444 Cypress St, Allen, TX 75013');

-- Order 11: Subtotal = $1000.00, Shipping = $50.00, Taxes = $39.38
-- Ordered Items: 2 iPhone 14, 1 Zara Summer Dress
INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address) VALUES
(1001, '2024-12-15 10:00:00', 1089.38, 'Delivered', '123 Main St, Dallas, TX 75201');

SELECT * FROM order_summary;

-- Insert 9: Insert records into the payment_detail table
-- @Author: Priyadarshan Parida

-- Order 1: Total = $2635.87
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(1, 'Credit Card', '4111111111111111', 2635.87, '2025-03-20 10:05:00', '123 Main St, Dallas, TX 75201');

-- Order 2: Total = $5099.98
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(2, 'Credit Card', '4222222222222222', 5099.98, '2025-03-20 11:05:00', '456 Elm St, Plano, TX 75024');

-- Order 3: Total = $5126.53
-- Paid fully with Debit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(3, 'Debit Card', '5333333333333333', 5126.53, '2025-03-20 12:05:00', '789 Oak St, Frisco, TX 75034');

-- Order 4: Total = $860.60
-- Paid fully with Gift Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(4, 'Gift Card', 'GC1001', 860.60, '2025-03-20 13:05:00', '321 Pine St, Irving, TX 75038');

-- Order 5: Total = $409.01
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(5, 'Credit Card', '4111111111111111', 409.01, '2025-03-20 14:05:00', '654 Cedar St, Richardson, TX 75080');

-- Order 6: Total = $2868.69
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(6, 'Credit Card', '4111111111111111', 2868.69, '2025-03-20 15:05:00', '987 Maple St, Addison, TX 75001');

-- Order 7: Total = $84.97
-- Paid fully with Gift Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(7, 'Gift Card', 'GC1002', 84.97, '2025-03-20 16:05:00', '111 Birch St, Carrollton, TX 75006');

-- Order 8: Total = $43.52
-- Paid fully with Debit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(8, 'Debit Card', '5333333333333333', 43.52, '2025-03-20 17:05:00', '222 Spruce St, Garland, TX 75040');

-- Order 9: Total = $2709.36
-- Split payment: $500.00 with Gift Card, $2209.36 with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(9, 'Gift Card', 'GC1003', 500.00, '2025-03-20 18:05:00', '333 Walnut St, McKinney, TX 75070'),
(9, 'Credit Card', '4111111111111111', 2209.36, '2025-03-20 18:06:00', '333 Walnut St, McKinney, TX 75070');

-- Order 10: Total = $4223.43
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(10, 'Credit Card', '4222222222222222', 4223.43, '2025-03-20 19:05:00', '444 Cypress St, Allen, TX 75013');

-- Order 11: Total = $1089.38
-- Paid fully with Credit Card
INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address) VALUES
(11, 'Credit Card', '4111111111111111', 1089.38, '2024-12-15 10:05:00', '123 Main St, Dallas, TX 75201');

SELECT * FROM payment_detail;

-- Insert 10: Insert records into the order_detail table
-- @Author: Priyadarshan Parida

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
-- @Author: Priyadarshan Parida

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
-- @Author: Priyadarshan Parida
INSERT INTO return_refund (order_detail_id, product_id, return_quantity, return_reason, refund_amount, status) VALUES
(12, 36, 1, 'Defective', 319.49, 'Refunded'); -- Returning 1 Ikea Malm Bed Frame

SELECT * FROM return_refund;

-- Module 5: Customer Feedback
USE cartwise;

-- Insert 13: Insert records into the product_review table
-- @Author: Qurrat Ul Ain

-- Product 1: iPhone 14 (product_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(1, 1001, 5, 'Amazing phone with great performance!'),
(1, 1002, 5, 'The camera quality is outstanding.'),
(1, 1003, 4, 'Good phone but a bit expensive.'),
(1, 1004, 5, 'Battery life is excellent.'),
(1, 1005, 5, 'Best iPhone I have ever used.');

-- Product 2: Samsung Galaxy S23 (product_review = 4.7)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(2, 1006, 5, 'Great phone with amazing features.'),
(2, 1007, 4, 'Good phone but could be better.'),
(2, 1008, 5, 'The display is stunning.'),
(2, 1009, 5, 'Performance is top-notch.'),
(2, 1010, 4, 'Battery life could be improved.');

-- Product 6: MacBook Pro 16" (product_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(6, 1001, 5, 'Perfect for professionals.'),
(6, 1002, 5, 'The M2 chip is a game-changer.'),
(6, 1003, 5, 'Build quality is excellent.'),
(6, 1004, 4, 'Very expensive but worth it.'),
(6, 1005, 5, 'Best laptop I have ever used.');
-- Product 7: Dell XPS 13 (product_review = 4.6)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(7, 1001, 5, 'Great laptop for everyday use.'),
(7, 1002, 4, 'Good performance but a bit heavy.'),
(7, 1003, 5, 'The display is fantastic.'),
(7, 1004, 4, 'Battery life could be better.'),
(7, 1005, 5, 'Highly recommend this laptop.');

-- Product 8: HP Spectre x360 (product_review = 4.2)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(8, 1006, 4, 'Good laptop but a bit pricey.'),
(8, 1007, 5, 'The design is beautiful.'),
(8, 1008, 4, 'Performance is decent.'),
(8, 1009, 5, 'Great for students.'),
(8, 1010, 4, 'Battery life is average.');

-- Product 9: Lenovo ThinkPad X1 Carbon (product_review = 4.1)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(9, 1001, 4, 'Good laptop for business use.'),
(9, 1002, 5, 'The keyboard is excellent.'),
(9, 1003, 4, 'Performance is good but a bit heavy.'),
(9, 1004, 5, 'Highly durable and reliable.'),
(9, 1005, 4, 'Battery life could be improved.');

-- Product 10: Asus ROG Zephyrus G14 (product_review = 4.4)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(10, 1006, 5, 'Great gaming laptop.'),
(10, 1007, 4, 'Performance is top-notch.'),
(10, 1008, 5, 'The design is sleek.'),
(10, 1009, 4, 'Battery life could be better.'),
(10, 1010, 5, 'Highly recommend for gamers.');

-- Product 11: Canon EOS R5 (product_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(11, 1006, 5, 'Amazing camera for professionals.'),
(11, 1007, 5, 'The image quality is stunning.'),
(11, 1008, 5, 'Great for both photos and videos.'),
(11, 1009, 4, 'A bit heavy to carry around.'),
(11, 1010, 5, 'Worth every penny.');

-- Product 16: LG InstaView Refrigerator (product_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(16, 1001, 5, 'Very convenient and spacious.'),
(16, 1002, 5, 'The InstaView feature is amazing.'),
(16, 1003, 4, 'A bit noisy at times.'),
(16, 1004, 5, 'Keeps food fresh for a long time.'),
(16, 1005, 5, 'Highly recommend this refrigerator.');

-- Product 46: Levi’s 501 Jeans (product_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(46, 1006, 5, 'Perfect fit and very comfortable.'),
(46, 1007, 5, 'The quality is excellent.'),
(46, 1008, 4, 'A bit pricey but worth it.'),
(46, 1009, 5, 'Classic jeans that never go out of style.'),
(46, 1010, 5, 'Highly durable and stylish.');

-- Product 51: Zara Summer Dress (product_review = 4.8)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(51, 1001, 5, 'Beautiful and lightweight dress.'),
(51, 1002, 5, 'Perfect for summer outings.'),
(51, 1003, 4, 'The fit could be better.'),
(51, 1004, 5, 'Very comfortable and stylish.'),
(51, 1005, 5, 'Great value for the price.');

-- Product 76: CeraVe Moisturizing Cream (product_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(76, 1006, 5, 'Best moisturizer for dry skin.'),
(76, 1007, 5, 'Very hydrating and non-greasy.'),
(76, 1008, 5, 'Works wonders for sensitive skin.'),
(76, 1009, 4, 'A bit expensive but effective.'),
(76, 1010, 5, 'Highly recommend this product.');

-- Product 136: Vitamin D3 (product_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(136, 1001, 5, 'Great supplement for daily use.'),
(136, 1002, 5, 'Easy to swallow and effective.'),
(136, 1003, 5, 'Improved my energy levels.'),
(136, 1004, 4, 'A bit pricey but worth it.'),
(136, 1005, 5, 'Highly recommend this supplement.');

-- Product 141: Blood Pressure Monitor (product_review = 4.9)
INSERT INTO product_review (product_id, customer_id, rating, review_text) VALUES
(141, 1006, 5, 'Very accurate and easy to use.'),
(141, 1007, 5, 'Compact and portable design.'),
(141, 1008, 5, 'Great for home monitoring.'),
(141, 1009, 4, 'Battery life could be better.'),
(141, 1010, 5, 'Highly reliable and effective.');

SELECT * FROM product_review;

-- Insert 14: Insert records into the customer_service table
-- @Author: Qurrat Ul Ain

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
-- @Author: Sai Vishnu Malladi
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
-- @Author: Sai Vishnu Malladi

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

-- Module 7: Location Lookup
-- Insert 20: Insert records into the state_lookup table
INSERT INTO state_lookup (state_code, state_name) VALUES
('TX', 'Texas'),
('CA', 'California'),
('NY', 'New York'),
('FL', 'Florida'),
('IL', 'Illinois');
-- Insert 21: Insert records into the city_lookup table
INSERT INTO city_lookup (city_name, state_code) VALUES
('Dallas', 'TX'),
('Austin', 'TX'),
('Houston', 'TX'),
('San Antonio', 'TX'),
('Los Angeles', 'CA'),
('New York City', 'NY'),
('Miami', 'FL'),
('Chicago', 'IL');
-- Insert 22: Insert records into the zip_lookup table
INSERT INTO zip_lookup (zip_code, city_id) VALUES
('75001', 1), -- Dallas
('73301', 2), -- Austin
('77001', 3), -- Houston
('78201', 4), -- San Antonio
('90001', 5), -- Los Angeles
('10001', 6), -- New York City
('33101', 7), -- Miami
('60601', 8); -- Chicago


-- ********************* Step 3: Create/Build/Rebuild Indexes *********************
/* 
Index 1: Add index to category_name in product_category.
@Author: Priyadarshan Parida
This index will help in faster searches for categories by name.
*/
CREATE INDEX idx_category_name ON product_category(category_name);

/* 
Index 2: Add index to category_description in product_category.
@Author: Priyadarshan Parida
The index on category_description is limited to 255 characters 
to optimize storage and performance.
*/
CREATE INDEX idx_category_description ON product_category(category_description(255));

/*
Index 3: Add index to product_name in product.
@Author: Priyadarshan Parida
This index will help in faster searches for products by name.
*/
CREATE INDEX idx_product_name ON product(product_name);

/*
Index 4: Add index to product_description in product.
@Author: Priyadarshan Parida
This index will help in faster searches for products by description.
*/
CREATE INDEX idx_product_description ON product(product_description(255));

/*
Index 5: Add index to product_brand in product.
@Author: Priyadarshan Parida
This index will help in faster searches for products by brand.
*/
CREATE INDEX idx_product_brand ON product(product_brand);

-- ********************* Step 4: Create Views *********************

-- Create a view for Product and Supplier information
CREATE VIEW product_supplier_inventory_report AS
SELECT 
    p.product_id AS ProductID,
    p.product_name AS ProductName,
    p.product_brand AS Brand,
    p.product_description AS Description,
    p.price AS Price,
    pc.category_name AS Category,
    s.supplier_name AS SupplierName,
    s.supplier_type AS SupplierType,
    s.supplier_rating AS SupplierRating,
    i.quantity AS Stock,
    i.location AS InventoryLocation,
    i.reorder_level AS ReorderLevel
FROM 
    product p
JOIN 
    product_category pc ON p.category_id = pc.category_id
JOIN 
    inventory i ON p.product_id = i.product_id
JOIN 
    supplier s ON i.supplier_id = s.supplier_id
ORDER BY 
    s.supplier_name, pc.category_name, p.product_name;

-- Query the view to verify the data
SELECT * FROM product_supplier_inventory_report;

-- ********************* Stored Programs *********************

-- ********************* Step 5: Create Stored Fucntions *********************

/* Function 1: Calculate Order Subtotal (before taxes)
Input Parameters:
- order_id: Order ID
Output Parameters:
- subtotal: Total amount before taxes
Purpose: Calculate the subtotal for an order
@Author: Priyadarshan Parida
*/
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

-- Test the CalculateSubtotal function
SELECT CalculateSubtotal(1) AS subtotal;

/* Function 2: Calculate Order Total (after shipping and taxes)
Input Parameters:
- order_id: Order ID
- tax_rate: Tax rate to be applied
Output Parameters:
- total_amount: Total amount after applying taxes and shipping cost
Purpose: Calculate the total amount for an order
@Author: Priyadarshan Parida
*/
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

/* Function 3: Calculate refund amount
Input Parameters:
- p_pid: Product ID
- p_qty: Quantity of the product
- p_tax_rate: Tax rate
Output Parameters:
- v_refund: Refund amount
Purpose: Calculate the refund amount for a 
specific product based on its price.
@Author: Priyadarshan Parida
*/
DELIMITER //

CREATE FUNCTION CalculateRefund(
    p_pid INT,
    p_qty INT,
    p_tax_rate DECIMAL(5, 2)
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_refund DECIMAL(10, 2);
    DECLARE v_price DECIMAL(10, 2);

    SELECT price
    INTO v_price
    FROM product
    WHERE product_id = p_pid;

    -- Calculate the refund amount
    SET v_refund = (v_price * p_qty) * (1 + p_tax_rate / 100);
    RETURN v_refund;
END //

DELIMITER ;

-- Test the CalculateRefund function
SELECT CalculateRefund(1, 2, 6.25) AS refund_amount;

/* Function 4: Calculate Average Product Rating
@Author: Priyadarshan Parida
Input Parameters:
- p_product_id: Product ID
Output Parameters:
- avg_rating: Average rating for the product
Purpose: Calculate the average rating for a specific 
product based on customer reviews.
*/
DELIMITER //

CREATE FUNCTION CalculateAverageRating(
    p_product_id INT
) RETURNS DECIMAL(3, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE avg_rating DECIMAL(3, 2);

    -- Calculate the average rating for the product
    SELECT AVG(rating)
    INTO avg_rating
    FROM product_review
    WHERE product_id = p_product_id;

    RETURN IFNULL(avg_rating, 0.00); -- Return 0.00 if no reviews exist
END //

DELIMITER ;
-- Test the CalculateAverageRating function
SELECT CalculateAverageRating(1) AS avg_rating;

/* Function 5: Get Customer Lifetime Value
Input Parameters:
- p_customer_id: Customer ID
Output Parameters:
- lifetime_value: Customer Lifetime Value (CLV)
@Author: Priyadarshan Parida
Purpose: Calculate the total amount a customer has spent across all their orders.
*/
DELIMITER //

CREATE FUNCTION GetCustomerLifetimeValue(
    p_customer_id INT
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE lifetime_value DECIMAL(10, 2);

    -- Calculate the total amount spent by the customer
    SELECT SUM(total_amount)
    INTO lifetime_value
    FROM order_summary
    WHERE customer_id = p_customer_id
      AND order_status IN ('Shipped', 'Delivered'); -- Only include completed orders

    RETURN IFNULL(lifetime_value, 0.00); -- Return 0.00 if no orders exist
END //

DELIMITER ;

-- Test the GetCustomerLifetimeValue function
SELECT GetCustomerLifetimeValue(1001) AS lifetime_value;

/* Function 6: Calculate Inventory Value
Input Parameters:
- p_product_id: Product ID (NULL for all products)
Output Parameters:
- inventory_value: Total value of inventory for the 
specified product or all products.
@Author: Priyadarshan Parida
Purpose: Calculate the total value of inventory 
for a specific product or all products.
*/
DELIMITER //

CREATE FUNCTION CalculateInventoryValue(
    p_product_id INT
) RETURNS DECIMAL(15, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE inventory_value DECIMAL(15, 2);

    -- Calculate the total inventory value for the specified product or all products
    SELECT SUM(i.quantity * p.price)
    INTO inventory_value
    FROM inventory i
    JOIN product p ON i.product_id = p.product_id
    WHERE p.product_id = p_product_id OR p_product_id IS NULL;

    RETURN IFNULL(inventory_value, 0.00); -- Return 0.00 if no inventory exists
END //

DELIMITER ;

-- Test the CalculateInventoryValue function
SELECT CalculateInventoryValue(NULL) AS total_inventory_value; -- For all products
SELECT CalculateInventoryValue(1) AS product_inventory_value; -- For a specific product

/* Function 7: Calculate Shipping Cost
@Author: Priyadarshan Parida
Input Parameters:
- p_product_id: Product ID
Output Parameters:
- v_shipping_cost: Shipping cost for the product
Purpose: This function generates a randomized shipping cost based on the 
product_id. In a real-world scenario, this would depend on parameters 
like weight, distance, etc., but here we’ll use a creative approach.
*/
DELIMITER //

CREATE FUNCTION CalculateShippingCost(
    p_product_id INT
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_base_cost DECIMAL(10, 2);
    DECLARE v_random_factor DECIMAL(10, 2);
    DECLARE v_product_price DECIMAL(10, 2);
    DECLARE v_shipping_cost DECIMAL(10, 2);

    -- Get the product price
    SELECT price
    INTO v_product_price
    FROM product
    WHERE product_id = p_product_id;

    -- Assign a base cost based on product_id (e.g., category or other logic)
    SET v_base_cost = CASE
        WHEN p_product_id BETWEEN 1 AND 50 THEN 5.00
        WHEN p_product_id BETWEEN 51 AND 100 THEN 10.00
        WHEN p_product_id BETWEEN 101 AND 150 THEN 15.00
        ELSE 20.00
    END;

    -- Generate a random factor to simulate variability in shipping cost
    SET v_random_factor = FLOOR(RAND() * 5.00); -- Random whole number between 0 and 5

    -- Calculate the shipping cost
    SET v_shipping_cost = v_base_cost + v_random_factor;

    -- Ensure the shipping cost does not exceed 50% of the product price
    IF v_shipping_cost > (v_product_price * 0.5) THEN
        SET v_shipping_cost = FLOOR(v_product_price * 0.5); -- Round down to the nearest whole number
    END IF;

    -- Return the total shipping cost
    RETURN v_shipping_cost;
END //

DELIMITER ;

-- ********************* Step 6: Create Stored Procedures *********************

/* Stored Procedure 1: Process Order
Input Parameters:
- p_customer_id: Customer ID
- p_shipping_address: Shipping address
- p_payment_methods: JSON input for payment methods, 
account numbers, and amounts
- p_billing_address: Billing address
- p_tax_rate: Tax rate
Output Parameters:
- p_order_id: Order ID of the newly created order
@Author: Priyadarshan Parida
*/

DELIMITER //

CREATE PROCEDURE ProcessOrder(
    IN p_customer_id INT,
    IN p_shipping_address VARCHAR(255),
    IN p_payment_methods JSON, -- JSON input for payment methods, account numbers, and amounts
    IN p_billing_address VARCHAR(255),
    IN p_tax_rate DECIMAL(5, 2), -- Input parameter for tax rate
    OUT p_order_id INT -- Output parameter to return the order_id
)
BEGIN
    DECLARE v_total_amount DECIMAL(10, 2);
    DECLARE v_subtotal DECIMAL(10, 2);
    DECLARE v_shipping_cost DECIMAL(10, 2);
    DECLARE v_payment_index INT DEFAULT 0;
    DECLARE v_payment_count INT;
    DECLARE v_payment_method VARCHAR(50);
    DECLARE v_account_number VARCHAR(50);
    DECLARE v_amount DECIMAL(10, 2);

    -- 1. Calculate the subtotal directly
    SET v_subtotal = (
        SELECT SUM(sc.quantity * p.price)
        FROM shopping_cart sc
        JOIN product p ON sc.product_id = p.product_id
        WHERE sc.customer_id = p_customer_id
    );

    -- 2. Calculate the total shipping cost using the CalculateShippingCost function
    SET v_shipping_cost = (
        SELECT SUM(CalculateShippingCost(sc.product_id))
        FROM shopping_cart sc
        WHERE sc.customer_id = p_customer_id
    );

    -- 3. Calculate the total amount (subtotal + shipping + taxes)
    SET v_total_amount = v_subtotal + v_shipping_cost + ((v_subtotal + v_shipping_cost) * p_tax_rate / 100);

    -- 4. Insert a new record into the order_summary table
    INSERT INTO order_summary (customer_id, order_date, total_amount, order_status, shipping_address)
    VALUES (p_customer_id, NOW(), v_total_amount, 'Processing', p_shipping_address);

    -- Get the newly created order_id
    SET p_order_id = LAST_INSERT_ID();

    -- 5. Insert records into the order_detail table for each product in the shopping cart
    INSERT INTO order_detail (order_id, product_id, quantity, price)
    SELECT p_order_id, sc.product_id, sc.quantity, p.price
    FROM shopping_cart sc
    JOIN product p ON sc.product_id = p.product_id
    WHERE sc.customer_id = p_customer_id;

    -- 5.1 Update inventory after order_detail is inserted
    UPDATE inventory i
    JOIN (
        SELECT product_id, SUM(quantity) AS qty_ordered
        FROM order_detail
        WHERE order_id = p_order_id
        GROUP BY product_id
    ) od ON i.product_id = od.product_id
    SET i.quantity = i.quantity - od.qty_ordered;

    -- 6. Insert records into the payment_detail table
    -- Parse the JSON input for payment methods, account numbers, and amounts
    SET v_payment_count = JSON_LENGTH(p_payment_methods);

    WHILE v_payment_index < v_payment_count DO
        -- Extract payment details from the JSON input
        SET v_payment_method = JSON_UNQUOTE(JSON_EXTRACT(p_payment_methods, CONCAT('$[', v_payment_index, '].payment_method')));
        SET v_account_number = JSON_UNQUOTE(JSON_EXTRACT(p_payment_methods, CONCAT('$[', v_payment_index, '].account_number')));
        SET v_amount = JSON_UNQUOTE(JSON_EXTRACT(p_payment_methods, CONCAT('$[', v_payment_index, '].amount')));

        -- Insert the payment details into the payment_detail table
        INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address)
        VALUES (p_order_id, v_payment_method, v_account_number, v_amount, NOW(), p_billing_address);

        -- Increment the index
        SET v_payment_index = v_payment_index + 1;
    END WHILE;

    -- 7. Insert records into the shipping table for each order item
    INSERT INTO shipping (order_detail_id, shipping_method, shipping_cost, shipping_date, delivery_date, tracking_number)
    SELECT od.order_detail_id, 'Standard', CalculateShippingCost(od.product_id), NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), CONCAT('TRACK', od.order_detail_id)
    FROM order_detail od
    WHERE od.order_id = p_order_id;

    -- 8. Clear the shopping cart for the customer
    DELETE FROM shopping_cart WHERE customer_id = p_customer_id;

    -- 9. Return the order_id as an output parameter
END //

DELIMITER ;

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

-- Execute: Call the ProcessOrder stored procedure
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

/* Stored Procedure 2: Simplified Return Process
@Author: Priyadarshan Parida
Input Parameters:
- p_order_detail_id: Order detail ID
- p_return_quantity: Quantity to return
- p_return_reason: Reason for return
- p_tax_rate: Tax rate
Output Parameters:
- p_return_id: Return ID of the newly created return
- p_payment_detail_id: Payment detail ID of the refund
Purpose: Cartwise is a startup, and return shipping 
is too expensive. Customers are offered to keep the item 
or donate even in cases we approve the refund.
Refunds are only approved for 'Defective', 'Damaged', 
or 'Wrong Item' reasons, and only if the return is 
requested within 30 days of purchase.
The refund was denied earlier and is being 
re-requested for the same order_detail_id.
The refund was already processed earlier, and the 
total quantity returned (including the current request) 
exceeds the total quantity purchased.
*/

DELIMITER //

CREATE PROCEDURE ProcessReturn(
    IN p_order_detail_id INT,
    IN p_return_quantity INT,
    IN p_return_reason ENUM(
        'Defective', 
        'Damaged', 
        'Wrong Item', 
        'No Longer Needed', 
        'Other'
    ),
    IN p_tax_rate DECIMAL(5, 2),
    OUT p_return_id INT,
    OUT p_payment_detail_id INT
)
BEGIN
    DECLARE v_product_id INT;
    DECLARE v_order_id INT;
    DECLARE v_order_date DATE;
    DECLARE v_refund_amount DECIMAL(10, 2);
    DECLARE v_payment_method ENUM('Credit Card', 'Gift Card', 'Debit Card');
    DECLARE v_account_number VARCHAR(50);
    DECLARE v_billing_address VARCHAR(255);
    DECLARE v_status ENUM('Refunded', 'Denied');
    DECLARE v_total_returned_quantity INT DEFAULT 0;
    DECLARE v_original_quantity INT;

    -- Get product_id, order_id, order_date, and original quantity from the order_detail and order_summary tables
    SELECT od.product_id, od.order_id, os.order_date, od.quantity
    INTO v_product_id, v_order_id, v_order_date, v_original_quantity
    FROM order_detail od
    JOIN order_summary os ON od.order_id = os.order_id
    WHERE od.order_detail_id = p_order_detail_id;

    -- Check if the return was denied earlier for the same order_detail_id
    IF EXISTS (
        SELECT 1
        FROM return_refund
        WHERE order_detail_id = p_order_detail_id AND status = 'Denied'
    ) THEN
        -- Deny the return if it was denied earlier
        SET v_refund_amount = 0.00;
        SET v_status = 'Denied';
    ELSE
        -- Calculate the total quantity already returned for this order_detail_id
        SELECT IFNULL(SUM(rr.return_quantity), 0)
        INTO v_total_returned_quantity
        FROM return_refund rr
        WHERE rr.order_detail_id = p_order_detail_id AND rr.status = 'Refunded';

        -- Check if the total quantity returned (including the current request) exceeds the original quantity
        IF (v_total_returned_quantity + p_return_quantity) > v_original_quantity THEN
            -- Deny the return if the total quantity exceeds the original quantity
            SET v_refund_amount = 0.00;
            SET v_status = 'Denied';
        ELSE
            -- Check if the return is eligible for a refund
            IF p_return_reason IN ('Defective', 'Damaged', 'Wrong Item') AND DATEDIFF(CURDATE(), v_order_date) <= 30 THEN
                -- Calculate the refund amount using the CalculateRefund function
                SET v_refund_amount = CalculateRefund(v_product_id, p_return_quantity, p_tax_rate);
                SET v_status = 'Refunded';
            ELSE
                -- Deny the return if the reason is not eligible or the return is requested after 30 days
                SET v_refund_amount = 0.00;
                SET v_status = 'Denied';
            END IF;
        END IF;
    END IF;

    -- Insert a new record into the return_refund table
    INSERT INTO return_refund (order_detail_id, product_id, return_reason, refund_amount, status)
    VALUES (p_order_detail_id, v_product_id, p_return_reason, v_refund_amount, v_status);

    -- Get the newly created return_id
    SET p_return_id = LAST_INSERT_ID();

    -- Only proceed with refund processing if the return is approved
    IF v_status = 'Refunded' THEN
        -- Update the order_detail table to adjust the quantity for partial returns
        UPDATE order_detail
        SET quantity = quantity - p_return_quantity
        WHERE order_detail_id = p_order_detail_id;

        -- Get the original payment details from the payment_detail table
        SELECT payment_method, account_number, billing_address
        INTO v_payment_method, v_account_number, v_billing_address
        FROM payment_detail
        WHERE order_id = v_order_id
        LIMIT 1;

        -- Insert a new record into the payment_detail table for the refund
        INSERT INTO payment_detail (order_id, payment_method, account_number, amount, payment_date, billing_address)
        VALUES (v_order_id, v_payment_method, v_account_number, -v_refund_amount, NOW(), v_billing_address);

        -- Get the newly created payment_detail_id
        SET p_payment_detail_id = LAST_INSERT_ID();
    END IF;
END //

DELIMITER ;

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

-- Execute
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

/* Stored Procedure 3: UpdateOrderStatus
@Author: Priyadarshan Parida
Purpose: Update the status of an order (e.g., from "Processing" to "Shipped" or "Delivered").
Input Parameters:
    - p_order_id (INT): The ID of the order to update.
    - p_new_status (ENUM): The new status for the order (e.g., "Processing", "Shipped", "Delivered").
Output: Success message or error if the order does not exist.
*/

DELIMITER //

CREATE PROCEDURE UpdateOrderStatus(
    IN p_order_id INT,
    IN p_new_status ENUM(
        'Processing', 
        'Shipped', 
        'Delivered', 
        'Cancelled'
    )
)
BEGIN
    -- Check if the order exists
    IF EXISTS (SELECT 1 FROM order_summary WHERE order_id = p_order_id) THEN
        -- Update the order status
        UPDATE order_summary
        SET order_status = p_new_status, updated_at = NOW()
        WHERE order_id = p_order_id;

        -- Return a success message
        SELECT CONCAT('Order ID ', p_order_id, ' status updated to ', p_new_status) AS message;
    ELSE
        -- Return an error message if the order does not exist
        SELECT CONCAT('Order ID ', p_order_id, ' does not exist.') AS error_message;
    END IF;
END //

DELIMITER ;

-- Test the UpdateOrderStatus procedure
-- Setup: Hold the original status in a variable
SET @original_status = NULL;
SELECT order_status
INTO @original_status
FROM order_summary
WHERE order_id = 1;
-- Execute: Call the stored procedure to update the order status
CALL UpdateOrderStatus(1, 'Shipped');
-- Verify the updated status in the order_summary table
SELECT * FROM order_summary WHERE order_id = 1;
-- Teardown: Revert the order status back to its original value
UPDATE order_summary
SET order_status = @original_status
WHERE order_id = 1;

/* Stored Procedure 4: AddProductToInventory
@Author: Priyadarshan Parida
Purpose: Add a new product to the inventory or update the 
quantity if the product already exists.
Input Parameters:
    - p_product_id (INT): The ID of the product.
    - p_supplier_id (INT): The ID of the supplier.
    - p_quantity (INT): The quantity to add.
    - p_location (VARCHAR): The location of the inventory.
    - p_reorder_level (INT): The reorder level for the product.
Output: Success message.
*/

DELIMITER //

CREATE PROCEDURE AddProductToInventory(
    IN p_product_id INT,
    IN p_supplier_id INT,
    IN p_quantity INT,
    IN p_location VARCHAR(255),
    IN p_reorder_level INT
)
BEGIN
    -- Check if the product already exists in the inventory
    IF EXISTS (
        SELECT 1 
        FROM inventory 
        WHERE product_id = p_product_id AND supplier_id = p_supplier_id
    ) THEN
        -- Update the quantity if the product exists
        UPDATE inventory
        SET 
            quantity = quantity + p_quantity,
            updated_at = NOW()
        WHERE 
            product_id = p_product_id AND supplier_id = p_supplier_id;

        -- Return a success message
        SELECT CONCAT('Updated inventory for Product ID ', p_product_id, ' with ', p_quantity, ' additional units.') AS message;
    ELSE
        -- Insert a new record if the product does not exist
        INSERT INTO inventory (product_id, supplier_id, quantity, location, reorder_level, created_at, updated_at)
        VALUES (p_product_id, p_supplier_id, p_quantity, p_location, p_reorder_level, NOW(), NOW());

        -- Return a success message
        SELECT CONCAT('Added Product ID ', p_product_id, ' to inventory with ', p_quantity, ' units.') AS message;
    END IF;
END //

DELIMITER ;

-- Test the AddProductToInventory procedure
-- Setup: Hold original quantity in a variable
SET @original_quantity = NULL;
SELECT quantity 
INTO @original_quantity
FROM inventory 
WHERE product_id = 1;
-- Execute: Call procedure AddProductToInventory
-- This should fail due to foreign key constraint with product and supplier
-- CALL AddProductToInventory(200, 300, 50, 'Test Warehouse', 10);
-- This should add 51 units to inventory of product_id = 1
CALL AddProductToInventory(1, 1, 51, 'Test Warehouse', 10);
-- Teardown: Restore quantity
UPDATE inventory SET quantity = @original_quantity WHERE product_id = 1;

/* Stored Procedure 5: UpdateProductPrice
@Author: Priyadarshan Parida
Purpose: Update the price of a product.
Input Parameters:
    - p_product_id (INT): The ID of the product.
    - p_new_price (DECIMAL): The new price for the product.
Output: Success message or error if the product does not exist.
*/

DELIMITER //

CREATE PROCEDURE UpdateProductPrice(
    IN p_product_id INT,
    IN p_new_price DECIMAL(10, 2)
)
BEGIN
    -- Check if the product exists
    IF EXISTS (SELECT 1 FROM product WHERE product_id = p_product_id) THEN
        -- Update the product price
        UPDATE product
        SET price = p_new_price, updated_at = NOW()
        WHERE product_id = p_product_id;

        -- Return a success message
        SELECT CONCAT('Product ID ', p_product_id, ' price updated to ', p_new_price) AS message;
    ELSE
        -- Return an error message if the product does not exist
        SELECT CONCAT('Product ID ', p_product_id, ' does not exist.') AS error_message;
    END IF;
END //

DELIMITER ;

-- Setup: Hold the original price in a variable
SET @original_price = NULL;
SELECT price 
INTO @original_price
FROM product 
WHERE product_id = 1;

-- Execute: Call the UpdateProductPrice procedure
CALL UpdateProductPrice(1, 1099.99);
-- Verify the updated price
SELECT * FROM product WHERE product_id = 1;
-- Teardown: Restore the original price
UPDATE product 
SET price = @original_price 
WHERE product_id = 1;

/* Stored Procedure 6: PurgeInactiveLogins
@Author: Priyadarshan Parida
Purpose: Remove inactive logins older than 2 years.
Input Parameters: None.
Output: Number of rows deleted.
*/

DELIMITER //

CREATE PROCEDURE PurgeInactiveLogins()
BEGIN
    DECLARE v_deleted_count INT;

    -- Delete inactive logins older than 2 years
    DELETE FROM login
    WHERE is_active = FALSE
      AND last_login_date < CURDATE() - INTERVAL 2 YEAR;

    -- Get the number of rows deleted
    SET v_deleted_count = ROW_COUNT();

    -- Return the number of rows deleted
    SELECT CONCAT(v_deleted_count, ' inactive logins purged.') AS message;
END //

DELIMITER ;


-- Setup: Insert test data into the customer table
INSERT INTO customer (first_name, last_name, dob, gender, email, phone, address_line1, city, state, zip, country)
VALUES
('Test', 'User1', '1990-01-01', 'Male', 'test.user1@example.com', '1234567890', '123 Test St', 'Test City', 'TX', '75001', 'USA'),
('Test', 'User2', '1991-01-01', 'Female', 'test.user2@example.com', '1234567891', '456 Test St', 'Test City', 'TX', '75002', 'USA'),
('Test', 'User3', '1992-01-01', 'Male', 'test.user3@example.com', '1234567892', '789 Test St', 'Test City', 'TX', '75003', 'USA');
-- Hold the customer IDs in variables
SET @cid = LAST_INSERT_ID();
INSERT INTO login (customer_id, password_hash, registration_date, last_login_date, is_active)
VALUES
(@cid, SHA2('password123', 256), '2020-01-01 10:00:00', '2021-01-01 10:00:00', FALSE), -- Inactive, older than 2 years
(@cid + 1, SHA2('password456', 256), '2020-01-01 10:00:00', '2023-05-01 10:00:00', FALSE), -- Inactive, within 2 years
(@cid + 2, SHA2('password789', 256), '2020-01-01 10:00:00', '2024-01-01 10:00:00', TRUE);  -- Active, older than 2 years
-- Execute: Call PurgeInactiveLogins
SET SQL_SAFE_UPDATES = 0;
CALL PurgeInactiveLogins();
SET SQL_SAFE_UPDATES = 1;
-- Verify if inactive logins purged.
SELECT * FROM login WHERE customer_id IN (@cid, @cid + 1, @cid + 2);
-- Teardown: Remove test data from login table
DELETE FROM login WHERE customer_id IN (@cid, @cid + 1, @cid + 2);
DELETE FROM customer WHERE customer_id IN (@cid, @cid + 1, @cid + 2);


-- ********************* Step 7: Create Triggers *********************
/* Trigger 1: UpdateProductRating
@Author: Priyadarshan Parida
Purpose: Automatically update the product_review 
column in the product table whenever a new review is 
added in the product_review table.
*/

DELIMITER //

CREATE TRIGGER UpdateProductRating
AFTER INSERT ON product_review
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(3, 2);

    -- Calculate the new average rating
    SELECT AVG(rating)
    INTO avg_rating
    FROM product_review
    WHERE product_id = NEW.product_id;

    -- Update the product table with the new average rating
    UPDATE product
    SET product_review = IFNULL(avg_rating, 0.00)
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

-- Test the UpdateProductRating trigger
-- Setup: Check the current product_review value for a product
SET @original_rating = NULL;
SELECT product_review
INTO @original_rating
FROM product
WHERE product_id = 1; -- Example: iPhone 14
-- Execution: Insert a new review into the product_review table
INSERT INTO product_review (product_id, customer_id, rating, review_text)
VALUES (1, 1014, 1, 'Excellent product! Highly recommend.');
-- Verify if the product_review column in the product table is updated
SELECT product_id, product_name, product_review
FROM product
WHERE product_id = 1;
-- Teardown Remove the test review
DELETE FROM product_review
WHERE product_id = 1 AND customer_id = 1014;
UPDATE product
SET product_review = @original_rating
WHERE product_id = 1;

/* Trigger 2: UpdateSupplierRating
@Author: Priyadarshan Parida
Purpose: Automatically update the supplier_rating
column in the supplier table whenever a new review is
added, updated, or deleted in the seller_review table.
*/

DELIMITER //

CREATE TRIGGER UpdateSupplierRating
AFTER INSERT ON seller_review
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    -- Calculate the new average rating
    SELECT AVG(rating)
    INTO avg_rating
    FROM seller_review
    WHERE seller_id = NEW.seller_id;

    -- Update the supplier table with the new average rating
    UPDATE supplier
    SET supplier_rating = IFNULL(avg_rating, 0.00)
    WHERE supplier_id = NEW.seller_id;
END //

DELIMITER ;

-- Setup: Check the current supplier_rating value for a supplier
SET @original_supplier_rating = NULL;
SELECT supplier_rating
INTO @original_supplier_rating
FROM supplier
WHERE supplier_id = 1; -- Example: Tech Distributors Inc.

-- Execution: Insert a new review into the seller_review table
INSERT INTO seller_review (seller_id, customer_id, rating, review_text)
VALUES (1, 1014, 4, 'Good service but delivery was slightly delayed.');

-- Verify if the supplier_rating column in the supplier table is updated
SELECT supplier_id, supplier_name, supplier_rating
FROM supplier
WHERE supplier_id = 1;

-- Teardown: Remove the test review
DELETE FROM seller_review
WHERE seller_id = 1 AND customer_id = 1014;

-- Restore the original supplier_rating
UPDATE supplier
SET supplier_rating = @original_supplier_rating
WHERE supplier_id = 1;

/* Trigger 3: PreventNegativeInventory
@Author: Priyadarshan Parida
Purpose: Ensure that the quantity in the inventory 
table never goes below zero during an update or insert.
*/

DELIMITER //

CREATE TRIGGER PreventNegativeInventory
BEFORE UPDATE ON inventory
FOR EACH ROW
BEGIN
    IF NEW.quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Inventory quantity cannot be negative.';
    END IF;
END //

DELIMITER ;

-- Test the PreventNegativeInventory trigger
-- This should fail due to the trigger
-- UPDATE inventory
-- SET quantity = -5
-- WHERE product_id = 1;


/* Trigger 4: LogFailedLoginAttempts
@Author: Priyadarshan Parida
Purpose: Automatically increment the number_of_failed_attempts
in the login_attempt table whenever a customer's last_login_status
is updated to false in the login table.
*/

DELIMITER //

CREATE TRIGGER LogFailedLoginAttempts
AFTER UPDATE ON login
FOR EACH ROW
BEGIN
    IF NEW.last_login_status = FALSE THEN
        -- Try to update
        UPDATE login_attempt
        SET number_of_failed_attempts = number_of_failed_attempts + 1
        WHERE customer_id = NEW.customer_id;

        -- If no rows updated, insert one
        IF ROW_COUNT() = 0 THEN
            INSERT INTO login_attempt (customer_id, number_of_failed_attempts)
            VALUES (NEW.customer_id, 1);
        END IF;
    END IF;
END //

DELIMITER ;

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

/* Trigger 5: LogEmailChange
@Author: Priyadarshan Parida
Purpose: Automatically log changes to customer
email in the customer_change_log table.
*/

DELIMITER //

CREATE TRIGGER LogEmailChange
AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        INSERT INTO customer_change_log (customer_id, field_changed, old_value, new_value, changed_at, changed_by)
        VALUES (OLD.customer_id, 'email', OLD.email, NEW.email, NOW(), 'System');
    END IF;
END //

DELIMITER ;

-- Test the LogEmailChange trigger
-- Setup: Hold original email in a variable
SET @original_email = NULL;
SELECT email 
INTO @original_email
FROM customer 
WHERE customer_id = 1001;
-- Execution: Update the email for the test customer
UPDATE customer
SET email = 'test.user.new@example.com'
WHERE customer_id = 1001;

-- Verify: Check if the change is logged in the customer_change_log table
SELECT * 
FROM customer_change_log
WHERE customer_id = 1001 AND field_changed = 'email';

-- Teardown: Remove the test data
UPDATE customer
SET email = @original_email
WHERE customer_id = 1001;

/* Trigger 6: LogAddressChange
@Author: Priyadarshan Parida
Purpose: Automatically log changes to customer
address in the customer_change_log table.
*/

DELIMITER //

CREATE TRIGGER LogAddressChange
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    -- Log changes to address_line1
    IF OLD.address_line1 != NEW.address_line1 THEN
        INSERT INTO customer_change_log (customer_id, field_changed, old_value, new_value, changed_at, changed_by)
        VALUES (OLD.customer_id, 'address_line1', OLD.address_line1, NEW.address_line1, NOW(), 'System');
    END IF;

    -- Log changes to address_line2
    IF OLD.address_line2 != NEW.address_line2 THEN
        INSERT INTO customer_change_log (customer_id, field_changed, old_value, new_value, changed_at, changed_by)
        VALUES (OLD.customer_id, 'address_line2', OLD.address_line2, NEW.address_line2, NOW(), 'System');
    END IF;

    -- Log changes to city
    IF OLD.city != NEW.city THEN
        INSERT INTO customer_change_log (customer_id, field_changed, old_value, new_value, changed_at, changed_by)
        VALUES (OLD.customer_id, 'city', OLD.city, NEW.city, NOW(), 'System');
    END IF;

    -- Log changes to state
    IF OLD.state != NEW.state THEN
        INSERT INTO customer_change_log (customer_id, field_changed, old_value, new_value, changed_at, changed_by)
        VALUES (OLD.customer_id, 'state', OLD.state, NEW.state, NOW(), 'System');
    END IF;

    -- Log changes to zip
    IF OLD.zip != NEW.zip THEN
        INSERT INTO customer_change_log (customer_id, field_changed, old_value, new_value, changed_at, changed_by)
        VALUES (OLD.customer_id, 'zip', OLD.zip, NEW.zip, NOW(), 'System');
    END IF;

    -- Log changes to country
    IF OLD.country != NEW.country THEN
        INSERT INTO customer_change_log (customer_id, field_changed, old_value, new_value, changed_at, changed_by)
        VALUES (OLD.customer_id, 'country', OLD.country, NEW.country, NOW(), 'System');
    END IF;
END //

DELIMITER ;

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

/* Trigger 7: ArchiveDeletedCustomer
@Author: Priyadarshan Parida
Purpose: Archive customer details into the archived_customer table before deletion.
*/

DELIMITER //

CREATE TRIGGER ArchiveDeletedCustomer
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO archived_customer (
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        address_line1,
        address_line2,
        city,
        state,
        zip,
        country
    )
    VALUES (
        OLD.customer_id,
        OLD.first_name,
        OLD.last_name,
        OLD.email,
        OLD.phone,
        OLD.address_line1,
        OLD.address_line2,
        OLD.city,
        OLD.state,
        OLD.zip,
        OLD.country
    );
END //

DELIMITER ;

-- Test the ArchiveDeletedCustomer trigger
-- Setup: Insert a test customer
INSERT INTO customer (first_name, last_name, email, phone, address_line1, city, state, zip, country)
VALUES ('Test', 'User', 'test.user@example.com', '1234567890', '123 Test St', 'Test City', 'TX', '75001', 'USA');
SET @test_customer_id = LAST_INSERT_ID();

-- Execution: Delete the test customer
DELETE FROM customer WHERE customer_id = @test_customer_id;

-- Verify: Check if the customer is archived in the archived_customer table
SELECT * 
FROM archived_customer
WHERE customer_id = @test_customer_id;

-- ********************* Step 8: Script Complex SQL Queries *********************

/* Query 1: Customer login
@Author: Soniya Rajappan
*/
SELECT 
    CONCAT('Welcome ', c.first_name, ' ', c.last_name, '!') AS welcome_message
FROM 
    customer c
JOIN 
    login l ON c.customer_id = l.customer_id
WHERE 
    c.email = 'john.doe@example.com' 
    AND l.password_hash = 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f'
    AND l.is_active = TRUE;

/* Query 2: search for products based on keywords in
product name, description, or category name.
@Author: Sunayana Jana
*/
SELECT 
    c.category_name,
    p.product_id,
    p.product_name,
    p.product_description,
    p.price,
    i.quantity AS stock
FROM 
    product p
JOIN 
    product_category c ON p.category_id = c.category_id
JOIN
    inventory i ON p.product_id = i.product_id
WHERE 
    p.product_name LIKE '%Off-Road%' 
    OR p.product_description LIKE '%Off-Road%'  
    OR c.category_name LIKE '%Off-Road%';

/* Query 3: Get inventory details for a specific product
@Author: Soniya Rajappan
*/
SELECT 
    i.inventory_id,
    p.product_name,
    i.quantity AS stock,
    i.location,
    i.reorder_level
FROM
    inventory i
JOIN
    product p ON i.product_id = p.product_id
WHERE
    p.product_id = '1';

/* Query 4: Get inventory details for a specific supplier
@Author: Sunayana Jana
*/
SELECT 
    i.supplier_id,
    s.supplier_name,
    i.inventory_id,
    p.product_name,
    i.quantity AS stock,
    i.location,
    i.reorder_level
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.product_id
JOIN
    supplier s ON i.supplier_id = s.supplier_id
WHERE 
    i.supplier_id = 1
ORDER BY 
    p.product_name;

/* Query 5: Get products below reorder level
@Author: Winnie Manyara
*/
SELECT 
    i.location,
    s.supplier_name,
    p.product_name,
    i.quantity AS stock,
    i.reorder_level
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.product_id
JOIN 
    supplier s ON i.supplier_id = s.supplier_id
WHERE 
    i.quantity < i.reorder_level
ORDER BY 
    i.location, s.supplier_name, p.product_name;

/* Query 6: Get inventory summary by location
@Author: Winnie Manyara
*/
SELECT 
    i.location,
    p.product_id,
    p.product_name,
    COUNT(i.inventory_id) AS total_products,
    SUM(i.quantity) AS total_stock,
    SUM(i.quantity * p.price) AS total_value
FROM 
    inventory i
JOIN 
    product p ON i.product_id = p.product_id
GROUP BY 
    i.location, p.product_id, p.product_name;

/* Query 7: Get shopping cart details for a specific customer
@Author: Priyadarshan Parida
*/
SELECT
    sc.cart_id,
    c.customer_id,
    p.product_id,
    p.product_name,
    sc.quantity
FROM
    shopping_cart sc
JOIN
    customer c ON sc.customer_id = c.customer_id
JOIN
    product p ON sc.product_id = p.product_id
WHERE
    c.customer_id = 1001
ORDER BY
    sc.cart_id;

/* Query 8: Order Summary and Payment Details
@Author: Priyadarshan Parida
*/
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

/* Query 9: Display order details with product and shipping information
@Author: Priyadarshan Parida
*/
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

/* Query 10: Display return history for customer
@Author: Priyadarshan Parida
*/
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    os.order_id,
    od.order_detail_id,
    p.product_id,
    p.product_name,
    p.price,
    od.quantity,
    r.refund_amount,
    r.return_reason,
    r.status AS return_status
FROM
    customer c
JOIN
    order_summary os ON c.customer_id = os.customer_id
JOIN
    order_detail od ON os.order_id = od.order_id
JOIN
    product p ON od.product_id = p.product_id
JOIN
    return_refund r ON od.order_detail_id = r.order_detail_id
WHERE
    c.customer_id = 1004;

/* Query 11: Get customer order history
@Author: Qurrat Ul Ain
*/
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

/* Query 12: Get top-rated products with the highest number of reviews
@Author: Qurrat Ul Ain
*/
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

/* Query 13: Get unresolved customer service tickets
@Author: Sai Vishnu Malladi
*/
SELECT 
    cs.ticket_id,
    cs.issue_description,
    cs.status,
    cs.created_at,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email AS customer_email
FROM 
    customer_service cs
JOIN 
    customer c ON cs.customer_id = c.customer_id
WHERE 
    cs.status = 'Open'
ORDER BY 
    cs.created_at ASC;

/* Query 14: Get seller rating
@Author: Sai Vishnu Malladi
*/
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