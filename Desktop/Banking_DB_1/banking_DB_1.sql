create database BankingDB;
use BankingDB;
create table Customers(
CustomerID int primary key,
Firstname varchar(50),
Lastname varchar(50),
email varchar(100),
phone varchar(15),
AccountCreationDate date);

