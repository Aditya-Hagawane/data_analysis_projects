CREATE TABLE branches(
  branch_id VARCHAR(10) PRIMARY KEY,
  branch_name VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL
);

CREATE TABLE customers(
  customer_id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT NOT NULL,
  gender VARCHAR(10) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  income NUMERIC NOT NULL,
  customer_since DATE NOT NULL
);

CREATE TABLE accounts(
  account_id VARCHAR(10) PRIMARY KEY,
  customer_id VARCHAR(10) NOT NULL,
  account_type VARCHAR(50) NOT NULL,
  balance NUMERIC NOT NULL,
  account_status VARCHAR(50) NOT NULL,
  open_date DATE NOT NULL,
  branch_id VARCHAR(10) NOT NULL,

  CONSTRAINT fk_accounts_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

  CONSTRAINT fk_accounts_branch
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE transactions(
  transaction_id VARCHAR(10) PRIMARY KEY,
  account_id VARCHAR(10) NOT NULL,
  transaction_date DATE NOT NULL,
  amount NUMERIC NOT NULL,
  transaction_type VARCHAR(50) NOT NULL,
  channel VARCHAR(100),

  CONSTRAINT fk_transactions_account
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans(
  loan_id VARCHAR(10) PRIMARY KEY,
  customer_id VARCHAR(10) NOT NULL,
  loan_type VARCHAR(50) NOT NULL,
  loan_amount NUMERIC NOT NULL,
  interest_rate NUMERIC NOT NULL,
  loan_status VARCHAR(20) NOT NULL,
  default_flag INT,

  CONSTRAINT fk_loans_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE INDEX idx_customer_id ON accounts(customer_id);
CREATE INDEX idx_account_id ON transactions(account_id);
CREATE INDEX idx_branch_id ON accounts(branch_id);
CREATE INDEX idx_loan_customer_id ON loans(customer_id);