from connect import *

def genre():
    genreField = input("Enter the name of the genre to search for: ") # asking the user to search for the input
    dbCursor.execute(f"SELECT * FROM tblFilms WHERE genre = '{genreField}' ") #select all records
    records = dbCursor.fetchall() # fetches the select records
    for aRecord in records:
        print(aRecord)
genre()


def idField():
    filmIDField = input("Enter filmID of the film to search for: ") # asking the user to search for the input
    dbCursor.execute(f"SELECT * FROM tblFilms WHERE genre = '{filmIDField}' ") #select all records
    records = dbCursor.fetchall() # fetches the select records
    for aRecord in records:
        print(aRecord)
idField()


def year():
    yearField = input("Enter the year of the film to search for: ") # asking the user to search for the input
    dbCursor.execute(f"SELECT * FROM tblFilms WHERE yearReleased = '{yearField}' ") #select all records
    records = dbCursor.fetchall() # fetches the select records
    for aRecord in records:
        print(aRecord)
year()

def rating():
    ratingField = input("Enter the rating of the film to search for: ") # asking the user to search for the input
    dbCursor.execute(f"SELECT * FROM tblFilms WHERE rating = '{ratingField}' ") #select all records
    records = dbCursor.fetchall() # fetches the select records
    for aRecord in records:
        print(aRecord)
rating()

