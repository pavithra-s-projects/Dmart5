create database BankingDB;
use BankingDB;
create table Customers(
CustomerID int primary key,
Firstname varchar(50),
Lastname varchar(50),
email varchar(100),
phone varchar(15),
AccountCreationDate date);
select database();
use BankingDB;
show tables;
create table Accounts(
AccountID INT,
Accounttype Varchar(20),
Balance Decimal(10,2)
);


-- transaction table 
CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

-- Branches table 
CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
-- Account Branches table 
CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

-- Loan tables 
CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
desc loans;
desc customers;
alter table customers Add DateOfBirth Date;
select database ();
use BankingDB;
create table dummy(sno int primary key, name varchar(20));
desc dummy;
alter table dummy add column age int;
select * from dummy;
alter table dummy drop column age;
desc dummy;
alter table dummy add age int first;
select * from dummy;
alter table dummy add column age1 int after sno;
select * from dummy;
select * from customers;
desc customers;
alter table customers modify phone varchar(20);
desc customers;
alter table customers modify email varchar(50);
desc customers;
select * from dummy;
drop table dummy;
insert into dummy values(1,'Pavi'), (2,'Ash');
delete from dummy;

-- 1st Task - accounts -> connect with customers (changing the accounts table so giving first then connecting customers [so in ref])
-- add a foreign key on customerid that references customers(customerid)

ALTER TABLE Accounts ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

desc customers;
desc accounts;

-- task 2 Accounts --> connect with branches 
-- Add a foreign key on BranchID that references Branches(BranchID)

alter table accounts add BranchID INT;

Alter table Branches 
add constraint PK_Branches
primary key (BranchID);

alter table Accounts 
add constraint FK_Accounts_Branches
foreign key (BranchID)
references Branches(BranchID);

desc accounts;

-- task 3 transactions connect with accounts 
-- Add a foreign key on AccountID that references Accounts(AccountID)

ALTER TABLE Accounts ADD PRIMARY KEY (AccountID);
  ALTER TABLE Transactions ADD COLUMN AccountID INT;

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID) 
REFERENCES Accounts(AccountID);

select * from transactions;
desc transactions;

select * from customers;
desc customers;
select * from loans;
desc loans;

-- task 4 , loans --> customers 
-- Add a foreign key on CustomerID that references Customers(CustomerID)

alter table loans add column CustomerID Int;

alter table loans 
add constraint FK_loans_customerid
foreign key (customerid)
references customers(customerid);

drop table dummy;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;


SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

DELETE FROM Transactions
WHERE TransactionID = 302;


SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;

use BankingDB;





SELECT * FROM ACCOUNTS;

UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

select * from customers;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

-- Insert 4 Records into Customers Table
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

-- Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into Branches Table
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');



-- Insert 5 Records into Loans Table
INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

-- View Complete Customer Information

SELECT * FROM Customers; 


-- drop 
-- alter table customers drop column AccountCreationDate
alter table customers drop column AccountCreationDate;


-- adding next to phone in table (remember to add data type after the column name created)

alter table customers add column AccountCreationDate date after phone;


-- View Only Required Customer Details

SELECT FirstName, LastName, Email, Phone
FROM Customers;

-- Retrieve Customers with Savings Accounts

select * from accounts;

SELECT * FROM Accounts WHERE AccountType = 'Savings';

-- Retrieve Accounts with Balance Greater Than 25000

SELECT * FROM Accounts WHERE Balance > 25000;

use BankingDB;
select database();

-- Retrieve Transactions Between Specific Amounts

SELECT * FROM Transactions WHERE Amount BETWEEN 5000 AND 20000;

-- Retrieve Records for Selected Customers (using IN operations)

-- In & OR are same 
SELECT * FROM Customers WHERE CustomerID IN (101,102,103);
SELECT * FROM Customers WHERE CustomerID not IN (101,102,103);
select * from customers where customerID =101 or customerID=102 or customerID=103;

-- Between & AND are same 
select * from customers where customerID between 101 and 104;
select * from customers where customerID>101 and customerID<104;

-- pattern matching

SELECT * FROM Customers WHERE FirstName LIKE 'R%';

-- order by ascending and decending 

SELECT * FROM Customers ORDER BY FirstName ASC;

SELECT * FROM Accounts ORDER BY Balance DESC;


select accounttype from accounts;

