
# Crear
delimiter $$
CREATE PROCEDURE createKlineRow(
	IN _table varchar(31),
	IN _symbol VARCHAR(15),
	IN _interv VARCHAR(5),
	IN _openTime DOUBLE,
	IN _openT VARCHAR(31),
	IN _high VARCHAR(31),
	IN _low VARCHAR(31),
	IN _closeT VARCHAR(31),
	IN _volume VARCHAR(31),
	IN _closeTime DOUBLE,
	IN _qav VARCHAR(31),
	IN _nTrades INT,
	IN _tbbav VARCHAR(31),
	IN _tbqav VARCHAR(31),
	IN _ign VARCHAR(31)
)
BEGIN

	SET @val01 = CONCAT("INSERT INTO ", _table, " (symbol, interv, openTime, openT, high, low, closeT, volume, closeTime, qav, nTrades, tbbav, tbqav, ign) ");
	SET @val02 = CONCAT("VALUES ('", CONCAT_WS("', '", _symbol, _interv, _openTime, _openT, _high, _low, _closeT, _volume, _closeTime, _qav, _nTrades, _tbbav, _tbqav, _ign), "') ");
	SET @val03 = CONCAT("ON DUPLICATE KEY UPDATE ",
		"symbol = '",_symbol, "', interv = '",_interv, "', openTime = '",_openTime, "', openT = '",_openT, "', high = '",_high, "', low = '",_low, "', closeT = '",_closeT,
        "', volume = '",_volume, "', closeTime = '",_closeTime, "', qav = '",_qav, "', nTrades = '",_nTrades, "', tbbav = '",_tbbav, "', tbqav = '",_tbqav, "', ign = '",_ign,"';");
	SET @setQuery = CONCAT(@val01, @val02, @val03);
	PREPARE stmt FROM @setQuery;
	EXECUTE stmt;
END
$$
delimiter ;






