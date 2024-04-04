FROM alpine:latest

RUN apk --no-cache add nodejs npm

WORKDIR /app

COPY . .

# Cambiar al directorio de trabajo antes de ejecutar los comandos npm
RUN cd /app && npm install

# Asegurar que npm start se ejecute en el directorio de trabajo correcto
CMD ["sh", "-c", "cd /app && npm start"]
