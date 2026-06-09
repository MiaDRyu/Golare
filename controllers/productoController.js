const pool = require('../config/db');

const obtenerProductos = async(req,res) => {
    try{
        const [rows] = await pool.query('SELECT p.id, p.sku, p.nombre, p.descripcion, p.precio, p.stock_minimo, p.estado, a.nombre AS area_nombre, m.nombre AS marca_nombre FROM productos AS p LEFT JOIN areas a ON p.area_id = a.id LEFT JOIN marcas m ON p.marca_id = m.id');

        res.json(rows);
    } catch (error){
        console.error(error);
        res.status(500).json({Mensaje:"Error al obtener los productos"});
    }
};

const crearProductos = async(req,res) =>{
    const {sku, nombre, descripcion, precio, stock_minimo, estado, area_id, marca_id} = req.body;

    if (!sku || !nombre || !precio || stock_minimo === undefined){
        return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }
    try{
        const [result] = await pool.query('INSERT INTO productos (sku, nombre, descripcion, precio, stock_minimo, estado, area_id, marca_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', [sku, nombre, descripcion || null, precio, stock_minimo, estado, area_id || null, marca_id || null]);

        res.status(201).json({Mensaje:"Producto registrado correctamente", id: result.insertId});

    } catch (error){
        if (error.code === 'ER_DUP_ENTRY'){
            res.status(400).json({Mensaje: 'El SKU ya existe'});
        }
        else{
            res.status(500).json({Mensaje: 'Error al registrar el producto'});
        }
    }

};

const actualizarProductos = async(req,res) =>{
    try{
        const {id} = req.params;
        const {sku, nombre, descripcion, precio, stock_minimo, estado, area_id, marca_id} = req.body;
        const [result] = await pool.query('UPDATE productos SET sku = ?, nombre = ?, descripcion = ?, precio = ?, stock_minimo = ?, estado = ?, area_id = ?, marca_id = ? WHERE id = ?', [sku, nombre, descripcion || null, precio, stock_minimo, estado, area_id || null, marca_id || null, id]);
        if (result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Producto no encontrado'});
        }
        res.json({Mensaje: 'Producto actualizado correctamente'});
    } catch (error){
        if (error.code === 'ER_DUP_ENTRY'){
            res.status(400).json({Mensaje: 'El SKU ya existe'});
        }
        else{
            console.error(error)
            res.status(500).json({Mensaje: 'Error al actualizar el producto'});
        }
    }
};

const eliminarProductos = async(req,res) =>{
    try{
        const {id} = req.params;
        const [result] = await pool.query('DELETE FROM productos WHERE id = ?', [id]);
        if (result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Producto no encontrado'});
        }
        res.json({Mensaje: 'Producto eliminado correctamente'});
    } catch (error){
        res.status(500).json({Mensaje: 'Error al eliminar el producto'});
    }
};

module.exports = {
    obtenerProductos,
    crearProductos,
    actualizarProductos,
    eliminarProductos
};