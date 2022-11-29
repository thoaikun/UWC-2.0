const express = require('express')
const router = express.Router()

const workerController = require('../app/controller/worker.controller')
const workerValidation = require('../app/middleware/workerValidation')
const passwordValidation = require('../app/middleware/passwordValidation')

router.get('/', workerController.getAll)
router.get('/:id', workerController.get)
router.patch('/:id', workerValidation, workerController.update)
router.delete('/:id', workerController.delete)
router.post('/create', workerController.create)
router.patch('/changePassword/:id', passwordValidation, workerController.changePassword)

module.exports = router