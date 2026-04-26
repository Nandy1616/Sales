# E-Learning Platform Purchases Analysis
Analyzing E-Learning Platform Purchases using MySQL

# 📖 Project Overview
This project focuses on analyzing purchase data from an online e-learning platform using MySQL. The platform offers various digital courses to learners across different countries.
The objective is to design a relational database and perform SQL queries to extract meaningful insights such as:
Learner spending behavior
Popular courses
Revenue by category
Purchase patterns

# 🗂️ Database Structure
The project consists of three main tables:
1. learners
Stores learner details
learner_id (Primary Key)
full_name
country
2. courses
Stores course information
course_id (Primary Key)
course_name
category
unit_price
3. purchases
Stores purchase transactions
purchase_id (Primary Key)
learner_id (Foreign Key)
course_id (Foreign Key)
quantity
purchase_date

# ⚙️ Features & Operations
🔹 Database Setup
Created MySQL database
Defined tables with proper constraints
Established relationships using foreign keys
Inserted sample data

# 🔹 Data Exploration Using Joins
Used SQL joins to combine data across tables:
# INNER JOIN – For matching records
# LEFT JOIN – To include all learners
# RIGHT JOIN – To include all courses
Displayed:
Learner name
Course name
Category
Quantity
Total amount (quantity × price)
Purchase date

# 🔹 Analytical Queries
Q1: Total Spending per Learner
Calculated total spending grouped by learner and country
Q2: Top 3 Most Purchased Courses
Identified courses with highest total quantity sold
Q3: Revenue by Category
Computed:
Total revenue
Number of unique learners per category
Q4: Multi-Category Learners
Listed learners who purchased from more than one category
Q5: Unpurchased Courses
Identified courses with zero purchases

# 🛠️ SQL Concepts Used
CREATE DATABASE, CREATE TABLE
INSERT INTO
INNER JOIN, LEFT JOIN, RIGHT JOIN
GROUP BY, HAVING
ORDER BY, LIMIT
Aggregate functions (SUM, COUNT)
Derived columns (calculations like revenue)

# 📊 Key Insights
Certain courses generate higher revenue due to repeated purchases
Some categories are more popular among learners
A small group of learners contributes significantly to total sales
Some courses have no purchases → need marketing focus

# 💡 Recommendations
Focus marketing on top-performing categories
Offer discounts on low-performing courses
Target high-spending learners with premium courses
Improve visibility of unpurchased courses

# 📦 Deliverables
MySQL Script (.sql)
Table creation
Data insertion
Insights

# 🎯 Skills Demonstrated
Database design and schema creation
Data analysis using SQL
Query optimization and joins
Business insight generation
Data presentation and reporting

# 📌 Conclusion
This project successfully demonstrated how MySQL can be used to design a relational database and analyze real-world e-learning purchase data. By creating structured tables and applying SQL operations such as joins, aggregations, and filtering, meaningful insights were extracted from the dataset.
