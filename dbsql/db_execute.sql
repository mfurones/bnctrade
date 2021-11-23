

#### CRUD USERS

CALL sp_CRUD_users_create('users', 'mfurones02', 'mfurones@gmail.com', TRUE);
CALL sp_CRUD_users_selectAll('users');
CALL sp_CRUD_users_selectById('users', 1001);
CALL sp_CRUD_users_update('users', 1002, 'furonet', 'mf@gmail.com', False);


#### CRUD Profiles

CALL sp_CRUD_profile_create('profiles', 'bollinger', 'BTCUSDT', '15m', TRUE, 2, 15, 1001);
CALL sp_CRUD_profile_selectAll('profiles');
CALL sp_CRUD_users_selectById('profiles', 10001);
CALL sp_CRUD_users_update('profiles', 10001, '3bar', 'BTCUSDT', '1h', FALSE, 2, 20, 1001);








