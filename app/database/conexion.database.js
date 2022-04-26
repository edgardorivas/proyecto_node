const mysql = require('mysql2');
const detalles = require('./datalles.database');
const { promisify } = require('util');

let app = mysql.createConnection(detalles.Database);
app.query = promisify(app.query);
module.exports = app;