const authRoute = require('./auth.route')
const workerRoute = require('./worker.route')
const mcpRoute = require('./mcp.route')
const vehicleRoute = require('./vehicle.route')
const taskRoute = require('./task.route')
const routeRoute = require('./route.route')

const route = (app) => {
    app.use('/auth', authRoute)
    app.use('/worker', workerRoute)
    app.use('/mcp', mcpRoute)
    app.use('/vehicle', vehicleRoute)
    app.use('/task', taskRoute)
    app.use('/route', routeRoute)
}

module.exports = route