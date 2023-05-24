
# Case Study #2 - Pizza Runner


<p align="center">
  <img height="400" src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/2.png">
</p>


## Table of Contents

- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
- [Example Datasets](#example-datasets)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [A. Pizza Metrics]()
  - [1. How many pizzas were ordered?]()
  - [2. How many unique customer orders were made?]()
  - [3. How many successful orders were delivered by each runner?]()
  - [4. How many of each type of pizza was delivered?]()
  - [5. How many Vegetarian and Meatlovers were ordered by each customer?]()
  - [6. What was the maximum number of pizzas delivered in a single order?]()
  - [7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?]()
  - [8. How many pizzas were delivered that had both exclusions and extras?]()
  - [9. What was the total volume of pizzas ordered for each hour of the day?]()
  - [10. What was the volume of orders for each day of the week?]()
- [B. Runner and Customer Experience]()
  - [1. How many runners signed up for each 1 week period?]()
  - [2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?]()
  - [3. Is there any relationship between the number of pizzas and how long the order takes to prepare?]()
  - [4. What was the average distance travelled for each customer?]()
  - [5. What was the difference between the longest and shortest delivery times for all orders?]()
  - [6. What was the average speed for each runner for each delivery and do you notice any trend for these values?]()
  - [7. What is the successful delivery percentage for each runner?]()
- [C. Ingredient Optimisation]()
  - [1. What are the standard ingredients for each pizza?]()
  - [2. What was the most commonly added extra?]()
  - [3. What was the most common exclusion?]()
  - [4. Generate an order item for each record in the customers_orders table in the format of one of the following: Meat Lovers, Meat Lovers - Exclude Beef, Meat Lovers - Extra Bacon, Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers]()
  - [5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients]()
  - [6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?]()
- [D. Pricing and Ratings]()
  - [1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?]()
  - [2. What if there was an additional $1 charge for any pizza extras?]()
  - [3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.]()
  - [4. Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?]()
  - [5. If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?]()






## Introduction

Danny was sold on the idea, but he knew that pizza alone was not going to help him get seed funding to expand his new Pizza Empire - so he had one more genius idea to combine with it - he was going to Uberize it - and so Pizza Runner was launched!

Danny started by recruiting “runners” to deliver fresh pizza from Pizza Runner Headquarters (otherwise known as Danny’s house) and also maxed out his credit card to pay freelance developers to build a mobile app to accept orders from customers.

## Problem Statement

Danny requires further assistance to clean his data and apply some basic calculations so he can better direct his runners and optimise Pizza Runner’s operations.

## Example Datasets

Danny has shared 3 key datasets for this case study:

- The `runners` table shows the `registration_date` for each new runner.
- The `customer_orders` table shows individual pizza orders made by customers with 1 row for each individual pizza that is part of the order, including the pizza type, excluded ingredients, and additional ingredients.
- The `runner_orders` table shows the details of pizza orders assigned to runners, including pickup time, distance traveled, and duration of delivery, with potential data issues.
- The `pizza_names` table shows the available pizza options.
- The `pizza_recipes` table shows the standard set of toppings used as part of the pizza recipe for each pizza type.
- The final `pizza_toppings` table shows the available topping names along with their corresponding topping ID values.

## Entity Relationship Diagram

<p align="center">
  <img src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/diag2.PNG">
</p>

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
