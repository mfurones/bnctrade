import os

class srvStrategies:
    def __init__(self):
        self.service = os.getenv('ENV_SERVICE')
        self.port = int(os.getenv('ENV_PORT'))

class srvOrders:
    def __init__(self):
        self.service = os.getenv('ENV_SERVICE')
        self.port = int(os.getenv('ENV_PORT'))


