const express = require('express');
const router = express.Router();
const { obtenerHistorialMovimientos } = require('../controllers/movimientoController');
const { verificarToken, autorizarRoles } = require('../middlewares/authMiddleware');

router.get('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), obtenerHistorialMovimientos);

module.exports = router;