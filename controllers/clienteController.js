const pool = require('../config/db');

const obtenerClientes = async (req,res) => {
    try {
        const [rows] = await pool.query(`SELECT * FROM clientes WHERE estado = 'Activo'`);

        res.json(rows);
    } catch(error){
        console.error(error);
        res.status(500).json({Mensaje: "Error al obtener los clientes"});
    }
};

const crearClientes = async (req,res) => {
    const {nombre,contacto,telefono,correo,direccion} = req.body;

    if (!nombre){
        return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }

    try {
        
        const [result] = await pool.query('INSERT INTO clientes (nombre_comercial, contacto_principal,telefono,correo,direccion) VALUES (?,?,?,?,?)', [nombre, contacto || null, telefono || null, correo || null, direccion || null]);
        res.status(201).json({Mensaje: "Cliente insertado correctamente", id: result.insertId});
    } catch (error) {
        console.error(error);
        res.status(500).json({Mensaje: "Error al crear el cliente"});
    }
};

module.exports = {
    obtenerClientes,
    crearClientes
};