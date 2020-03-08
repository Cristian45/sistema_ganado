from flask import Flask,render_template, request
from conexion import ConexionData
import json

app = Flask(__name__)


@app.route("/listar")
def listar_datos():
    con = ConexionData()
    con.conectar_base()
    return json.dumps(con.retornar_animales())
    #return "Revisar la terminal"

@app.route("/listar/ubicacion")
def listar_ubicaciones():
    con = ConexionData()
    con.conectar_base()
    return json.dumps(con.retornar_ubicacion())
    #return "Revisar la terminal"

@app.route("/listar/cantidad")
def listar_cantidad():
    con = ConexionData()
    con.conectar_base()
    return json.dumps(con.retornar_cantidad())


@app.route("/insertar",methods=['POST'])
def insertar_datos():
    _id = request.form['id']
    _nombre = request.form['nombre']
    _acudiente = request.form['tipo']
    _zona = request.form['zona']
    con = ConexionData()
    con.conectar_base()
    con.insertar_datos(_id,_nombre,_acudiente,_zona)
    return "Datos recibidos"+_acudiente


@app.route("/")
def main():
    return "Saludos desde la aplicacion de Ganado!"
    	
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
