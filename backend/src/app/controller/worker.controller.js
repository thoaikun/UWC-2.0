const WorkerModel = require('../model/worker.model')
const WorkerView = require('../view/worker.view')

const workerModel = new WorkerModel()
const workerView = new WorkerView()

class WorkerController {
    getAll(req, res) {
        workerModel.getAll((workers) => {
            workerView.getAll(res, workers)
        })
    }

    get(req, res) {
        let id = Number.parseInt(req.params.id)
        workerModel.get(id, (worker) => {
            workerView.get(res, worker)
        })
    }

    update(req, res) {
        let id = Number.parseInt(req.params.id)
        let editedWorker = req.body

        workerModel.update(id, editedWorker, (result, message) => {
            workerView.update(res, result, message)
        })
    }

    create(req, res) {
        let newWorker = req.body

        // create a random string password
        let password = (Math.random() + 1).toString(36).substring(5)
        newWorker.password = password

        workerModel.create(newWorker, (result, message) => {
            workerView.create(res, result, message)
        })
    }

    changePassword(req, res) {
        let id = Number.parseInt(req.params.id)
        let newPassword = req.body.newPassword
        let oldPassword = req.body.oldPassword
        workerModel.changePassword(id, oldPassword, newPassword, (result, message) => {
            workerView.changePassword(res, result, message)
        })
    }
}

module.exports = new WorkerController