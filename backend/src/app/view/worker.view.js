class WorkerView {
    getAll(res, workers) {
        if (workers) {
            res.status(200).json({
                result: 'success',
                message: 'get all worker',
                size: workers.length,
                workers: workers
            })
        }
        else {
            res.status(400).json({
                result: 'success',
                message: 'something wrong happened, please try again',
                size: null,
                workers: null
            })
        }
    }

    get(res, status, worker) {
        if (worker) {
            res.status(status).json({
                result: 'success',
                message: 'get worker by id',
                worker: worker
            })
        }
        else {
            res.status(status).json({
                result: 'fail',
                message: 'id not exist, please check again',
            })
        }
    }

    update(res, status, result, message) {
        res.status(status).json({
            result: result ? 'success' : 'fail',
            message
        })
    }

    create(res, status, result, message, password) {
        res.status(status).json({
            result: result ? 'success' : 'fail',
            message,
            password
        })
    }

    changePassword(res, status, result, message) {
        res.status(status).json({
            result: result ? 'success' : 'fail',
            message
        })
    }

    delete(res, status, result, message) {
        res.status(status).json({
            result: result ? 'success' : 'fail',
            message
        })
    }
}

module.exports = WorkerView