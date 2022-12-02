const RouteModel = require('../model/route.model')
const RouteView = require('../view/route.view')

const routeModel = new RouteModel()
const routeView = new RouteView()

class RouteController {
    getAll(req, res) {
        routeModel.getAll((status, routes) => {
            routeView.getAll(res, status, routes)
        })
    }

    get(req, res) {
        let id = Number.parseInt(req.params.id)
        routeModel.get(id, (status, route) => {
            routeView.get(res, status, route)
        })
    }

    create(req, res) {

    }

    delete(req, res) {
        let id = Number.parseInt(req.params.id)
        routeModel.delete(id, (status, message) => {
            routeView.delete(res, status, message)
        })
    }
}

module.exports = new RouteController()