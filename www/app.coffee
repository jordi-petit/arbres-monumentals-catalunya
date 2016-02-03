express = require "express"
path = require "path"
favicon = require "serve-favicon"
logger = require "morgan"
cookieParser = require "cookie-parser"
bodyParser = require "body-parser"
debug = require("debug") "arbres-www"

index = require "./routes/index"
consells = require "./routes/consells"
presentacio = require "./routes/presentacio"
quant_a = require "./routes/quant_a"

app = express()

# view engine setup
app.set "views", path.join __dirname, "views"
app.set "view engine", "jade"


app.use favicon "#{__dirname}/public/favicon.ico"
app.use logger "dev"
app.use bodyParser.json()
app.use bodyParser.urlencoded
  extended: false
app.use cookieParser()
app.use require("stylus").middleware path.join __dirname, "public"
app.use "/", express.static path.join __dirname, "public"
app.use "/bower_components", express.static path.join __dirname, "bower_components"

app.use "/", index
app.use "/consells", consells
app.use "/presentacio", presentacio
app.use "/quant_a", quant_a

# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error "Not Found"
  err.status = 404
  next err

# error handlers

# development error handler
# will print stacktrace
if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
      message: err.message,
      error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render "error",
    message: err.message,
    error: {}

module.exports = app

debug "Hola"
