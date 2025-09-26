use ecommerce_db;
select * from sample_dataset;

-- columns
describe sample_dataset;

-- Which Gender spends more on Average?
select Gender,
		AVG(`Transaction Amount`) AS avg_spending
FROM sample_dataset
GROUP BY Gender;

Select Gender from sample_dataset;
-- Filling Blank Spaces
update sample_dataset
set Gender = "Others"
where trim(Gender) = '';

set sql_safe_updates = 1;

-- Who are the top 10 customers by total spending?
SELECT `Customer ID`, Name, Surname, Category,
		SUM(`Transaction Amount`) as total_spent
FROM sample_dataset
GROUP BY `Customer ID`, Name, Surname, Category
ORDER BY total_spent DESC
LIMIT 10;

-- Which merchant gets the highest total sales?
SELECT `Merchant Name`,
		SUM(`Transaction Amount`) as total_sales
FROM sample_dataset
GROUP BY `Merchant Name`
ORDER BY total_sales DESC
LIMIT 10;

-- What are the most popular purchase categories?
SELECT Category,
		COUNT(*) as total_transactions,
        SUM(`Transaction Amount`) as total_spent
FROM sample_dataset
GROUP BY Category
ORDER BY total_transactions DESC;

-- How does spending change over time (monthly trend)
SELECT DATE_FORMAT(Date, '%Y-%m') AS month,
	   SUM(`Transaction Amount`) AS monthly_spent,
       COUNT(*) AS transactinos_count
FROM sample_dataset
GROUP BY month
ORDER BY month;

-- Spending by Month
SELECT 
	MONTHNAME(Date) as month_name,
    SUM(`Transaction Amount`) AS monthly_spent
FROM sample_dataset
GROUP BY month_name
ORDER BY monthly_spent;

-- Spending by Year
SELECT 
	YEAR(Date) as year,
    SUM(`Transaction Amount`) AS monthly_spent
FROM sample_dataset
GROUP BY year
ORDER BY year;

-- Number of Transactions by Month
SELECT
	MONTHNAME(Date) as month_name,
	COUNT(*) as total_transactions
FROM sample_dataset
GROUP BY month_name
ORDER BY month_name;