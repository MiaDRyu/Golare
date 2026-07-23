const pool = require('../config/db');

const obtenerClientes = async (req, res) => {
    try {
        const query = `
            SELECT 
                c.id, 
                c.nombre_comercial AS nombre, 
                c.telefono, 
                c.correo, 
                c.estado,
                (SELECT SUM(m.cantidad) FROM movimientos_inventario m WHERE m.cliente_id = c.id AND m.tipo_movimiento = 'Salida') AS total_compras,
                (SELECT p.nombre FROM movimientos_inventario m2 JOIN lotes l ON m2.lote_id = l.id JOIN productos p ON l.producto_id = p.id WHERE m2.cliente_id = c.id AND m2.tipo_movimiento = 'Salida' GROUP BY p.id ORDER BY COUNT(p.id) DESC LIMIT 1) AS producto_favorito,
                (SELECT p.nombre FROM movimientos_inventario m3 JOIN lotes l ON m3.lote_id = l.id JOIN productos p ON l.producto_id = p.id WHERE m3.cliente_id = c.id AND m3.tipo_movimiento = 'Salida' ORDER BY m3.fecha_hora DESC LIMIT 1) AS ultima_compra,
                (SELECT MAX(fecha_hora) FROM movimientos_inventario WHERE cliente_id = c.id AND tipo_movimiento = 'Salida') AS fecha_ultima_compra
            FROM clientes c
            ORDER BY c.nombre_comercial ASC
        `;
        const [rows] = await pool.query(query);
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al obtener clientes" });
    }
};

const crearCliente = async (req, res) => {
    const { nombre, telefono, correo } = req.body;

    if (!nombre) {
        return res.status(400).json({ Mensaje: "El nombre comercial es obligatorio" });
    }

    try {
        const query = `INSERT INTO clientes (nombre_comercial, telefono, correo, estado) VALUES (?, ?, ?, 'Activo')`;
        await pool.query(query, [nombre, telefono || null, correo || null]);
        res.status(201).json({ Mensaje: "Cliente registrado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al crear cliente" });
    }
};

const actualizarCliente = async (req, res) => {
    const { id } = req.params;
    const { nombre, telefono, correo } = req.body;

    try {
        const query = `UPDATE clientes SET nombre_comercial = ?, telefono = ?, correo = ? WHERE id = ?`;
        const [result] = await pool.query(query, [nombre, telefono || null, correo || null, id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Cliente no encontrado" });
        }
        res.json({ Mensaje: "Datos del cliente actualizados" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al actualizar cliente" });
    }
};

const eliminarCliente = async (req, res) => {
    const { id } = req.params;
    
    try {
        const query = `UPDATE clientes SET estado = 'Inactivo' WHERE id = ?`;
        const [result] = await pool.query(query, [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ Mensaje: "Cliente no encontrado" });
        }
        res.json({ Mensaje: "Cliente desactivado correctamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al desactivar cliente" });
    }
};

module.exports = { obtenerClientes, crearCliente, actualizarCliente, eliminarCliente };