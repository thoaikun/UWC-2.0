const express = require('express')
const router = express.Router()

const workerController = require('../app/controller/worker.controller')
const workerValidation = require('../app/middleware/workerValidation')
const emailValidation = require('../app/middleware/emailValidation')
const passwordValidation = require('../app/middleware/passwordValidation')
const verifyRole = require('../app/middleware/verifyRole')

router.get('/', verifyRole(['back officer']), workerController.getAll)
router.get('/getIdByEmail', verifyRole(['back officer', 'worker']), workerController.getIdByEmail)
router.get('/:id', verifyRole(['back officer', 'worker']), workerController.get)
router.delete('/:id', verifyRole(['back officer']), workerController.delete)
router.patch('/changePassword/:id', verifyRole(['worker']), passwordValidation, workerController.changePassword)

router.use(verifyRole(['back officer']))
router.use(emailValidation, workerValidation)
router.post('/create', workerController.create)
router.patch('/:id', workerController.update)

module.exports = router