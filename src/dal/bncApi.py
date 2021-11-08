from binance.spot import Spot
import src.be.credential as credential
import src.be.statistic as statistic
import pandas as pd
import numpy as np

class bncApi:
    def __init__(self):
        _cred = credential.bncCred()
        self.client = Spot(key=_cred.apiKey, secret=_cred.secret)

    def getKline(self, symbol, interval, startTime=None, endTime=None, limit=1):
        _kl = self.client.klines(symbol=symbol, interval=interval, limit=limit, startTime=startTime, endTime=endTime)
        _klnp = np.array(_kl)
        # Define colums & types
        cols = ['OpenTime', 'OpenPrice', 'High', 'Low', 'ClosePrice', 'Volume', 'CloseTime', 'QAV', 'trades', 'TBBAV', 'TBQAV', 'Ignore']
        types = ['int64', 'float64', 'float64', 'float64', 'float64', 'float64', 'int64', 'float64', 'float64', 'float64', 'float64', 'int64']
        # Create dataframe
        _df = pd.DataFrame(_klnp.reshape(-1,12), columns = cols )
        # Rename columns & types
        for i in range(len(cols)):
            _df[cols[i]] = _df[cols[i]].astype(types[i])
        # Add datetime columns
        _df['OpenTimeH'] = pd.to_datetime(_df['OpenTime'], unit='ms')
        _df['CloseTimeH'] = pd.to_datetime(_df['CloseTime'], unit='ms')
        return _df




    
