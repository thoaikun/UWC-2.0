class TaskView {
    getAll(res, status, tasks) {
        if (tasks)
            res.status(status).json({
                result: 'success',
                message: 'get all tasks',
                size: tasks.length,
                tasks
            })
        else
            res.status(status).json({
                result: 'fail',
                message: 'something wrong were happened, please try again'
            })
    }

    get(res, status, task) {
        if (task)
            res.status(status).json({
                result: 'success',
                message: 'get task by id',
                task
            })
        else {
            if (status === 400)
                res.status(status).json({
                    result: 'fail',
                    message: 'something wrong were happened, please try again'
                })
            else if (status === 404)
                res.status(status).json({
                    result: 'fail',
                    message: 'invalid id'
                })
        }
    }

    getByUser(res, status, tasks) {
        if (tasks)
            res.status(status).json({
                result: 'success',
                message: 'get all tasks by worker id',
                size: tasks.length,
                tasks
            })
        else {
            if (status === 400)
                res.status(status).json({
                    result: 'fail',
                    message: 'something wrong were happened, please try again'
                })
            else if (status === 404)
                res.status(status).json({
                    result: 'fail',
                    message: 'invalid id'
                })
        }
    }

    getTaskByDate(res, status, tasks) {
        if (tasks) {
            res.status(status).json({
                result: 'success',
                message: 'get all tasks by worker id at a date',
                size: tasks.length,
                tasks
            })
        }
        else {
            if (status === 400)
                res.status(status).json({
                    result: 'fail',
                    message: 'something wrong were happened, please try again'
                })
            else if (status === 404)
                res.status(status).json({
                    result: 'fail',
                    message: 'invalid id'
                })
        }
    }

    create(res, status, message) {
        res.status(status).json({
            result: status === 200 ? 'success' : 'fail',
            message
        })
    }

    updateAcceptTime(res, status, message) {
        res.status(status).json({
            result: status === 200 ? 'success' : 'fail',
            message
        })
    }

    updateDoneTime(res, status, message) {
        res.status(status).json({
            result: status === 200 ? 'success' : 'fail',
            message
        })
    }
}

module.exports = TaskView