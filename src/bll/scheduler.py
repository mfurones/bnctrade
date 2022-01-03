
from src.be.environments import srvStrategies
from src.be.apiBodys import syintst
from src.dal.bncApi import bncApi
from src.dal.mapperdbcnx import mapperdbcnx
import requests

class scheduler:
    def __init__(self, objService: srvStrategies):
        self.bncApi = bncApi()
        self.mapperdbcnx = mapperdbcnx()
        self.strategicURL = "http://{}:{}/strategies".format(objService.service, objService.port)
    def run(self):
        ## Get all profiles
        _prof = self.mapperdbcnx.mGetProfiles()
        print(_prof)
        for index, data in _prof.groupby(["symbol", "interv", "strategy"]):
            _param = syintst(symbol=index[0], interv=index[1], strategy=index[2])
            _header = {"Content-Type": "application/json"}
            _url = "{}/{}".format(self.strategicURL, index[2])
            try:
                _rr = requests.request(method="POST", url=_url, json=_param.dict(), headers=_header)
            except:
                print("Failed calling {}".format(_url))

            








