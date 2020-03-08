from flask import Flask,render_template, request,jsonify
from flask_restful import Resource, Api
from conexion import ConexionData
import json

from flask_cors import CORS

app = Flask(__name__)
api = Api(app)
CORS(app)

@app.route("/listar", methods =['GET'])
def listar_datos():
    con = ConexionData()
    con.conectar_base()
    return con.retornar_animales()
    #return "Revisar la terminal"

@app.route("/listar/ubicacion")
def listar_ubicaciones():
    con = ConexionData()
    con.conectar_base()
    return con.retornar_ubicacion()
    #return "Revisar la terminal"

@app.route("/listar/cantidad")
def listar_cantidad():
    con = ConexionData()
    con.conectar_base()
    return con.retornar_cantidad()


@app.route("/insertar",methods=['POST'])
def insertar_datos():
    _id = request.form['id']
    _nombre = request.form['nombre']
    _acudiente = request.form['tipo']
    _zona = request.form['ubicacion']
    con = ConexionData()
    con.conectar_base()
    con.insertar_datos(_id,_nombre,_acudiente,_zona)
    return "Datos recibidos"+_nombre


@app.route("/")
def main():
    return "Saludos desde la aplicacion de Ganado!"
    	
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
    
