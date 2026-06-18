const express = require('express');
const router = express.Router();
const {obtenerLotes,obtenerLotesPorProductos,actualizarLotes, eliminarLotes, crearLotes, registrarSalida} = require('../controllers/loteController');
const { route } = require('./areaRoutes');

router.get('/', obtenerLotes);
router.get('/producto/:producto_id', obtenerLotesPorProductos)
router.post('/', crearLotes);
router.post('/salida', registrarSalida)
router.put('/:id', actualizarLotes);
router.delete('/:id', eliminarLotes);

module.exports = router;