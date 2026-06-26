const express = require('express');
const router = express.Router();
const {generarReporteHistorico} = require('../controllers/reporteController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/historico/pdf', verificarToken, generarReporteHistorico);

module.exports = router;