from flask import Flask, render_template, request, redirect
from dbhelper import selectAll, insertFuelEntry

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/addNew")
def addRecord():

    FUELTYPES = selectAll("fuelType")
    UNITS = selectAll("units")
    VEHICLES = selectAll("vehicle")

    return render_template("addNew.html", fuelTypes=FUELTYPES,units=UNITS,vehicles=VEHICLES)

    # TODO
    # Auto load last fuel price
    # Show Vehicle name
    # Show unit
    # Show Fuel Type

@app.route("/saveRecord", methods=["POST"])
def saveRecord():
    refuelMileage = request.form.get("refuelMileage")
    refuelAmount = request.form.get("refuelAmount")
    refuelType = request.form.get("refuelType")
    refuelDate = request.form.get("refuelDate")
    refuelQty = request.form.get("refuelQty")
    refuelUnitPrice = request.form.get("refuelUnitPrice")
    fuelType_idfuelType = request.form.get("fuelType_idfuelType")
    Vehicle_idVehicle = request.form.get("Vehicle_idVehicle")
    Units_idUnits = request.form.get("Units_idUnits")

    refuelRecord = {
        "refuelMileage":refuelMileage, 
        "refuelAmount":refuelAmount,
        "refuelType":refuelType,
        "refuelDate":refuelDate,
        "refuelQty":refuelQty,
        "refuelUnitPrice":refuelUnitPrice,
        "fuelType_idfuelType":fuelType_idfuelType,
        "Vehicle_idVehicle":Vehicle_idVehicle,
        "Units_idUnits":Units_idUnits
    }

    # print(refuelRecord)
    # print(f"INSERT INTO refuelEntries (refuelDate, refuelMileage, refuelQty, refuelType, refuelUnitPrice, refuelAmount, fuelType_idfuelType, Vehicle_idVehicle, Units_idUnits) VALUES ('{refuelRecord['refuelDate']}','{refuelRecord['refuelMileage']}','{refuelRecord['refuelQty']}','{refuelRecord['refuelType']}','{refuelRecord['refuelUnitPrice']}','{refuelRecord['refuelAmount']}','{refuelRecord['fuelType_idfuelType']}','{refuelRecord['Vehicle_idVehicle']}','{refuelRecord['Units_idUnits']}')")
    
    insertFuelEntry(refuelRecord)

    return redirect("/listRecords")

@app.route("/listRecords")
def listRecords():
    RECORDS = selectAll("refuelEntries")
    return render_template("listRecords.html", records=RECORDS)