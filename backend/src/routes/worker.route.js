const express = require('express')
const router = express.Router()

const workerController = require('../app/controller/worker.controller')
const workerValidation = require('../app/middleware/workerValidation')
const emailValidation = require('../app/middleware/emailValidation')
const passwordValidation = require('../app/middleware/passwordValidation')

router.get('/', workerController.getAll)
router.get('/:id', workerController.get)
router.delete('/:id', workerController.delete)
router.patch('/changePassword/:id', passwordValidation, workerController.changePassword)

router.use(emailValidation, workerValidation)
router.post('/create', workerController.create)
router.patch('/:id', workerController.update)

module.exports = router