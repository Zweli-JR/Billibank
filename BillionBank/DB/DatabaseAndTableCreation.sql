 /*
=============================================================
FileName: Create_Database_And_Tables.sql
Programmer: Zwelethu Jr. Nkosi
Description: This file will create the database and tables with the necessary constraints.
=============================================================
*/

USE master
GO

IF EXISTS(SELECT name FROM master.dbo.sysdatabases
	       WHERE name = 'BilliBank')
BEGIN
	DROP DATABASE BilliBank
	PRINT 'The database has been deleted'
END

CREATE DATABASE BilliBank
ON PRIMARY
(
	NAME = 'BilliBank',
	FILENAME = 'C:\sql22\BilliBank.mdf',
	SIZE = 5MB,
	FILEGROWTH = 10%
)
LOG ON
(
	NAME = 'BilliBank_log',
	FILENAME = 'C:\sql22\BilliBank_log.ldf',
	SIZE = 5MB,
	FILEGROWTH = 10%
)
GO

USE BilliBank
GO

CREATE TABLE users
(
	userEmail VARCHAR(30) UNIQUE NOT NULL,
	userID VARCHAR(13) UNIQUE NOT NULL,
	userName VARCHAR(30) NOT NULL,
	userPrefName VARCHAR(30) NOT NULL,
	addressLine1 VARCHAR(250) NOT NULL,
	addressLine2 VARCHAR(250) NULL,
	city VARCHAR(50) NOT NULL,
	contactNo VARCHAR(15) NOT NULL, 
	userPassword VARCHAR(20) NOT NULL,
	question VARCHAR(250) NOT NULL,
	answer VARCHAR(250) NOT NULL,
	dateAdded DATETIME NOT NULL,
	newness INT NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY(userEmail),
)
GO

CREATE TABLE accounts
(
	accNo BIGINT IDENTITY(1012963571,1) NOT NULL,
	accOwner VARCHAR(30) NOT NULL,
	accType VARCHAR(7) NOT NULL,
	accName VARCHAR(20) NOT NULL,
	accBalance FLOAT NOT NULL,
	dateAdded DATETIME NOT NULL,
	useCount INT NOT NULL,
	CONSTRAINT accounts_pk PRIMARY KEY(accNo),
	CONSTRAINT accounts_fk FOREIGN KEY(accOwner) REFERENCES users(userEmail),
)
GO

CREATE TABLE transactions
(
	transactionID BIGINT IDENTITY(1,1) NOT NULL,
	transactionOwner VARCHAR(30) NOT NULL,
	sender BIGINT NOT NULL, 
	recepient BIGINT NOT NULL,
	ref VARCHAR(50) NOT NULL,
	recepientRef VARCHAR(50) NOT NULL,
	amt FLOAT NOT NULL,
	transfers INT NOT NULL,
	transactionTime DATETIME NOT NULL,
	CONSTRAINT transactions_pk PRIMARY KEY(transactionID),
	CONSTRAINT transactions_fk FOREIGN KEY(transactionOwner) REFERENCES users(userEmail),
)