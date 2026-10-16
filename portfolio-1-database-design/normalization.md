**Apply normalization to the given unnormalised table.**
**Given Table:**

**|account_id | account_type | customer_name | customer_phone | employee_id | employee_name | transaction_id | transaction_type | amount  | deposit_method | withdrawal_amount | loan_amount |**
**|-----------|--------------|---------------|----------------|-------------|---------------|----------------|------------------|---------|--------------- |--------- ---------|-------------|**
  |    101    |    Saving    |    Zita Sarah |   234-1103-0	  |     20      |  sodiq Pascal	|      5001	     |    Deposit	      | 1250.00 |     Cash	     |       NULL	       |    NULL     |
  |    102	  |   Checking	 |  Mary olabisi |  234-1104-01	  |     15      |  Alex rex	    |      5002	     |    Loan          | 550.00  |	    NULL	     |       NULL        |    550.00   |
  |    103	  |    Savings	 |   Rose Peace	 |  234-1105-02	  |     30      |  king Kenny	  |      5003	     |    Withdrawal	  | 10000.00|	    Cash	     |    10000.00		   |    10000.00 |
  |    104    |   Saving     |  Peter chidi  |  234-1106-03   |     34      |  bolaji Tom   |      5004      |    Loan          | 200.00  |     NULL       |      NULL         |     200.00  |

**Normalisation Steps:**

**First Normal Form (1NF): Ensure atomicity by creating separate tables for extracted customer names, customer phone, account_id**
**|account_id |  customer_name | customer_phone |**
**|-----------|----------------|----------------|**
  |    101    |   Zita Sarah   |     234-1103-0	|
  |    102    |   Mary olabisi |    234-1104-01 |
  |    103    |   Rose Peace   |    234-1105-02 |
  |    104    |   Peter chidi  |    234-1106-03 |

**Table 2**
**Second Normal Form (2NF): Extracted unique employees:**
**| employee_id | employee_name |**
**|-------------|---------------|**
  |     20      |  sodiq Pascal	|
  |     15      |  Alex rex	    |
  |     30      |  king Kenny	  |
  |     34      |  bolaji Tom   |

 **Table 3: account**
**Third Normal Form 3NF: Connects accounts to their respective customers and employees using IDs:**
  **| account_id  | account_type  | employee_id | employee_name |**
  **|-------------|---------------|-------------|---------------|**
    |    101      |    Saving     |     20      |  sodiq Pascal	|
    |    102      |    Checking   |     15      |   Alex rex    |	 
    |    103      |    Savings    |     30      |   king Kenny	| 
    |    104      |    Saving     |     34      |  bolaji Tom   | 

**Table 4: transaction**
**Fourth Normal Form (4NF): Tracks the financial events tied back to their respective accounts**
**| transaction_id | account_id | transaction_type |  amount  |**
**|----------------|------------|------------------|----------|**
  |     5001	     |    101     |    Deposit       | 1250.00  |	
  |     5002	     |    102     |    Loan          | 550.00   |
  |     5003	     |    103     |    Withdrawal    | 10000.00 |
  |     5004       |    104     |    Loan          | 200.00   |

    
