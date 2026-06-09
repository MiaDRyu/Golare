const express = require('express');
const router = express.Router();
const {obtenerProductos, crearProductos, actualizarProductos, eliminarProductos} = require('../controllers/productoController');

router.get('/', obtenerProductos);
router.post('/', crearProductos);
router.put('/:id', actualizarProductos);
router.delete('/:id', eliminarProductos);

module.exports = router;