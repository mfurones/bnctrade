import os

class bncCred:
    def __init__(self):
        self.user = os.getenv('BNCUSER')
        self.apiKey = os.getenv('BNCAPIKEY')
        self.secret = os.getenv('BNCSECRET')

class mysqlCred:
    def __init__(self, ru, rp, uu, up):
        self.rusr = os.getenv('MYSQLRUSR')
        self.rpass = os.getenv('MYSQLRPASS')
        self.usuer = os.getenv('MYSQLUUSR')
        self.upass = os.getenv('MYSQLUPASS')