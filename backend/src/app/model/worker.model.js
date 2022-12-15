const bcrypt = require('bcrypt')
const Model = require('./model')

class WorkerModel extends Model {
    constructor() {
        super()
    }

    getAll(callback) {
        this.query(
            'SELECT W.id, A.name, A.email, A.phone, W.fCollector, W.fJanitor FROM worker W, account A WHERE A.id = W.id',
        )
            .then(results => callback(results))
            .catch((error) => {
                console.log(error)
                callback(null)
            })
    }

    get(id, callback) {
        this.query(
            'SELECT W.id, A.name, A.email, A.phone, W.fCollector, W.fJanitor FROM worker W, account A WHERE A.id = W.id AND W.id = ?',
            [id]
        )
            .then(results => {
                if (results.length === 0)
                    callback(404, null)
                else
                    callback(200, results[0])
            })
            .catch(() => callback(404, null))
    }

    getInfoByEmail(email, callback) {
        this.query(
            'SELECT * FROM account WHERE email=?',
            [email]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('Email doesn\'t exists')
                else 
                    callback(200, results[0])
            })
            .catch(error => {
                if (error.message === 'Email doesn\'t exists')
                    callback(405, null, error.message)
                else 
                    callback(400, null, 'Something were wrong, please try again')
            })
    }

    update(id, editedWorker, callback) {
        this.query(
            `SELECT * FROM account WHERE id = ?`,
            [id]
        )
            .then(results => {
                if (!id || results.length === 0)
                    throw  Error('invalid id')
                else {
                    if (editedWorker.role !== undefined) {
                        let query = ''
                        if (editedWorker.role === 'collector')
                            query = `UPDATE worker W SET W.fCollector = 1, W.fJanitor = 0 WHERE W.id = ${id}`
                        else
                            query = `UPDATE worker W SET W.fCollector = 0, W.fJanitor = 1 WHERE W.id = ${id}`

                        this.query(query)
                            .catch((error) => {
                                console.log(error)
                                callback(400, false, 'Something wrong happened, please try again')
                            })
                    }
                    if (editedWorker.email !== undefined) {
                        let query = ''
                        query = `UPDATE account A SET A.email = '${editedWorker.email}' WHERE A.id = ${id}`
                        this.query(query)
                            .catch((error) => {
                                console.log(error)
                                callback(400, false, 'Something wrong happened, please try again')
                            })
                    }
                    if (editedWorker.name !== undefined) {
                        let query = ''
                        query = `UPDATE account A SET A.name = '${editedWorker.name}' WHERE A.id = ${id}`
                        this.query(query)
                            .catch((error) => {
                                console.log(error)
                                callback(400, false, 'Something wrong happened, please try again')
                            })
                    }
                    if (editedWorker.phone !== undefined) {
                        let query = ''
                        query = `UPDATE account A SET A.phone = '${editedWorker.phone}' WHERE A.id = ${id}`
                        this.query(query)
                            .catch((error) => {
                                console.log(error)
                                callback(400, false, 'Something wrong happened, please try again')
                            })
                    }

                    callback(200, true, 'update success')
                }
            })
            .catch(error => {
                console.log(error);
                if (error.message === 'invalid id')
                    callback(404, false, error.message)
                else
                    callback(400, false, 'Something wrong happened, please try again')
            })
    }

    create(newWorker, callback) {
        bcrypt.hash(newWorker.password, 7)
            .then(hash => this.query(
                'INSERT INTO account SET ?',
                {
                    name: newWorker.name,
                    email: newWorker.email,
                    phone: newWorker.phone,
                    password: hash
                }
            ))
            .then(results => this.query(
                'INSERT INTO worker  VALUES (?, ?, ?)',
                [results.insertId, newWorker.role === 'collector', newWorker.role !== 'collector']
            ))
            .then(() => callback(200, true, 'Create success', newWorker.password))
            .catch((error) => {
                if (error.includes('Duplicate entry'))
                    callback(400, false, 'email has been used', undefined)
                else
                    callback(400, false, 'something wrong happened, please try again', undefined)
            })
    }

    changePassword(id, oldPassword, newPassword, callback) {
        this.query(
            'SELECT * FROM account WHERE id = ?',
            [id]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('invalid id')
                else
                    return  bcrypt.compare(oldPassword, results[0]['password'])
            })
            .then(isMatch => {
                if (!isMatch)
                    throw Error('old password is not correct')
                else
                    return bcrypt.hash(newPassword, 7)
            })
            .then(hash => this.query(
                'UPDATE account SET password = ? WHERE id = ?',
                [hash, id],
            ))
            .then(() => callback(200, true, 'change password success'))
            .catch(error => {
                if (error.message === 'invalid id')
                    callback(400, false, error.message)
                else if (error.message === 'old password is not correct')
                    callback(405, false, error.message)
                else
                    callback(400, false, 'something wrong was happened, please try again')
            })
    }

    delete(id, callback) {
        this.query(
            `SELECT * FROM account WHERE id = ?`,
            [id]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('invalid id')
                else
                    return this.query(
                        'DELETE FROM account WHERE id = ?',
                        [id],
                    )
            })
            .then(() => {
                callback(200, true, 'delete success')
            })
            .catch(error => {
                console.log(error);
                if (error.message === 'invalid id')
                    callback(406, false, error.message)
                else
                    callback(400, false, 'something wrong happened, please try again')
            })
    }
}

module.exports = WorkerModel