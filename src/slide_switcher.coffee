angular.module('msl.vslides').factory 'slide_switcher', ['$q',
'animated_scroller', 'scroll_position', 'easing_functions', ($q,
animated_scroller, scroll_position, easing_functions) ->
  switchTo: (slide) ->
    deferred = $q.defer()
    a = scroll_position.current()
    b = scroll_position.of slide
    c =
      duration: 1000
      frequency: 25
      easing: easing_functions.linear
    animated_scroller.scroll(a, b, c).then -> deferred.resolve()
    deferred.promise
]
