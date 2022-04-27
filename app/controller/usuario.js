let sql = require('../middleware/usuario');


async function mostrarUsuarios(req, res) {
  //let tabla = { tabla: 'usuario' };
  let tabla = 'usuario';
  let responder = await sql.mostrarTodo(tabla);
  res.status(200);
  res.json(responder);
}
async function mostrarUsuariosEspecifico(req, res) {
  let tabla = { id: 1 }//req.body.id };
  let responder = await sql.mostrarTodo(tabla);
  res.status(200);
  res.json(responder);
}
module.exports = { mostrarUsuarios, mostrarUsuariosEspecifico };