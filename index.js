require('dotenv').config();
const express = require('express');
const cors = require('cors');
const pool = require('./config/db');
const areaRoutes = require('./routes/areaRoutes');
const marcaRoutes = require('./routes/marcaRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());


app.use('/api/areas', areaRoutes);
app.use('/api/marcas', marcaRoutes);


app.listen(PORT, () =>{
    console.log(`La app escucha en el puerto ${PORT}`);
});

