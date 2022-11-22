"""
2022-11-22
All methods related to Database are listed here
"""

import sqlite3

DATABASE = "database.db"

def selectAll(tableName):

    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute(f"SELECT * from {tableName}")
    result = cursor.fetchall();
    conn.commit()
    conn.close()

    return result

#data is passed as a dictionary
def insertFuelEntry():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute(f"INSERT INTO refuelEntries (refuelDate, refuelMileage, refuelQty, refuelType, refuelUnitPrice, refuelAmount, fuelType_idfuelType, Vehicle_idVehicle, Units_idUnits) VALUES ()")
