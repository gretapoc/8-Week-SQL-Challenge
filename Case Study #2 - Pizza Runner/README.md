
# Case Study #2 - Pizza Runner


<p align="center">
  <img height="400" src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/2.png">
</p>


## Table of Contents

- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
- [Example Datasets](#example-datasets)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Case Study Questions And Answers](#case-study-questions-and-answers)
  - [A. Pizza Metrics]()
1. [How many pizzas were ordered?]()
2. [How many unique customer orders were made?]()
3. [How many successful orders were delivered by each runner?]()
4. [How many of each type of pizza was delivered?]()
5. [How many Vegetarian and Meatlovers were ordered by each customer?]()
6. [What was the maximum number of pizzas delivered in a single order?]()
7. [For each customer, how many delivered pizzas had at least 1 change and how many had no changes?]()
8. [How many pizzas were delivered that had both exclusions and extras?]()
9. [What was the total volume of pizzas ordered for each hour of the day?]()
10. [What was the volume of orders for each day of the week?]()
  - [B. Runner and Customer Experience]()
	[1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)]()
	[2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?]()
	[3. Is there any relationship between the number of pizzas and how long the order takes to prepare?]()
	[4. What was the average distance travelled for each customer?]()
	[5. What was the difference between the longest and shortest delivery times for all orders?]()
	[6. What was the average speed for each runner for each delivery and do you notice any trend for these values?]()
	[7. What is the successful delivery percentage for each runner?]()
  - [C. Ingredient Optimisation]()
	[1. What are the standard ingredients for each pizza?
	[2. What was the most commonly added extra?
	[3. What was the most common exclusion?
	[4. Generate an order item for each record in the customers_orders table in the format of one of the following]:
	Meat Lovers
	Meat Lovers - Exclude Beef
	Meat Lovers - Extra Bacon
	Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
	[5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients]()
	[6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?]()



















## Introduction

Danny was sold on the idea, but he knew that pizza alone was not going to help him get seed funding to expand his new Pizza Empire - so he had one more genius idea to combine with it - he was going to Uberize it - and so Pizza Runner was launched!

Danny started by recruiting “runners” to deliver fresh pizza from Pizza Runner Headquarters (otherwise known as Danny’s house) and also maxed out his credit card to pay freelance developers to build a mobile app to accept orders from customers.

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

This case study has LOTS of questions - they are broken up by area of focus including:

- Pizza Metrics
- Runner and Customer Experience
- Ingredient Optimisation
- Pricing and Ratings
- Bonus DML Challenges (DML = Data Manipulation Language)

### A. Pizza Metrics


#### 1. How many pizzas were ordered?

**Solution:**

**Answer:**


#### 2. How many unique customer orders were made?

**Solution:**

**Answer:**


#### 3. How many successful orders were delivered by each runner?

**Solution:**

**Answer:**


#### 4. How many of each type of pizza was delivered?

**Solution:**

**Answer:**


#### 5. How many Vegetarian and Meatlovers were ordered by each customer?

**Solution:**

**Answer:**


#### 6. What was the maximum number of pizzas delivered in a single order?

**Solution:**

**Answer:**


#### 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

**Solution:**

**Answer:**


#### 8. How many pizzas were delivered that had both exclusions and extras?

**Solution:**

**Answer:**


#### 9. What was the total volume of pizzas ordered for each hour of the day?

**Solution:**

**Answer:**


#### 10. What was the volume of orders for each day of the week?

**Solution:**

**Answer:**








### 1. What is the total amount each customer spent at the restaurant?

**Solution:**

- Selecting the `customer_id` and the sum of prices (`total_amount`) from the `sales` and `menu` tables.
- Defining the tables aliases as `s` for `sales` and `m` for `menu`.
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
