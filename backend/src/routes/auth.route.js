const express = require('express')
const router = express.Router()

const emailValidation = require('../app/middleware/emailValidation')
const passwordValidation = require('../app/middleware/passwordValidation')

const authController  = require('../app/controller/auth.controller')

router.post('/login', emailValidation, authController.login)
router.post('/renew', authController.renewAccessToken)
router.patch('/logout', authController.logout)

module.exports = router