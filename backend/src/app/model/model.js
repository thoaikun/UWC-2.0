const mysql = require('mysql')

const database = {
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'uwc'
}

class Model {
    constructor() {
        this.conn = mysql.createConnection(database)
        this.conn.connect()
    }

    query(query, arr) {
        let databaseQuery;
        databaseQuery = new Promise((resolve, reject) => {
            this.conn.query(
                query,
                arr,
                (error, results) => {
                    if (error)
                       reject(error.sqlMessage)
                    else
                        resolve(results)
                }
            )
        });

        return databaseQuery
    }
}

module.exports = Model