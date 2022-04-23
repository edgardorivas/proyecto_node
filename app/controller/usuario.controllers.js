const consultas = require('../middleware/consultas.middleware');

function buscarUsuarios() {
  async (req, res) => {
    let tabla = 'usuario';
    let valor = await consultas.buscarTodo(tabla);
    res.send(valor);
  }
}
module.exports = { buscarUsuarios };