const pool = require('../config/db');

// --- OBTENER TODOS LOS EQUIPOS ---
const obtenerEquipos = async (req, res) => {
    try {
        const query = `
            SELECT 
                e.id, 
                e.nombre, 
                m.nombre as marca_equipo, 
                e.modelo,  
                e.estado
            FROM equipos e join marcas m ON e.marca_id = m.id
            WHERE e.estado != 'Eliminado'
            ORDER BY e.id DESC
        `;
        const [rows] = await pool.query(query);
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al obtener los equipos" });
    }
};

// --- CREAR UN NUEVO EQUIPO ---
const crearEquipo = async (req, res) => {
    const { nombre, marca, modelo, estado } = req.body;

    if (!nombre) {
        return res.status(400).json({ Mensaje: "El nombre es obligatorio" });
    }

    try {
        const query = `
            INSERT INTO equipos 
            (nombre, marca, modelo, estado) 
            VALUES (?, ?, ?, ?)
        `;
        await pool.query(query, [nombre, marca || null, modelo || null, estado || 'Activo']);
        res.status(201).json({ Mensaje: "Equipo registrado exitosamente" });
    } catch (error) {
        console.error(error);
        if (error.code === 'ER_DUP_ENTRY') {
            return res.status(409).json({ Mensaje: "El equipo ya está registrado" });
        }
        res.status(500).json({ Mensaje: "Error al registrar el equipo" });
    }
};

// --- ACTUALIZAR EQUIPO ---
const actualizarEquipo = async (req, res) => {
    const { id } = req.params;
    const { nombre, marca, modelo, estado } = req.body;

    try {
        const query = `
            UPDATE equipos 
            SET nombre = ?, marca = ?, modelo = ?, estado = ? 
            WHERE id = ?
        `;
        const [result] = await pool.query(query, [nombre, marca || null, modelo || null, estado, id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Equipo no encontrado" });
        }
        res.json({ Mensaje: "Datos del equipo actualizados" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al actualizar el equipo" });
    }
};

// --- ELIMINAR (BAJA LÓGICA) ---
const eliminarEquipo = async (req, res) => {
    const { id } = req.params;
    
    try {
        const query = `UPDATE equipos SET estado = 'Eliminado' WHERE id = ?`;
        const [result] = await pool.query(query, [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Equipo no encontrado" });
        }
        res.json({ Mensaje: "Equipo eliminado correctamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al eliminar el equipo" });
    }
};

module.exports = { obtenerEquipos, crearEquipo, actualizarEquipo, eliminarEquipo };