# CUSTOMER FEEDBACKS
# What feedback type is most common (complaint, suggestion, praise)?

SELECT
	feedback_type,
    COUNT(feedback_id) AS number_of_feedbacks
FROM bank_data
GROUP BY feedback_type
ORDER BY number_of_feedbacks DESC;

# What’s the resolution rate?

SELECT 
    (SUM(
		CASE 
		WHEN resolution_status = 'Resolved' THEN 1 
        ELSE 0 
        END)
        / 
			COUNT(*)
            ) * 100 AS resolution_rate_percent
FROM bank_data;


# What’s the average resolution time (resolution_date - feedback_date)?

SELECT
	resolution_status,
	AVG(DATEDIFF(resolution_date, feedback_date)) AS avg_resolution_time
FROM bank_data
GROUP BY resolution_status;

SELECT
	AVG(DATEDIFF(resolution_date, feedback_date)) AS avg_resolution_time
FROM bank_data;