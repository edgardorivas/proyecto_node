let sql = require('../middleware/usuario');


async function mostrarUsuarios(req, res) {
  let responder = await sql.mostrarTodo('usuario');
  res.status(200);
  res.json(responder);
}
module.exports = { mostrarUsuarios };