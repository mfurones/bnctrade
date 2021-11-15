import os

class bncCred:
    def __init__(self):
        self.user = os.getenv('BNCUSER')
        self.apiKey = os.getenv('BNCAPIKEY')
        self.secret = os.getenv('BNCSECRET')

class mysqlCred:
    def __init__(self):
        self.usr = os.getenv('MYSQLUSR')
        self.passw = os.getenv('MYSQLPASSW')
        self.host = os.getenv('MYSQLHOST')
        self.db = os.getenv('MYSQLDB')