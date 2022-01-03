
from src.be.environments import srvStrategies
from src.bll.scheduler import scheduler

def dealer():
    _objService = srvStrategies()
    _scheduler = scheduler(_objService)
    _scheduler.run()



if __name__ == "__main__":
    dealer()