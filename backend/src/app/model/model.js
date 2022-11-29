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
}

module.exports = Model