const express = require('express');
const router = express.Router();
const {obtenerProductos, crearProductos, actualizarProductos, eliminarProductos} = require('../controllers/productoController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerProductos);
router.post('/', verificarToken, crearProductos);
router.put('/:id', verificarToken, actualizarProductos);
router.delete('/:id', verificarToken, eliminarProductos);

module.exports = router;