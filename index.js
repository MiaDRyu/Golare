require('dotenv').config();
const express = require('express');
const cors = require('cors');
const pool = require('./config/db');
const areaRoutes = require('./routes/areaRoutes');
const marcaRoutes = require('./routes/marcaRoutes');
const productoRoutes = require('./routes/productoRoutes');
const loteRoutes = require('./routes/loteRoutes');
const usuarioRoutes = require('./routes/usuarioRoutes');
const alertasRoutes = require('./routes/alertaRoutes');
const reporteRoutes = require('./routes/reporteRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());


app.use('/api/areas', areaRoutes);
app.use('/api/marcas', marcaRoutes);
app.use('/api/productos', productoRoutes);
app.use('/api/lotes',loteRoutes);
app.use('/api/usuarios',usuarioRoutes);
app.use('/api/alertas', alertasRoutes);
app.use('/api/reportes', reporteRoutes);

app.listen(PORT, () =>{
    console.log(`La app escucha en el puerto ${PORT}`);
});

