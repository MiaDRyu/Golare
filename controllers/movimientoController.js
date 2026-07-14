const pool = require('../config/db');

const obtenerHistorialMovimientos = async (req, res) => {
    try {
        const query = `
            SELECT 
                m.folio, 
                m.tipo_movimiento, 
                m.cantidad, 
                m.fecha_hora, 
                m.comentarios,
                p.nombre AS producto, 
                p.sku,
                l.numero_lote,
                u.nombre AS usuario,
                c.nombre_comercial AS cliente
            FROM movimientos_inventario m
            JOIN lotes l ON m.lote_id = l.id
            JOIN productos p ON l.producto_id = p.id
            JOIN usuarios u ON m.usuario_id = u.id
            LEFT JOIN clientes c ON m.cliente_id = c.id
            ORDER BY m.fecha_hora DESC
            LIMIT 150;
        `;
        const [rows] = await pool.query(query);
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ Mensaje: "Error al obtener el historial de movimientos" });
    }
};

module.exports = { obtenerHistorialMovimientos };