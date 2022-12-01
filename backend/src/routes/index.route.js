const authRoute = require('./auth.route')
const workerRoute = require('./worker.route')
const mcpRoute = require('./mcp.route')

const route = (app) => {
    app.use('/auth', authRoute)
    app.use('/worker', workerRoute)
    app.use('/mcp', mcpRoute)
}

module.exports = route