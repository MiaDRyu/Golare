const pool = require('../config/db');

const obtenerEquipos = async (req,res) => {
    try {
        const [rows] = await pool.query(`SELECT e.*, a.nombre AS area_nombre FROM equipos e JOIN areas a ON e.area_id = a.id WHERE e.estado = 'Activo'`);

        res.json(rows);
    } catch(error){
        console.error(error);
        res.status(500).json({Mensaje: "Error al obtener los equipos"});
    }
};

const crearEquipos = async (req,res) => {
    const {nombre,area_id} = req.body;

    if (!nombre || !area_id){
        return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }

    try {
        
        const [result] = await pool.query('INSERT INTO equipos (nombre, area_id) VALUES (?,?)', [nombre, area_id]);
        res.status(201).json({Mensaje: "Equipo insertado correctamente", id: result.insertId});
    } catch (error) {
        console.error(error);
        res.status(500).json({Mensaje: "Error al crear el equipo"});
    }
};

module.exports = {
    obtenerEquipos,
    crearEquipos
};