-- distinct shows how many types present inside the columns by removing the duplicates 
select distinct accounttype from accounts;
-- SELECT DISTINCT COLUMN_NAME FROM TABLE_NAME;

SELECT COUNT(ACCOUNTTYPE) FROM ACCOUNTS; -- TO COUNT THE NUMBER OF ACCOUNT TYPE IN THE ACCOUNTS 

SELECT  COUNT(DISTINCT ACCOUNTTYPE) FROM ACCOUNTS; -- TO AVOID THE DUPLICATES IN THE COUNT 

SELECT ACCOUNTTYPE FROM ACCOUNTS;

-- LIMIT CLAUSE IS USED TO RESTRICT THE NUMBER OF RECORDS alter
-- SELECT * FROM TABLE_NAME LIMIT CONDITION;

-- OFFSET IS USED TO SKIP SPECIFIC NUMBER OF ROWS BEFORE STARTING TO RETURN ROWS 
-- SELECT COLUMN_NAME FROM TABLE_NAME LIMIT NUMBER OFFSET SKIP_NUMBER; 


-- OFFSET IS USED TO SKIP ROWS ; LIMIT IS USED TO SHOW ROWS 

SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 3;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

USE BANKINGDB;

-- CASE STATEMENTS 

SELECT 
    ACCOUNTID,
    BALANCE,
    CASE
        WHEN BALANCE >= 50000 THEN 'PREMIUM ACCOUNT'
        WHEN BALANCE >= 25000 THEN 'STANDARD ACCOUNT'
        ELSE 'BASIC ACCOUNT'
    END AS ACCOUNTCATEGORY
FROM
    ACCOUNTS; 
    
    --  FUNCTIONS (USED FOR DATA ANALAYSIS) 
    
SELECT * FROM ACCOUNTS;

-- AGGREGATE FUNCTIONS: SUM(), AVG(), MAX(), MIN(), COUNT() 

SELECT SUM(BALANCE) FROM ACCOUNTS;
SELECT AVG(BALANCE) FROM ACCOUNTS;
SELECT MIN(BALANCE) FROM ACCOUNTS;
SELECT MAX(BALANCE) FROM ACCOUNTS;
SELECT SUM(BALANCE) AS "TOTAL BALANCE" FROM ACCOUNTS; -- ALICE QUERY "AS" SINCE SPACE IS USED HAVE TO GIVE INSIDE THE STRINGS 
SELECT COUNT(*) FROM ACCOUNTS; -- STAR * AUTOMATICALLY COUNTS THE COLUMNS WHICH CONTAINS NUMBER 

-- WINDOW FUNCTIONS 
-- ROW_NUMBER(), RANK(), SUM(), 
-- CLAUSE USED FOR WINDOW FUNCTIION IS OVER() 
-- SELECT COLUMN1, FUNCTION(COLUMN2) OVER 

SELECT BALANCE, SUM(BALANCE) OVER() AS TOTALBALANCE FROM ACCOUNTS;

SELECT ACCOUNTID, BALANCE, SUM(BALANCE) OVER() AS TOTALBALANCE FROM ACCOUNTS;

SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;
use bankingdb;


-- search customers starts with A
select * from customers where firstname like 'A%';

-- search customers ends with A
select * from customers where lastname like '%A';

-- search customers contains gmail
select * from customers where email like '%gmail%';

-- name ends with kar 
SELECT *
FROM Customers
WHERE LastName LIKE '%kar';

-- ends with both a and i 

select * from customers where lastname like '%a' or lastname like '%i';
-- ends with 99 phone 
select * from customers where phone like '%99';
select * from customers where phone like '%9';

-- phone numbers start with 98 

select * from customers where phone like '98%';

-- filtering account types 

select * from accounts where Accounttype in ('savings', 'current');

select * from accounts;

select * from accounts where accounttype='savings' or accounttype='current';

-- balance savings and balance greater than 40000 

select * from accounts where accounttype='savings' and balance>40000;

-- act type both savings and current; bal>40000 using "or"
select * from accounts where accounttype=('savings' or 'current') and balance>40000;

select * from accounts where (accounttype='savings' or accounttype='current') and balance>40000;

-- -- act type both savings and current; bal>40000 using "and"
select * from accounts where accounttype in ('savings','current') and balance>40000;

-- to see the content in transactions 
select transactiontype from transactions;

