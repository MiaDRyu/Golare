const jwt = require('jsonwebtoken');

const verificarToken = (req,res,next) => {

    const authHeader = req.header('Authorization');

    if (!authHeader) {
        return res.status(401).json({Mensaje: 'Token no proporcionado'});
    }

    const token = authHeader.split(' ')[1];

    if (!token){
        return res.status(401).json({Mensaje: 'Formato de token inválido'});
    }

    try {
        const payloadDecodificado = jwt.verify(token, process.env.JWT_SECRET);

        req.usuario = payloadDecodificado;

        next();
    } catch (error) {
        console.error(error);
        return res.status(401).json({Mensaje: 'Token inválido o expirado'});
    }
};

const autorizarRoles = (...rolesPermitidos) =>{
    return (req,res,next) => {
        if (!req.usuario || !req.usuario.departamento){
            return res.status(403).json({Mensaje: 'Acceso denegado'});
        }

        if(rolesPermitidos.includes(req.usuario.departamento)){
            next();
        } else {
            return res.status(403).json({Mensaje: 'Acceso denegado'});
        }
    };
};

module.exports = {
    verificarToken,
    autorizarRoles
};