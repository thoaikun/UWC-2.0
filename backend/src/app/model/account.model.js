const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
require('dotenv').config()

const Model = require('./model')

class AccountModel extends Model {
    constructor() {
        super()
    }

    login(email, password, callback) {
        this.query(
            'SELECT * FROM account WHERE email = ?',
            [email]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('email doesn\'t exist');
                else {
                    let hash = results[0].password
                    return bcrypt.compare(password, hash)
                }
            })
            .then(isMatch => {
                if (!isMatch)
                    throw Error('password is not correct')
                else
                    return this.query(
                        'SELECT * FROM account A, worker W WHERE A.id = W.id AND A.email = ?',
                        [email]
                    )
            })
            .then(results => {
                let accessToken, refreshToken
                let role

                if (results.length === 0) {
                    accessToken = jwt.sign(
                        {
                            email: email,
                            role: 'back officer'
                        },
                        process.env.ACCESS_TOKEN_SECRET,
                        { expiresIn: '10m' }
                    )
                    refreshToken = jwt.sign(
                        {
                            email: email,
                            role: 'back officer'
                        },
                        process.env.REFRESH_TOKEN_SECRET,
                        { expiresIn: '1d' }
                    )
                    role = 'back officer'
                }
                else {
                    accessToken = jwt.sign(
                        {
                            email: email,
                            role: 'worker'
                        },
                        process.env.ACCESS_TOKEN_SECRET,
                        { expiresIn: '10m' }
                    )
                    refreshToken = jwt.sign(
                        {
                            email: email,
                            role: 'worker'
                        },
                        process.env.REFRESH_TOKEN_SECRET,
                        { expiresIn: '1d' }
                    )
                    role = 'worker'
                }

                return this.query(
                    'UPDATE account SET refreshToken = ? WHERE email = ?',
                    [refreshToken, email]
                )
                    .then(() => callback(200, true, 'login success', accessToken, refreshToken, role))
                    .catch(() => callback(400, false, 'something were wrong, please try again'))
            })
            .catch(error => {
                if (error.message === 'email doesn\'t exist')
                    callback(401, false, error.message)
                else if (error.message === 'password is not correct')
                    callback(401, false, error.message)
                else
                    callback(400, false, 'something were wrong, please try again')
            })
    }

    renewAccessToken(refreshToken, callback) {
        this.query(
            'SELECT * FROM account WHERE refreshToken = ?',
            [refreshToken]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('refresh token is not correct')
                else {
                    jwt.verify(
                        refreshToken,
                        process.env.REFRESH_TOKEN_SECRET,
                        (error, decoded) => {
                            console.log(decoded)
                            if (error || decoded.email !== results[0].email) {
                                callback(401, false, 'refresh token is not correct')
                            }
                            else {
                                const accessToken = jwt.sign(
                                    {
                                        email: results[0].email,
                                        role: decoded.role
                                    },
                                    process.env.ACCESS_TOKEN_SECRET,
                                    { expiresIn: '10m' }
                                )

                                callback(200, true, 'create new access token success', accessToken)
                            }
                        }
                    )
                }
            })
            .catch(error => callback(401, false, error.message))
    }

    logout(refreshToken, callback) {
        this.query(
            'UPDATE account SET refreshToken = null WHERE refreshToken = ?',
            [refreshToken]
        )
            .then(() => callback(200, true, 'logout success'))
            .catch((error) => callback(400, false, 'something were wrong, please try again'))
    }
}

module.exports = AccountModel