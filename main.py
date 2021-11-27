# %%
from binance.spot import Spot
import datetime
import json
import os
import src.be.credential as credential
import src.dal.bncApi as bncApi
import src.dal.dbcnx as mysqlCNX
import src.bll.formula as formula
import pandas as pd
import numpy as np

# Parameters

#%%

_ba = bncApi.bncApi()

_dsKline = _ba.getKline(symbol='BNBUSDT', interval='30m',limit=500)

f = formula.formula()

f.setBollinger(_dsKline)


#### como Plotear!

# %% 

file_name = "backtest01.csv"
_dsKline.to_csv (file_name, index = False, header=True)


# %%




