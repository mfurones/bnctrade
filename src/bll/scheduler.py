import src.dal.bncApi as bncApi
import src.dal.mapperdbcnx as mapperdbcnx

class scheduler:
    def __init__(self):
        self.bncApi = bncApi.bncApi()
        self.mapperdbcnx = mapperdbcnx.mapperdbcnx()
    def run(self):
        ## Get all profiles
        _prof = self.mapperdbcnx.mGetProfiles()
        for sy in _prof['symbol'].unique():
            ## Filter by symbol
            _df1 = _prof.query("symbol==@sy")
            for i in _df1['interv'].unique():
                ## Get Klines by symbol
                self.klines = self.bncApi.getKline(symbol=sy, interval=i,limit=50)
                ## Filter by symbol & interv
                _df2 = _prof.query("symbol==@sy" and "interv==@i")

                for st in _df2['strategy'].unique():
                    ## Filter by symbol & interv & strategy
                    _df3 = _prof.query("symbol==@sy" and "interv==@i" and "strategy==@st")

                    ### Ejecutar la estrategia
       




        