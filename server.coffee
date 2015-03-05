express = require 'express'
teacup = require 'teacup/lib/express'
nib = require 'nib'
cson = require 'cson'

# express
app = express()

# teacup
app.set 'view engine', 'coffee'
app.engine 'coffee', teacup.renderFile

# client files
app.use express.static "#{process.cwd()}/public"
app.use express.static "#{process.cwd()}/build"
app.use '/lib', express.static("#{process.cwd()}/bower_components")

# dev livereload
app.use require('connect-livereload')({port: 35729}) if 'dev' in process.argv

# routes
app.get '/', (req, res) ->
  me = cson.parseFileSync 'me.cson'

  fonts = [
    'http://fonts.googleapis.com/css?family=Open+Sans:600'
    'http://fonts.googleapis.com/css?family=Lato:400,300italic'
    '/css/fontello.css'
  ]

  mins = [
    '/lib/jquery/dist/jquery.min.js'
    '/lib/jquery-cycle2/build/jquery.cycle2.min.js'
    '/lib/jquery-cycle2/build/plugin/jquery.cycle2.swipe.min.js'
    '/lib/fastclick/lib/fastclick.js'
  ]

  res.render 'index', {data: me, fonts: fonts, scripts: mins}

port = process.env.PORT or 3000
app.listen port, ->
  console.log 'listening on ', port
