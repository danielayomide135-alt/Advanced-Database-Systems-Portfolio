BEGIN;

-- Create a dedicated schema for the banking system
CREATE SCHEMA IF NOT EXISTS banking;

---------------------------------------------------------
-- 1. CUSTOMER TABLE
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS banking.customer (
    customer_id SERIAL PRIMARY KEY,              -- Unique identifier for each customer
    name VARCHAR(255) NOT NULL,                  -- Full name of the customer
    date_of_birth DATE,                          -- Customer's date of birth
    phone_number VARCHAR(50),                    -- Contact phone number
    email_address VARCHAR(255)                   -- Primary email address
);

---------------------------------------------------------
-- 2. EMPLOYEE TABLE
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS banking.employee (
    employee_id SERIAL PRIMARY KEY,              -- Unique identifier for each bank employee
    name VARCHAR(255) NOT NULL,                  -- Employee's full name
    job_title VARCHAR(255),                      -- Job title/role (e.g., Teller, Loan Officer)
    email VARCHAR(255)                           -- Employee work email
);

---------------------------------------------------------
-- 3. ACCOUNT TABLE
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS banking.account (
    account_id SERIAL PRIMARY KEY,              -- Unique identifier for the account
    customer_id INTEGER REFERENCES banking.customer(customer_id),       -- Owner of the account
    employee_id INTEGER REFERENCES banking.employee(employee_id),       -- Employee who opened/manages the account
    account_number VARCHAR(50) UNIQUE,           -- Unique account number string
    account_type VARCHAR(50),                    -- Type of account (e.g., Checking, Savings)
    date_opened DATE                             -- Date the account was opened
);

---------------------------------------------------------
-- 4. TRANSACTION TABLE
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS banking.transaction (
    transaction_id SERIAL PRIMARY KEY,           -- Unique identifier for the transaction
    account_id INTEGER REFERENCES banking.account(account_id),         -- Account where the transaction occurred
    transaction_type VARCHAR(50),                -- Type of transaction (Deposit, Withdrawal, Loan Disbursement, etc.)
    amount NUMERIC(18, 2),                       -- Total monetary amount involved
    transaction_date DATE                        -- Date and time of the transaction
);

---------------------------------------------------------
-- 5. DEPOSIT TABLE
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS banking.deposit (
    deposit_id SERIAL PRIMARY KEY,               -- Unique identifier for deposit details
    transaction_id INTEGER REFERENCES banking.transaction(transaction_id), -- Links to the main transaction record
    deposit_amount NUMERIC(18, 2),               -- Amount deposited
    deposit_date DATE,                           -- Date of deposit
    deposit_method VARCHAR(50),                  -- Method used (e.g., Cash, Check, Wire)
    deposit_status VARCHAR(50)                   -- Status (e.g., Cleared, Pending)
);

---------------------------------------------------------
-- 6. WITHDRAWAL TABLE
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS banking.withdrawal (
    withdrawal_id SERIAL PRIMARY KEY,            -- Unique identifier for withdrawal details
    transaction_id INTEGER REFERENCES banking.transaction(transaction_id), -- Links to the main transaction record
    withdrawal_amount NUMERIC(18, 2),            -- Amount withdrawn
    withdrawal_date DATE                         -- Date of withdrawal
);

---------------------------------------------------------
-- 7. LOAN TABLE
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS banking.loan (
    loan_id SERIAL PRIMARY KEY,                  -- Unique identifier for loan details
    transaction_id INTEGER REFERENCES banking.transaction(transaction_id), -- Links to the main transaction record
    loan_amount NUMERIC(18, 2),                  -- Total approved loan amount
    interest_rate NUMERIC(5, 2),                 -- Interest rate percentage (e.g., 5.25)
    loan_term INTEGER,                           -- Term duration in months or years
    loan_status VARCHAR(50),                     -- Status (e.g., Active, Paid, Defaulted)
    application_date DATE                        -- Date the loan application was submitted
);

COMMIT;
