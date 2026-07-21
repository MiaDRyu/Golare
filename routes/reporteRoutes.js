const express = require('express');
const router = express.Router();
const {generarReporteHistorico} = require('../controllers/reporteController');
const {verificarToken, autorizarRoles} = require('../middlewares/authMiddleware');

router.get('/historico/pdf', autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen', 'Gerencia de Ventas', 'Vendedor'), verificarToken, generarReporteHistorico);

module.exports = router;