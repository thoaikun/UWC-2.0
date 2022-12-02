const Model = require('./model')

class RouteModel extends Model {
    getAll(callback) {
        this.query(
            'SELECT * FROM route ORDER BY id ASC'
        )
            .then(results => {
                let routes = []

                let length = results.length
                for (let i=0; i < length; i++) {
                    let routeId = results[i].id

                    let route = {}
                    this.query(
                        'SELECT * FROM route WHERE id = ?',
                        [routeId]
                    )
                        .then(results => {
                            route = {...results[0]}
                            return this.query(
                                'SELECT RD.id, RD.roadName, RD.startPoint, RD.endPoint, RD.distance FROM route R, road RD WHERE R.id = RD.routeId AND R.id=?',
                                [routeId]
                            )
                        })
                        .then(results => {
                            route.paths = [...results]

                            return this.query(
                                'SELECT M.id, M.status, M.address FROM mcp M, mcpinroute MCR, route R WHERE R.id = MCR.routeId AND M.id = MCR.mcpId AND R.id = ?',
                                [routeId]
                            )
                        })
                        .then(results => {
                            route.mcps = [...results]
                            routes.push(route)
                            if (i === length - 1)
                                callback(200, routes)
                        })
                        .catch(error => console.log(error))
                }
            })
            .catch(error => callback(400, null))
    }

    get(id, callback) {
        let route = {}

        this.query(
            'SELECT * FROM route WHERE id = ?',
            [id]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('invalid id')
                else {
                    route = {...results[0]}
                    return this.query(
                        'SELECT RD.id, RD.roadName, RD.startPoint, RD.endPoint, RD.distance FROM route R, road RD WHERE R.id = RD.routeId AND R.id=?',
                        [id]
                    )
                }
            })
            .then(results => {
                route.paths = [...results]

                return this.query(
                    'SELECT M.id, M.status, M.address FROM mcp M, mcpinroute MCR, route R WHERE R.id = MCR.routeId AND M.id = MCR.mcpId AND R.id = ?',
                    [id]
                )
            })
            .then(results => {
                route.mcps = [...results]

                callback(200, route)
            })
            .catch(error => {
                if (error.message === 'invalid id')
                    callback(404, null)
                else
                    callback(400, null)
            })
    }



    delete(id, callback) {
        this.query(
            'SELECT * FROM route WHERE id = ?',
            [id]
        )
            .then(results => {
                if (results.length === 0)
                    throw Error('invalid id')
                else {
                    return this.query(
                        'DELETE FROM route WHERE id = ?',
                        [id]
                    )
                }
            })
            .then(() => callback(200, 'route has been deleted'))
            .catch(error => {
                if (error.message === 'invalid id')
                    callback(404, error.message)
                else
                    callback(400, 'something wrong were happened, please try again')
            })
    }
}

module.exports = RouteModel