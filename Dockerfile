# # Usa una imagen base oficial de Node.js
# FROM node:20-slim

# # Instalar dependencias del sistema necesarias para better-sqlite3
# RUN apt-get update && apt-get install -y \
#     sqlite3 \
#     python3 \
#     make \
#     g++ \
#     && rm -rf /var/lib/apt/lists/*

# # Establecer el directorio de trabajo
# WORKDIR /usr/src/app

# COPY backend/. .

# # Instalar dependencias
# RUN npm install

# RUN npm run build

# RUN cp src/microservices/schema.sql dist/microservices/schema.sql

# # Crear carpeta data si no existe
# RUN mkdir -p /usr/src/app/data

# # Exponer el puerto de la API
# EXPOSE 3000

# ENV NODE_ENV=development

# # Ejecutar el servidor DB
# CMD ["node", "dist/microservices/api/server.js"]

FROM transcendence-base
WORKDIR /usr/src/app
COPY backend/. .
# RUN npm install
# RUN npm run build
RUN cp src/microservices/schema.sql dist/microservices/schema.sql
EXPOSE 3000
ENV NODE_ENV=development
CMD ["node", "dist/microservices/api/server.js"]
