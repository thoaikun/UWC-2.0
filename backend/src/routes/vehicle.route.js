const express = require('express')
const router = express.Router()
const verifyRole = require('../app/middleware/verifyRole')
const vehicleController = require('../app/controller/vehicle.controller')

router.get('/', verifyRole(['back officer']), vehicleController.getAll)
router.get('/:id', verifyRole(['back officer', 'worker']), vehicleController.get)
router.post('/create', verifyRole(['back officer']), vehicleController.create)
router.patch('/:id', verifyRole(['back officer']), vehicleController.update)
router.delete('/:id', verifyRole(['back officer']), vehicleController.delete)

module.exports = router