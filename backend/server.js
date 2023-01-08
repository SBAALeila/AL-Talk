const express = require('express')
const app = express()
const morgan = require('morgan')
const routes = require('./routes/index')
const cors = require('cors')
const connectDB = require('./config/db')
const passport = require('passport')
const bodyParser = require('body-parser')

connectDB()

if (process.env.NODE_ENV === 'development') {
    app.use(morgan('dev'))
}


const PORT = process.env.PORT || 3000

app.use(cors())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(routes)

app.listen(PORT,()=>{
    console.log(console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`)+PORT)
})