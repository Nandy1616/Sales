-- create database
create database elearning_db;
use elearning_db;

-- Learners Table
CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);

-- Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- Purchases Table
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert Learners
INSERT INTO learners(learner_id, full_name, country) 
VALUES
(1, 'Nandhini', 'India'),
(2, 'Arun', 'India'),
(3, 'John', 'USA'),
(4, 'Sara', 'UK'),
(5, 'Ali', 'UAE'),
(6,'Ravi Patel', 'India'),
(7,'Emily Clark', 'USA'),
(8,'David Miller', 'Canada'),
(9,'Sophia Brown', 'UK'),
(10,'Chen Wei', 'China');

-- Insert Courses
INSERT INTO courses(course_id, course_name, category, unit_price) VALUES
(101, 'Python Basics', 'Programming', 50.00),
(102, 'SQL Mastery', 'Database', 60.00),
(103, 'Power BI', 'Analytics', 70.00),
(104, 'Excel Advanced', 'Productivity', 40.00),
(105, 'Machine Learning', 'AI', 100.00),
(106,'Machine Learning', 'Programming', 3000.00),
(107,'Tableau', 'Analytics', 1700.00),
(108,'Digital Marketing', 'Marketing', 1400.00),
(109,'Cloud Computing', 'IT', 2800.00),
(110,'Cyber Security', 'IT', 2600.00);

-- Insert Purchases
INSERT INTO purchases(purchase_id, learner_id, course_id, quantity, purchase_date) VALUES
(1, 1, 101, 2, '2024-01-10'),
(2, 2, 102, 1, '2024-01-11'),
(3, 1, 103, 1, '2024-01-15'),
(4, 3, 101, 3, '2024-01-20'),
(5, 4, 104, 2, '2024-01-22'),
(6, 5, 103, 1, '2024-01-25'),
(7, 2, 105, 1, '2024-01-28'),
(8, 1, 6, 1, '2024-03-20'),
(9, 2, 7, 2, '2024-03-21'),
(10, 3, 8, 1, '2024-03-22'),
(11, 4, 9, 2, '2024-03-23'),
(12, 5, 10, 1, '2024-03-24'),
(13, 6, 1, 3, '2024-03-25'),
(14, 7, 2, 1, '2024-03-26'),
(15, 8, 3, 2, '2024-03-27'),
(16, 9, 4, 1, '2024-03-28'),
(17, 10, 5, 2, '2024-03-29'),
(18, 1, 7, 1, '2024-03-30'),
(19, 2, 8, 2, '2024-03-31');


Select * from learners;
select * from courses;
select * from purcourseschases;

-- Format Currency Decimal 2
SELECT 
    FORMAT(p.quantity * c.unit_price, 2) AS total_revenue
FROM purchases p
JOIN courses c ON p.course_id = c.course_id;

-- Use aliases for column names (e.g., AS total_revenue)
SELECT 
    (p.quantity * c.unit_price) AS total_revenue
FROM purchases p
JOIN courses c ON p.course_id = c.course_id;

-- Highest total spent first
SELECT 
    l.full_name AS learner_name,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name
ORDER BY total_spent DESC;

-- joins
SELECT 
    l.full_name AS learner_name,
    l.country AS country,
    c.course_name AS course_name,
    c.category AS category,
    p.quantity AS quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date AS purchase_date
FROM purchases p
INNER JOIN learners l ON p.learner_id = l.learner_id
INNER JOIN courses c ON p.course_id = c.course_id;

-- Display each learner’s purchase details (course name, category, quantity, total amount, and purchase date).
SELECT 
    l.full_name AS learner_name,
    c.course_name AS course_name,
    c.category AS category,
    p.quantity AS quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
   p.purchase_date AS purchase_date
FROM purchases p
INNER JOIN learners l ON p.learner_id = l.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
ORDER BY total_amount DESC;

-- Analytical Queries
-- Q1 Total Spending per Learner
SELECT 
    l.full_name,
    l.country,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name, l.country
ORDER BY total_spent DESC;

-- Q2 Top 3 Most Purchased Courses
SELECT 
    c.course_name,
    SUM(p.quantity) AS total_quantity
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_name
ORDER BY total_quantity DESC
LIMIT 3;

-- Q3 Category Revenue & Unique Learners
SELECT 
    c.category,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category;

-- Q4 Learners with Multiple Categories
SELECT 
    l.full_name
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name
HAVING COUNT(DISTINCT c.category) > 1;

-- Q5 Courses Not Purchased
SELECT 
    c.course_name
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.course_id IS NULL;


-- Q6 Monthly Revenue Trend
SELECT 
    DATE_FORMAT(p.purchase_date, '%Y-%m') AS month,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS monthly_revenue
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY month
ORDER BY month;
-- Q7 Top Spending Learner
SELECT 
    l.full_name,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name
ORDER BY total_spent DESC
LIMIT 1;
-- Q8 Average Order Value per Learner
SELECT 
    l.full_name,
    FORMAT(AVG(p.quantity * c.unit_price), 2) AS avg_order_value
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name;

-- Q9 Most Popular Category (by Quantity)
SELECT 
    c.category,
    SUM(p.quantity) AS total_quantity
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category
ORDER BY total_quantity DESC
LIMIT 1;

-- Q10 Revenue per Course
SELECT 
    c.course_name,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_name
ORDER BY total_revenue DESC;












