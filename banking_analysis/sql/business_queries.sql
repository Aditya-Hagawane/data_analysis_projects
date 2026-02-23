SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_balance DESC
LIMIT 10;

SELECT b.branch_id, b.branch_name, SUM(a.balance) AS total_deposit
FROM cleaned_branches b
JOIN cleaned_accounts a ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_deposit DESC
LIMIT 10;

SELECT DATE_TRUNC('month', transaction_date) AS month, COUNT(*) AS transaction_count
FROM cleaned_transactions
GROUP BY month
ORDER BY month;

SELECT channel, COUNT(*) AS txn_count
FROM cleaned_transactions
GROUP BY channel
ORDER BY txn_count DESC;

SELECT c.customer_id, c.name,
       COUNT(t.transaction_id) AS total_transactions,
       SUM(CASE WHEN t.transaction_type='Credit' THEN t.amount ELSE 0 END) AS total_credit,
       SUM(CASE WHEN t.transaction_type='Debit' THEN t.amount ELSE 0 END) AS total_debit,
       AVG(t.amount) AS avg_transaction_amount
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
JOIN cleaned_transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name
ORDER BY total_transactions DESC
LIMIT 10;

SELECT b.branch_id, b.branch_name,
       COUNT(t.transaction_id) AS total_transactions,
       SUM(CASE WHEN t.transaction_type='Credit' THEN t.amount ELSE 0 END) AS total_credit,
       SUM(CASE WHEN t.transaction_type='Debit' THEN t.amount ELSE 0 END) AS total_debit,
       AVG(t.amount) AS avg_transaction_amount
FROM cleaned_branches b
JOIN cleaned_accounts a ON b.branch_id = a.branch_id
JOIN cleaned_transactions t ON a.account_id = t.account_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_transactions DESC;

SELECT c.customer_id, c.name,
       COUNT(t.transaction_id) AS txn_count,
       SUM(t.amount) AS total_amount
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
JOIN cleaned_transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name
HAVING COUNT(t.transaction_id) > 50 
LIMIT 10;

SELECT c.customer_id, c.name,
       SUM(a.balance) AS total_balance,
       SUM(l.loan_amount) AS total_loan,
       (SUM(l.loan_amount)/NULLIF(SUM(a.balance),0)) AS loan_to_balance_ratio
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
JOIN cleaned_loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(a.balance) > 50000 
ORDER BY loan_to_balance_ratio DESC
LIMIT 10;