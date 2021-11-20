
# Select database
USE bnctradedbdev;

### Store Procedures CRUD tradeordersbuy

# Create Order

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_tradeordersbuy_create;
CREATE PROCEDURE sp_CRUD_tradeordersbuy_create(IN _tblname varchar(31), IN _symbol VARCHAR(15), IN _interv VARCHAR(7), IN _timed INT, IN _timeh DATETIME, IN _trade INT, IN _orderid INT, IN _amount FLOAT, IN _ustd FLOAT, IN _price FLOAT, IN _profile_id DOUBLE)
BEGIN
SET @id = 0;
SET @CountId = CONCAT('SELECT COUNT(*) INTO @id FROM ', _tblname, ';');
PREPARE cid FROM @CountId;
EXECUTE cid;
IF @id > 0 THEN
	SET @MaxId = CONCAT('SELECT (MAX(id) + 1) INTO @id FROM ', _tblname, ';');
    PREPARE mid FROM @MaxId;
	EXECUTE mid;
    deallocate PREPARE mid;
ELSE
	SET @id = 1000;
END IF;

SET @symbol = _symbol;
SET @interv = _interv;
SET @timed = _timed;
SET @timeh = _timeh;
SET @trade = _trade;
SET @orderid = _orderid;
SET @amount = _amount;
SET @ustd = _ustd;
SET @price = _price;
SET @profile_id = _profile_id;

SET @insetRecordInto = CONCAT('INSERT INTO ', _tblname, '(id, symbol, interv, timed, timeh, trade, orderid, amount, ustd, price, tradesell_id, profile_id) ');
SET @insetRecordValues = CONCAT('VALUES(@id, @symbol, @interv, @timed, @timeh, @trade, @orderid, @amount, @ustd, @price, 0, @profile_id);');
SET @insetRecord = @insetRecordInto + @insetRecordValues;
PREPARE ir FROM @insetRecord;
EXECUTE ir;
deallocate PREPARE ir;
END
||
delimiter ;


# Update Order

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_tradeordersbuy_update;
CREATE PROCEDURE sp_CRUD_tradeordersbuy_update(IN _tblname varchar(31), IN _id DOUBLE, IN _tradesell_id DOUBLE)
BEGIN

SET @id = _id;
SET @tradesell_id = _tradesell_id;

SET @qTable = CONCAT('UPDATE ', _tblname, ' ');
SET @qSet = CONCAT('SET tradesell_id = @tradesell_id ');
SET @qWhere = CONCAT('WHERE id = @id;');
SET @query = @qTable + @qSet + @qWhere;
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;


# Select Order by Symbol, Interv

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_tradeordersbuy_selectBySymbolInterv;
CREATE PROCEDURE sp_CRUD_tradeordersbuy_selectBySymbolInterv(IN _tblname varchar(31), IN _symbol VARCHAR(15), IN _interv VARCHAR(7))
BEGIN

SET @symbol = _symbol;
SET @interv = _interv;

SET @qSelect = CONCAT('SELECT id, symbol, interv, timed, timeh, trade, orderid, amount, ustd, price, tradesell_id, profile_id ');
SET @qFrom = CONCAT('FROM ', _tblname, ' ');
SET @qWhere = CONCAT('WHERE (symbol = @symbol) AND (interv = @interv);');
SET @query = @qSelect + @qFrom + @qWhere;
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;

# Select Order by ID

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_tradeordersbuy_selectById;
CREATE PROCEDURE sp_CRUD_tradeordersbuy_selectById(IN _tblname varchar(31), IN _id DOUBLE)
BEGIN

SET @id = _id;
SET @tradesell_id = _tradesell_id;

SET @qSelect = CONCAT('SELECT id, symbol, interv, timed, timeh, trade, orderid, amount, ustd, price, tradesell_id, profile_id ');
SET @qFrom = CONCAT('FROM ', _tblname, ' ');
SET @qWhere = CONCAT('WHERE id = @id;');
SET @query = @qSelect + @qFrom + @qWhere;
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;


### Store Procedures CRUD tradeorderssell

# Create Order

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_tradeorderssell_create;
CREATE PROCEDURE sp_CRUD_tradeorderssell_create(IN _tblname varchar(31), IN _symbol VARCHAR(15), IN _interv VARCHAR(7), IN _timed INT, IN _timeh DATETIME, IN _trade INT, IN _orderid INT, IN _amount FLOAT, IN _ustd FLOAT, IN _price FLOAT, IN _tradebuy_id DOUBLE, IN _profile_id DOUBLE)
BEGIN
SET @id = 0;
SET @CountId = CONCAT('SELECT COUNT(*) INTO @id FROM ', _tblname, ';');
PREPARE cid FROM @CountId;
EXECUTE cid;
IF @id > 0 THEN
	SET @MaxId = CONCAT('SELECT (MAX(id) + 1) INTO @id FROM ', _tblname, ';');
    PREPARE mid FROM @MaxId;
	EXECUTE mid;
    deallocate PREPARE mid;
ELSE
	SET @id = 1000;
END IF;

SET @symbol = _symbol;
SET @interv = _interv;
SET @timed = _timed;
SET @timeh = _timeh;
SET @trade = _trade;
SET @orderid = _orderid;
SET @amount = _amount;
SET @ustd = _ustd;
SET @price = _price;
SET @tradebuy_id = _tradebuy_id;
SET @profile_id = _profile_id;

SET @insetRecordInto = CONCAT('INSERT INTO ', _tblname, '(id, symbol, interv, timed, timeh, trade, orderid, amount, ustd, price, tradebuy_id, profile_id) ');
SET @insetRecordValues = CONCAT('VALUES(@id, @symbol, @interv, @timed, @timeh, @trade, @orderid, @amount, @ustd, @price, @tradebuy_id, @profile_id);');
SET @insetRecord = @insetRecordInto + @insetRecordValues;
PREPARE ir FROM @insetRecord;
EXECUTE ir;
deallocate PREPARE ir;
END
||
delimiter ;


