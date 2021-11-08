import json
import datetime

class bncKline:
    def __init__(self, symbol, interval, openTime, openTimeH, openT, high, low, closeT, volume, closeTime, closeTimeH, qav, nTrades, tbbav, tbqav):
        self.symbol = symbol
        self.interval = interval
        self.openTime = openTime #Open time
        self.openTimeH = openTimeH
        self.openT = openT
        self.high = high
        self.low = low
        self.closeT = closeT
        self.volume = volume
        self.closeTime = closeTime
        self.closeTimeH = closeTimeH       
        self.qav = qav # Quote asset volume
        self.nTrades = nTrades #Number of trades
        self.tbbav = tbbav # Taker buy base asset volume
        self.tbqav = tbqav # Taker buy quote asset volume


