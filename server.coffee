express = require 'express'
teacup = require 'teacup/lib/express'
nib = require 'nib'
assets = require 'teacup/lib/connect-assets'

# express
app = express()

# teacup
app.set 'view engine', 'coffee'
app.engine 'coffee', teacup.renderFile

# connect-assets for stylus+nib
assets().environment.getEngines('.styl').configure (s) -> s.use(nib())
app.use assets()

# routes
app.get '/', (req, res) -> res.render 'index'

app.listen 3000
