
# Case Study #2 - Pizza Runner


<p align="center">
  <img height="400" src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/2.png">
</p>

## Table of Contents

- [Introduction](#introduction)
- [Problem Statement](#problem-statement)
- [Example Datasets](#example-datasets)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Data Cleaning and Transformation](#data-cleaning-and-transformation)
<details open>
  <summary>A. Pizza Metrics</summary>
  
1. [How many pizzas were ordered?](#1-how-many-pizzas-were-ordered)
2. [How many unique customer orders were made?](#2-how-many-unique-customer-orders-were-made)
3. [How many successful orders were delivered by each runner?](#3-how-many-successful-orders-were-delivered-by-each-runner)
4. [How many of each type of pizza was delivered?](#4-how-many-of-each-type-of-pizza-was-delivered)
5. [How many Vegetarian and Meatlovers were ordered by each customer?](#5-how-many-Vegetarian-and-Meatlovers-were-ordered-by-each-customer)
6. [What was the maximum number of pizzas delivered in a single order?](#6-what-was-the-maximum-number-of-pizzas-delivered-in-a-single-order)
7. [For each customer, how many delivered pizzas had at least 1 change and how many had no changes?](#7-for-each-customer-how-many-delivered-pizzas-had-at-least-1-change-and-how-many-had-no-changes)
8. [How many pizzas were delivered that had both exclusions and extras?](#8-how-many-pizzas-were-delivered-that-had-both-exclusions-and-extras)
9. [What was the total volume of pizzas ordered for each hour of the day?](#9-what-was-the-total-volume-of-pizzas-ordered-for-each-hour-of-the-day)
10. [What was the volume of orders for each day of the week?](#10-what-was-the-volume-of-orders-for-each-day-of-the-week)
	
</details>
<details open>
  <summary>B. Runner and Customer Experience</summary>
  
1. [How many runners signed up for each 1 week period?](#1-how-many-runners-signed-up-for-each-1-week-period)
2. [What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?](https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/Case%20Study%20%232%20-%20Pizza%20Runner/README.md#2-what-was-the-average-time-in-minutes-it-took-for-each-runner-to-arrive-at-the-pizza-runner-hq-to-pickup-the-order)
3. [Is there any relationship between the number of pizzas and how long the order takes to prepare?](https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/Case%20Study%20%232%20-%20Pizza%20Runner/README.md#3-is-there-any-relationship-between-the-number-of-pizzas-and-how-long-the-order-takes-to-prepare)
4. [What was the average distance travelled for each customer?](https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/Case%20Study%20%232%20-%20Pizza%20Runner/README.md#4-what-was-the-average-distance-travelled-for-each-customer)
5. [What was the difference between the longest and shortest delivery times for all orders?](https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/Case%20Study%20%232%20-%20Pizza%20Runner/README.md#5-what-was-the-difference-between-the-longest-and-shortest-delivery-times-for-all-orders)
6. [What was the average speed for each runner for each delivery and do you notice any trend for these values?](https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/Case%20Study%20%232%20-%20Pizza%20Runner/README.md#6-what-was-the-average-speed-for-each-runner-for-each-delivery-and-do-you-notice-any-trend-for-these-values)
7. [What is the successful delivery percentage for each runner?](https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/Case%20Study%20%232%20-%20Pizza%20Runner/README.md#7-what-is-the-successful-delivery-percentage-for-each-runner)
	
</details>
<details open>
  <summary>C. Ingredient Optimisation</summary>
  
1. [What are the standard ingredients for each pizza?](#1-what-are-the-standard-ingredients-for-each-pizza)
2. [What was the most commonly added extra?](#2-what-was-the-most-commonly-added-extra)
3. [What was the most common exclusion?](#3-what-was-the-most-common-exclusion)
4. [Generate an order item for each record in the customers_orders table in the format of one of the following: Meat Lovers, Meat Lovers - Exclude Beef, Meat Lovers - Extra Bacon, Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers.](#4-generate-an-order-item-for-each-record-in-the-customers_orders-table-in-the-format-of-one-of-the-following-meat-lovers-meat-lovers---exclude-beef-meat-lovers---extra-bacon-meat-lovers---exclude-cheese-bacon---extra-mushroom-peppers)
5. [Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients.](#5-generate-an-alphabetically-ordered-comma-separated-ingredient-list-for-each-pizza-order-from-the-customer_orders-table-and-add-a-2x-in-front-of-any-relevant-ingredients)
6. [What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?](#6-what-is-the-total-quantity-of-each-ingredient-used-in-all-delivered-pizzas-sorted-by-most-frequent-first)
	
</details>
<details open>
  <summary>D. Pricing and Ratings</summary>
  
1. [If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?](#1-if-a-meat-lovers-pizza-costs-12-and-vegetarian-costs-10-and-there-were-no-charges-for-changes---how-much-money-has-pizza-runner-made-so-far-if-there-are-no-delivery-fees)
2. [What if there was an additional $1 charge for any pizza extras?](#2-what-if-there-was-an-additional-1-charge-for-any-pizza-extras)
3. [The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.](#3-the-pizza-runner-team-now-wants-to-add-an-additional-ratings-system-that-allows-customers-to-rate-their-runner-how-would-you-design-an-additional-table-for-this-new-dataset---generate-a-schema-for-this-new-table-and-insert-your-own-data-for-ratings-for-each-successful-customer-order-between-1-to-5)
4. [Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?](#4-using-your-newly-generated-table---can-you-join-all-of-the-information-together-to-form-a-table-which-has-the-following-information-for-successful-deliveries)
5. [If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?](#5-if-a-meat-lovers-pizza-was-12-and-vegetarian-10-fixed-prices-with-no-cost-for-extras-and-each-runner-is-paid-030-per-kilometre-traveled---how-much-money-does-pizza-runner-have-left-over-after-these-deliveries)

</details>

## Introduction

Danny was sold on the idea, but he knew that pizza alone was not going to help him get seed funding to expand his new Pizza Empire - so he had one more genius idea to combine with it - he was going to Uberize it - and so Pizza Runner was launched!

Danny started by recruiting “runners” to deliver fresh pizza from Pizza Runner Headquarters (otherwise known as Danny’s house) and also maxed out his credit card to pay freelance developers to build a mobile app to accept orders from customers.

## Problem Statement

Danny requires further assistance to clean his data and apply some basic calculations so he can better direct his runners and optimise Pizza Runner’s operations.

## Example Datasets

Danny has shared 3 key datasets for this case study:

- The `runners` table shows the registration date for each new runner.
- The `customer_orders` table shows individual pizza orders made by customers with 1 row for each individual pizza that is part of the order, including the pizza type, excluded ingredients, and additional ingredients.
- The `runner_orders` table shows the details of pizza orders assigned to runners, including pickup time, distance traveled, and duration of delivery, with potential data issues.
- The `pizza_names` table shows the available pizza options.
- The `pizza_recipes` table shows the standard set of toppings used as part of the pizza recipe for each pizza type.
- The final `pizza_toppings` table shows the available topping names along with their corresponding topping ID values.

## Entity Relationship Diagram

<p align="center">
  <img src="https://github.com/gretapoc/8-Week-SQL-Challenge/blob/main/images/diag2.PNG">
</p>


## Data Cleaning and Transformation

Let's examine the `customer_orders` table and observe that there are some missing and 'null' values present in the `exclusions` and `extras` columns. In order to ensure data cleanliness and consistency, we will proceed with the necessary steps to clean and refine the table.

```sql
SELECT *
FROM customer_orders;
```

| order_id | customer_id | pizza_id | exclusions | extras | order_time             |
| -------- | ----------- | -------- | ---------- | ------ | ---------------------- |
| 1	   | 101	 | 1	    | 		 |        |2020-01-01 18:05:02.000 | 
| 2	   | 101	 | 1	    | 		 |        |2020-01-01 19:00:52.000 | 
| 3	   | 102	 | 1	    | 	         |        |2020-01-02 23:51:23.000 | 
| 3	   | 102 	 | 2	    | 	 	 | NULL   |2020-01-02 23:51:23.000 | 
| 4	   | 103	 | 1	    | 4		 |        |2020-01-04 13:23:46.000 | 
| 4	   | 103	 | 1	    | 4		 |        |2020-01-04 13:23:46.000 | 
| 4	   | 103	 | 2	    | 4		 |        |2020-01-04 13:23:46.000 | 
| 5	   | 104	 | 1	    | null       | 1	  |2020-01-08 21:00:29.000 | 
| 6	   | 101 	 | 2	    | null 	 | null   |2020-01-08 21:03:13.000 | 
| 7	   | 105	 | 2	    | null       | 1      |2020-01-08 21:20:29.000 | 
| 8	   | 102	 | 1	    | null 	 | null   |2020-01-09 23:54:33.000 | 
| 9	   | 103	 | 1	    | 4	         | 1, 5	  |2020-01-10 11:22:59.000 | 
| 10	   | 104	 | 1	    | null 	 | null   |2020-01-11 18:34:49.000 | 
| 10	   | 104	 | 1        | 2, 6	 | 1, 4	  |2020-01-11 18:34:49.000 | 

**Solution:**

- Check if a table called "temp_customer_orders" exists and drop it if it does.
- Select specific columns: order_id, customer_id, pizza_id, exclusions, extras, and order_time.
- Replace 'null' values in the exclusions column with an empty string.
- Replace 'null' values in the extras column with an empty string.
- Store the result into a temporary table called temp_customer_orders.
- Retrieve all the rows from the temp_customer_orders table.

```sql
DROP TABLE IF EXISTS temp_customer_orders
SELECT 
	order_id,
	customer_id,
	pizza_id,
	COALESCE(NULLIF(exclusions, 'null'), '') AS exclusions,
	COALESCE(NULLIF(extras, 'null'), '') AS extras,
	order_time
INTO temp_customer_orders
FROM customer_orders;

SELECT * 
FROM temp_customer_orders;
```

**Answer:**

| order_id | customer_id | pizza_id | exclusions | extras | order_time             |
| -------- | ----------- | -------- | ---------- | ------ | ---------------------- |
| 1	   | 101	 | 1	    | 		 |        |2020-01-01 18:05:02.000 | 
| 2	   | 101	 | 1	    | 		 |        |2020-01-01 19:00:52.000 | 
| 3	   | 102	 | 1	    | 	         |        |2020-01-02 23:51:23.000 | 
| 3	   | 102 	 | 2	    | 	 	 |        |2020-01-02 23:51:23.000 | 
| 4	   | 103	 | 1	    | 4		 |        |2020-01-04 13:23:46.000 | 
| 4	   | 103	 | 1	    | 4		 |        |2020-01-04 13:23:46.000 | 
| 4	   | 103	 | 2	    | 4		 |        |2020-01-04 13:23:46.000 | 
| 5	   | 104	 | 1	    |  	         | 1	  |2020-01-08 21:00:29.000 | 
| 6	   | 101 	 | 2	    |  	 	 |        |2020-01-08 21:03:13.000 | 
| 7	   | 105	 | 2	    |  	         | 1      |2020-01-08 21:20:29.000 | 
| 8	   | 102	 | 1	    |  	 	 |        |2020-01-09 23:54:33.000 | 
| 9	   | 103	 | 1	    | 4	         | 1, 5	  |2020-01-10 11:22:59.000 | 
| 10	   | 104	 | 1	    |  	 	 |        |2020-01-11 18:34:49.000 | 
| 10	   | 104	 | 1        | 2, 6	 | 1, 4	  |2020-01-11 18:34:49.000 | 


Let's review the `runner_orders` table and observe that there are some instances where the `pickup_time`, `distance`, and `duration` columns have 'null' values. Additionally, we can identify missing or 'null' values in the `cancellation` column. Also, the `distance` and `duration` columns contain extra text (e.g., 'km', 'minutes') that needs to be removed. In order to ensure data cleanliness and consistency, we will proceed with the necessary steps to clean and refine the table.

```sql
SELECT *
FROM customer_orders;
```

| order_id | runner_id   | pickup_time          | distance   | duration   | cancellation            |
| -------- | ----------- | -------------------- | ---------- | ---------- | ----------------------- |
| 1        | 1           | 2020-01-01 18:15:34  | 20km       | 32 minutes |                         |
| 2	   | 1	         | 2020-01-01 19:10:54	| 20km	     | 27 minutes |                         |
| 3	   | 1	         | 2020-01-03 00:12:37	| 13.4km     | 20 mins    | NULL                    |
| 4	   | 2   	 | 2020-01-04 13:53:03	| 23.4	     | 40	  | NULL                    |
| 5	   | 3	         | 2020-01-08 21:10:57	| 10	     | 15	  | NULL                    |
| 6	   | 3	         | null	 	 	| null       | null       | Restaurant Cancellation |
| 7	   | 2	         | 2020-01-08 21:30:45	| 25km	     | 25mins	  | null                    |
| 8	   | 2	         | 2020-01-10 00:15:02	| 23.4 km    | 15 minute  | null                    |
| 9	   | 2	         | null	 	 	| null       | null       | Customer Cancellation   |
| 10	   | 1	         | 2020-01-11 18:50:20	| 10km	     | 10minutes  | null                    |

**Solution:**

- Check if a table called "temp_runner_orders" exists and drop it if it does.
- Select specific columns: order_id, runner_id, pickup_time, distance, duration, and cancellation.
- Replace 'null' values in the pickup_time column with an empty string.
- For the distance column, if the value is 'null', replace it with an empty string. Otherwise, remove the 'km' unit from the value if present, and replace 'null' values with an empty string.
- For the duration column, if the value is 'null', replace it with an empty string. Otherwise, remove the 'mins', 'minutes', and 'minute' units from the value if present, and replace 'null' values with an empty string.
- Replace 'null' values in the cancellation column with an empty string.
- Store the result into a temporary table called temp_runner_orders.
- Alter the pickup_time column in the temporary table to have the DATETIME data type.
- Alter the distance column in the temporary table to have the FLOAT data type.
- Alter the duration column in the temporary table to have the INT data type.
- Retrieve all the rows from the temp_runner_orders table.

```sql
DROP TABLE IF EXISTS temp_runner_orders
SELECT
	order_id,
	runner_id,
	COALESCE(NULLIF(pickup_time, 'null'), '') AS pickup_time,
	CASE
		WHEN distance = 'null' THEN ' '
		ELSE COALESCE(NULLIF(REPLACE(distance, 'km', ''), 'null'), distance)
	END AS distance,
	CASE
		WHEN duration = 'null' THEN ' '
		ELSE COALESCE(NULLIF(REPLACE(REPLACE(REPLACE(duration, 'mins', ''), 'minutes', ''), 'minute', ''), 'null'), duration)
	END AS duration,
	COALESCE(NULLIF(cancellation, 'null'), '') AS cancellation
INTO temp_runner_orders
FROM runner_orders;

ALTER TABLE temp_runner_orders
ALTER COLUMN pickup_time DATETIME;

ALTER TABLE temp_runner_orders
ALTER COLUMN distance FLOAT;

ALTER TABLE temp_runner_orders
ALTER COLUMN duration INT;

SELECT *
FROM temp_runner_orders;
```

**Answer:**

| order_id | runner_id   | pickup_time          | distance   | duration | cancellation            |
| -------- | ----------- | -------------------- | ---------- | -------- | ----------------------- |
| 1        | 1           | 2020-01-01 18:15:34  | 20         | 32       |                         |
| 2	   | 1	         | 2020-01-01 19:10:54	| 20	     | 27       |                         |
| 3	   | 1	         | 2020-01-03 00:12:37	| 13.4	     | 20 	|                         |
| 4	   | 2   	 | 2020-01-04 13:53:03	| 23.4	     | 40	|                         |
| 5	   | 3	         | 2020-01-08 21:10:57	| 10	     | 15	|                         |
| 6	   | 3	         | 	 	 	|            |          | Restaurant Cancellation |
| 7	   | 2	         | 2020-01-08 21:30:45	| 25	     | 25	|                         |
| 8	   | 2	         | 2020-01-10 00:15:02	| 23.4 	     | 15 	|                         |
| 9	   | 2	         | 	 	 	|            |          | Customer Cancellation   |
| 10	   | 1	         | 2020-01-11 18:50:20	| 10	     | 10	|                         |


### A. Pizza Metrics


#### 1. How many pizzas were ordered?

**Solution:**

- Count the occurrences of the pizza_id column.
- Return the count as total_pizzas.

```sql
SELECT 
	COUNT(pizza_id) AS total_pizzas
FROM temp_customer_orders;
```

**Answer:**

| total_pizzas |
| ------------ |
| 14           |

Total of 14 pizzas were ordered.


#### 2. How many unique customer orders were made?

**Solution:**

- Count the number of distinct order_id values in the temp_customer_orders table.
- Assign the count as unique_orders.

```sql
SELECT 
	COUNT(DISTINCT order_id) AS unique_orders
FROM temp_customer_orders;
```

**Answer:**

| customer_orders |
| --------------- |
| 10              |

The number of unique customer orders made is 10.


#### 3. How many successful orders were delivered by each runner?

**Solution:**

- Retrieve the runner_id column from the temp_runner_orders table.
- Count the occurrences of each unique runner_id.
- Assign the count of each runner_id as successful_orders.
- Filter the results by excluding rows where pickup_time is equal to 0.
- Group the results by runner_id.

```sql
SELECT 
	runner_id,
	COUNT(runner_id) AS successful_orders
FROM temp_runner_orders
WHERE pickup_time <> 0
GROUP BY runner_id;
```

**Answer:**

| runner_id | successful_orders |
| --------- | ----------------- |
| 1         | 4                 |
| 2         | 3                 |
| 3         | 1                 |

- Runner 1 delivered 4 successful orders.
- Runner 2 delivered 3 successful orders.
- Runner 3 delivered 1 successful orders.


#### 4. How many of each type of pizza was delivered?

**Solution:**

- Retrieve the pizza_id column from the temp_customer_orders table (aliased as c).
- Count the occurrences of each unique pizza_id.
- Assign the count of each pizza_id as total_delivered.
- Join the temp_customer_orders table (aliased as c) with the temp_runner_orders table (aliased as r) using the order_id column as the join condition.
- Filter the results by excluding rows where pickup_time in the temp_runner_orders table is equal to 0.
- Group the results by pizza_id.

```sql
SELECT 
	c.pizza_id,
	COUNT(c.pizza_id) AS total_delivered
FROM temp_customer_orders AS c
JOIN temp_runner_orders AS r
ON c.order_id = r.order_id
WHERE r.pickup_time <> 0
GROUP BY c.pizza_id;
```

**Answer:**

| pizza_id | total_delivered |
| -------- | --------------- |
| 1        | 9               |
| 2        | 3               |

- Pizza with ID 1 was delivered 9 times.
- Pizza with ID 2 was delivered 3 times.


#### 5. How many Vegetarian and Meatlovers were ordered by each customer?

- Retrieve the customer_id and pizza_id columns, as well as the count of each pizza_id for each customer_id, from the temp_customer_orders table.
- Group the results by customer_id and pizza_id, and assign the count as order_count.
- Alias the subquery as "c".
- Join the pizza_names table (aliased as p) with the subquery "c" using the pizza_id column as the join condition.
- Select the customer_id, pizza_name from the pizza_names table, and order_count from the subquery "c".
- Order the results by customer_id.

**Solution:**

```sql
SELECT 
	c.customer_id,
	p.pizza_name,
	c.order_count
FROM pizza_names AS p
JOIN (
	SELECT 
		customer_id, 
		pizza_id,
		COUNT(pizza_id) AS order_count
	FROM temp_customer_orders
	GROUP BY customer_id, pizza_id) AS c
ON p.pizza_id = c.pizza_id
ORDER BY customer_id;
```

**Answer:**

| customer_id | pizza_name    | order_count |
| ----------- | ------------- | ----------- |
| 101         | Meatlovers    | 2           |
| 101         | Vegetarian    | 1           |
| 102         | Meatlovers    | 2           |
| 102         | Vegetarian    | 1           |
| 103         | Meatlovers    | 3           |
| 103         | Vegetarian    | 1           |
| 104         | Meatlovers    | 3           |
| 105         | Vegetarian    | 1           |

- Customer 102 ordered 1 Vegetarian pizza and 2 Meatlovers pizzas.
- Customer 103 ordered 1 Vegetarian pizza and 3 Meatlovers pizzas.
- Customer 104 ordered 3 Meatlovers pizzas.
- Customer 105 ordered 1 Vegetarian pizza.


#### 6. What was the maximum number of pizzas delivered in a single order?

**Solution:**

- Retrieve the top 1 row from the result set.
- Select the order_id and count of pizzas delivered, aliased as "pizzas_delivered", from the temp_customer_orders table, aliased as "c".
- Join the temp_customer_orders table with the temp_runner_orders table, aliased as "r", using the order_id column as the join condition.
- Exclude rows where the pickup_time in the temp_runner_orders table is equal to 0.
- Group the results by the order_id.
- Order the results by the count of pizzas delivered in descending order.

```sql
SELECT
	TOP(1)
	c.order_id,
	COUNT(c.order_id) AS pizzas_delivered
FROM temp_customer_orders AS c
JOIN temp_runner_orders AS r
ON c.order_id = r.order_id
WHERE r.pickup_time <> 0
GROUP BY c.order_id
ORDER BY COUNT(c.order_id) DESC;
```

**Answer:**

| order_id | pizzas_delivered |
| -------- | ---------------- |
| 4        | 3                |

The maximum number of pizzas delivered in a single order was 3.

#### 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

**Solution:**

```sql


```

**Answer:**


#### 8. How many pizzas were delivered that had both exclusions and extras?

**Solution:**

```sql


```

**Answer:**


#### 9. What was the total volume of pizzas ordered for each hour of the day?

**Solution:**

```sql


```

**Answer:**


#### 10. What was the volume of orders for each day of the week?

**Solution:**

```sql


```

**Answer:**


### B. Runner and Customer Experience
  
#### 1. How many runners signed up for each 1 week period?

**Solution:**

```sql


```

**Answer:**


#### 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

**Solution:**

```sql


```

**Answer:**


#### 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?

**Solution:**

```sql


```

**Answer:**


#### 4. What was the average distance travelled for each customer?

**Solution:**

```sql


```

**Answer:**


#### 5. What was the difference between the longest and shortest delivery times for all orders?

**Solution:**

```sql


```

**Answer:**


#### 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?

**Solution:**

```sql


```

**Answer:**


#### 7. What is the successful delivery percentage for each runner?

**Solution:**

```sql


```

**Answer:**


### C. Ingredient Optimisation
  
#### 1. What are the standard ingredients for each pizza?

**Solution:**

```sql


```

**Answer:**


#### 2. What was the most commonly added extra?

**Solution:**

```sql


```

**Answer:**


#### 3. What was the most common exclusion?

**Solution:**

```sql


```

**Answer:**


#### 4. Generate an order item for each record in the customers_orders table in the format of one of the following: Meat Lovers, Meat Lovers - Exclude Beef, Meat Lovers - Extra Bacon, Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers.

**Solution:**

```sql


```

**Answer:**


#### 5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients.

**Solution:**

```sql


```

**Answer:**


#### 6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

**Solution:**

```sql


```

**Answer:**

	
### D. Pricing and Ratings
  
#### 1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?

**Solution:**

```sql


```

**Answer:**


#### 2. What if there was an additional $1 charge for any pizza extras?

**Solution:**

```sql


```

**Answer:**


#### 3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.

**Solution:**

```sql


```

**Answer:**


#### 4. Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?

**Solution:**

```sql


```

**Answer:**


#### 5. If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?

**Solution:**

```sql


```

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
