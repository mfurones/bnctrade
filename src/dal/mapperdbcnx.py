from src.dal.dbcnx import msqlCNX
from src.be.apiBodys import syintst, prof


class mapperdbcnx:
    def __init__(self):
        self.dbcnx = msqlCNX()

    ### Profiles
    def mGetProfiles(self):
        return self.dbcnx.spGet('sp_CRUD_profiles_selectByProdIjUsersEnable', ['profiles', 'users'])
        # Output: id, strategy, symbol, interv, tradeenable, invertcycles, invertmoney, user_id, user, email, uenable

    def mGetProfileId(self, prof: prof):
        return self.dbcnx.spGet('sp_CRUD_profiles_selectByProdIjUsersEnable', ['profiles', 'users', prof.id])
        # Output: id, strategy, symbol, interv, tradeenable, invertcycles, invertmoney, user_id, user, email, uenable

    def mGetProfilesToBuy(self, syintst:syintst):
        return self.dbcnx.spGet('sp_CRUD_profiles_selectEnablesBuy', ['profiles', 'users', syintst.symbol, syintst.interv, syintst.strategy])
        # Output: id, strategy, symbol, interv

    ### Orders
    def mGetOpenOrders(self):
        return self.dbcnx.spGet('sp_CRUD_tradeordersbuy_selectBySymbolIntervNoSells', ['tradeordersbuy'])

    def mGetOpenOrdersDryRun(self):
        return self.dbcnx.spGet('sp_CRUD_tradeordersbuy_selectBySymbolIntervNoSells', ['tradeordersbuyDryRun'])
