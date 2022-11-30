const randexp = require('randexp')
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
        workerModel.get(id, (status, worker) => {
            workerView.get(res, status, worker)
        })
    }

    update(req, res) {
        console.log(req.body)
        let id = Number.parseInt(req.params.id)
        let editedWorker = req.body

        workerModel.update(id, editedWorker, (status, result, message) => {
            workerView.update(res, status, result, message)
        })
    }

    create(req, res) {
        let newWorker = req.body

        // create a random string password
        let password = new randexp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$/).gen()
        newWorker.password = password

        workerModel.create(newWorker, (status, result, message, password) => {
            workerView.create(res, status, result, message, password)
        })
    }

    changePassword(req, res) {
        let id = Number.parseInt(req.params.id)
        let newPassword = req.body.newPassword
        let oldPassword = req.body.oldPassword
        workerModel.changePassword(id, oldPassword, newPassword, (status, result, message) => {
            workerView.changePassword(res, status, result, message)
        })
    }

    delete(req, res) {
        let id = Number.parseInt(req.params.id)
        workerModel.delete(id, (status, result, message) => {
            workerView.delete(res, status, result, message)
        })
    }
}

module.exports = new WorkerController