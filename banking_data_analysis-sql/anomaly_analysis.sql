# ANOMALY DETECTION 
# Which transactions are flagged as anomalies?

SELECT 
    transaction_id,
    customer_id,
    branch_id,
    transaction_type,
    transaction_date,
    transaction_amount
FROM bank_data
WHERE anomaly = 1;

# Are anomalies concentrated in certain branches, transaction types, or customer groups?
# Certain branches
SELECT 
    branch_id,
    COUNT(*) AS anomaly_count
FROM bank_data
WHERE anomaly = 1
GROUP BY branch_id
ORDER BY anomaly_count DESC;

# Certain transaction types
SELECT 
    transaction_type,
    COUNT(*) AS anomaly_count
FROM bank_data
WHERE anomaly = 1
GROUP BY transaction_type
ORDER BY anomaly_count DESC;

# Certain customer groups
SELECT
	CASE
		WHEN age BETWEEN 18 AND 29 THEN '18-29, Youth'
        WHEN age BETWEEN 30 AND 45 THEN '30-45, Young Adult'
        WHEN age BETWEEN 46 AND 59 THEN '46-59, Adult'
        WHEN age >= 60 THEN '60+, Senior'
        ELSE 'Under 18'
	END AS age_group,
    COUNT(*) AS anomaly_count
    FROM bank_data
    GROUP BY age_group
    ORDER BY anomaly_count DESC;