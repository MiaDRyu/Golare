const express = require('express');
const router = express.Router();
const {obtenerMarcas, crearMarcas, actualizarMarcas, eliminarMarcas} = require('../controllers/marcaController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken,  autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Jefe de Ingenieria', 'Operadores'),  obtenerMarcas);
router.post('/', verificarToken,  autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), crearMarcas);
router.put('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), actualizarMarcas);
router.delete('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), eliminarMarcas);

module.exports = router;