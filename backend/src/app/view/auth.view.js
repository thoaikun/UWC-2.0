class AuthView {
    login(res, status, result, message, accessToken ,refreshToken, role) {
        res.status(status).json({
            result: result ? 'success' : 'fail',
            message,
            accessToken,
            refreshToken,
            role
        })
    }

    renewAccessToken(res, status, result, message, accessToken) {
        res.status(status).json({
            result: result ? 'success' : 'fail',
            message,
            accessToken
        })
    }

    logout(res, status, result, message) {
        res.status(status).json({
            result: result ? 'success' : 'fail',
            message
        })
    }
}

module.exports = AuthView