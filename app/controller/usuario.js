let sql = require('../middleware/usuario');


async function mostrarUsuarios(req, res) {
  //let tabla = { tabla: 'usuario' };
  let tabla = 'usuario';
  let responder = await sql.mostrarTodo(tabla);
  res.status(200);
  res.json(responder);
}
async function mostrarUsuariosEspecifico(req, res) {
  let tabla = 'usuario';//req.body.id };
  let datos = { id: 1 };
  let responder = await sql.buscarEspecifico(tabla, datos);
  res.status(200);
  res.json(responder);
}
module.exports = { mostrarUsuarios, mostrarUsuariosEspecifico };