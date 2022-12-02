const express = require('express')
const router = express.Router()

const routeController = require('../app/controller/route.controller')

router.get('/', routeController.getAll)
router.get('/:id', routeController.get)
router.post('/create', routeController.create)
router.delete('/:id', routeController.delete)

module.exports = router