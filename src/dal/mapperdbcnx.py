import src.dal.dbcnx as dbcnx


class mapperdbcnx:
    def __init__(self):
        self.dbcnx = dbcnx.msqlCNX()

    def mGetProfiles(self):
        return self.dbcnx.spGet('sp_CRUD_profiles_selectByProdIjUsersEnable', ['profiles', 'users'])


