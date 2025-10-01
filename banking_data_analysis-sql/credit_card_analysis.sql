# CREDIT CARDS
# What’s the distribution of credit card types?

SELECT
	card_type,
    COUNT(DISTINCT card_id) AS number_of_cards
FROM bank_data
GROUP BY card_type
ORDER BY number_of_cards DESC;

# What’s the average credit limit and balance?

SELECT
	AVG(credit_limit) AS avg_credit_limit,
    AVG(credit_card_balance) AS avg_credit_card_blc
FROM bank_data;

# How many customers are overdue (payment_due_date < today)?

SELECT
    COUNT(customer_id) AS no_of_overdue_customers
FROM bank_data
WHERE payment_due_date < CURDATE();

# Which customers spend the most reward points?

SELECT
	customer_id,
    first_name,
    last_name,
    SUM(rewards_points) AS total_rewards_points
FROM bank_data
GROUP BY customer_id, first_name, last_name
ORDER BY total_rewards_points DESC
LIMIT 5;