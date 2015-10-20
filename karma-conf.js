module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine'],
    files: [
      'node_modules/angular/angular.js',
      'node_modules/angular-mocks/angular-mocks.js',
      'src/js/module.js',
      'src/js/fullpage.js',
      'src/js/no_overflow.js',
      'src/js/scroll_detector.js',
      'src/js/arrows_detector.js',
      'test/js/fullpage.js',
      'test/js/no_overflow.js',
      'test/js/scroll_detector.js',
      'test/js/arrows_detector.js'
    ],
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['Chrome'],
    singleRun: true
  });
};
