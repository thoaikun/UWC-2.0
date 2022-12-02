const TaskModel = require('../model/task.model')
const TaskView = require('../view/task.view')

const taskModel = new TaskModel()
const taskView = new TaskView()

class TaskController {
    getAll(req, res) {
        taskModel.getAll((status, tasks) => {
            taskView.getAll(res, status, tasks)
        })
    }

    get(req, res) {
        let id = Number.parseInt(req.params.id)
        taskModel.get(id, (status, task) => {
            taskView.get(res, status, task)
        })
    }

    getByUser(req, res) {
        let userId = Number.parseInt(req.params.userId)
        taskModel.getByUser(userId, (status, tasks) => {
            taskView.getByUser(res, status, tasks)
        })
    }

    create(req, res) {
        let workingTime = req.body.workingTime
        let status = req.body.status
        let backofficerId = Number.parseInt(req.body.createBy)
        let workerId = Number.parseInt(req.body.doneBy)
        let routeId = Number.parseInt(req.body.route)

        taskModel.create(workingTime, status, backofficerId, workerId, routeId, (status, message) => {
            taskView.create(res, status, message)
        })
    }

    updateAcceptTime(req, res) {
        let taskId = Number.parseInt(req.params.id)
        let acceptTime = req.body.acceptTime

        taskModel.updateAcceptTime(acceptTime, taskId, (status, message) => {
            taskView.updateAcceptTime(res, status, message)
        })
    }

    updateDoneTime(req, res) {
        let taskId = Number.parseInt(req.params.id)
        let doneTime = req.body.doneTime

        taskModel.updateDoneTime(doneTime, taskId, (status, message) => {
            taskView.updateDoneTime(res, status, message)
        })
    }
}

module.exports = new TaskController()