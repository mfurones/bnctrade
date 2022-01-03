import requests

from src.be.environments import srvOrders
from src.be.apiBodys import syintst, prof
from src.dal.mapperdbcnx import mapperdbcnx
from src.dal.bncApi import bncApi



class strategies:
    def __init__(self):
        self.mapperdbcnx = mapperdbcnx()
        self.bncApi = bncApi()
        self.srvOrders = srvOrders()
        self.ordersURL = "http://{}:{}/orders".format(self.srvOrders.service, self.srvOrders.port)


    def bollinger01(self, syintst:syintst):
        print("entre en bollinger")
        print(syintst)
        print(self.bncApi.getTime())

        _dfKline = self.bncApi.getKline(syintst=syintst,limit=20)

        #####
        #
        #
        #  Se genera la estrategia
        #
        #
        #####


        _ackLongBuy = False
        _ackLongSell = False

        ### Execute Buy
        if _ackLongBuy:
            # Get profiles availables with syintst
            _prof = self.mapperdbcnx.mGetProfilesToBuy(syintst)
            for index, data in _prof:
                _param = prof(syintst=syintst, id=data.id)
                _header = {"Content-Type": "application/json"}
                _url = "{}/buylong".format(self.ordersURL)
                try:
                    _rr = requests.request(method="POST", url=_url, json=_param.dict(), headers=_header)
                except:
                    print("Failed calling {}".format(self.ordersURL))
                
        ### Execute Buy
        if _ackLongSell:
            pass




    def lw3bars01(self, syintst:syintst):
        print("Soy Larry Willams")



