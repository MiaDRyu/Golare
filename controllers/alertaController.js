const pool = require('../config/db');

const obtenerAlertasCaducidad = async (req,res) => {
    try {
        const [alertas] = await pool.query(`
             SELECT l.id, l.numero_lote, l.fecha_caducidad, l.cantidad_disponible, p.nombre AS producto_nombre, p.sku AS producto_sku FROM lotes l JOIN productos p ON l.producto_id = p.id WHERE l.estado = 'Activo' AND l.cantidad_disponible > 0 AND l.fecha_caducidad <= DATE_ADD(CURDATE(), INTERVAL 60 DAY) ORDER BY l.fecha_caducidad ASC`);
             
        res.status(200).json({Mensaje: 'Alertas de caducidad obtenidas exitosamente', alertas});
    } catch (error){
        console.error(error);
        res.status(500).json({Mensaje: 'Error al obtener las alertas de caducidad'});
    }
}

const obtenerAlertasStock = async (req,res) => {
    try {
        const [alertas] = await pool.query(`
            SELECT p.id AS producto_id, p.sku, p.nombre, p.stock_minimo, COALESCE(SUM(l.cantidad_disponible), 0) AS stock_actual FROM productos p LEFT JOIN lotes l ON p.id = l.producto_id AND l.estado = 'Activo' WHERE p.estado = 1 GROUP BY p.id, p.sku, p.nombre, p.stock_minimo HAVING stock_actual <= p.stock_minimo ORDER BY stock_actual ASC`);
            
        res.status(200).json({Mensaje: 'Alertas de stock obtenidas exitosamente', alertas});
    } catch (error) {
        console.error(error);
        res.status(500).json({Mensaje: 'Error al obtener las alertas de stock'});
    }
};

module.exports = {
    obtenerAlertasCaducidad,
    obtenerAlertasStock
};