-- viewing the number of distinct transaction types

select distinct transactiontype from transactions;

-- counting the number of distinct transaction types 

select count(distinct transactiontype) as "Trasaction Types" from transactions;

-- counting the number of transaction types excluding distinct 

select count(transactiontype) as "Trasaction Types" from transactions;

-- in and not in (similar to null and not null functions)  

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

SELECT *
FROM Customers
WHERE CustomerID not IN (101,102,105);

-- sort by ascending order -- Display Customers in Ascending Order of Last Name

select * 
from customers 
order by lastname asc;

-- Display Accounts with Highest Balance First 

select * from accounts order by balance desc;

-- Display Transactions Sorted by Transaction Date
select * from transactions order by transactiondate desc;

-- Display Only Top 5 Highest Balance Accounts

-- displays first three records 
select * from accounts limit 3;

-- display top three in balance 

select * from accounts order by balance desc limit 3;

-- to get first highest balance only 
select * from accounts order by balance desc limit 1;
 
-- to get second highest balance only 
select * from accounts order by balance desc limit 1 offset 1;

-- Display Savings Account Customers Sorted by Balance (using where clause inside order by )
select * from accounts where accounttype='savings' order by balance desc;

-- Search Customers Using Partial Name and Limit Results
SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

-- Display Selected Transactions in Sorted Order
select * from transactions where transactiontype in ('deposit', 'withdraw')
order by transactiondate desc; 

select * from transactions where transactiontype= ('deposit'or 'withdraw')
order by transactiondate desc; 

use bankingdb;

select * from customers;

-- concat (join) first and last names 

select concat(firstname,' ',lastname) as Fullname from customers;

-- upper 
SELECT
FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

-- lower 
SELECT
FirstName,
LOWER(FirstName) AS LowerCaseName
FROM customers;

-- capitalise only first letter of the name and the rest is lower 

select concat(
upper(left(firstname,1)),
lower(substring(firstname,2))
)
as propername 
from customers;

select firstname, length(firstname)  -- firtsname and namelength we have two columns so , in syntax 
as namelength
from customers;

-- 
SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;






-- Display only the first three characters of customer FirstName

SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;


-- Combine customer's FirstName with LastName
SELECT
CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

-- math functions

-- round 
SELECT ROUND(1256.75) AS Rounded_Value;

-- ceil 
SELECT CEIL(1256.25) AS Ceiling_Value;

-- floor 
SELECT FLOOR(1256.75) AS Floor_Value;

-- mod function 

select 10%3;

select mod (10,3) as reminder;

-- abs 

SELECT ABS(-2500) AS Absolute_Value;


-- reversing the firstname column in customers using reverse function 

select firstname, reverse(firstname) as reversename from customers; -- dont miss the comma 

select * from accounts;

-- Calculate the total balance maintained across all customer accounts 

select sum(balance) as totalbalance from accounts;

select avg(balance) as averagebal from accounts;

-- two functions to cut the extra floating points = truncate and average 
select truncate(avg(balance),2) as averagebal from accounts;

select max(balance) as maxbalance from accounts;

select min(balance) as minbalance from accounts;

select count(*) as totalaccounts from accounts; -- * bcoz count automatically counts number table without assigning specific table 

-- quotation doubt 
select * from customers;
select firstname, reverse('priya') as reversename from customers;

-- GROUB BY 
-- is used to group rows which 
-- the GROUP BY clause to organize similar records together and calculate performance metrics for each group

select * from accounts;

-- sums and displays all savings and current separately 
select accounttype, sum(balance) as totalbalance from accounts group by accounttype; 

use bankingdb;

-- HAVING CLUASE 

SELECT 
    accounttype, SUM(balance) AS totalbalance
FROM
    accounts
GROUP BY accounttype
HAVING totalbalance > 25000; -- dont miss the comma // since we are using alice column 


-- DATE FUNCTIONS 

select * from customers;

-- for current date display 
select curdate();

-- for date and present time 
select now();

select dayofmonth(now());
select dayofweek(now());
select dayofyear(now());


-- DISPLAY OF DATE OF BIRTH 

 select year(curdate());

select month(curdate());

select day(curdate());


select * from customers;

select customerid, dateofbirth, year(dateofbirth) as birthyear from customers;

