from connect import *

def read():
    dbCursor.execute("SELECT * FROM tblFilms") #select all records
    records = dbCursor.fetchall() # fetches the select records
    for aRecord in records:
        print(aRecord)
if __name__=="__main__":
    read()