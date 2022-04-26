const consulta = require('../controller/usuario');
const express = require('express');

let ruta = express.Router();

ruta.get('/usuarios', consulta.mostrarUsuarios);

module.exports = ruta;