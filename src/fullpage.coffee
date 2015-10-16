angular.module('msl.vslides').factory 'fullpage', [ ->
  (e) ->
    e.css 'width', '100vw'
    e.css 'height', '100vh'
]
