const consulta = require('../controller/usuario');
const express = require('express');

let ruta = express.Router();

ruta.get('/usuarios', consulta.mostrarUsuarios);
ruta.get('/usuarios/especifico', consulta.mostrarUsuariosEspecifico);


module.exports = ruta;