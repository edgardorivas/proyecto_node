const conn = require('../database/conexion.database');

function buscarTodo(tabla) {
  return new Promise(async (resolver, reject) => {
    let sql = 'SELECT * FROM ?;';
    await conn.query(sql, tabla).then((resultado) => {
      return resolver(results);
    }).catch((err) => {
      console.error("[DB]", err);
      return reject({ message: err, code: 401 });
    })
  })
}
module.exports = { buscarTodo };