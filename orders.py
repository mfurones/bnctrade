import uvicorn
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from src.be.apiBodys import syintst, prof
from src.be.environments import srvOrders
from src.bll.orders import orders

_srvOrders = srvOrders()
_orders = orders()

ord = FastAPI()

@ord.get("/ping")
async def root_ping():
    return JSONResponse(status_code=200, content={"message": "pong"})

@ord.post("/orders/buylong")
async def execute_buylong(prof: prof):
    _orders.longBuy(prof)
    return JSONResponse(status_code=200, content={"message": "Buy Long was executed!"})

@ord.post("/orders/selllong")
async def execute_selllong(syintst: syintst):
    print(syintst)
    return JSONResponse(status_code=200, content={"message": "Sell Long was executed!"})

@ord.post("/orders/{id_st}")
async def root_orders(id_st: str, syintst: syintst):
    return JSONResponse(status_code=404, content={"message": "Item: <{}> not found".format(id_st)})


if __name__ == "__main__":
    uvicorn.run("orders:ord", host="0.0.0.0", port=_srvOrders.port, reload=True,  debug=True)