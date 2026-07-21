const express = require('express');
const router = express.Router();
const {obtenerProductos, crearProductos, actualizarProductos, eliminarProductos} = require('../controllers/productoController');
const {verificarToken, autorizarRoles} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Jefe de Ingenieria', 'Operador', 'Vendedor'), obtenerProductos);
router.post('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), crearProductos);
router.put('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), actualizarProductos);
router.delete('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), eliminarProductos);

module.exports = router;