const pool = require('../config/db');

const obtenerLotes = async(req,res) => {
    try{
        const [rows] = await pool.query(`SELECT l.id, l.producto_id, l.numero_lote, l.fecha_caducidad, l.cantidad_inicial, l.cantidad_disponible, l.estado, p.nombre AS producto_nombre, p.sku AS producto_sku, p.stock_minimo FROM lotes l JOIN productos p ON l.producto_id = p.id ORDER BY l.fecha_caducidad ASC`);

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
    const {producto_id, numero_lote, fecha_caducidad, cantidad_inicial, folio, comentarios} = req.body;
    const usuario_id = req.usuario.id;

    if (!producto_id || !numero_lote || !fecha_caducidad || !cantidad_inicial || !usuario_id || !folio){
            return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }
    
    const conn = await pool.getConnection();

    try{
        await conn.beginTransaction();

        const queryLote = `
            INSERT INTO lotes 
            (producto_id, numero_lote, fecha_caducidad, cantidad_inicial, cantidad_disponible, estado) 
            VALUES (?, ?, ?, ?, ?, 'Activo')
        `;
        const [resultLote] = await conn.query(queryLote, [producto_id, numero_lote, fecha_caducidad, cantidad_inicial, cantidad_inicial]);
        
        const loteId = resultLote.insertId;

        const queryMovimiento = `
            INSERT INTO movimientos_inventario 
            (folio, lote_id, usuario_id, tipo_movimiento, cantidad, comentarios) 
            VALUES (?, ?, ?, 'Entrada', ?, ?)
        `;
        const [resultMovimiento] = await conn.query(queryMovimiento, [folio, loteId, usuario_id, cantidad_inicial, comentarios || 'Entrada inicial al lote']);

        await conn.commit();

        res.status(201).json({Mensaje: "El lote ha sido registrado correctamente"});
    } catch (error) {
       await conn.rollback();

       console.error(error);

       if(error.code === 'ER_DUP_ENTRY'){
            return res.status(409).json({Mensaje: 'El número de folio o el lote ya existen'});
       }

       res.status(500).json({Mensaje: 'Error al registrar el lote'});
    } finally {
        conn.release();
    }
};

const registrarSalida = async(req,res) => {
    const {producto_id, cantidad_solicitada, folio, comentarios, cliente_id} = req.body;
    const usuario_id = req.usuario.id;

    if (!producto_id || !cantidad_solicitada || !usuario_id || !folio){
        return res.status(400).json({Mensaje: 'Faltan campos obligatorios para registrar salida'});
    }

    const conn = await pool.getConnection();

    try{
        await conn.beginTransaction();

        const [lotes] = await conn.query(`SELECT id, cantidad_disponible FROM lotes WHERE producto_id = ? AND estado = 'Activo' AND cantidad_disponible > 0 ORDER BY fecha_caducidad ASC FOR UPDATE`, [producto_id]);

        const stockTotal = lotes.reduce((sum, lote) => sum + lote.cantidad_disponible, 0);

        if (stockTotal < cantidad_solicitada) {
            await conn.rollback();
            return res.status(400).json({Mensaje: 'La cantidad solicitada excede el stock disponible'});
        }

        let cantidadRestante = cantidad_solicitada;

        for (const lote of lotes){
            if (cantidadRestante === 0) break;

            let cantidadADescontar = 0;
            let nuevoEstado = 'Activo';

            if (lote.cantidad_disponible <= cantidadRestante) {
                cantidadADescontar = lote.cantidad_disponible;
                cantidadRestante -= lote.cantidad_disponible;
                nuevoEstado = 'Agotado';
            } else {
                cantidadADescontar = cantidadRestante;
                cantidadRestante = 0;
            }

            await conn.query(`UPDATE lotes SET cantidad_disponible = cantidad_disponible - ?, estado = ? WHERE id = ?`, [cantidadADescontar, nuevoEstado, lote.id]);

            await conn.query(`INSERT INTO movimientos_inventario (folio, lote_id, usuario_id, cliente_id, tipo_movimiento, cantidad, comentarios) VALUES(?,?,?,?,'Salida',?,?)`, [folio, lote.id, usuario_id, cliente_id || null, cantidadADescontar, comentarios || 'Salida de mercancía']);
        }

        await conn.commit();
        res.status(200).json({Mensaje: 'Salida registrada correctamente'});
    } catch (error) {
        await conn.rollback();
        console.error(error);
        res.status(500).json({Mensaje:'Error al registrar la salida'});
    } finally {
        conn.release();
    }
}
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
        if (error.code === 'ER_ROW_IS_REFERENCED_2'){
            return res.status(409).json({Mensaje: 'No se puede eliminar el lote pues ya hay cambios registrados en el Kardex'})
        }
        res.status(500).json({Mensaje: 'Error al eliminar el lote'});
    }
};

module.exports = {
    obtenerLotes,
    obtenerLotesPorProductos,
    crearLotes,
    registrarSalida,
    actualizarLotes,
    eliminarLotes
};