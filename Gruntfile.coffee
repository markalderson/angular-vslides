module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        files:
          'src/js/module.js': 'src/module.coffee'
          'test/js/module.js': 'test/module.coffee'
    concat:
      options:
        banner: '/* <%= pkg.name %> - v<%= pkg.version %> - ' +
          '<%= grunt.template.today("yyyy-mm-dd") %> */\n'
        separator: '\n'
      dist:
        src: ['src/js/module.js']
        dest: 'bin/<%= pkg.name %>.js'
    uglify:
      options:
        banner: '/* <%= pkg.name %> - v<%= pkg.version %> - ' +
          '<%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: 'bin/<%= pkg.name %>.js',
        dest: 'bin/<%= pkg.name %>.min.js'
    karma:
      unit:
        configFile: 'karma-conf.js'
    shell:
      clean:
        command: 'rm -rf src/js bin'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask 'compile', ['coffee']
  grunt.registerTask 'minify', ['uglify']
  grunt.registerTask 'test', ['karma']
  grunt.registerTask 'clean', ['shell:clean']
  grunt.registerTask 'default', ['clean', 'compile', 'concat', 'minify', 'test']
