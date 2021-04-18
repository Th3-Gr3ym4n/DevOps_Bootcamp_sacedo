# Voy a ir indicando los pasos hechos para crear el ejercicio 1
# Creo la red lemoncode-challenge 
docker network create lemoncode-challenge

#Creo el contenedor mongo dentro de la red lemoncode-challenge y #Añado la capa de persistencia en /data/db
docker run -d --name mymongo -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret123 --network lemoncode-challenge --mount source=data,target=/data/db mongo

# Hago un volumen data inspect y un network inspect lemoncode-challenge
docker volume inspect data
docker network inspect lemoncode-challenge --format '{{json .Containers}}' | jq

# Creo la imagen para el backend con .NET core (using docker build command or thus VSCode Docker Extension)
cd lemoncode-challenge/backend/backend
docker build --tag:devopsbootcampsacedo

# Creo la imagen para el frontend con node:latest (using docker build command or thus VSCode Docker Extension)
cd lemoncode-challenge/frontend
docker build --tag:frontend

# Revisamos las imágenes creadas
docker image ls

#Creamos el contenedor backend dotnet apuntando al contenedor mongodb dentro de la red lemoncode-challenge

docker run -it --name dotnetcontainer --network lemoncode-challenge -e MONGO_URI=mymongo:27017 -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret123 -p 5000:5000 devopsbootcampsacedo

# Creamos el contenedor frontend node dentro de la red de lemoncode-challenge

docker run --name front-node --network lemoncode-challenge -p4000:3000 frontend
