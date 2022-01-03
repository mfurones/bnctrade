from src.be.apiBodys import prof
from src.dal.bncApi import bncApi
from src.dal.mapperdbcnx import mapperdbcnx

class orders:
    def __init__(self) -> None:
        self.bncApi = bncApi()
        self.mapperdbcnx = mapperdbcnx()


    def longBuy(self, prof: prof):
        _prof = self.mapperdbcnx.mGetProfileId(prof)


    def longSell(self):
        pass

    def shortBuy(self):
        pass


    def shortSell(self):
        pass
    