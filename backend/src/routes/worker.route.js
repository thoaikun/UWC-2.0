const express = require('express')
const router = express.Router()

const workerController = require('../app/controller/worker.controller')
const workerValidation = require('../app/middleware/workerValidation')
const passwordValidation = require('../app/middleware/passwordValidation')

router.get('/', workerController.getAll)
router.get('/:id', workerController.get)
router.patch('/edit/:id', workerValidation, workerController.update)
router.post('/create', workerController.create)
router.patch('/changePassword/:id', passwordValidation, workerController.changePassword)

module.exports = router