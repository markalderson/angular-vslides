angular.module('msl.vslides').factory 'no_overflow', [ ->
  atAll: (e) ->
    e.css 'overflow', 'hidden'
  onXAxis: (e) ->
    e.css 'overflow-x', 'hidden'
]
