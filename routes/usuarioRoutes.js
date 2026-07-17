const express = require('express');
const router = express.Router();
const {registrarUsuario, loginUsuario} = require('../controllers/usuarioController');
const {verificarToken, autorizarRoles} = require('../middlewares/authMiddleware');

router.post('/registro', verificarToken, autorizarRoles('Direccion','Subdireccion','Sistemas','RH','Gerencia de Administracion'), registrarUsuario);
router.post('/login', loginUsuario);

module.exports = router;