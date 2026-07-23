const express = require('express');
const router = express.Router();
const { obtenerClientes, crearCliente, actualizarCliente, eliminarCliente } = require('../controllers/clienteController');
const { verificarToken, autorizarRoles } = require('../middlewares/authMiddleware');

// GET: Todos pueden leer (para llenar selects y ver estadísticas)
router.get('/', verificarToken, obtenerClientes);

// POST y PUT: Área directiva, administrativa y comercial pueden crear/editar
const rolesCreacion = ['Direccion', 'Sub-Direccion', 'Gerencia de Ventas', 'Vendedor', 'Sistemas', 'Gerencia de Administracion'];
router.post('/', verificarToken, autorizarRoles(...rolesCreacion), crearCliente);
router.put('/:id', verificarToken, autorizarRoles(...rolesCreacion), actualizarCliente);

// DELETE: Solo la cúpula directiva puede desactivar clientes para no afectar métricas
const rolesEliminacion = ['Direccion', 'Sub-Direccion', 'Sistemas'];
router.delete('/:id', verificarToken, autorizarRoles(...rolesEliminacion), eliminarCliente);

module.exports = router;