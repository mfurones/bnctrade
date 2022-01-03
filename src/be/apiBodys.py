from pydantic import BaseModel
from typing import Optional

class syintst(BaseModel):
    symbol: str
    interv: str
    strategy: str


class prof(BaseModel):
    id: int
    strategy: str
    symbol: str
    interv: str
    tradeenable: Optional[bool] = None
    invertcycles: Optional[int] = None
    invertmoney: Optional[float] = None
    user_id: Optional[int] = None
    user: Optional[str] = None
    email: Optional[str] = None
    uenable: Optional[bool] = None

    def __init__(self, syintst: syintst = None, **kargs) -> None:
        if syintst:
            super().__init__(symbol=syintst.symbol, interv=syintst.interv, strategy=syintst.strategy, **kargs)
        else:
            super().__init__(**kargs )