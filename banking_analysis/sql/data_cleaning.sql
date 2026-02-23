--Numeric cleaning
UPDATE customers
SET income = 0
WHERE income < 0;

ALTER TABLE customers ADD COLUMN IF NOT EXISTS age_invalid BOOLEAN DEFAULT FALSE;
UPDATE customers
SET age_invalid = TRUE
WHERE age <= 0 OR age > 100;

ALTER TABLE accounts ADD COLUMN IF NOT EXISTS balance_invalid BOOLEAN DEFAULT FALSE;
UPDATE accounts
SET balance_invalid = TRUE
WHERE balance < 0;

ALTER TABLE loans ADD COLUMN IF NOT EXISTS loan_invalid BOOLEAN DEFAULT FALSE;
UPDATE loans
SET loan_invalid = TRUE
WHERE loan_amount < 0 OR interest_rate < 0 OR interest_rate > 50;

ALTER TABLE transactions ADD COLUMN IF NOT EXISTS txn_invalid BOOLEAN DEFAULT FALSE;
UPDATE transactions
SET txn_invalid = TRUE
WHERE amount < 0;

--categorical standardization
UPDATE customers
SET gender = 'Male'
WHERE LOWER(gender) IN ('m', 'male');

UPDATE customers
SET gender = 'Female'
WHERE LOWER(gender) IN ('f', 'female');

UPDATE accounts
SET account_status = 'Active'
WHERE LOWER(account_status) IN ('active', 'a');

UPDATE accounts
SET account_status = 'Closed'
WHERE LOWER(account_status) IN ('closed', 'c');

UPDATE transactions
SET transaction_type = 'Credit'
WHERE LOWER(transaction_type) IN ('credit', 'cr');

UPDATE transactions
SET transaction_type = 'Debit'
WHERE LOWER(transaction_type) IN ('debit', 'dr');

--cleaned views for analysis
CREATE OR REPLACE VIEW cleaned_customers AS
SELECT * FROM customers
WHERE age_invalid = FALSE AND income >= 0;

CREATE OR REPLACE VIEW cleaned_accounts AS
SELECT * FROM accounts
WHERE balance_invalid = FALSE;

CREATE OR REPLACE VIEW cleaned_loans AS
SELECT * FROM loans
WHERE loan_invalid = FALSE;

CREATE OR REPLACE VIEW cleaned_transactions AS
SELECT * FROM transactions
WHERE txn_invalid = FALSE;

CREATE OR REPLACE VIEW cleaned_branches AS
SELECT * FROM branches;