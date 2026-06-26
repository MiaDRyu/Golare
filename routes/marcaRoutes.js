const express = require('express');
const router = express.Router();
const {obtenerMarcas, crearMarcas, actualizarMarcas, eliminarMarcas} = require('../controllers/marcaController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerMarcas);
router.post('/', verificarToken, crearMarcas);
router.put('/:id', verificarToken, actualizarMarcas);
router.delete('/:id', verificarToken, eliminarMarcas);

module.exports = router;