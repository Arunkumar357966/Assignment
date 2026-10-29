USE company;

SELECT COUNT(*) AS total_products FROM Product;

SELECT SUM(price * quantity) AS total_stock_value FROM Product;

SELECT AVG(price) AS average_price FROM Product;

SELECT product_name,SUM(price * quantity) AS total_sales
FROM Product GROUP BY product_name;

SELECT MAX(price) AS maximum_price,MIN(price) AS minimum_price
FROM Product;

SELECT product_name,SUM(price * quantity) AS total_sales FROM Product GROUP BY product_name
ORDER BY total_sales DESC;

CREATE TABLE events (id INT PRIMARY KEY,event_name VARCHAR(100),event_date DATE);

INSERT INTO events (id, event_name, event_date)
VALUES(1, 'New Year', '2026-01-01'),(2, 'College Day', '2026-02-15'),(3, 'Sports Day', '2026-06-10'),
(4, 'Tech Fest', '2026-08-20'),(5, 'Annual Day', '2026-12-15');

SELECT * FROM events;

SELECT NOW() AS current_date_time;

SELECT event_name,DATE_FORMAT(event_date, '%d-%m-%Y') AS formatted_date FROM events;


SELECT event_name,YEAR(event_date) AS event_year,MONTH(event_date) AS event_month FROM events;

SELECT CONCAT(event_name,' - ',DATE_FORMAT(event_date, '%d-%m-%Y')) AS event_details FROM events;