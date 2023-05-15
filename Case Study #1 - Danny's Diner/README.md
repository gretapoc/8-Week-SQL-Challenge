
# Case Study #1 - Danny's Diner

<p align="center">
  <img height="400" src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/1.png">
</p>


## Table of Contents

- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
- [Example Datasets](#example-datasets)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Case Study Questions And Answers](#case-study-questions-and-answers)
	- [1. What is the total amount each customer spent at the restaurant?](#1-what-is-the-total-amount-each-customer-spent-at-the-restaurant)
	- [2. How many days has each customer visited the restaurant?](#2-how-many-days-has-each-customer-visited-the-restaurant)
	- [3. What was the first item from the menu purchased by each customer?](#3-what-was-the-first-item-from-the-menu-purchased-by-each-customer)
	- [4. What is the most purchased item on the menu and how many times was it purchased by all customers?](#4-what-is-the-most-purchased-item-on-the-menu-and-how-many-times-was-it-purchased-by-all-customers)
	- [5. Which item was the most popular for each customer?](#5-which-item-was-the-most-popular-for-each-customer)
	- [6. Which item was purchased first by the customer after they became a member?](#6-which-item-was-purchased-first-by-the-customer-after-they-became-a-member)
	- [7. Which item was purchased just before the customer became a member?](#7-which-item-was-purchased-just-before-the-customer-became-a-member)
	- [8. What is the total items and amount spent for each member before they became a member?](#8-what-is-the-total-items-and-amount-spent-for-each-member-before-they-became-a-member)
	- [9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?](#9-if-each-1-spent-equates-to-10-points-and-sushi-has-a-2x-points-multiplier---how-many-points-would-each-customer-have)
	- [10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?](#10-in-the-first-week-after-a-customer-joins-the-program-including-their-join-date-they-earn-2x-points-on-all-items-not-just-sushi---how-many-points-do-customer-a-and-b-have-at-the-end-of-january)

## Introduction

Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.

Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.

## Problem Statement

Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. 
Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

## Example Datasets

Danny has shared 3 key datasets for this case study:

- The `sales` table captures all `customer_id` level purchases with an corresponding `order_date` and `product_id` information for when and what menu items were ordered.
- The `menu` table maps the `product_id` to the actual `product_name` and `price` of each menu item.
- The final `members` table captures the `join_date` when a `customer_id` joined the beta version of the Danny’s Diner loyalty program.

## Entity Relationship Diagram

<p align="center">
  <img src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/diag1.PNG">
</p>

## Case Study Questions And Answers

### 1. What is the total amount each customer spent at the restaurant?

**Solution:**

- Selecting the `customer_id` and the sum of prices (`total_amount`) from the `sales` and `menu` tables.
- Defining the tables aliases as 's' for `sales` and 'm' for `menu`.
- Joining the `sales` and `menu` tables based on the `product_id` column.
- Grouping the results by `customer_id`.
- Ordering the results in ascending order based on `customer_id`.

```sql
SELECT 
	customer_id, 
	SUM(m.price) AS total_amount
FROM sales AS s
JOIN menu AS m
ON s.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id;
```

**Answer:**

| customer_id | total_sales |
| ----------- | ----------- |
| A           | 76          |
| B           | 74          |
| C           | 36          |

Customer A spent $76, customer B spent $74, and customer C spent $36 at the restaurant.

### 2. How many days has each customer visited the restaurant?


**Solution:**

- Selecting the `customer_id` and counting the number of order dates (days visited) from the `sales` table.
- Grouping the results by `customer_id`.
- Ordering the results in ascending order based on `customer_id`.

```sql
SELECT 
	customer_id, 
	COUNT(order_date) AS days_visited
FROM sales
GROUP BY customer_id
ORDER BY customer_id;
```

**Answer:**

| customer_id | days_visited |
| ----------- | ----------- |
| A           | 6           |
| B           | 6           |
| C           | 3           |

Customer A and B visited the restaurant 6 days each, customer C visited 3 days.


### 3. What was the first item from the menu purchased by each customer?


**Solution:**

- Selecting the `customer_id` and `product_name` from the `sales` and `menu` tables.
- Subquery to assign row numbers to each customer's purchases based on `order_date`.
- Joining the subquery with the menu table based on the `product_id` column.
- Filtering the results to include only the first row for each customer.

```sql
SELECT s.customer_id, m.product_name
FROM (
	SELECT 
		customer_id, 
		product_id, 
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
	FROM sales
) AS s
JOIN menu AS m 
ON s.product_id = m.product_id
WHERE s.row_num = 1
ORDER BY customer_id;
```

**Answer:**

| customer_id | product_name   |
| ----------- | -------------- |
| A           | sushi          |
| B           | curry          |
| C           | ramen          |


### 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

**Solution:**

- Selecting the top 1 row with the most purchased item and its count from the sales and menu tables.
- From the sales table with an alias 's'.
- Joining the sales and menu tables based on the product_id column.
- Grouping the results by product_name.
- Ordering the results in descending order based on the count of times_purchased.

```sql
SELECT TOP(1) 
	product_name, 
	COUNT(product_name) AS times_purchased
FROM sales AS s
JOIN menu AS m
ON s.product_id = m.product_id
GROUP BY product_name
ORDER BY times_purchased DESC;
```

**Answer:**

| product_name | times_purchased |
| ------------ | --------------- |
| ramen        | 8               |

The most purchased item on the menu is ramen. It was purchased 8 times by all customers combined.

### 5. Which item was the most popular for each customer?

**Solution:**

- Selecting the customer_id, product_name, and num_items from the nu subquery.
-  Creating a subquery named nu to calculate the count of each product purchased by each customer.
-  Subquery nu: calculates the count of each product purchased by each customer.
-  Joining the nu subquery with another subquery ma to determine the most popular item for each customer.
-  Subquery ma: determines the maximum count of items purchased by each customer.
-  Subquery nu: calculates the count of each product purchased by each customer.
-  Ordering the results in descending order based on num_items.

```sql
SELECT 
	nu.customer_id, 
	nu.product_name, 
	nu.num_items
FROM (
	SELECT customer_id, product_name, COUNT(s.product_id) AS num_items
	FROM sales AS s
	JOIN menu AS m
	ON s.product_id = m.product_id
	GROUP BY customer_id, product_name
) AS nu
INNER JOIN (
	SELECT nu.customer_id, MAX(num_items) AS max_items
	FROM (
		SELECT customer_id, product_name, COUNT(s.product_id) AS num_items
		FROM sales AS s
		JOIN menu AS m
		ON s.product_id = m.product_id
		GROUP BY customer_id, product_name
	) AS nu
	GROUP BY nu.customer_id) AS ma
ON nu.customer_id = ma.customer_id
AND nu.num_items = ma.max_items
ORDER BY nu.num_items DESC;
```

**Answer:**

| customer_id | product_name | num_items |
| ----------- | ------------ | --------- |
| C           | ramen        | 3         |
| A           | ramen        | 3         |
| B           | sushi        | 2         |
| B           | curry        | 2         |
| B           | ramen        | 2         |


### 6. Which item was purchased first by the customer after they became a member?

**Solution:**

- Selecting the customer_id, order_date, and product_name (as first_item) from the fir subquery.
- Subquery fir: assigns row numbers to each customer's purchases after becoming a member.
- Joining the fir subquery with the menu table based on the product_id column.
- Filtering the results to include only the first row for each customer.
- Ordering the results in ascending order based on customer_id.

```sql
SELECT 
	customer_id,
	order_date,
	product_name AS first_item
FROM (
	SELECT 
		s.customer_id, 
		order_date, 
		product_id,
		RANK() OVER (PARTITION BY s.customer_id ORDER BY order_date) AS row_num
	FROM members AS e
	JOIN sales AS s
	ON s.customer_id = e.customer_id
	WHERE join_date <= order_date
) AS fir
JOIN menu AS m
ON  fir.product_id = m.product_id
WHERE row_num = 1
ORDER BY customer_id;
```

**Answer:**

| customer_id | order_date | first_item |
| ----------- | ---------- | ---------- |
| A           | 2021-01-07 | curry      |
| B           | 2021-01-11 | sushi      |

Customer A first purchased curry after becoming a member, and customer B first purchased sushi.


### 7. Which item was purchased just before the customer became a member?

**Solution:**

- Selecting the customer_id, order_date, join_date, and product_name (as first_item).
- Subquery fir: assigns row numbers to each customer's purchases just before becoming a member.
- Joining the fir subquery with the menu table based on the product_id column.
- Filtering the results to include only the first row for each customer.
- Ordering the results in ascending order based on customer_id.

```sql
SELECT 
	customer_id,
	order_date,
	join_date,
	product_name AS first_item
FROM (
	SELECT 
		s.customer_id, 
		order_date, 
		product_id,
		join_date,
		RANK() OVER (PARTITION BY s.customer_id ORDER BY order_date DESC) AS row_num
	FROM members AS e
	JOIN sales AS s
	ON s.customer_id = e.customer_id
	WHERE join_date > order_date
) AS fir
JOIN menu AS m
ON  fir.product_id = m.product_id
WHERE row_num = 1
ORDER BY customer_id;
```

**Answer:**

| customer_id | order_date  | join_date  | first_item |
| ----------- | ----------- | ---------- | ---------- |
| A           | 2021-01-01  | 2021-01-07 | sushi      |
| A           | 2021-01-01  | 2021-01-07 | curry      |
| B           | 2021-01-04  | 2021-01-09 | sushi      |

Customer A purchased sushi and curry just before they became a member, customer B purchased sushi.


### 8. What is the total items and amount spent for each member before they became a member?

**Solution:**

- Selecting the customer_id, count of product_id (as num_items), and sum of price (as total_sales)
- Joining the sales, members, and menu tables
- Filtering sales that occurred before the customer became a member
- Grouping results by customer_id

```sql
SELECT 
	s.customer_id,
	COUNT(s.product_id) AS num_items, 
    SUM(price) AS total_sales
FROM sales AS s
JOIN members AS e
ON s.customer_id = e.customer_id
JOIN menu AS m
ON s.product_id = m.product_id
WHERE order_date < join_date
GROUP BY s.customer_id;
```

**Answer:**

| customer_id | num_items | total_sales |
| ----------- | --------- | ----------- |
| A           | 2         | 25          |
| B           | 3         | 40          |

Customer A purchased 2 items for a total of $25, and Customer B purchased 3 items for a total of $40 before becoming a member.


### 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

**Solution:**

- Selecting the customer_id and calculating the total points for each customer.
- Joining the sales and menu tables based on the product_id column.
- Grouping results by customer_id.

```sql
SELECT 
	customer_id, 
	SUM(CASE WHEN product_name = 'sushi' THEN price * 20 ELSE price * 10 END) AS points
FROM sales AS s
JOIN menu AS m
ON s.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id;
```

**Answer:**

| customer_id | points      |
| ----------- | ----------- |
| A           | 860         |
| B           | 940         |
| C           | 360         |

Customer A has 860 points, customer B has 940 points, and customer C has 360 points.

### 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

**Solution:**

- Selecting the customer_id and calculating the member_points for each customer.
- Subquery p: retrieves relevant data for each sale before a specified date.
- Filtering sales before a specified date.
- Grouping the results by customer_id.
- Ordering the results in ascending order based on customer_id.

```sql
SELECT 
	customer_id, 
	SUM(CASE WHEN order_date BETWEEN join_date AND DATEADD(DAY, 6, join_date) THEN price * 20 ELSE 
	   (CASE WHEN product_name = 'sushi' THEN price * 20 ELSE price * 10 END) END) AS member_points
	FROM(
SELECT 
	s.customer_id, 
	s.order_date,
	e.join_date,
	product_name,
	price 
FROM sales AS s
JOIN menu AS m	
ON s.product_id = m.product_id
JOIN members AS e
ON s.customer_id = e.customer_id
WHERE order_date < '2021-02-01'
) AS p
GROUP BY customer_id
ORDER BY customer_id;
```

**Answer:**

| customer_id | member_points |
| ----------- | ------------- |
| A           | 1370          |
| B           | 820           |

Customer A has 1370 points, and customer B has 820 points at the end of January.



