const express = require('express');
const router = express.Router();
const { obtenerHistorialMovimientos } = require('../controllers/movimientoController');
const { verificarToken } = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerHistorialMovimientos);

module.exports = router;