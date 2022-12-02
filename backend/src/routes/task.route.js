const express = require('express')
const router = express.Router()

const taskController = require('../app/controller/task.controller')

router.get('/', taskController.getAll)
router.get('/:id', taskController.get)
router.get('/user/:userId', taskController.getByUser)
router.post('/create', taskController.create)
router.patch('/updateAcceptTime/:id', taskController.updateAcceptTime)
router.patch('/updateDoneTime/:id', taskController.updateDoneTime)

module.exports = router