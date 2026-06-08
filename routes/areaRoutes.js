const express = require('express');
const router = express.Router();
const {obtenerAreas, crearAreas, actualizarAreas, eliminarAreas} = require('../controllers/areaController');

router.get('/', obtenerAreas);
router.post('/', crearAreas);
router.put('/:id', actualizarAreas);
router.delete('/:id', eliminarAreas);

module.exports = router;