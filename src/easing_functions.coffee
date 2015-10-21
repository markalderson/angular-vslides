angular.module('msl.vslides').factory 'easing_functions', [->
  linear: (a, b, p) ->
    p = 0 if p < 0
    p = 1 if p > 1
    a + ((b - a) * p)
]
