const express = require('express');
const router = express.Router();
const {obtenerMarcas, crearMarcas, actualizarMarcas, eliminarMarcas} = require('../controllers/marcaController');

router.get('/', obtenerMarcas);
router.post('/', crearMarcas);
router.put('/:id', actualizarMarcas);
router.delete('/:id', eliminarMarcas);

module.exports = router;