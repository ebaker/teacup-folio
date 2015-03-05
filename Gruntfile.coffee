module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
        files:
          'build/app.js':
            [
              'assets/js/*.coffee'
            ]
    concurrent:
      default: ['nodemon', 'watch']
      options:
        logConcurrentOutput: true
        limit: 10
    fontello:
      dist:
        options:
          config: 'assets/fontello/config.json'
          fonts: 'build/font'
          styles: 'build/css'
          force: true
    nodemon:
      dev:
        script: 'server.coffee'
        options:
          args: ['dev']
          watch: [
            'server.coffee'
            'views/*.coffee'
          ]
    stylus:
      compile:
        options:
          compress: true
          use:[
            require('nib')
          ]
        files:
          'build/app.css': ['assets/css/*.styl']
    watch:
      options:
        livereload: true
      app:
        files: [
          'assets/js/*.coffee'
          'cruntfile.coffee'
          'server.coffee'
          'views/*.coffee'
        ]
        tasks: ['coffee']
      style:
        files: 'assets/css/*.styl'
        tasks: 'stylus'

  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-fontello'
  grunt.loadNpmTasks 'grunt-nodemon'

  grunt.registerTask 'default', ['concurrent:default']
  grunt.registerTask 'build', ['coffee', 'stylus', 'fontello']
