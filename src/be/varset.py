

class varbnc:
    def __init__(self) -> None:
        self.bncTimeMapper =  {
            "1m": 60,
            "3m": 180,
            "5m": 300,
            "15m": 900,
            "30m": 1800,
            "1H": 3600,
            "2H": 7200,
            "4H": 14400,
            "6H": 21600,
            "8H": 28800,
            "12H": 43200,
            "1D": 86400,
            "3D": 259200,
            "1W": 604800
        }

    def bncTimeToInt(self, time: str):
        return self.bncTimeMapper.get(time, -1)

