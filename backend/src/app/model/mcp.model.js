const Model = require('./model')

class McpModel extends Model {
    constructor() {
        super()
    }

    getAll(callback) {              //callback(result)
        this.conn.query(
            'SELECT m.id, m.totalCapacity, m.status, m.address, m.inUse FROM mcp m',
            (error, result) => {
                if (error) 
                    return callback(null);
                else
                    return callback(result)
                
            }
        )
    }

    get(id, callback){              //id: int, callback(code, result)
        this.conn.query(
            'SELECT m.id, m.totalCapacity, m.status, m.address, m.inUse FROM mcp m WHERE m.id = ?',
            [id],
            (error, result) => {
                if (error || result.length === 0) 
                    return callback(404, null)          // id not found
                else
                    return callback(200, result[0])
            }
        )
    }


    updateStatus(id, status, callback) {        //id: int, status: string, callback(code)        
        this.conn.query(
            'SELECT m.id FROM mcp m WHERE m.id = ?',
            [id],
            (error, result) => {
                if (error || result.length === 0)
                    return callback(404)          // id not found
                else if (status === undefined || ['ONLINE', 'DISCONNECTED', 'OFFLINE'].indexOf(status) === -1)
                        return callback(405)      // invalid status
                else {
                    this.conn.query(
                        'UPDATE mcp SET status =? WHERE id =?',
                        [status, id],
                        (error, result) => {
                            if (error)
                                return callback(400)
                            else
                                return callback(200)
                        }
                    )
                }
                
            }
            
        )
    }


    updateCapacity(id, capacity, callback) {        //int: id, capacity: float, callback(code)
        this.conn.query(
            'SELECT m.id FROM mcp m WHERE m.id = ?',
            [id],
            (error, result) => {
                if (error || result.length === 0)
                    return callback(404)          // id not found
                else if (capacity === undefined || capacity < 0)
                        return callback(405)      // invalid capacity
                else {
                    this.conn.query(
                        'UPDATE mcp SET totalCapacity =? WHERE id =?',
                        [capacity, id],
                        (error, result) => {
                            if (error)
                                return callback(400)
                            else
                                return callback(200)
                        }
                    )
                }
                
            }
            
        )
    }

}

module.exports = McpModel