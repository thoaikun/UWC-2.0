class VehiceView {
    getAll(res, vehicles) {
        if (vehicles) {
            res.status(200).json({
                result: 'success',
                message: 'get all vehicles',
                size: vehicles.length,
                vehicles: vehicles
            })
        }
        else {
            res.status(400).json({
                result: 'fail',
                message: 'something wrong happened, please try again',
                size: null,
                workers: null
            })
        }
    }

    get(res, status, vehicle) {
        if (vehicle) {
            res.status(status).json({
                result: 'success',
                message: 'get vehicle by id',
                vehicle: vehicle
            })
        }
        else {
            res.status(status).json({
                result: 'fail',
                message: 'id not exist or something wrong happend',
            })
        }
    }

    update(res, status, message) {
        res.status(status).json({
            result: status==200 ? 'success' : 'fail',
            message: message
        })
    }

    create(res, status, message) {
        res.status(status).json({
            result: status==200 ? 'success' : 'fail',
            message: message
        })
    }

    delete(res, status, message) {
        res.status(status).json({
            result: status==200 ? 'success' : 'fail',
            message: message
        })
    }
}

module.exports = VehicleView