### Databases
# DEV
CREATE DATABASE bnctradedev;
# PROD
CREATE DATABASE bnctradeprod;

# Select database
USE bnctradedev;

### Schemas

### Table Klines DIAUSDT (Candlestick )

# Crear
delimiter ||
CREATE PROCEDURE createKlineTable(IN dbname varchar(31))
BEGIN
SET @setQuery =
    CONCAT('CREATE TABLE IF NOT EXISTS ',dbname ,' (
		symbol VARCHAR(15) not null,
        interv VARCHAR(5) not null,
        openTime DOUBLE not null,
        openT VARCHAR(31) not null,
        high VARCHAR(31) not null,
        low VARCHAR(31) not null,
        closeT VARCHAR(31) not null,
        volume VARCHAR(31) not null,
        closeTime DOUBLE not null,
        qav VARCHAR(31) not null,
        nTrades INT not null,
        tbbav VARCHAR(31) not null,
        tbqav VARCHAR(31) not null,
        ign VARCHAR(31),
        PRIMARY KEY (interv, openTime)
        );');
	PREPARE stmt FROM @setQuery;
	EXECUTE stmt;
END
||
delimiter ;

# Borrar
delimiter ||
CREATE PROCEDURE deleteTable(IN dbname varchar(31))
BEGIN
SET @setQuery =
    CONCAT('DROP TABLE ',dbname);
	PREPARE stmt FROM @setQuery;
	EXECUTE stmt;
END
||
delimiter ;

# delete procedure
DROP procedure createKlineRowDIA;
DROP procedure createKlineTable;



