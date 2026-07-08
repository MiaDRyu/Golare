const express = require('express');
const router = express.Router();
const {obtenerEquipos, crearEquipos} = require('../controllers/equipoController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerEquipos);
router.post('/', verificarToken, crearEquipos);

module.exports = router;