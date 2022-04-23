const mysql = require('promise-mysql2');
const detalles = require('./datalles.database');
const { promisify } = require('util');

let conn = mysql.createPool(detalles.Database);
conn.getConnection((err) => {
  if (err) {
    console.log(err);
  }
  console.log('todo bien');
})
module.exports = conn;
