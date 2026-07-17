const express = require('express');
const router = express.Router();
const {obtenerAreas, crearAreas, actualizarAreas, eliminarAreas} = require('../controllers/areaController');
const {verificarToken, autorizarRoles} = require('../middlewares/authMiddleware');

router.get('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas'), obtenerAreas);
router.post('/', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas'), crearAreas);
router.put('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas'),actualizarAreas);
router.delete('/:id', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas'),eliminarAreas);

module.exports = router;