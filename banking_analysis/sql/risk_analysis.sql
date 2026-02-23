SELECT c.customer_id, c.name,
       SUM(l.loan_amount)/NULLIF(SUM(a.balance),0) AS loan_to_balance_ratio,
       SUM(a.balance) AS total_balance,
       SUM(l.loan_amount) AS total_loan
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
JOIN cleaned_loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.name
ORDER BY loan_to_balance_ratio DESC
LIMIT 20;

SELECT loan_type,
       COUNT(*) FILTER (WHERE default_flag = 1)::FLOAT / COUNT(*) AS default_rate,
       COUNT(*) AS total_loans
FROM cleaned_loans
GROUP BY loan_type
ORDER BY default_rate DESC;

SELECT b.branch_id, b.branch_name,
       COUNT(l.loan_id) FILTER (WHERE l.default_flag = 1) AS defaults,
       COUNT(l.loan_id) AS total_loans,
       (COUNT(l.loan_id) FILTER (WHERE l.default_flag = 1)::FLOAT / NULLIF(COUNT(l.loan_id),0)) AS default_rate,
       SUM(a.balance) AS total_deposit
FROM cleaned_branches b
JOIN cleaned_accounts a ON b.branch_id = a.branch_id
JOIN cleaned_loans l ON a.customer_id = l.customer_id
GROUP BY b.branch_id, b.branch_name
ORDER BY default_rate DESC;

SELECT c.customer_id, c.name, COUNT(l.loan_id) AS total_loans,
       COUNT(l.loan_id) FILTER (WHERE l.default_flag=1) AS total_defaults
FROM cleaned_customers c
JOIN cleaned_loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(l.loan_id) FILTER (WHERE l.default_flag=1) > 1
ORDER BY total_defaults DESC;

SELECT c.customer_id, c.name,
       SUM(l.loan_amount)/NULLIF(SUM(a.balance),0) AS loan_to_balance_ratio,
       COUNT(l.loan_id) FILTER (WHERE l.default_flag=1) AS defaults_count,
       SUM(a.balance) AS total_balance,
       SUM(l.loan_amount) AS total_loan
FROM cleaned_customers c
JOIN cleaned_accounts a ON c.customer_id = a.customer_id
JOIN cleaned_loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(l.loan_amount)/NULLIF(SUM(a.balance),0) > 1
   OR COUNT(l.loan_id) FILTER (WHERE l.default_flag=1) > 0
ORDER BY defaults_count DESC, loan_to_balance_ratio DESC;