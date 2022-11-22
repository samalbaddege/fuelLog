from flask import Flask, render_template, request
from dbhelper import selectAll

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/addRecord")
def addRecord():
    return render_template("addRecord.html")


@app.route("/listRecords")
def listRecords():
    RECORDS = selectAll("database.db", "refuelEntries")
    return render_template("listRecords.html", records=RECORDS)