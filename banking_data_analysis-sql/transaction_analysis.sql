# TRANSACTIONS
# How many transactions happen per day/month?

SELECT
    DATE(transaction_date) AS transaction_day,
	COUNT(transaction_id) AS number_of_transaction
FROM bank_data
GROUP BY transaction_day
ORDER BY transaction_day;

# How many transactions happen per month?

SELECT
	DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,
	COUNT(transaction_id) AS number_of_transaction
FROM bank_data
GROUP BY transaction_month
ORDER BY transaction_month;

# How many transactions happen per month for each transation type?
SELECT
	transaction_type,
    DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,
	COUNT(transaction_id) AS number_of_transaction
FROM bank_data
GROUP BY 
	transaction_type,
    transaction_month
ORDER BY transaction_month;

# Which transaction type is most common (deposit, withdrawal, transfer, etc.)?

SELECT
	transaction_type,
    COUNT(transaction_id) AS number_of_transaction
FROM bank_data
GROUP BY transaction_type
ORDER BY transaction_type DESC
LIMIT 1;

# What’s the total transaction volume per branch?

SELECT
	branch_id,
    SUM(transaction_amount) AS total_transaction_volume
FROM bank_data
GROUP BY branch_id
ORDER BY total_transaction_volume DESC;

# Which customers have the highest transaction frequency?

SELECT
	customer_id,
    first_name,
    last_name,
    COUNT(transaction_id) AS number_of_transaction
FROM bank_data
GROUP BY 
	customer_id,
    first_name,
    last_name
ORDER BY number_of_transaction DESC
LIMIT 5;