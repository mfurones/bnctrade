import uvicorn
from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse
from src.be.apiBodys import syintst
from src.bll.strategies import strategies
from src.be.environments import srvStrategies

_srvStrategies = srvStrategies()
strgy = FastAPI()

# @strgy.post("/strategies", response_model=syintst)
# async def read_root(syintst: syintst):
#     print(syintst)
#     return syintst

@strgy.get("/ping")
async def root_ping():
    return JSONResponse(status_code=200, content={"message": "pong"})

@strgy.post("/strategies/bollinger01")
async def execute_bollinger01(syintst: syintst):
    _st = strategies()
    _st.bollinger01(syintst=syintst)
    return JSONResponse(status_code=200, content={"message": "Bollinger was executed!"})

@strgy.post("/strategies/lw3bars01")
async def execute_lw3bars01(syintst: syintst):
    _st = strategies()
    _st.lw3bars01(syintst=syintst)
    return JSONResponse(status_code=200, content={"message": "3 bars was executed!"})

@strgy.post("/strategies/{id_st}")
async def root_strategies(id_st: str, syintst: syintst):
    return JSONResponse(status_code=404, content={"message": "Item: <{}> not found".format(id_st)})






if __name__ == "__main__":
    uvicorn.run("strategies:strgy", host="0.0.0.0", port=_srvStrategies.port, reload=True,  debug=True)