const pool = require('../config/db');

const obtenerProductos = async(req,res) => {
    try{
        // Agregamos el JOIN para categorias
        const query = `
            SELECT p.*, 
                   a.nombre AS area_nombre, 
                   c.nombre AS categoria_nombre, 
                   m.nombre AS marca_nombre, 
                   e.nombre AS equipo_nombre 
            FROM productos AS p 
            LEFT JOIN areas a ON p.area_id = a.id 
            LEFT JOIN categorias_producto c ON p.categoria_id = c.id
            LEFT JOIN marcas m ON p.marca_id = m.id 
            LEFT JOIN equipos e ON p.equipo_id = e.id
        `;
        const [rows] = await pool.query(query);
        res.json(rows);
    } catch (error){
        console.error(error);
        res.status(500).json({Mensaje:"Error al obtener los productos"});
    }
};

const crearProductos = async(req,res) =>{
    // Agregamos categoria_id al destructuring
    const {sku, nombre, presentacion, descripcion, precio, stock_minimo, estado, area_id, categoria_id, marca_id, equipo_id} = req.body;

    if (!sku || !nombre || !precio || stock_minimo === undefined){
        return res.status(400).json({Mensaje: 'Faltan campos obligatorios'});
    }
    try{
        // Actualizamos el INSERT para incluir categoria_id
        const [result] = await pool.query(
            'INSERT INTO productos (sku, nombre, presentacion, descripcion, precio, stock_minimo, estado, area_id, categoria_id, marca_id, equipo_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
            [sku, nombre, presentacion, descripcion || null, precio, stock_minimo, estado, area_id || null, categoria_id || null, marca_id || null, equipo_id || null]
        );

        res.status(201).json({Mensaje:"Producto registrado correctamente", id: result.insertId});
    } catch (error){
        if (error.code === 'ER_DUP_ENTRY'){
            res.status(400).json({Mensaje: 'El SKU ya existe'});
        } else{
            res.status(500).json({Mensaje: 'Error al registrar el producto'});
        }
    }
};

const actualizarProductos = async(req,res) =>{
    try{
        const {id} = req.params;
        const {sku, nombre, presentacion, descripcion, precio, stock_minimo, estado, area_id, categoria_id, marca_id, equipo_id} = req.body;
        
        // Actualizamos el UPDATE para incluir categoria_id
        const [result] = await pool.query(
            'UPDATE productos SET sku = ?, nombre = ?, presentacion = ?, descripcion = ?, precio = ?, stock_minimo = ?, estado = ?, area_id = ?, categoria_id = ?, marca_id = ?, equipo_id = ? WHERE id = ?', 
            [sku, nombre, presentacion, descripcion || null, precio, stock_minimo, estado, area_id || null, categoria_id || null, marca_id || null, equipo_id || null, id]
        );
        
        if (result.affectedRows === 0){
            return res.status(404).json({Mensaje: 'Producto no encontrado'});
        }
        res.json({Mensaje: 'Producto actualizado correctamente'});
    } catch (error){
        if (error.code === 'ER_DUP_ENTRY'){
            res.status(400).json({Mensaje: 'El SKU ya existe'});
        } else{
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

const obtenerProductoPorSku = async (req, res) => {
    const { sku } = req.params;

    try {
        const query = `SELECT id, nombre, sku FROM productos WHERE sku = ? AND estado = 1`;
        const [rows] = await pool.query(query, [sku]);

        if (rows.length === 0) {
            return res.status(404).json({ Mensaje: "Producto no encontrado o inactivo" });
        }
        res.json(rows[0]);
    } catch (error) {
        console.error("Error al buscar por SKU:", error);
        res.status(500).json({ Mensaje: "Error al realizar la búsqueda" });
    }
};

module.exports = {
    obtenerProductos,
    crearProductos,
    actualizarProductos,
    eliminarProductos,
    obtenerProductoPorSku
};