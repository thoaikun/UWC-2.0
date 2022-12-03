const express = require('express')
const router = express.Router()
const verifyRole = require('../app/middleware/verifyRole')
const verifyJWT = require('../app/middleware/verifyJWT')
const routeController = require('../app/controller/route.controller')

router.get('/', verifyRole(['back officer']) , routeController.getAll)
router.get('/:id', verifyRole(['back officer', 'worker']), routeController.get)
router.post('/create', verifyRole(['back officer']), routeController.create)
router.delete('/:id', verifyRole(['back officer']), routeController.delete)

module.exports = router