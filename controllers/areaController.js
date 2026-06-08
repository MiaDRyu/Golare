const pool = require('../config/db');

const obtenerAreas = async(req,res) => {
    try{
        const [rows] = await pool.query('SElECT * FROM areas');
        res.json(rows);
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al obtener las categorías'});
    }
};

const crearAreas = async(req,res) => {
    const {nombre,descripcion} = req.body;
    try{
        const [result] = await pool.query('INSERT INTO areas (nombre, descripcion) VALUES (?, ?)', [nombre, descripcion]);
        res.json({id: result.insertId, nombre, descripcion});
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al crear el área'});
    }
};

const actualizarAreas = async(req,res) => {
    const {id} = req.params;
    const {nombre, descripcion} = req.body;
    try{
        const [result] = await pool.query('UPDATE areas SET nombre = ?, descripcion = ? WHERE id = ?', [nombre, descripcion, id]);
        if(result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Área no encontrada'});
        }
        res.json({id, nombre, descripcion});
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al actualizar el área'});
    }
};

const eliminarAreas = async(req,res) => {
    const {id} = req.params;
    try{
        const [result] = await pool.query('DELETE FROM areas WHERE id = ?', [id]);
        if(result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Área no encontrada'});
        }
        res.json({Mensaje: 'Área eliminada'});
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al eliminar el área'});
    }
} 

module.exports = {
    obtenerAreas,
    crearAreas,
    actualizarAreas,
    eliminarAreas
};