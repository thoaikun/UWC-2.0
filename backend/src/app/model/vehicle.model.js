const Model = require('./model')

class VehicleModel extends Model {
    constructor() {
        super()
    }

    getAll(callback) {
        this.conn.query(
            'SELECT id, carNumber, type, status, weight, fuelConsumption FROM vehicle',
            (error, results) => {
                if (error)
                    return callback(null)
                else    
                    return callback(results)
            }
        )
    }

    get(id, callback) {
        this.conn.query(
            'SELECT id, carNumber, type, status, weight, fuelConsumption FROM vehicle WHERE id = ?',
            [id],
            (error, results) => {
                if (error)
                    return callback(405, null)
                else if (results.length === 0)
                    return callback(404, null)
                else
                    return callback(200, results[0])
            }
        )
    }

    update(id, updateInfo, callback) {
        this.conn.query("SELECT id FROM vehicle WHERE id = ?", [id], 
        (error, results) => {
            // check if id exist 
            if (error || results.length === 0) return callback(404, "invalid ID")

            // check parameter in request
            let query = ""
            if (updateInfo.vehicleNumber !== undefined) {
                if (query !== "")
                    query = query.concat(", ")
                query = query.concat(`carNumber = '${updateInfo.vehicleNumber}'`)
            }

            if (updateInfo.type !== undefined) {
                if (query !== "")
                    query = query.concat(", ")
                query = query.concat(`type = '${updateInfo.type}'`)
            }

            if (updateInfo.status !== undefined) {
                if (query !== "")
                    query = query.concat(", ")
                query = query.concat(`status = '${updateInfo.status}'`)
            }

            if (updateInfo.weight !== undefined) {
                if (query !== "")
                    query = query.concat(", ")
                query = query.concat(`weight = ${updateInfo.weight}`)
            }

            if (updateInfo.fuelConsumption !== undefined) {
                if (query !== "")
                    query = query.concat(", ")
                query = query.concat(`fuelConsumption = ${updateInfo.fuelConsumption}`)
            }

            if (updateInfo.managedBy !== undefined) {
                if (query !== "")
                    query = query.concat(", ")
                query = query.concat(`backofficerId = ${updateInfo.managedBy}`)
            }

            // query database
            if (query !== "") {
                this.conn.query(`UPDATE vehicle SET ${query} WHERE id = ${id}`,
                (error, results) => {
                    if (error) 
                        return callback(405, "invalid input or something wrong happens")
                    else return callback(200, 'vehicle has been updated')
                })
            }
            else return callback(405, "empty input")
        })
    }

    create(newVehicle, callback) {
        // insert new account
        this.conn.query(    
            'INSERT INTO vehicle SET ?',
            {
                carNumber: newVehicle.vehicleNumber,
                type: newVehicle.type,
                status: newVehicle.status,
                weight: newVehicle.weight,
                fuelConsumption: newVehicle.fuelConsumption
            },
            (error, results) => {
                if (error)
                    callback(405, "invalid input or something wrong happens")
                else 
                    callback(200, null)
            }
        )
    }

    delete(id, callback) {
        this.conn.query("SELECT id FROM vehicle WHERE id = ?", [id],
        (error, results) => {
            if (error || results.length === 0) return callback(404, "invalid ID or something wrong happens")

            this.conn.query(
                `DELETE FROM vehicle WHERE id = ${id}`,
                (error, results) => {    
                    if (error) return callback(405, "something wrong happens")
                    else {
                        return callback(200, 'vehicle has been deleted')
                    }
                })
        })
    }
}

module.exports = VehicleModel