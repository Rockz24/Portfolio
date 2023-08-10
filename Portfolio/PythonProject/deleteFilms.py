from connect import * 

#subroutine function
def delete():
    # use the filmID(primary key) to select and delete a record in DB table
    idField = input("Enter filmID of the record to be deleted: ")

    # "DELETE FROM tbleFilms WHERE filmID = 1/2/3/4/5....
    dbCursor.execute(f"DELETE FROM tblFilms WHERE filmID = {idField}")
    dbCon.commit()

    print(f"Record {idField} deleted from songs table")
    dbCon.close #closes the connection
if __name__=="__main__":
    delete()