const sql = require('../database/conexion.database');

async function mostrarTodo(tabla) {
  try {
    let consulta = 'SELECT * FROM usuario ';
    let respu = await sql.query(consulta, tabla);
    return respu;
  } catch (error) {
    console.log('error');
  }
}

module.exports = { mostrarTodo };