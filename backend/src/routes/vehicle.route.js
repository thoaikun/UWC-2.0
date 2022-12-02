const express = require('express')
const router = express.Router()

const vehicleController = require('../app/controller/vehicle.controller')

router.get('/', vehicleController.getAll)
router.get('/:id', vehicleController.get)
router.post('/create', vehicleController.create)
router.patch('/:id', vehicleController.update)
router.delete('/:id', vehicleController.delete)

module.exports = router