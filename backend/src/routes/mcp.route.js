const express = require('express');
const router = express.Router();

//import controller and middleware for mcp
const mcpController = require('../app/controller/mcp.controller')

router.get('/', mcpController.getAll)
router.get('/:id', mcpController.get)
router.patch('/updateStatus/:id', mcpController.updateStatus)
router.patch('/updateCapacity/:id', mcpController.updateCapacity)

module.exports = router
