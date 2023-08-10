import sqlite3 #import sqllite3 built in module 

# use the connectMethod/function that belongs to the sqlite3 module
dbCon = sqlite3.connect("Portfolio/PythonProject/filmflix.db") #create a dbFile or open an existing dbFile

# create a cursor object to perform sql queries/commands. Does the translation for us, any time we want to write a code, any time we want to run a select statement, or anything in the database we do this
# Python will not recognise SELECT * FROM files; etc, so we use cursor.
dbCursor = dbCon.cursor() # we can use dbCursor whenever we want as it will connect to the database
