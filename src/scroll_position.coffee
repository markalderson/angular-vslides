angular.module('msl.vslides').factory 'scroll_position', ['$window',
($window) ->
  current: -> $window.scrollY
  of: (element) -> @current() + element[0].getBoundingClientRect().top
]
