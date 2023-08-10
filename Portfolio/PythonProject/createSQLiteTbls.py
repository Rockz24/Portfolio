from connect import * # import the connect.py module 
#this file is creating all the tables in our database
# execute module uses the cursor module linked to dbCursor variable in order to generate our tables. When executing tables in python we need to use strings.
dbCursor.execute(""" 
CREATE TABLE "tblfilms" (
	"filmID"	INTEGER,
	"title"	TEXT,
	"yearReleased"	INTEGER,
	"rating"	TEXT,
    "duration"   INTEGER,
    "genre" TEXT,
	PRIMARY KEY("filmID" AUTOINCREMENT)
)""")
