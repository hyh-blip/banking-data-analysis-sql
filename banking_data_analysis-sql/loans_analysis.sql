# LOANS
# How many loans were approved vs. rejected?

SELECT
	loan_status,
    COUNT(loan_id) AS number_of_loans
FROM bank_data
GROUP BY loan_status
ORDER BY number_of_loans DESC;

# What’s the total loan amount disbursed by loan type?

SELECT
	loan_type,
    SUM(loan_amount) AS total_loan_amount
FROM bank_data
GROUP BY loan_type
ORDER BY total_loan_amount DESC;

# What’s the average interest rate & term length?

SELECT
	loan_type,
	AVG(interest_rate) AS avg_interest_rate,
    AVG(loan_term) AS avg_term_length
FROM bank_data
GROUP BY loan_type
ORDER BY loan_type;

SELECT
	AVG(interest_rate) AS avg_interest_rate,
    AVG(loan_term) AS avg_term_length
FROM bank_data;

# Default risk analysis: which age group/city has most rejections?

SELECT
	city,
    loan_status,
    COUNT(loan_id) AS number_of_loans
FROM bank_data
WHERE loan_status = "rejected"
GROUP BY city
ORDER BY number_of_loans DESC
LIMIT 5;