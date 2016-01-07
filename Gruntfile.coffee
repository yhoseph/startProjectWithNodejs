module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      coffee_to_js:
        options:
          bare: true
          sourceMap: true
        expand: true
        flatten: false
        cwd: "."
        src: ["**/*.coffee"]
        dest: 'build'
        ext: ".js"
    copy:
      client:
        src: ['client/**']
        expand: true
        dest: 'build/'
      json:
        src: ['package.json', 'bower.json', '.bowerrc']
        expand: true
        dest: 'build/'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.registerTask 'default', [
    'coffee'
    'copy:json'
    'copy:client'
  ]
