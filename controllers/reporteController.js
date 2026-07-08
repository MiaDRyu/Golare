const pool = require('../config/db');
const PDFDocument = require('pdfkit');

const generarReporteHistorico = async (req,res) => {
    try {
        const [movimientos] = await pool.query(`
            SELECT m.folio, m.tipo_movimiento, m.cantidad, m.fecha_hora, m.comentarios, p.nombre AS producto, p.sku, l.numero_lote, u.nombre AS usuario c.nombre_comercial FROM movimientos_inventario m JOIN lotes l ON m.lote_id = l.id JOIN productos p ON l.producto_id = p.id JOIN usuarios u ON m.usuario_id = u.id LEFT JOIN clientes c ON m.cliente_id = c.id ORDER BY m.fecha_hora DESC LIMIT 100`);
        
        res.setHeader('Content-Type', 'application/pdf');
        res.setHeader('Content-Disposition', 'attachment; filename=Reporte_Inventario_Golare.pdf');

        const doc = new PDFDocument({margin:50});

        doc.pipe(res);

        doc.fontSize(20).text('Golare - Suministros Integrales', {align:'center'});
        doc.moveDown();
        doc.fontSize(14).text('Reporte Histórico de Movimientos de Inventario', {align:'center'});
        doc.fontSize(10).text(`Fecha de generación ${new Date().toLocaleDateString()}`, {align:'center'});

        if (movimientos.length === 0){
            doc.moveDown();
            doc.fontSize(12).text('No hay movimientos de inventario para mostrar.', {align:'center'});
        } else {
            doc.moveDown();
            movimientos.forEach((mov) => {
                const fecha = new Date(mov.fecha_hora).toLocaleString();

                doc.fillColor(mov.tipo_movimiento === 'Entrada' ? 'green' : 'blue').fontSize(12).text(`${mov.tipo_movimiento.toUpperCase()} - Folio: ${mov.folio}`);

                doc.fillColor('black').fontSize(10).text(`Fecha: ${fecha} | Usuario: ${mov.usuario}`).text(`Producto: [${mov.sku}] ${mov.producto}`).text(`Lote: ${mov.numero_lote} |Cantidad: ${mov.cantidad}`).text(`Cliente: ${mov.cliente || 'N/A'}`).text(`Comentarios: ${mov.comentarios || 'N/A'}`);

                doc.moveDown(1);
                doc.moveTo(50, doc.y).lineTo(550,doc.y).stroke();
                doc.moveDown(1);
            });
        }
        doc.end();
    } catch (error) {
        if (!res.headersSent) {
            res.status(500).json({Mensaje: 'Error al generar el reporte'});
        }
    }
};

module.exports = {
    generarReporteHistorico
};