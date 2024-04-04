FROM ubuntu:latest

# Actualizar e instalar las herramientas necesarias
RUN apt-get update \
    && apt-get install -y nodejs npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copiar el contenido de la aplicación a la raíz del contenedor
COPY . .

# Instalar las dependencias de la aplicación
RUN npm install

# Ejecutar la aplicación directamente
CMD ["node", "app.js"]
