const express = require('express');
const router = express.Router();
const { obtenerCategorias, crearCategoria, actualizarCategoria, eliminarCategoria } = require('../controllers/categoriaController');
const { verificarToken, autorizarRoles } = require('../middlewares/authMiddleware');

// GET: Lectura disponible para todos los usuarios con sesión iniciada
router.get('/', verificarToken, obtenerCategorias);

// POST, PUT, DELETE: Restringido a directivos y administradores
const rolesAdmin = ['Direccion', 'Sub-Direccion', 'Sistemas', 'Gerencia de Administracion'];

router.post('/', verificarToken, autorizarRoles(...rolesAdmin), crearCategoria);
router.put('/:id', verificarToken, autorizarRoles(...rolesAdmin), actualizarCategoria);
router.delete('/:id', verificarToken, autorizarRoles(...rolesAdmin), eliminarCategoria);

module.exports = router;