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
    stylus:
      compile:
        options:
          compress: true
        files:
          'build/app.css': ['assets/css/*.styl']

    watch:
      options:
        livereload: true
      app:
        files: [
          'assets/js/*.coffee'
          'Gruntfile.coffee'
          'server.coffee'
        ]
        tasks: ['coffee']
      style:
        files: 'assets/css/*.styl'
        tasks: 'stylus'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'stylus']
