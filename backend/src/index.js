const express = require('express')
const path = require('path')
const cors = require('cors')
const morgan = require('morgan')
const route = require('./routes/index.route')

const port = 3000
const app = express()

// setting up the server
app.use(cors())
app.use(express.json()); 
app.use(express.urlencoded({ extended: false }));
app.use(morgan('combined'))
app.use(express.static(path.join(__dirname, '/public')))

// api document static path
app.use('/doc', express.static(path.join(__dirname, '/public/swagger/index.html')))

route(app)

app.listen(port, () => console.log(`Example app listening on port ${port}`))