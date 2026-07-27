const pool = require('../config/db');

// --- OBTENER TODAS LAS CATEGORÍAS ---
const obtenerCategorias = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM categorias_producto ORDER BY nombre ASC');
        res.json(rows);
    } catch (error) {
        console.error("Error al obtener categorías:", error);
        res.status(500).json({ Mensaje: "Error al obtener las categorías" });
    }
};

// --- CREAR CATEGORÍA ---
const crearCategoria = async (req, res) => {
    const { nombre } = req.body;

    if (!nombre) {
        return res.status(400).json({ Mensaje: "El nombre de la categoría es obligatorio" });
    }

    try {
        const [result] = await pool.query('INSERT INTO categorias_producto (nombre) VALUES (?)', [nombre]);
        res.status(201).json({ Mensaje: "Categoría creada exitosamente", id: result.insertId });
    } catch (error) {
        console.error("Error al crear categoría:", error);
        res.status(500).json({ Mensaje: "Error al registrar la categoría" });
    }
};

// --- ACTUALIZAR CATEGORÍA ---
const actualizarCategoria = async (req, res) => {
    const { id } = req.params;
    const { nombre } = req.body;

    if (!nombre) {
        return res.status(400).json({ Mensaje: "El nombre es obligatorio" });
    }

    try {
        const [result] = await pool.query('UPDATE categorias_producto SET nombre = ? WHERE id = ?', [nombre, id]);
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Categoría no encontrada" });
        }
        res.json({ Mensaje: "Categoría actualizada correctamente" });
    } catch (error) {
        console.error("Error al actualizar categoría:", error);
        res.status(500).json({ Mensaje: "Error al actualizar la categoría" });
    }
};

// --- ELIMINAR CATEGORÍA ---
const eliminarCategoria = async (req, res) => {
    const { id } = req.params;

    try {
        const [result] = await pool.query('DELETE FROM categorias_producto WHERE id = ?', [id]);
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Categoría no encontrada" });
        }
        res.json({ Mensaje: "Categoría eliminada correctamente" });
    } catch (error) {
        // Validación de Integridad Referencial: Evita borrar categorías en uso
        if (error.code === 'ER_ROW_IS_REFERENCED_2') {
            return res.status(409).json({ Mensaje: "No se puede eliminar esta categoría porque hay productos vinculados a ella" });
        }
        console.error("Error al eliminar categoría:", error);
        res.status(500).json({ Mensaje: "Error al eliminar la categoría" });
    }
};

module.exports = {
    obtenerCategorias,
    crearCategoria,
    actualizarCategoria,
    eliminarCategoria
};