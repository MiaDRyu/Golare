const pool = require('../config/db');

const obtenerMarcas = async(req,res) => {
    try{
        const [rows] = await pool.query('SElECT * FROM marcas');
        res.json(rows);
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al obtener las categorías'});
    }
};

const crearMarcas = async(req,res) => {
    const {nombre,descripcion,imagen} = req.body;
    try{
        const [result] = await pool.query('INSERT INTO marcas (nombre, descripcion, imagen) VALUES (?, ?, ?)', [nombre, descripcion, imagen]);
        res.json({id: result.insertId, nombre, descripcion, imagen});
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al crear la marca'});
    }
};

const actualizarMarcas = async(req,res) => {
    const {id} = req.params;
    const {nombre, descripcion, imagen} = req.body;
    try{
        const [result] = await pool.query('UPDATE marcas SET nombre = ?, descripcion = ?, imagen = ? WHERE id = ?', [nombre, descripcion, imagen, id]);
        if(result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Marca no encontrada'});
        }
        res.json({id, nombre, descripcion, imagen});
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al actualizar la marca'});
    }
};

const eliminarMarcas = async(req,res) => {
    const {id} = req.params;
    try{
        const [result] = await pool.query('DELETE FROM marcas WHERE id = ?', [id]);
        if(result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Marca no encontrada'});
        }
        res.json({Mensaje: 'Marca eliminada'});
    } catch (error) {
        res.status(500).json({Mensaje: 'Error al eliminar la marca'});
    }
} 

module.exports = {
    obtenerMarcas,
    crearMarcas,
    actualizarMarcas,
    eliminarMarcas
};