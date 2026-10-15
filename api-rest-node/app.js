//#region OLD

require('dotenv').config()
const express = require('express')
const router = require('./routes/route')
var helmet = require('helmet');

const app = express()

// Config JSON response
app.use(express.json())
app.use('/', router)
app.use(helmet()); 
app.disable('x-powered-by');

const PORT = 3000
app.listen(PORT, () => { 
    console.log(`Servidor iniciado na porta: ${PORT}`) 
})

//#endregion


