const express = require('express');
const router = express.Router();
const {obtenerClientes, crearClientes} = require('../controllers/clienteController');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, obtenerClientes);
router.post('/', verificarToken, crearClientes);

module.exports = router;