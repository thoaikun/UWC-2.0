import * as express from 'express'
import * as morgan from 'morgan'
import * as cors from 'cors'
import * as path from 'path'

const port = 3000
const app = express()

// setting up the server
app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: false }));
app.use(morgan('combined'))
app.use(express.static(path.join(__dirname, 'public')))

app.listen(port, () => console.log('Server listen on port', port))