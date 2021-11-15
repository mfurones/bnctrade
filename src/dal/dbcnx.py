import mysql.connector
from mysql.connector import Error
import src.be.credential as credential

class msqlCNX:
    def __init__(self):
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


    def spSet(self):
        _cursor = self.cnx.cursor()


        _cursor.close()
        self.cnx.close()

    def spGet(self):
        _cursor = self.cnx.cursor()


        _cursor.close()
        self.cnx.close()

