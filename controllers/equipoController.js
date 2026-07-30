const pool = require('../config/db');

// --- OBTENER TODOS LOS EQUIPOS ---
const obtenerEquipos = async (req, res) => {
    try {
        const query = `
            SELECT 
                e.id, 
                e.nombre, 
                e.numero_serie, 
                e.modelo,
                e.permiso,
                e.duracion_permiso, 
                e.area_id, 
                a.nombre AS area_nombre,
                e.marca_id,
                m.nombre AS marca_nombre,
                e.cliente_id,
                c.nombre_comercial AS cliente_nombre,
                e.fecha_instalacion, 
                e.fecha_mantenimiento, 
                e.estado
            FROM equipos e
            INNER JOIN areas a ON e.area_id = a.id
            LEFT JOIN marcas m ON e.marca_id = m.id
            LEFT JOIN clientes c ON e.cliente_id = c.id
            ORDER BY e.id DESC
        `;
        const [rows] = await pool.query(query);
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al obtener los equipos" });
    }
};

const crearEquipo = async (req, res) => {
    const { nombre, numero_serie, modelo, permiso, duracion_permiso, area_id, marca_id, cliente_id, fecha_instalacion, fecha_mantenimiento, estado } = req.body;

    if (!nombre || !numero_serie || !area_id) {
        return res.status(400).json({ Mensaje: "Nombre, número de serie y área son obligatorios" });
    }

    try {
        const query = `
            INSERT INTO equipos 
            (nombre, numero_serie, modelo, permiso, duracion_permiso, area_id, marca_id, cliente_id, fecha_instalacion, fecha_mantenimiento, estado) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
        await pool.query(query, [nombre, numero_serie, modelo || null, area_id, marca_id || null, cliente_id || null, fecha_instalacion || null, fecha_mantenimiento || null, estado || 'Activo']);
        res.status(201).json({ Mensaje: "Equipo registrado exitosamente" });
    } catch (error) {
        console.error(error);
        if (error.code === 'ER_DUP_ENTRY') {
            return res.status(409).json({ Mensaje: "El número de serie ya está registrado en otro equipo" });
        }
        res.status(500).json({ Mensaje: "Error al registrar el equipo" });
    }
};

// --- ACTUALIZAR EQUIPO ---
const actualizarEquipo = async (req, res) => {
    const { id } = req.params;
    const { nombre, numero_serie, modelo, permiso, duracion_permiso, area_id, marca_id, cliente_id, fecha_instalacion, fecha_mantenimiento, estado } = req.body;

    try {
        const query = `
            UPDATE equipos 
            SET nombre = ?, numero_serie = ?, modelo = ?, permiso = ?, duracion_permiso = ?, area_id = ?, marca_id = ?, cliente_id = ?, fecha_instalacion = ?, fecha_mantenimiento = ?, estado = ? 
            WHERE id = ?
        `;
        const [result] = await pool.query(query, [nombre, numero_serie, modelo || null, permiso, duracion_permiso || null, area_id, marca_id || null, cliente_id || null, fecha_instalacion || null, fecha_mantenimiento || null, estado, id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Equipo no encontrado" });
        }
        res.json({ Mensaje: "Datos del equipo actualizados" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al actualizar el equipo" });
    }
};

const eliminarEquipo = async (req, res) => {
    const { id } = req.params;
    try {
        const query = `UPDATE equipos SET estado = 'Inactivo' WHERE id = ?`;
        const [result] = await pool.query(query, [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Equipo no encontrado" });
        }
        res.json({ Mensaje: "Equipo desactivado correctamente" });
    } catch (error) {
        res.status(500).json({ Mensaje: "Error al desactivar el equipo" });
    }
};

module.exports = { obtenerEquipos, crearEquipo, actualizarEquipo, eliminarEquipo };