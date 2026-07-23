const express = require('express');
const router = express.Router();
const { obtenerEquipos, crearEquipo, actualizarEquipo, eliminarEquipo } = require('../controllers/equipoController');
const { verificarToken, autorizarRoles } = require('../middlewares/authMiddleware');

// GET: Lectura general
router.get('/', verificarToken, obtenerEquipos);

// POST/PUT: Solo áreas técnicas y gerenciales
const rolesTecnicos = ['Direccion', 'Sub-Direccion', 'Gerencia de Operaciones', 'Jefe de Ingenieria', 'Ingeniero', 'Sistemas'];
router.post('/', verificarToken, autorizarRoles(...rolesTecnicos), crearEquipo);
router.put('/:id', verificarToken, autorizarRoles(...rolesTecnicos), actualizarEquipo);

// DELETE: Estrictamente cúpula
const rolesEliminacion = ['Direccion', 'Sub-Direccion', 'Sistemas'];
router.delete('/:id', verificarToken, autorizarRoles(...rolesEliminacion), eliminarEquipo);

module.exports = router;