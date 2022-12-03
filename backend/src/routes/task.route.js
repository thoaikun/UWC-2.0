const express = require('express')
const router = express.Router()
const verifyRole = require('../app/middleware/verifyRole')
const taskController = require('../app/controller/task.controller')

router.get('/', taskController.getAll)
router.get('/:id', verifyRole(['back officer', 'worker']), taskController.get)
router.get('/user/:userId', verifyRole(['back officer', 'worker']), taskController.getByUser)
router.post('/create', verifyRole(['back officer']), taskController.create)
router.patch('/updateAcceptTime/:id', verifyRole(['worker']), taskController.updateAcceptTime)
router.patch('/updateDoneTime/:id', verifyRole(['worker']), taskController.updateDoneTime)

module.exports = router