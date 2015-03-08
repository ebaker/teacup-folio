# teacup-folio

[Stylus-tea-boiler](https://github.com/ebaker/stylus-tea-boiler) was used to create a
 [coffeescript](http://coffeescript.org/) environment using
 [teacup](https://github.com/goodeggs/teacup) for html templating and
 [stylus](http://learnboost.github.io/stylus/) for CSS-preprocessing served over
 [express](https://github.com/strongloop/express).

## Client Dependancy Libraries
 - [jquery](http://jquery.com)
 - [jquery-cycle2](http://jquery.malsup.com/cycle2)
 - [fastclick](https://github.com/ftlabs/fastclick)

## Server Requirements
```sh
$ npm install -g coffee-script bower nodemon
```

## Get Started
```sh
$ git clone https://github.com/ebaker/teacup-folio.git
$ cd teacup-folio
$ npm install
$ bower install
$ grunt build
$ grunt
$ vim assets/css/app.styl
```

## Structure
This project is setup for a single web application.
server.coffee serves the index view for the / endpoint. 
Client assets are written in teacup and stylus and compiled
through grunt and served via express.

#### assets (client)
 - js directory containes coffee files for controller logic
 - css directory containes styl file

#### server.coffee
 - express server
 - grunt compiles coffee and styl files as js and css

#### views (server)
 - server views searched by express
 - index served from here

#### grunt
 - coffee task compile assets/js/*.coffee
 - stylus task compile assets/css/*.styl
 - default task watches files to compile and livereload
 - livereload included through connect-livereload'

## Dependencies
 - [coffeescript](http://coffeescript.org/)
 - [express](https://github.com/strongloop/express)
 - [stylus](http://learnboost.github.io/stylus/)
 - [nib](https://github.com/tj/nib) - stylus CSS3 mixin plugin
 - [connect-assets](https://github.com/adunkman/connect-assets)
 - [bower](http://bower.io/)
 - [jQuery](http://jquery.com)
 - [grunt](http://gruntjs.com/)

License
----

MIT
