const express = require('express');
const router = express.Router();
const {obtenerAlertasCaducidad, obtenerAlertasStock} = require('../controllers/alertaController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/caducidades', verificarToken, obtenerAlertasCaducidad);
router.get('/stock', verificarToken, obtenerAlertasStock);

module.exports = router;