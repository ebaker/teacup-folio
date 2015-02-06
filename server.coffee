express = require 'express'
teacup = require 'teacup/lib/express'
nib = require 'nib'
assets = require 'teacup/lib/connect-assets'
cson = require 'cson'

# express
app = express()

# teacup
app.set 'view engine', 'coffee'
app.engine 'coffee', teacup.renderFile

# client files
app.use express.static "#{process.cwd()}/public"
app.use '/lib', express.static("#{process.cwd()}/bower_components")

# connect-assets for stylus+nib
assets().environment.getEngines('.styl').configure (s) -> s.use(nib())
app.use assets()

# routes
app.get '/', (req, res) ->
  me = cson.parseFileSync 'me.cson'

  fonts = [
    'http://fonts.googleapis.com/css?family=Open+Sans:600'
    'http://fonts.googleapis.com/css?family=Lato:400,300italic'
  ]

  mins = [
    '/lib/jquery/dist/jquery.min.js'
    '/lib/jquery-cycle2/build/jquery.cycle2.min.js'
    '/lib/jquery-cycle2/build/plugin/jquery.cycle2.swipe.min.js'
  ]

  res.render 'index', {data: me, fonts: fonts, scripts: mins}

app.listen 3000
