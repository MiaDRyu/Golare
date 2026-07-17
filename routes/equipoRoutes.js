const express = require('express');
const router = express.Router();
const {obtenerEquipos, crearEquipos} = require('../controllers/equipoController');
const {verificarToken,autorizarRoles} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Jefe de Ingenieria'),obtenerEquipos);
router.post('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Jefe de Ingenieria'),crearEquipos);

module.exports = router;