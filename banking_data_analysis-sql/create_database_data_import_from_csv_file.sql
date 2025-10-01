# DATASET SOURCE FROM KAGGLE (Comprehensive_Banking_Database CSV FILE)
 
# CREATE DATABASE

CREATE DATABASE banking_data;

USE banking_data;

# CREATE TABLE 

CREATE TABLE bank_data
(
	customer_id VARCHAR(255), # ID can be all types such as number, alphabet. That's why defined as VARCHAR for all ID. 
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	age INT,
	gender VARCHAR(255),
	address VARCHAR(255),
	city VARCHAR(255),
	contact_number VARCHAR(255), # At first contact_number defined as INT and exceeded the limit, then changed to VARCHAR(255).
	email VARCHAR(255),
	account_type VARCHAR(255),
	account_balance DECIMAL,
	date_of_account_opening DATETIME,
	last_transaction_date DATETIME,
	transaction_id VARCHAR(255),
	transaction_date DATETIME,
	transaction_type VARCHAR(255),
	transaction_amount DECIMAL,
	account_balance_after_transaction DECIMAL,
	branch_id VARCHAR(255),
	loan_id VARCHAR(255),
	loan_amount DECIMAL, 
	loan_type VARCHAR(255),
	interest_rate DECIMAL,
	loan_term INT,
	approval_rejection_date DATETIME,
	loan_status VARCHAR(255),
	card_id VARCHAR(255),
	card_type VARCHAR(255),
	credit_limit DECIMAL,
	credit_card_balance DECIMAL,
	minimum_payment_due DECIMAL,
	payment_due_date DATETIME,
	last_credit_card_payment_date DATETIME,
	rewards_points INT,
	feedback_id VARCHAR(255),
	feedback_date DATETIME,
	feedback_type VARCHAR(255),
	resolution_status VARCHAR(255),
	resolution_date DATETIME,
	anomaly INT
    );
# Import data from CSV file into table columns.
# When importing data, there has an error that incorrect time value because date format in CSV file and format in MySQL is different. 
# That's why modify the column type into VARCHAR temporarily.

ALTER TABLE bank_data
MODIFY COLUMN date_of_account_opening VARCHAR(255),
MODIFY COLUMN last_transaction_date VARCHAR(255),
MODIFY COLUMN transaction_date VARCHAR(255),
MODIFY COLUMN approval_rejection_date VARCHAR(255),
MODIFY COLUMN payment_due_date VARCHAR(255),
MODIFY COLUMN last_credit_card_payment_date VARCHAR(255),
MODIFY COLUMN feedback_date VARCHAR(255),
MODIFY COLUMN resolution_date VARCHAR(255)
;

# After importing data smoothly, update columns to match with CSV format '%m/%d/%Y'.

UPDATE bank_data
SET 
  date_of_account_opening = STR_TO_DATE(date_of_account_opening, '%m/%d/%Y'),
  last_transaction_date = STR_TO_DATE(last_transaction_date, '%m/%d/%Y'),
  transaction_date = STR_TO_DATE(transaction_date, '%m/%d/%Y'),
  approval_rejection_date = STR_TO_DATE(approval_rejection_date, '%m/%d/%Y'),
  payment_due_date = STR_TO_DATE(payment_due_date, '%m/%d/%Y'),
  last_credit_card_payment_date = STR_TO_DATE(last_credit_card_payment_date, '%m/%d/%Y'),
  feedback_date = STR_TO_DATE(feedback_date, '%m/%d/%Y'),
  resolution_date = STR_TO_DATE(resolution_date, '%m/%d/%Y');

# Convert the column type to DATE

ALTER TABLE bank_data
MODIFY COLUMN date_of_account_opening DATE,
MODIFY COLUMN last_transaction_date DATE,
MODIFY COLUMN transaction_date DATE,
MODIFY COLUMN approval_rejection_date DATE,
MODIFY COLUMN payment_due_date DATE,
MODIFY COLUMN last_credit_card_payment_date DATE,
MODIFY COLUMN feedback_date DATE,
MODIFY COLUMN resolution_date DATE;

SELECT * FROM bank_data
LIMIT 3;