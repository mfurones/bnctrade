# Select database
USE bnctradedbdev;

### Store Procedures CRUD users

# Create User

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_users_create;
CREATE PROCEDURE sp_CRUD_users_create(IN _tblname varchar(31), IN _user VARCHAR(63), IN _email VARCHAR(127), IN _uenable BOOL)
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

SET @user = _user;
SET @email = _email;
SET @uenable = _uenable;

SET @qInsert = CONCAT('INSERT INTO ', _tblname, '(id, user, email, uneable) ');
SET @qValues = CONCAT('VALUES(@id, @user, @email; @uenable);');
SET @query = @qInsert + @qValues;
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;

# Select User All

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_users_selectAll;
CREATE PROCEDURE sp_CRUD_users_selectAll(IN _tblname varchar(31))
BEGIN

SET @qSelect = CONCAT('SELECT id, user, email, uneable ');
SET @qFrom = CONCAT('FROM ', _tblname, ';');
SET @query = @qSelect + @qFrom;
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;

END
||
delimiter ;

# Select User by id

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_users_selectById;
CREATE PROCEDURE sp_CRUD_users_selectById(IN _tblname varchar(31), IN _id DOUBLE)
BEGIN

SET @id = _id;

SET @qSelect = CONCAT('SELECT id, user, email, uneable ');
SET @qFrom = CONCAT('FROM ', _tblname, ' ');
SET @qWhere = CONCAT('WHERE id = @id;');
SET @query = @qSelect + @qFrom + @qWhere;
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;

END
||
delimiter ;


# Update User

delimiter ||
DROP PROCEDURE IF EXISTS sp_CRUD_users_update;
CREATE PROCEDURE sp_CRUD_users_update(IN _tblname varchar(31), IN _id DOUBLE, IN _user VARCHAR(63), IN _email VARCHAR(127), IN _uenable BOOL)
BEGIN

SET @id = _id;
SET @user = _user;
SET @email = _email;
SET @uenable = _uenable;

SET @qTable = CONCAT('UPDATE ', _tblname, ' ');
SET @qSet = CONCAT('SET user = @user, email = @email, uenable = @uenable ');
SET @qWhere = CONCAT('WHERE id = @id;');
SET @query = @qTable + @qSet + @qWhere;
PREPARE query FROM @query;
EXECUTE query;
deallocate PREPARE query;
END
||
delimiter ;

