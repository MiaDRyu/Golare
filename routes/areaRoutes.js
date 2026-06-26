const express = require('express');
const router = express.Router();
const {obtenerAreas, crearAreas, actualizarAreas, eliminarAreas} = require('../controllers/areaController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerAreas);
router.post('/', verificarToken, crearAreas);
router.put('/:id', verificarToken, actualizarAreas);
router.delete('/:id', verificarToken, eliminarAreas);

module.exports = router;