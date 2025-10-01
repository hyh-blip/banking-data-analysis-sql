# ACCOUNT INSIGHTS
# Which account type (savings, current, etc.) is most common?

SELECT
	account_type,
    COUNT(*) AS customer_count
FROM bank_data
GROUP BY account_type
ORDER BY customer_count DESC
LIMIT 1;

# What’s the average account balance per account type?

SELECT
	account_type,
	AVG(account_balance) AS avg_account_balance
FROM bank_data
GROUP BY account_type
ORDER BY avg_account_balance DESC;

# Who are the top 10 customers by balance?

SELECT
	customer_id,
    first_name,
    last_name,
    gender,
    account_type,
    account_balance
FROM bank_data
ORDER BY account_balance DESC
LIMIT 10;