const express = require('express');
const usuario = require('../controller/usuario.controllers');

let ruta = express.Router();

ruta.get('/usuario', usuario.buscarUsuarios);

module.exports = ruta;