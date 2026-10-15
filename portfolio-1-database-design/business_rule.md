# Bank Entities and Business Rules

# Entities
- **Employee Data:** refers to the details about the bank's employees
- **Customer Data:** refers to the information about a person or businesses that use the bank's services
- **Loan Data:** Information about loans provided or applied for by customers,
- **Withdrawal Data:** Records of money withdrawn from bank accounts
- **Deposit Data:** Records of money paid into bank accounts,

## Business Rule 
- Every employee must have a unique employee ID. 
- Every bank account must have a unique account number.
- An account may have multiple deposits and withdrawals.
- Every customer must have a unique customer ID.
- Every system user must have a unique login identity.
- Access to the database must be restricted according to assigned roles and permissions.
- Customers must only access their own authorized account information.
- Passwords must be stored securely using appropriate password hashing.
- Each deposit must record its date, amount, method, and status.
- Loans must be approved before disbursement.
- A customer may own one or more bank accounts.
- Each customer record must contain valid contact information where required.
- Each employee must have an assigned job title and access privileges appropriate to their responsibilities.
- Each account must have an account type, opening date, and status.
- Each account must be linked to at least one customer.
- Customer information can only be accessed or modified by authorized users.

## Scope Assumption
- Every customer, employee, account, deposit, withdrawal, and loan has a unique identification number.
- Only authorized users can access banking records, and transactions must follow the bank's business rules.



