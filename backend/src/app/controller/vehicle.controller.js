const VehicleModel = require('../model/vehicle.model')
const VehicleView = require('../view/vehicle.view')

const vehicleModel = new VehicleModel()
const vehicleView = new VehicleView()

class WorkerController {
    getAll(req, res) {
        vehicleModel.getAll((vehicles) => {
            vehicleView.getAll(res, vehicles)
        })
    }

    get(req, res) {
        let id = Number.parseInt(req.params.id)
        vehicleModel.get(id, (status, vehicle) => {
            vehicleView.get(res, status, vehicle)
        })
    }

    update(req, res) {
        let id = Number.parseInt(req.params.id)
        let editedVehicle = req.body

        vehicleModel.update(id, editedWorker, (status, message) => {
            vehicleView.update(res, status, message)
        })
    }

    create(req, res) {
        let newVehicle = req.body

        vehicleModel.create(newVehicle, (status, message) => {
            vehicleView.create(res, status, message)
        })
    }

    delete(req, res) {
        let id = Number.parseInt(req.params.id)
        vehicleModel.delete(id, (status, message) => {
            vehicleView.delete(res, status, message)
        })
    }
}

module.exports = new VehicleController