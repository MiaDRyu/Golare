const express = require('express');
const router = express.Router();
const {obtenerLotes,obtenerLotesPorProductos,actualizarLotes, eliminarLotes, crearLotes, registrarSalida} = require('../controllers/loteController');
const { route } = require('./areaRoutes');
const {verificarToken} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Jefe de Ingenieria'), obtenerLotes);
router.get('/producto/:producto_id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen','Gerencia de Ventas','Jefe de Ingenieria'), obtenerLotesPorProductos);
router.post('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'),crearLotes);
router.post('/salida', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), registrarSalida);
router.put('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), actualizarLotes);
router.delete('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','Gerencia de Operaciones','Jefe de Almacen'), eliminarLotes);

module.exports = router;