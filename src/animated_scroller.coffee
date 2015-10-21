angular.module('msl.vslides').factory 'animated_scroller', ['$window', '$q',
'$interval', ($window, $q, $interval) ->
  scroll: (from, to, config) ->
    deferred = $q.defer()
    t = 0
    T = config.duration
    delta = config.duration / config.frequency
    animation = $interval(->
      t += delta
      p = t / T
      $window.scroll 0, (config.easing from, to, p)
      if t >= T
        $interval.cancel animation
        deferred.resolve()
    , delta)
    deferred.promise
]
