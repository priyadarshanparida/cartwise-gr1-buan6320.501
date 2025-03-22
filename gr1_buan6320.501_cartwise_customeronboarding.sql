-- Module 1. Customer Onboarding
USE cartwise;

-- Insert 1: Insert records into the customer table
INSERT INTO customer (cid, fname, lname, dob, gender, email, phone, address_line1, address_line2, city, state, zip, country) VALUES
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
INSERT INTO login (cid, password_hash, registration_date, last_login_date, is_active) VALUES
(1000, SHA2('password123', 256), '2023-01-01 10:00:00', '2025-03-20 15:30:00', TRUE),
(1001, SHA2('password456', 256), '2023-01-02 11:00:00', '2025-03-19 14:20:00', TRUE),
(1002, SHA2('password789', 256), '2023-01-03 12:00:00', '2025-03-18 13:10:00', TRUE),
(1003, SHA2('password321', 256), '2023-01-04 13:00:00', '2025-03-17 12:00:00', TRUE),
(1004, SHA2('password654', 256), '2023-01-05 14:00:00', '2025-03-16 11:50:00', TRUE),
(1005, SHA2('password987', 256), '2023-01-06 15:00:00', '2025-03-15 10:40:00', TRUE),
(1006, SHA2('password111', 256), '2023-01-07 16:00:00', '2025-03-14 09:30:00', TRUE),
(1007, SHA2('password222', 256), '2023-01-08 17:00:00', '2025-03-13 08:20:00', TRUE),
(1008, SHA2('password333', 256), '2023-01-09 18:00:00', '2025-03-12 07:10:00', TRUE),
(1009, SHA2('password444', 256), '2023-01-10 19:00:00', '2025-03-11 06:00:00', TRUE),
(1010, SHA2('password555', 256), '2023-01-11 20:00:00', '2025-03-10 05:50:00', TRUE),
(1011, SHA2('password666', 256), '2023-01-12 21:00:00', '2025-03-09 04:40:00', TRUE),
(1012, SHA2('password777', 256), '2023-01-13 22:00:00', '2025-03-08 03:30:00', TRUE),
(1013, SHA2('password888', 256), '2023-01-14 23:00:00', '2025-03-07 02:20:00', TRUE),
(1014, SHA2('password999', 256), '2023-01-15 09:00:00', '2025-03-06 01:10:00', TRUE);
SELECT * FROM login;