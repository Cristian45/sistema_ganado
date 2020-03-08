
# crear contenedor de base de datos

docker run --name sds-postgres -e POSTGRES_PASSWORD=sds -e POSTGRES_USER=sds -e POSTGRES_DB=sds -d -p 5432:5432 postgres
