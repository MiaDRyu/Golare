const pool = require('../config/db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const registrarUsuario = async(req,res) => {
    const {nombre, email, password, departamento} = req.body;

    if (!nombre || !email || !password){
        return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }

    try{
        const [existingUser] = await pool.query('SELECT id FROM usuarios WHERE email = ?',[email]);
        if (existingUser.length > 0){
            return res.status(400).json({Mensaje: 'El correo electrónico ya está registrado'});
        }

        const saltRounds = 10;
        const passwordHash = await bcrypt.hash(password, saltRounds);

        const [result] = await pool.query('INSERT INTO usuarios (nombre,email,password_hash,departamento) VALUES (?,?,?,?)',[nombre,email,passwordHash,departamento || null]);

        res.status(201).json({Mensaje: 'Usuario registrado correctamente', usuario_id: result.insertId});
    } catch (error){
        console.error(error);
        res.status(500).json({Mensaje: 'Error al registrar el usuario'});
    }
}

const loginUsuario = async(req,res) =>{
    const {nombre, password} = req.body;

    if (!nombre || !password){
        return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }

    try {
        const [users] = await pool.query('SELECT * FROM usuarios WHERE nombre = ?',[nombre]);
        if (users.length === 0){
            return res.status(401).json({Mensaje: 'Credenciales inválidas'});
        }

        const user = users[0];

        const isMatch = await bcrypt.compare(password, user.password_hash);
        if (!isMatch){
            return res.status(401).json({Mensaje: 'Credenciales inválidas'});
        }

        const payload = {
            id: user.id,
            nombre: user.nombre,
            email: user.email,
            departamento: user.departamento
        };

        const token = jwt.sign(payload, process.env.JWT_SECRET, {expiresIn: '8h'});

        res.status(200).json({Mensaje: 'Login exitoso!', token, user: payload});
    } catch (error) {
        console.error(error);
        res.status(500).json({Mensaje: 'Error al iniciar sesión'});
    }
};

module.exports = {
    registrarUsuario,
    loginUsuario
};