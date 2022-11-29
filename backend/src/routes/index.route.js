const authRoute = require('./auth.route')
const workerRoute = require('./worker.route')

const route = (app) => {
    app.use('/auth', authRoute)
    app.use('/worker', workerRoute)
}

module.exports = route