select customerid, dateofbirth, month(dateofbirth) as birthmonth from customers; -- for birth month display in numbers -- month()

select customerid, dateofbirth, monthname(dateofbirth) as birthmonth from customers; -- for birth month display in names -- monthname() 

select customerid, dateofbirth, dayname(dateofbirth) as birthday from customers; -- for birth day displaying 

-- DATEDIFF function 

select customerid, datediff(curdate(), dateofbirth) as days from customers; -- subtracting current-date from dob for customer 


-- COMPARISON FUNCTION 

select year(curdate());


-- IF FUNCTION 
SELECT 
    firstname,
    dateofbirth,
    IF(YEAR(dateofbirth) <= 1995,
        'adult',
        'young') AS category
FROM
    customers;
    
    use bankingdb;
   
   
   -- IFNULL FUNCTION 
    
    select firstname, ifnull(phone, 'not available') as phonenumber 
from customers;

-- USING TIMESTAMP YEARS// DAYS// MONTH 

select firstname, dateofbirth, timestampdiff(year, dateofbirth, now()) as years from customers;

select firstname, dateofbirth, timestampdiff(day, dateofbirth, now()) as days from customers;

select firstname, dateofbirth, timestampdiff(month, dateofbirth, now()) as months from customers;

select adddate(curdate(), interval 3 day);

select adddate(curdate(), interval 3 year);

select subdate(curdate(), interval 3 day);

select adddate(curdate(), interval 3 year);

select time (curdate());

select time (now());

select hour(now());

select minute(now());

select greatest(78,67,87);

select least(56,78,99);

select * from accounts;
select least(balance) from accounts; 


select date_format('2026-11-04', '%d-%m-%y');

select date_format('2026-11-04', '%d-%m-%Y');

select date_format('2026-11-04', '%d-%M-%Y');

select date_format('2026-11-04', '%D-%M-%Y');

select date_format('2026-11-04', '%d-%m-%y') as format;

-- NULLIF -- TO GIVE NULL TO ANY INPUT VALUE AND DISPLAY IT AS NULL 

select firstname, nullif(firstname, 'priya') as result from customers;

-- TASK 7 
-- WINDOW FUNCTIONS 
-- partition is not mandatory 
-- over() is the clause used in window fn 
-- group by is not possible in window functions 
select balance, sum(balance) over () as totalbalance from accounts;

select balance, avg(balance) over () as avgbalance from accounts;

select balance, min(balance) over () as minbalance from accounts;

select balance, max(balance) over () as maxbalance from accounts;

select balance, row_number() over () as rownumber from accounts; -- dont give rank it consider as function ; use ranks for alice 

select balance, rank() over () as ranks from accounts; -- dont give rank it consider as function ; use ranks for alice 

select balance, rank() over (order by balance desc) as ranks from accounts;
-- you have to give order by inside the over bracket 
-- decending 

select balance, rank() over (order by balance asc) as ranks from accounts;
-- ascending


-- PARTITION BY  

-- have to add balance into sum column into bracket 


select balance,
       sum(balance) over (partition by accountid) as total
from accounts;

select * from accounts;

-- ACTIVITY
-- RANK  
Select
    LoanID,
    CustomerID, LoanAmount, RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS LoanRank
FROM Loans;

-- DENSE RANK 
select loanid, customerid, loanamount, dense_rank() 
over(order by loanamount desc) as denserank
from loans;

-- RANK() OVER(PARTITION columnname BY ORDER colmunnumer BY DESC/ASC)

select *, RANK() over (partition by accountid ORDER BY balance desc) as total
from accounts;

select *, row_number() over (partition by accountid ORDER BY balance desc) as total
from accounts;

select *, sum(balance) over(partition by accountid order by balance desc) as cumsum from accounts;


-- partition by -- splits the results into logical partitions 

select * from loans;

select loanid, loanamount, customerid, row_number() over(order by loanamount desc) from loans; 

select loanid, loanamount, customerid, row_number() over(partition by customerid order by loanamount desc) as rownum from loans;
 
 
 select *, lag(loanamount) over(order by loanamount desc) as rownum from loans;
-- generates previous loan amount 

 select *, lead(loanamount) over(order by loanamount desc) as rownum from loans;
-- generates before loan amount 


-- rank() dense_rank() row_number() percent_rank() cume_dist() inside the bracket it stays empty 

-- ACTIVITY 8 

