-- Total accounts per customer
SELECT c.customer_id, c.name, COUNT(a.account_id) AS total_accounts
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_accounts DESC;

-- Total balance per customer
SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_balance DESC;

-- Total loan exposure per customer
SELECT c.customer_id, c.name, SUM(l.loan_amount) AS total_loan
FROM cleaned_customers c
JOIN cleaned_loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_loan DESC;

-- Average account balance per customer
SELECT c.customer_id, c.name, AVG(a.balance) AS avg_balance
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY avg_balance DESC;

-- Total deposits per branch
SELECT b.branch_id, b.branch_name, SUM(a.balance) AS total_deposit
FROM cleaned_branches b
JOIN cleaned_accounts a ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_deposit DESC;

-- Average account balance per branch
SELECT b.branch_id, b.branch_name, AVG(a.balance) AS avg_balance
FROM cleaned_branches b
JOIN cleaned_accounts a ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY avg_balance DESC;

-- Total loans per branch
SELECT b.branch_id, b.branch_name, SUM(l.loan_amount) AS total_loan
FROM cleaned_branches b
JOIN cleaned_accounts a ON b.branch_id = a.branch_id
JOIN cleaned_loans l ON a.customer_id = l.customer_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_loan DESC;

-- Branch-level loan default rate
SELECT b.branch_id, b.branch_name,
       COUNT(l.loan_id) FILTER (WHERE l.default_flag=1)::FLOAT / NULLIF(COUNT(l.loan_id),0) AS default_rate
FROM cleaned_branches b
JOIN cleaned_accounts a ON b.branch_id = a.branch_id
JOIN cleaned_loans l ON a.customer_id = l.customer_id
GROUP BY b.branch_id, b.branch_name
ORDER BY default_rate DESC;

-- Total transactions per customer
SELECT c.customer_id, c.name, COUNT(t.transaction_id) AS total_transactions
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
JOIN cleaned_transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name
ORDER BY total_transactions DESC;

-- Average transaction amount per customer
SELECT c.customer_id, c.name, AVG(t.amount) AS avg_transaction_amount
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
JOIN cleaned_transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name
ORDER BY avg_transaction_amount DESC;

-- Most used transaction channel
SELECT t.channel, COUNT(*) AS txn_count
FROM cleaned_transactions t
GROUP BY t.channel
ORDER BY txn_count DESC;