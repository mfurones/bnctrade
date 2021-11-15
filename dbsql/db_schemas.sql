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
        user VARCHAR(63) not null UNIQUE,
        mail VARCHAR(127) not null,
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
        id INT,
        strategy VARCHAR(63) NOT NULL,
        symbol VARCHAR(63) NOT NULL,
        interv VARCHAR(63) NOT NULL,
        trade VARCHAR(7) NOT NULL,
        invertcycles INT NOT NULL,
        invertmoney INT NOT NULL,
        user_id INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES users(id)
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
        id INT,
        timeD INT NOT NULL,
        timeh DATETIME NOT NULL,
        orderid INT NOT NULL,
        fiat VARCHAR(15) NOT NULL,
        amount DOUBLE(10, 10) NOT NULL,
        ustd DOUBLE(10, 10) NOT NULL,
        price DOUBLE(10, 10) NOT NULL,
        user_id INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES users(id)
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
        id INT,
        symbol VARCHAR(15) NOT NULL,
        timed INT NOT NULL,
        timeh DATETIME NOT NULL,
        trade INT NOT NULL,
        orderid INT NOT NULL,
        amount DOUBLE(10, 10) NOT NULL,
        ustd DOUBLE(10, 10) NOT NULL,
        price DOUBLE(10, 10) NOT NULL,
        tradesell_id INT,
        profile_id INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (profile_id) REFERENCES profiles(id),
        FOREIGN KEY (tradesell_id) REFERENCES tradeorderssell(id)
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
DROP PROCEDURE IF EXISTS sp_tbl_create_tradeorderssel;
CREATE PROCEDURE sp_tbl_create_tradeorderssel(IN tblname varchar(31))
BEGIN
SET @dropTable = CONCAT('DROP TABLE IF EXISTS ', tblname);
SET @createTable = CONCAT('CREATE TABLE IF NOT EXISTS ',tblname ,' (
        id INT,
        symbol VARCHAR(15) NOT NULL,
        timed INT NOT NULL,
        timeh DATETIME NOT NULL,
        trade INT NOT NULL,
        orderid INT NOT NULL,
        amount DOUBLE(10, 10) NOT NULL,
        ustd DOUBLE(10, 10) NOT NULL,
        price DOUBLE(10, 10) NOT NULL,
        tradebuy_id INT,
        profile_id INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (profile_id) REFERENCES profiles(id),
        FOREIGN KEY (tradebuy_id) REFERENCES tradeordersbuy(id)
        );');
PREPARE dt FROM @dropTable;
PREPARE ct FROM @createTable;
EXECUTE dt;
EXECUTE ct;
END
||
delimiter ;


### SP Calls



