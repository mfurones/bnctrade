

#### CRUD users

CALL sp_CRUD_users_create('users', 'mfurones02', 'mfurones@gmail.com', TRUE);
CALL sp_CRUD_users_selectAll('users');
CALL sp_CRUD_users_selectById('users', 1001);
CALL sp_CRUD_users_update('users', 1002, 'furonet', 'mf@gmail.com', False);


#### CRUD profiles

CALL sp_CRUD_profile_create('profiles', 'bollinger', 'BTCUSDT', '15m', TRUE, 2, 15, 1001);
CALL sp_CRUD_profile_selectAll('profiles');
CALL sp_CRUD_profiles_selectById('profiles', 10001);
CALL sp_CRUD_profiles_update('profiles', 10001, '3bar', 'BTCUSDT', '1h', FALSE, 2, 20, 1001);
CALL sp_CRUD_profiles_selectByProdIjUsersEnable('profiles', 'users');

#### CRUD tradeordersbuy

CALL sp_CRUD_tradeordersbuy_create('tradeordersbuy', 'BTCUSDT', '15m', 1637721249372, '2021-11-24 16:03:50', 11111, 8379269410, 0.00024, 13.5960, 56650, 10002 );
CALL sp_CRUD_tradeordersbuy_create('tradeordersbuy', 'ETHUSDT', '1h', 1637721249372, '2021-11-24 16:03:50', 11111, 8379269410, 0.00024, 13.5960, 56650, 10002 );
CALL sp_CRUD_tradeordersbuy_update('tradeordersbuy', 2, 8386268799);
CALL sp_CRUD_tradeordersbuy_selectBySymbolInterv('tradeordersbuy', 'BTCUSDT', '15m');
CALL sp_CRUD_tradeordersbuy_selectBySymbolIntervNoSells('tradeordersbuy', 'BTCUSDT', '15m');
CALL sp_CRUD_tradeordersbuy_selectById('tradeordersbuy', 3);
CALL sp_CRUD_tradeorderssell_create('tradeorderssell', 'BTCUSDT', '15m', 1637769089734, '2021-11-24 15:51:30', 11111, 8386268799, 0.00024, 13.6651, 56937.79, 8386430197, 10002 );
CALL sp_CRUD_tradeorderssell_create('tradeorderssell', 'ETHUSDT', '1h', 1637769089734, '2021-11-24 15:51:30', 11111, 8386268799, 0.00024, 13.6651, 56937.79, 8386430197, 10002 );









