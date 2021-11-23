### Databases
# DEV
CREATE DATABASE bnctradedbdev;
# PROD
CREATE DATABASE bnctradedbprod;

# Select database
USE bnctradedbdev;

# user

select user(), current_user();

### Store Procedures Schemas

# TBL USERS

delimiter ||
DROP PROCEDURE IF EXISTS sp_tbl_create_users;
CREATE PROCEDURE sp_tbl_create_users(IN tblname varchar(31))
BEGIN
SET @dropTable = CONCAT('DROP TABLE IF EXISTS ', tblname);
SET @createTable = CONCAT('CREATE TABLE IF NOT EXISTS ',tblname ,' (
        id INT,
        user VARCHAR(63) NOT NULL UNIQUE,
        email VARCHAR(127) NOT NULL,
        uenable BOOLEAN NOT NULL,
        PRIMARY KEY (id)
        );');
PREPARE dt FROM @dropTable;
PREPARE ct FROM @createTable;
EXECUTE dt;
EXECUTE ct;
END
||
delimiter ;

# TBL PROFILES

delimiter ||
DROP PROCEDURE IF EXISTS sp_tbl_create_profiles;
CREATE PROCEDURE sp_tbl_create_profiles(IN tblname varchar(31))
BEGIN
SET @dropTable = CONCAT('DROP TABLE IF EXISTS ', tblname);
SET @createTable = CONCAT('CREATE TABLE IF NOT EXISTS ',tblname ,' (
        id DOUBLE,
        strategy VARCHAR(63) NOT NULL,
        symbol VARCHAR(63) NOT NULL,
        interv VARCHAR(7) NOT NULL,
        tradeenable BOOL NOT NULL,
        invertcycles INT NOT NULL,
        invertmoney INT NOT NULL,
        user_id INT NOT NULL,
        PRIMARY KEY (id)
        );');
PREPARE dt FROM @dropTable;
PREPARE ct FROM @createTable;
EXECUTE dt;
EXECUTE ct;
END
||
delimiter ;


# TBL Fiat Orders

delimiter ||
DROP PROCEDURE IF EXISTS sp_tbl_create_fiatorders;
CREATE PROCEDURE sp_tbl_create_fiatorders(IN tblname varchar(31))
BEGIN
SET @dropTable = CONCAT('DROP TABLE IF EXISTS ', tblname);
SET @createTable = CONCAT('CREATE TABLE IF NOT EXISTS ',tblname ,' (
        id DOUBLE,
        timeD INT NOT NULL,
        timeh DATETIME NOT NULL,
        orderid INT NOT NULL,
        fiat VARCHAR(15) NOT NULL,
        amount DOUBLE(10, 10) NOT NULL,
        ustd DOUBLE(10, 10) NOT NULL,
        price DOUBLE(10, 10) NOT NULL,
        user_id INT NOT NULL,
        PRIMARY KEY (id)
        );');
PREPARE dt FROM @dropTable;
PREPARE ct FROM @createTable;
EXECUTE dt;
EXECUTE ct;
END
||
delimiter ;


# TBL Trade Orders Buy

delimiter ||
DROP PROCEDURE IF EXISTS sp_tbl_create_tradeordersbuy;
CREATE PROCEDURE sp_tbl_create_tradeordersbuy(IN tblname varchar(31))
BEGIN
SET @dropTable = CONCAT('DROP TABLE IF EXISTS ', tblname);
SET @createTable = CONCAT('CREATE TABLE IF NOT EXISTS ',tblname ,' (
        id DOUBLE,
        symbol VARCHAR(15) NOT NULL,
        interv VARCHAR(7) NOT NULL,
        timed INT NOT NULL,
        timeh DATETIME NOT NULL,
        trade INT NOT NULL,
        orderid INT NOT NULL,
        amount FLOAT NOT NULL,
        ustd FLOAT NOT NULL,
        price FLOAT NOT NULL,
        tradesell_id INT,
        profile_id INT NOT NULL,
        PRIMARY KEY (id)
        );');
PREPARE dt FROM @dropTable;
PREPARE ct FROM @createTable;
EXECUTE dt;
EXECUTE ct;
END
||
delimiter ;


# TBL Trade Orders Sell

delimiter ||
DROP PROCEDURE IF EXISTS sp_tbl_create_tradeorderssell;
CREATE PROCEDURE sp_tbl_create_tradeorderssell(IN tblname varchar(31))
BEGIN
SET @dropTable = CONCAT('DROP TABLE IF EXISTS ', tblname);
SET @createTable = CONCAT('CREATE TABLE IF NOT EXISTS ',tblname ,' (
        id DOUBLE,
        symbol VARCHAR(15) NOT NULL,
        interv VARCHAR(7) NOT NULL,
        timed INT NOT NULL,
        timeh DATETIME NOT NULL,
        trade INT NOT NULL,
        orderid INT NOT NULL,
        amount FLOAT NOT NULL,
        ustd FLOAT NOT NULL,
        price FLOAT NOT NULL,
        tradebuy_id INT,
        profile_id INT NOT NULL,
        PRIMARY KEY (id)
        );');
PREPARE dt FROM @dropTable;
PREPARE ct FROM @createTable;
EXECUTE dt;
EXECUTE ct;
END
||
delimiter ;


### SP Calls

call sp_tbl_create_users('users');
call sp_tbl_create_profiles('profiles');
call sp_tbl_create_fiatorders('fiatorders');
call sp_tbl_create_tradeordersbuy('tradeordersbuy');
call sp_tbl_create_tradeorderssell('tradeorderssell');
