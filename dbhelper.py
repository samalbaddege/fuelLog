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

# data is passed as a dictionary
# add type hinting
def insertFuelEntry(rec: dict):
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute(f"INSERT INTO refuelEntries (refuelDate, refuelMileage, refuelQty, refuelType, refuelUnitPrice, refuelAmount, fuelType_idfuelType, Vehicle_idVehicle, Units_idUnits) VALUES ('{rec['refuelDate']}','{rec['refuelMileage']}','{rec['refuelQty']}','{rec['refuelType']}','{rec['refuelUnitPrice']}','{rec['refuelAmount']}','{rec['fuelType_idfuelType']}','{rec['Vehicle_idVehicle']}','{rec['Units_idUnits']}')")
    conn.commit()
    conn.close()

