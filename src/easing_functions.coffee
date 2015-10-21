angular.module('msl.vslides').factory 'easing_functions', [->
  linear: (a, b, p) ->
    a + ((b - a) * p)
]
