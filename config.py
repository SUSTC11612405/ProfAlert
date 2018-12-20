import os

DEBUG = True

DIALECT = 'mysql'
DRIVER = 'pymysql'
USERNAME = 'root'
PASSWORD = 'ltz66666'
HOST = '127.0.0.1'
PORT = '3306'
DATABASE = 'prof_alert'

SQLALCHEMY_DATABASE_URI = "mysql+pymysql://{}:{}@{}:{}/{}?charset=utf8".format(USERNAME, PASSWORD,
                                                                     HOST, PORT, DATABASE)
SECRET_KEY = os.urandom(24)
SQLALCHEMY_TRACK_MODIFICATIONS = False