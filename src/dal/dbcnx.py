import mysql.connector
from mysql.connector import Error
from mysql.connector import FieldType
import pandas as pd
import src.be.credential as credential

class msqlCNX:
    def __init__(self):
        ### Params
        self.dataTypeMap = {'VAR_STRING':'object',
            'DOUBLE':'int64',
            'LONG': 'int64',
            'DATETIME':'datetime64',
            'FLOAT':'float64',
            'TINY':'bool'
        }

        ### Connection
        _cred = credential.mysqlCred()
        _config = {
            'user': _cred.usr,
            'password': _cred.passw,
            'host': _cred.host,
            'database': _cred.db,
            'raise_on_warnings': True
        }
        try:
            self.cnx = mysql.connector.connect(**_config)
            if self.cnx.is_connected():
                self.cnx.close()
        except Error as e:
            print("Error while connecting to MySQL:", e)


    def spSet(self, sp, params):
        if not self.cnx.is_connected():
            self.cnx.reconnect(attempts=2, delay=0.1)
        _cursor = self.cnx.cursor()
        _cursor.callproc(sp, params)
        self.cnx.commit()
        for result in _cursor.stored_results():
            print(result.fetchall())
        _cursor.close()
        self.cnx.close()

    def spGet(self, sp, params):
        if not self.cnx.is_connected():
            self.cnx.reconnect(attempts=2, delay=0.1)
        _cursor = self.cnx.cursor()
        _cursor.callproc(sp, params)
        print(_cursor.stored_results())
        for result in _cursor.stored_results():
            _r = result.fetchall()
            # print([FieldType.get_info(i[1]) for i in result.description])
            _df = pd.DataFrame(_r, columns=[i[0] for i in result.description])
            _df = _df.astype(dict(zip([i[0] for i in result.description], [self.dataTypeMap[FieldType.get_info(i[1])] for i in result.description])))
        _cursor.close()
        self.cnx.close()
        return _df
