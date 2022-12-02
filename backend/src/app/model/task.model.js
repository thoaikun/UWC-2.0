const Model = require('./model')

class TaskModel extends Model {
    getAll(callback) {
        this.query(
            'SELECT T.id,\n' +
            '       T.createTime,\n' +
            '       T.workingTime,\n' +
            '       T.status,\n' +
            '       T.acceptTime,\n' +
            '       T.doneTime,\n' +
            '       T.routeId,\n' +
            '       BO.name AS createBy,\n' +
            '       WO.name AS doneBy\n' +
            'FROM task T,\n' +
            '     account BO,\n' +
            '     account WO\n' +
            'WHERE T.backofficerId = BO.id\n' +
            '  AND WO.id = T.workerId;'
        )
            .then(results => {
                callback(200,results)
            })
            .catch(error => {
                console.log(error)
                callback(400, null)
            })
    }

    get(id, callback) {
        this.query(
            'SELECT T.id,\n' +
            '       T.createTime,\n' +
            '       T.workingTime,\n' +
            '       T.status,\n' +
            '       T.acceptTime,\n' +
            '       T.doneTime,\n' +
            '       T.routeId,\n' +
            '       BO.name AS createBy,\n' +
            '       WO.name AS doneBy\n' +
            'FROM task T,\n' +
            '     account BO,\n' +
            '     account WO\n' +
            'WHERE T.backofficerId = BO.id\n' +
            '  AND WO.id = T.workerId ' +
            '  AND T.id = ?',
            [id]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('invalid id')
                else {
                    callback(200, results[0])
                }
            })
            .catch(error => {
                if (error.message === 'invalid id')
                    callback(404, null)
                else
                    callback(400, null)
            })
    }

    getByUser(userId, callback) {
        this.query(
            'CALL getTaskByWorker(?)',
            [userId]
        )
            .then(results => callback(200, results[0]))
            .catch(error => {
                if (error === 'invalid id')
                    callback(404, null)
                else
                    callback(400, null)
            })
    }

    create(workingTime, status, backofficerId, workerId, routeId, callback) {
        this.query(
            'CALL insertTask(?, ?, ?, ?, ?)',
            [workingTime, status, backofficerId, workerId, routeId]
        )
            .then(() => callback(200, 'task has been created'))
            .catch(error => callback(405, error))
    }

    updateAcceptTime(acceptTime, taskId, callback) {
        this.query(
            'CALL updateTaskAcceptTime(?,?)',
            [acceptTime, taskId]
        )
            .then(() => callback(200, 'accept time has been updated'))
            .catch(error => callback(405, error))
    }

    updateDoneTime(doneTime, taskId, callback) {
        this.query(
            'CALL updateTaskDoneTime(?,?)',
            [doneTime, taskId]
        )
            .then(() => callback(200, 'done time has been updated'))
            .catch(error => callback(405, error))
    }
}

module.exports = TaskModel