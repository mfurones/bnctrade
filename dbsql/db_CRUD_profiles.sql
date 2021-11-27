# Select database
USE bnctradedbdev;

### Store Procedures CRUD Profiles

# Create Profile

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_profile_create;
CREATE PROCEDURE sp_CRUD_profile_create(IN _tblname varchar(31), IN _strategy VARCHAR(63), IN _symbol VARCHAR(63), IN _interv VARCHAR(7), IN _tradeenable BOOL, IN _invertcycles INT, IN _invertmoney INT, IN _user_id INT)
BEGIN
SET @id = 0;
SET @CountId = CONCAT('SELECT COUNT(*) INTO @id FROM ', _tblname, ';');
PREPARE cid FROM @CountId;
EXECUTE cid;
deallocate PREPARE cid;
IF @id > 0 THEN
SET @MaxId = CONCAT('SELECT (MAX(id) + 1) INTO @id FROM ', _tblname, ';');
PREPARE mid FROM @MaxId;
EXECUTE mid;
deallocate PREPARE mid;
ELSE
SET @id = 10001;
END IF;
SET @strategy = _strategy;
SET @symbol = _symbol;
SET @interv = _interv;
SET @tradeenable = _tradeenable;
SET @invertcycles = _invertcycles;
SET @invertmoney = _invertmoney;
SET @user_id = _user_id;
SET @qInsert = CONCAT('INSERT INTO ', _tblname, '(id, strategy, symbol, interv, tradeenable, invertcycles, invertmoney, user_id) ');
SET @qValues = CONCAT('VALUES(@id, @strategy, @symbol, @interv, @tradeenable, @invertcycles, @invertmoney, @user_id);');
SET @query = CONCAT(@qInsert, @qValues);
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;

# Select User All

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_profile_selectAll;
CREATE PROCEDURE sp_CRUD_profile_selectAll(IN _tblname varchar(31))
BEGIN
SET @qSelect = CONCAT('SELECT id, strategy, symbol, interv, tradeenable, invertcycles, invertmoney, user_id ');
SET @qFrom = CONCAT('FROM ', _tblname, ';');
SET @query = CONCAT(@qSelect, @qFrom);
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;

# Select User by id

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_profiles_selectById;
CREATE PROCEDURE sp_CRUD_profiles_selectById(IN _tblname varchar(31), IN _id DOUBLE)
BEGIN
SET @id = _id;
SET @qSelect = CONCAT('SELECT id, strategy, symbol, interv, tradeenable, invertcycles, invertmoney, user_id ');
SET @qFrom = CONCAT('FROM ', _tblname, ' ');
SET @qWhere = CONCAT('WHERE id = @id;');
SET @query = CONCAT(@qSelect, @qFrom, @qWhere);
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;


# Update User

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_profiles_update;
CREATE PROCEDURE sp_CRUD_profiles_update(IN _tblname varchar(31), IN _id DOUBLE, IN _strategy VARCHAR(63), IN _symbol VARCHAR(63), IN _interv VARCHAR(7), IN _tradeenable BOOL, IN _invertcycles INT, IN _invertmoney INT, IN _user_id DOUBLE)
BEGIN
SET @id = _id;
SET @strategy = _strategy;
SET @symbol = _symbol;
SET @interv = _interv;
SET @tradeenable = _tradeenable;
SET @invertcycles = _invertcycles;
SET @invertmoney = _invertmoney;
SET @user_id = _user_id;
SET @qTable = CONCAT('UPDATE ', _tblname, ' ');
SET @qSet = CONCAT('SET strategy = @strategy, symbol = @symbol, interv = @interv, tradeenable = @tradeenable, invertcycles = @invertcycles, invertmoney = @invertmoney, user_id = @user_id ');
SET @qWhere = CONCAT('WHERE id = @id;');
SET @query = CONCAT(@qTable, @qSet, @qWhere);
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;


# Select User by id

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_profiles_selectByProdIjUsersEnable;
CREATE PROCEDURE sp_CRUD_profiles_selectByProdIjUsersEnable(IN _tblname1 varchar(31),IN _tblname2 varchar(31))
BEGIN
SET @qSelect = CONCAT('SELECT tb1.id, tb1.strategy, tb1.symbol, tb1.interv, tb1.tradeenable, tb1.invertcycles, tb1.invertmoney, tb1.user_id, tb2.user, tb2.email, tb2.uenable ');
SET @qFrom = CONCAT('FROM ', _tblname1, ' AS tb1 ');
SET @qInnerJoin = CONCAT('INNER JOIN ', _tblname2, ' AS tb2 ');
SET @qOn = CONCAT('ON tb1.user_id = tb2.id ');
SET @qWhere = CONCAT('WHERE tb2.uenable = TRUE;');
SET @query = CONCAT(@qSelect, @qFrom, @qInnerJoin, @qOn, @qWhere);
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;
