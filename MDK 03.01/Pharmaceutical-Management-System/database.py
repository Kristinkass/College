import pymysql

class database:
    conn=None
    curs=None
    @staticmethod
    def connection():
        #измененнная база, перенесенная на свой ноутбук
        database.conn = pymysql.connect(user='root', password='Cstud161620', database='Man')
        return database.conn
    @staticmethod
    def cursor():
        database.curs=database.conn.cursor()
        return database.curs
    @staticmethod
    def close():
        database.curs.close()
        database.conn.close()
