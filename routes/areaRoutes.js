const express = require('express');
const router = express.Router();
const {obtenerAreas, crearAreas, actualizarAreas, eliminarAreas} = require('../controllers/areaController');
const {verificarToken, autorizarRoles} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerAreas);
router.post('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), crearAreas);
router.put('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'),actualizarAreas);
router.delete('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'),eliminarAreas);

module.exports = router;