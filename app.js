// Importar el módulo express
const express = require('express');

// Crear una instancia de express
const app = express();

// Definir una ruta para el mensaje "Hola Mundo"
app.get('/', (req, res) => {
  res.send('Microservicio de Ventas');
});

// Iniciar el servidor en el puerto 3000
const PORT = process.env.PORT || 3000;
const server = app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`);
});

// Mantener la aplicación en ejecución indefinidamente
process.on('SIGINT', function() {
  console.log("Deteniendo servidor");
  server.close(() => {
    console.log("Servidor detenido");
    process.exit(0);
  });
});
