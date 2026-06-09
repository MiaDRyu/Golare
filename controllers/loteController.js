const pool = require('../config/db');

const obtenerLotes = async(req,res) => {
    try{
        const [rows] = await pool.query(`SELECT l.id, l.producto_id, l.numero_lote, l.fecha_caducidad, l.cantidad_inicial, l.cantidad_disponible, l.estado, p.nombre AS producto_nombre, p.sku AS producto_sku FROM lotes l JOIN productos p ON l.producto_id = p.id WHERE l.estado != 'Agotado' ORDER BY l.fecha_caducidad ASC`);

        res.json(rows);
    } catch (error){
        console.error(error);
        res.status(500).json({Mensaje:"Error al obtener los lotes"});
    }
};

const obtenerLotesPorProductos = async(req,res) => {
    const{producto_id} = req.params;
    try{
        const [rows] = await pool.query(`SELECT l.id, l.producto_id, l.numero_lote, l.fecha_caducidad, l.cantidad_inicial, l.cantidad_disponible, l.estado, p.nombre AS producto_nombre, p.sku AS producto_sku FROM lotes l JOIN productos p ON l.producto_id = p.id WHERE l.estado = 'Activo' AND l.producto_id = ? AND cantidad_disponible > 0 ORDER BY l.fecha_caducidad ASC`, [producto_id]);

        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({Mensaje: "Error al obtener los lotes por producto"});
    }
}

const crearLotes = async(req,res) =>{
    const {producto_id, numero_lote, fecha_caducidad, cantidad_inicial, cantidad_disponible} = req.body;

    if (!producto_id || !numero_lote || !fecha_caducidad || !cantidad_inicial || !cantidad_disponible){
            return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }
    
    try{
        const [result] = await pool.query(`INSERT INTO lotes (producto_id, numero_lote, fecha_caducidad, cantidad_inicial, cantidad_disponible, estado) VALUES (?,?,?,?,?,'Activo')`, [producto_id, numero_lote, fecha_caducidad, cantidad_inicial, cantidad_disponible]);

        res.status(201).json({Mensaje: "Lote registrado correctamente", lote_id: result.insertId});

    } catch (error) {
        console.error(error);
        if (error.code === 'ER_DUP_ENTRY'){
            res.status(400).json({Mensaje: 'El lote ya existe'});
        }
        res.status(500).json({Mensaje: 'Error al registrar el lote'});
    }
};

const actualizarLotes = async(req,res) => {
    const {id} = req.params;
    const {producto_id, numero_lote, fecha_caducidad, cantidad_inicial, cantidad_disponible, estado} = req.body;

    try{    
        const [result] = await pool.query(`UPDATE lotes SET producto_id = ?, numero_lote = ?, fecha_caducidad = ?, cantidad_inicial = ?, cantidad_disponible = ?, estado = ? WHERE id = ?`, [producto_id, numero_lote, fecha_caducidad, cantidad_inicial, cantidad_disponible, estado, id]);

        if(result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Lote no encontrado'});
        }
        res.json({Mensaje: 'Lote actualizado correctamente'});
    } catch (error) {
        console.error(error);

        if (error.code === 'ER_DUP_ENTRY'){
            res.status(400).json({Mensaje: 'El lote ya existe'});
        }

        res.status(500).json({Mensaje:"Error al actualizar el lote"});
    }
};

const eliminarLotes = async(req,res) => {
    const {id} = req.params;
    try{
        const [result] = await pool.query(`DELETE FROM lotes WHERE id = ?`, [id]);
        if(result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Lote no encontrado'});
        }
        res.json({Mensaje: 'Lote eliminado'});
    } catch (error) {
        console.error(error);
        res.status(500).json({Mensaje: 'Error al eliminar el lote'});
    }
};

module.exports = {
    obtenerLotes,
    obtenerLotesPorProductos,
    crearLotes,
    actualizarLotes,
    eliminarLotes
};