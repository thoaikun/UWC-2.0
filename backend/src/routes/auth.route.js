const express = require('express')
const router = express.Router()

const authController  = require('../app/controller/auth.controller')

router.post('/login', authController.login)
router.post('/renew', authController.renewAccessToken)
router.post('/logout', authController.logout)

module.exports = router