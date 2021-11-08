# %%
from binance.spot import Spot
import json
import os
import src.be.credential as credential
import src.dal.bncApi as bncApi
import src.bll.formula as formula
import pandas as pd
import numpy as np

# Parameters

#%%

tt = bncApi.bncApi()

bb = tt.getKline(symbol='BNBUSDT', interval='30m',limit=500)

f = formula.formula()

f.setBollinger(bb)


#### como Plotear!

# %% 

file_name = "backtest01.csv"
bb.to_csv (file_name, index = False, header=True)


# %%
