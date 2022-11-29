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

    get(res, worker) {
        if (worker) {
            res.status(200).json({
                result: 'success',
                message: 'get worker by id',
                worker: worker
            })
        }
        else {
            res.status(404).json({
                result: 'fail',
                message: 'id not exist, please check again',
                workers: null
            })
        }
    }

    update(res, result, message) {
        res.status(result ? 200 : 400).json({
            result: result ? 'success' : 'fail',
            message
        })
    }

    create(res, result, message) {
        res.status(result ? 200 : 400).json({
            result: result ? 'success' : 'fail',
            message
        })
    }

    changePassword(res, result, message) {
        res.status(result ? 200 : 400).json({
            result: result ? 'success' : 'fail',
            message
        })
    }


}

module.exports = WorkerView