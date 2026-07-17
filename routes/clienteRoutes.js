const express = require('express');
const router = express.Router();
const {obtenerClientes, crearClientes} = require('../controllers/clienteController');
const {verificarToken,autorizarRoles} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Vendedor','Jefe de Ingenieria','Ingeniero'),obtenerClientes);
router.post('/', verificarToken, ('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Vendedor','Jefe de Ingenieria','Ingeniero'),crearClientes);

module.exports = router;