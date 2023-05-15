
# Case Study #1 - Danny's Diner

<p align="center">
  <img height="400" src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/1.png">
</p>


## Table of Contents

- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
- [Example Datasets](#example-datasets)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Case Study Questions](#case-study-questions-and-answers)

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

**2. How many days has each customer visited the restaurant?**


**3. What was the first item from the menu purchased by each customer?**


**4. What is the most purchased item on the menu and how many times was it purchased by all customers?**


**5. Which item was the most popular for each customer?**
**6. Which item was purchased first by the customer after they became a member?**
**7. Which item was purchased just before the customer became a member?**
**8. What is the total items and amount spent for each member before they became a member?**
**9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?**
**10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?**



