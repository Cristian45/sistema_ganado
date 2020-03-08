
import psycopg2
import json

class ConexionData:

    conexion = ''

    def conectar_base(self):
        try:
            credenciales = {
                "dbname": "sds",
                #"user": "sds",
                "user": "postgres",
                #"password": "sds",
                "password": "postgres",
                "host": "localhost",				
                "port": 5432
            }
            self.conexion = psycopg2.connect(**credenciales)
            if self.conexion :
                print('it works')
        except psycopg2.Error as e:
            print("Ocurrió un error al conectar a PostgreSQL: ", e)
    
    def insertar_datos(self,id,nombre,tipo,zona):
        try:
            print('Listo para insertar datos')
            with self.conexion.cursor() as cursor:
                consulta = "INSERT INTO ANIMALES(ANI_ID,NOMBRE,TIPO) VALUES (%s,%s, %s);"                
                cursor.execute(consulta, (id,nombre, tipo))      
                consulta = "INSERT INTO public.ubicacion_animal(ANI_ID,UBI_ID,CANTIDAD) VALUES (%s,%s, %s);"                
                cursor.execute(consulta, (id,zona, 2))               
                           
            self.conexion.commit()  # Si no haces commit, los cambios no se guardan            

        except psycopg2.Error as e:
            print("Ocurrió un error al insertar: ", e)

    def retornar_animales(self):
        try:
            data = []
            print('Listo para mostrar datos')
            with self.conexion.cursor() as cursor:
                query = " SELECT ANI_ID||'',NOMBRE,TIPO FROM ANIMALES;"            
                cursor.execute(query)               
                estudiantes = cursor.fetchall()                            
            self.conexion.close()
            return (json.dumps(estudiantes))  
        except psycopg2.Error as e:
            print("Ocurrió un error al retornar: ", e)

    def retornar_ubicacion(self):
        try:
            data = []
            print('Listo para mostrar datos')
            with self.conexion.cursor() as cursor:
                query = " SELECT UBI_ID||'',LATITUD||'',LONGITUD||'',TIPO FROM UBICACION;"            
                cursor.execute(query)               
                estudiantes = cursor.fetchall()                
            self.conexion.close()
            return (json.dumps(estudiantes))
        except psycopg2.Error as e:
            print("Ocurrió un error al retornar: ", e)


    def retornar_cantidad(self):
        try:         
            print('Listo para mostrar datos')
            with self.conexion.cursor() as cursor:
                query = " SELECT UBI.TIPO,COUNT(*) FROM UBICACION_ANIMAL UBI_ANI JOIN UBICACION UBI ON UBI_ANI.UBI_ID = UBI.UBI_ID GROUP BY UBI.TIPO;"            
                cursor.execute(query)               
                estudiantes = cursor.fetchall()                
            self.conexion.close()
            return (json.dumps(estudiantes))
        except psycopg2.Error as e:
            print("Ocurrió un error al retornar: ", e)


    


   


