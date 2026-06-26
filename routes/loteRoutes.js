const express = require('express');
const router = express.Router();
const {obtenerLotes,obtenerLotesPorProductos,actualizarLotes, eliminarLotes, crearLotes, registrarSalida} = require('../controllers/loteController');
const { route } = require('./areaRoutes');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerLotes);
router.get('/producto/:producto_id', verificarToken, obtenerLotesPorProductos);
router.post('/', verificarToken, crearLotes);
router.post('/salida', verificarToken, registrarSalida);
router.put('/:id', verificarToken, actualizarLotes);
router.delete('/:id', verificarToken, eliminarLotes);

module.exports = router;