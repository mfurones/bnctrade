from binance.spot import Spot
import src.be.credential as credential
from src.be.apiBodys import syintst
import pandas as pd
import numpy as np
from datetime import datetime

class bncApi:
    def __init__(self):
        _cred = credential.bncCred()
        self.client = Spot(key=_cred.apiKey, secret=_cred.secret)

    def getTime(self):
        return {
            "time": datetime.fromtimestamp(int(self.client.time()["serverTime"])/1000.0).strftime("%Y-%m-%d %H:%M:%S")
        }

    def getKline(self, syintst: syintst, startTime=None, endTime=None, limit=1, filled=False):
        _kl = self.client.klines(symbol=syintst.symbol, interval=syintst.interv, limit=limit, startTime=startTime, endTime=endTime)
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


    def createTradeOrder(self, symbol, side, quantity ):
        return self.client.new_order(symbol=symbol, type='MARKET', side=side, quantity=quantity )

    def createTradeOrderDryRun(self, symbol, side, quantity ):
        _time = self.client.time()['serverTime']
        _price = self.client.ticker_price(symbol=symbol)['price']
        _cummulativeQuoteQty = float(_price) * float(quantity)
        _toDryRun = {
            "symbol": symbol,
            "orderId": -1,
            "orderListId": -1,
            "clientOrderId": "dryRunOrder",
            "transactTime": _time,
            "price": "0.00000000",
            "origQty": str(quantity),
            "executedQty": str(quantity),
            "cummulativeQuoteQty": str(_cummulativeQuoteQty),
            "status": "FILLED",
            "timeInForce": "GTC",
            "type": "MARKET",
            "side": side,
            "fills": [
                {
                    "price": _price,
                    "qty": str(quantity),
                    "commission": str(quantity * 0.000075), # %0.075
                    "commissionAsset": symbol[0:-4], # Remove USDT
                    "tradeId": -1
                }
            ]
        }
        return _toDryRun









    
