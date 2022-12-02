class RouteView {
    getAll(res, status, routes) {
        if (routes)
            res.status(status).json({
                result: 'success',
                message: 'get all route',
                size: routes.length,
                routes
            })
        else
            res.status(status).json({
                result: 'fail',
                message: 'something were wrong, please try again'
            })
    }

    get(res, status, route) {
        if (route)
            res.status(status).json({
                result: 'success',
                message: 'get route by id',
                route
            })
        else {
            if (status === 404)
                res.status(status).json({
                    result: 'fail',
                    message: 'invalid id'
                })
            else
                res.status(status).json({
                    result: 'fail',
                    message: 'something were wrong, please try again'
                })
        }
    }

    delete(res, status, message) {
        res.status(status).json({
            result: status === 200 ? 'success' : 'fail',
            message
        })
    }
}

module.exports = RouteView