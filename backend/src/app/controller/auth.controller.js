const AccountModel = require('../model/account.model')
const AuthView = require('../view/auth.view')
const {auth} = require("mysql/lib/protocol/Auth");

const accountModel = new AccountModel()
const authView = new AuthView()

class AuthController {
    login(req, res) {
        let email = req.body.email
        let password = req.body.password

        accountModel.login(email, password, (status, result, message, accessToken, refreshToken, role) => {
            authView.login(res, status, result, message, accessToken, refreshToken, role)
        })
    }

    renewAccessToken(req, res) {
        let refreshToken = req.body.refreshToken

        accountModel.renewAccessToken(refreshToken, (status, result, message, accessToken) => {
            authView.renewAccessToken(res, status, result, message, accessToken)
        })
    }

    logout(req, res) {
        let refreshToken = req.body.refreshToken

        accountModel.logout(refreshToken, (status, result, message) => {
            authView.logout(res, status, result, message)
        })
    }
}

module.exports = new AuthController