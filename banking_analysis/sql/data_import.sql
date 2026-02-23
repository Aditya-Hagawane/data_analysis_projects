COPY branches(branch_id,branch_name,city,state)
From "C:\Users\aditya\Desktop\Projects\data_analysis_projects\banking_analysis\data\branches.csv"
DELIMITER ','
CSV HEADER;

COPY customers(customer_id,name,age,gender,city,state,income,customer_since)
FROM "C:\Users\aditya\Desktop\Projects\data_analysis_projects\banking_analysis\data\customers.csv"
DELIMITER ','
CSV HEADER;

COPY accounts(acc_id,cusomter_id,acc_type,balance,acc_status,open_date,branch_id)
FROM "C:\Users\aditya\Desktop\Projects\data_analysis_projects\banking_analysis\data\accounts.csv"
DELIMITER ','
CSV HEADER

COPY transcations(transcation_id,acc_id,transcation_date,amount,transaction_type,channel)
FROM "C:\Users\aditya\Desktop\Projects\data_analysis_projects\banking_analysis\data\transactions.csv"
DELIMITER ','
CSV HEADER

COPY loans(loan_id,cusomter_id,loan_type,loan_amount,interest_rate,loan_status,default_flag)
FROM "C:\Users\aditya\Desktop\Projects\data_analysis_projects\banking_analysis\data\loans.csv"
DELIMITER ','
CSV HEADER