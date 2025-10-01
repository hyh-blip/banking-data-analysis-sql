# CUSTOMER DEMOGRAPHIC
# What’s the average customer age? 

SELECT
	AVG(age)
FROM bank_data;

# Which age group dominates?

SELECT
	CASE
		WHEN age BETWEEN 18 AND 29 THEN '18-29, Youth'
        WHEN age BETWEEN 30 AND 45 THEN '30-45, Young Adult'
        WHEN age BETWEEN 46 AND 59 THEN '46-59, Adult'
        WHEN age >= 60 THEN '60+, Senior'
        ELSE 'Under 18'
	END AS age_group,
    COUNT(*) AS total_in_group
FROM bank_data
GROUP BY age_group
ORDER BY
	CASE
		WHEN age_group = 'Under 18' THEN 1
        WHEN age_group = '18-29, Youth' THEN 2
        WHEN age_group = '30-45, Young Adult' THEN 3
        WHEN age_group = '46-59, Adult' THEN 4
        WHEN age_group = '60+, Senior' THEN 5
	END;
        
# Gender distribution across different accounts types?

SELECT
	gender,
    account_type,
    COUNT(*) AS customer_count
FROM bank_data
GROUP BY
	gender,
    account_type
ORDER BY 
	account_type,
    customer_count;

# Which city has the most customers?

SELECT
	COUNT(DISTINCT city)
FROM bank_data;

SELECT
	city,
    COUNT(*) AS customer_count
FROM bank_data
GROUP BY city
ORDER BY customer_count DESC
LIMIT 10;