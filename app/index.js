const express = require('express');
const http = require('http');
const body_parse = require('body-parser');
const usuario = require('./routers/usuario.routers');

let app = express();

app.use(body_parse.json());
app.use(body_parse.urlencoded({ extended: true }));

app.use('/', usuario);

http.createServer(app).listen(8080, () => {
  console.log('servidor arriba');
})