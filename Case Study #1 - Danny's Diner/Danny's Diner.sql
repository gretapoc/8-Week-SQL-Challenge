-- Case Study #1 - Danny's Diner
-- Greta Poceviciute


-- Creating sales table
CREATE TABLE sales (
	customer_id VARCHAR(1),
	order_date DATE,
	product_id INT
);

-- Inserting values
INSERT INTO sales
VALUES
	('A', '2021-01-01', 1),
	('A', '2021-01-01', 2),
	('A', '2021-01-07', 2),
	('A', '2021-01-10', 3),
	('A', '2021-01-11', 3),
	('A', '2021-01-11', 3),
	('B', '2021-01-01', 2),
	('B', '2021-01-02', 2),
	('B', '2021-01-04', 1),
	('B', '2021-01-11', 1),
	('B', '2021-01-16', 3),
	('B', '2021-02-01', 3),
	('C', '2021-01-01', 3),
	('C', '2021-01-01', 3),
	('C', '2021-01-07', 3);

-- Viewing sales table
SELECT *
FROM sales;

-- Creating menu table
CREATE TABLE menu (
	product_id INT,
	product_name VARCHAR(50),
	price INT
);

-- Inserting values
INSERT INTO menu
VALUES
	(1, 'sushi', 10),
	(2, 'curry', 15),
	(3, 'ramen', 12);

-- Viewing menu table
SELECT *
FROM menu;

-- Creating members table
CREATE TABLE members (
	customer_id VARCHAR(1),
	join_date DATE
);

-- Inserting values
INSERT INTO members
VALUES
	('A', '2021-01-07'),
	('B', '2021-01-09');

-- Viewing members table
SELECT *
FROM members;


-- 1. What is the total amount each customer spent at the restaurant?

SELECT 
	customer_id, 
	SUM(m.price) AS total_amount
FROM sales AS s
JOIN menu AS m
ON s.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id;


-- 2. How many days has each customer visited the restaurant?

SELECT 
	customer_id, 
	COUNT(order_date) AS days_visited
FROM sales
GROUP BY customer_id
ORDER BY customer_id;


-- 3. What was the first item from the menu purchased by each customer?

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


-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT TOP(1) 
	product_name, 
	COUNT(product_name) AS times_purchased
FROM sales AS s
JOIN menu AS m
ON s.product_id = m.product_id
GROUP BY product_name
ORDER BY times_purchased DESC;


-- 5. Which item was the most popular for each customer?

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



-- 6. Which item was purchased first by the customer after they became a member?

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


-- 7. Which item was purchased just before the customer became a member?

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


-- 8. What is the total items and amount spent for each member before they became a member?

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


-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT 
	customer_id, 
	SUM(CASE WHEN product_name = 'sushi' THEN price * 20 ELSE price * 10 END) AS points
FROM sales AS s
JOIN menu AS m
ON s.product_id = m.product_id
GROUP BY customer_id
ORDER BY customer_id;


-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

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


