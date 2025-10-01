# BRANCH PERFORMANCE 
# Which branch has the most customers?

SELECT
	branch_id,
	COUNT(DISTINCT customer_id) AS no_of_customers
FROM bank_data
GROUP BY branch_id
ORDER BY no_of_customers DESC
LIMIT 1;

# Which branch handles the highest transaction volume?

SELECT
	branch_id,
    SUM(transaction_amount) AS total_transaction_amount,
    COUNT(transaction_id) AS no_of_transaction
FROM bank_data
GROUP BY branch_id
ORDER BY total_transaction_amount DESC
LIMIT 1;

# Which branch issues the most loans/cards?

SELECT
	branch_id,
    SUM(loan_amount) AS total_loan_amount,
    COUNT(DISTINCT card_id) AS no_of_cards
FROM bank_data
GROUP BY branch_id
ORDER BY 
	total_loan_amount DESC,
	no_of_cards DESC
LIMIT 5;