const bcrypt = require('bcrypt')
const Model = require('./model')

class WorkerModel extends Model {
    constructor() {
        super()
    }

    getAll(callback) {
        this.conn.query(
            'SELECT W.id, A.name, A.email, A.phone, W.fCollector, W.fJanitor FROM worker W, account A WHERE A.id = W.id', 
            (error, results) => {
                if (error)
                    return callback(null)
                else    
                    return callback(results)
            }
        )
    }

    get(id, callback) {
        this.conn.query(
            'SELECT W.id, A.name, A.email, A.phone, W.fCollector, W.fJanitor FROM worker W, account A WHERE A.id = W.id AND W.id = ?',
            [id],
            (error, results) => {
                if (error || results.length === 0)
                    return callback(404, null)
                else
                    return callback(200, results[0])
            }
        )
    }

    update(id, editedWorker, callback) {
        this.conn.query(
            `SELECT isIdExist(${id})`,
            (error, results) => {
                if (results[0][`isIdExist(${id})`] === 0)
                    callback(404, false, 'Invalid id')
                else {
                    if (editedWorker.role != undefined) {
                        let query = ''
                        if (editedWorker.role == 'collector')
                            query = `UPDATE worker W SET W.fCollector = 1, W.fJanitor = 0 WHERE W.id = ${id}`
                        else
                            query = `UPDATE worker W SET W.fCollector = 0, W.fJanitor = 1 WHERE W.id = ${id}`
                        this.conn.query(
                            query,
                            (error) => {
                                if (error)
                                    callback(400, false, 'Something wrong happened, please try again')
                            }
                        )
                    }
                    if (editedWorker.email != undefined) {
                        let query = ''
                        query = `UPDATE account A SET A.email = '${editedWorker.email}' WHERE A.id = ${id}`
                        this.conn.query(
                            query,
                            (error) => {
                                if (error)
                                    callback(400, false, 'Something wrong happened, please try again')
                            }
                        )
                    }
                    if (editedWorker.name != undefined) {
                        let query = ''
                        query = `UPDATE account A SET A.name = '${editedWorker.name}' WHERE A.id = ${id}`
                        this.conn.query(
                            query,
                            (error) => {
                                if (error)
                                    callback(400, false, 'Something wrong happened, please try again')
                            }
                        )
                    }
                    if (editedWorker.phone != undefined) {
                        let query = ''
                        query = `UPDATE account A SET A.phone = '${editedWorker.phone}' WHERE A.id = ${id}`
                        this.conn.query(
                            query,
                            (error) => {
                                if (error)
                                    callback(400, false, 'Something wrong happened, please try again')
                            }
                        )
                    }

                    callback(200, true, 'update success')
                }
            }
        )
    }

    create(newWorker, callback) {
        console.log(newWorker)

        bcrypt.hash(newWorker.password, 7)
            .then(hash => 
                // insert new account
                this.conn.query(    
                    'INSERT INTO account SET ?',
                    {
                        name: newWorker.name,
                        email: newWorker.email,
                        phone: newWorker.phone,
                        password: hash
                    },
                    (error, results) => {
                        if (error)
                            callback(false, 'Something wrong happened, please try again')
                        else {
                            this.conn.query(
                                'INSERT INTO worker  VALUES (?, ?, ?)',
                                [results.insertId, newWorker.role === 'collector' ? true : false, newWorker.role !== 'collector' ? true : false],
                                (error) => {
                                    if (error)
                                        callback(false, 'Something wrong happened, please try again')
                                    else
                                        callback(true, 'Create success')
                                }
                            )
                        }
                    }
                )
            )
    }

    changePassword(id, oldPassword, newPassword, callback) {
        // check old password
        this.conn.query(
            'SELECT * FROM account WHERE id = ?', 
            [id],
            (error, results) => {
                if (error || results.length === 0)
                    callback(404, false, 'Invalid id')
                else {
                    bcrypt.compare(oldPassword, results[0]['password'])
                        .then(isMatch => {
                            if (!isMatch)
                                callback(406, false, 'old password is not correct')
                            else {
                                bcrypt.hash(newPassword, 7)
                                    .then(hash => {
                                        // update new password
                                        this.conn.query(
                                            'UPDATE account SET password = ? WHERE id = ?',
                                            [hash, id],
                                            (error) => {
                                                if (error)
                                                    callback(400, false, 'something wrong happened, please try again')
                                                callback(200, true, 'change password success')
                                            }
                                        )
                                    })
                            }
                        })
                }
            }
        )
    }

    delete(id, callback) {
        this.conn.query(
            `SELECT isIdExist(${id})`,
            (error, results) => {
                console.log(results)
                if (results[0][`isIdExist(${id})`] === 0)
                    callback(404, false, 'Invalid id')
                else {
                    this.conn.query(
                        'DELETE FROM account WHERE id = ?',
                        [id],
                        (error2) => {
                            if (error2) {
                                console.log(error2)
                                callback(400, false, 'something wrong happened, please try again')
                            }
                            else
                                callback(200, true, 'delete success')
                        }
                    )
                }
            }
        )
    }
}

module.exports = WorkerModel