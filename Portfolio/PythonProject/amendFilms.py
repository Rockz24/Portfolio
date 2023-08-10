from connect import *

#subroutine function
def update():
    # use the filmID(primary key) to select and update a record in DB table
    idField = input("Enter filmID of the record to be updated: ")

    # fieldName: we want to find the field we want to update, set the field/column(Title or Artist or Genre etc) to be updated
    fieldName = input("Enter the title or yearReleased or rating or duration or genre as a field name: ") # use .title() to convert the first character of each word into a capital, to match with the name of the collumn.

    # fieldValue: we want to find the field we want to update, set the field/value(Title or Artist or Genre etc) to be updated
    fieldValue = input(f"Enter the value for {fieldName} field: ")

    fieldValue = "'" +fieldValue+ "'" # add single quote one either side of the value when when amending our records because that is how it is stored in the database

    #Update the records in films table
    " UPDATE songs SET title/yearReleased/rating/duration/genre = titleValue/yearReleasedValue/ratingValue/durationValue/genreValue WHERE filmID = 1/2/3/4/5...."
    dbCursor.execute(f"UPDATE tblFilms SET {fieldName} = {fieldValue} WHERE filmID = {idField}")
    dbCon.commit() # to make the changes permanent

    print(f"Record {idField} updated into films table")
if __name__ =="__main__":
    update()


    