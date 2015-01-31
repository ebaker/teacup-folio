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
app.get '/', (req, res) ->
  me =
    name: 'eliot baker'
    contact: [
      {
        url: 'http://www.linkedin.com/in/eliotbaker'
        img: 'http://eliotbaker.com/images/linkedin.png'
      }
      {
        url: 'http://eliotbaker.com/images/resume.pdf'
        img: 'http://eliotbaker.com/images/cv_pdf_vodniciar_com.png'
      }
      {
        url: 'http://github.com/ebaker'
        img: 'http://eliotbaker.com/images/github.png'
      }
      {
        url: 'http://twitter.com/eliotbaker'
        img: 'http://eliotbaker.com/images/twitter.png'
      }
    ]
    projects: 'projects'
    about:
      img: 'http://eliotbaker.com/images/me.jpg'
      bio: 'coffeescript - yoga - tea'

  res.render 'index', {data: me}

app.listen 3000
