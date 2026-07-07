# Dockerfile
FROM node:24-slim

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos al contenedor
COPY package*.json ./
COPY index.js .

# Copiar tests y la "base de datos" JSON (requerido para correr los tests dentro de la imagen)
COPY tests ./tests
COPY users.json .

# Instalar dependencias (incluye devDependencies: jest y supertest)
RUN npm ci

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]