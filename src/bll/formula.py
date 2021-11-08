import pandas as pd

class formula:


    def setBollinger(self, df):
        # Calc SMA (Simple Moving Average)
        df['SMA'] = df['ClosePrice'].rolling(window=20).mean()
        # Calc STD (Standard Deviation)
        df['STD'] = df['ClosePrice'].rolling(window=20).std()
        # Calculate Upper Bollinger band
        df['bbUp'] = df['SMA'] + (2 * df['STD'])
        # Calculate Lower Bollinger band
        df['bbLow'] = df['SMA'] - (2 * df['STD'])


