const express = require('express')
const router = express.Router()
const VeiculoController = require('../controllers/VeiculoController')
const rateLimit = require('express-rate-limit')

const apiRequestLimiter = rateLimit({ 
    windowMs: 1 * 60 * 1000, // 1 minuto 
    máximo: 2, // limita cada IP a 2 solicitações por manipulador de windowMs 
})

// router.post('/add',apiRequestLimiter, UserController.Add)
// router.get('/get/:id',apiRequestLimiter, UserController.GetById)
// router.post('/login',apiRequestLimiter, UserController.Login)
// router.post('/authAdd',apiRequestLimiter, UserController.AuthAdd)
// router.post('/forgotPassword',apiRequestLimiter, UserController.ForgotPassword)
// router.post('/changePassword',apiRequestLimiter, UserController.ChangePassword)
router.get('/get', apiRequestLimiter, VeiculoController.Get)
router.get('/update/:ID&:Multiplicador', apiRequestLimiter, VeiculoController.Update)

router.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});


module.exports = router

