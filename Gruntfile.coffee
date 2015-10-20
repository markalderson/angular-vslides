module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        files:
          'src/js/module.js': 'src/module.coffee'
          'src/js/fullpage.js': 'src/fullpage.coffee'
          'test/js/fullpage.js': 'test/fullpage.coffee'
          'src/js/no_overflow.js': 'src/no_overflow.coffee'
          'test/js/no_overflow.js': 'test/no_overflow.coffee'
          'src/js/scroll_detector.js': 'src/scroll_detector.coffee'
          'test/js/scroll_detector.js': 'test/scroll_detector.coffee'
    concat:
      options:
        banner: '/* <%= pkg.name %> - v<%= pkg.version %> - ' +
          '<%= grunt.template.today("yyyy-mm-dd") %> */\n'
        separator: '\n'
      dist:
        src: [
          'src/js/module.js', 'src/js/fullpage.js',
          'src/js/no_overflow.js', 'src/js/scroll_detector.js'
        ]
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
