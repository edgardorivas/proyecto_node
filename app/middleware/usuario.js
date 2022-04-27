const sql = require('../database/conexion.database');

async function mostrarTodo(tabla) {
  try {
    let consulta = 'SELECT * FROM ??';
    let respu = await sql.query(consulta, tabla);
    return respu;
  } catch (error) {
    console.log('error');
  }
}
async function buscarEspecifico(tabla, datos) {
  try {
    let consulta = 'SELECT * FROM ' + tabla + ' where ?';
    let respuesta = await sql.query(consulta, datos);
    return respuesta;
  } catch (error) {
    console.log(error);
  }
}

module.exports = { mostrarTodo, buscarEspecifico };