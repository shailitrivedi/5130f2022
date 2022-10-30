from flask import Flask, request,jsonify
from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = 'mysql+pymysql://shailitrivedi:toor0073@shailitrivedi.mysql.pythonanywhere-services.com/shailitrivedi$iws'
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)
CORS(app)


class User(db.Model):
    _tablename_="user"
#Basic Information
    id = db.Column(db.Integer, primary_key=True)
    fname = db.Column(db.String(50), nullable=True)
    lname = db.Column(db.String(50), nullable=True)
    personal_email = db.Column(db.String(50), nullable=True)
    con_num = db.Column(db.Numeric(50), nullable=True)
    dob = db.Column(db.DateTime, nullable=True)
    gender = db.Column(db.String(50), nullable=True)
    curr_location = db.Column(db.String(50), nullable=True)
    pic = db.Column(db.String(50), nullable=True)
    cv = db.Column(db.String(50), nullable=True)

#More Facts
    sname = db.Column(db.String(50), nullable=True)
    dreamplace = db.Column(db.String(50), nullable=True)
    fun1 = db.Column(db.String(50), nullable=True)



@app.route("/")
def index():
    return "OK Google"



@app.route("/ad",methods=["POST"])
def Store():
    user=User(fname=request.json.get("fname"),
                lname=request.json.get("lname"),
                personal_email=request.json.get("personal_email"),
                con_num=request.json.get("con_num"),
                dob=request.json.get("dob"),
                gender=request.json.get("gender"),
                curr_location=request.json.get("curr_location"),
                sname=request.json.get("sname"),
                dreamplace=request.json.get("dreamplace"),
                fun1=request.json.get("fun1"))
    db.session.add(user)
    db.session.commit()

    return jsonify({"status":True, "message":"Data Saved!"}),200



if __name__ == "__main__":
    app.config["DEBUG"] = True
    app.run()