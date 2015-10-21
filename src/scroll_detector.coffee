angular.module('msl.vslides').factory 'scroll_detector', ['scroll_position',
'$window', '$document', (scroll_position, $window, $document) ->
  start_scroll = null
  scroll_handler = null
  scrollHandler = (scope) ->
    ->
      if scroll_position.current() > start_scroll then scope.$emit 'next_slide'
      if scroll_position.current() < start_scroll then scope.$emit 'prev_slide'
      start_scroll = scroll_position.current()
  return {
    attach: (scope) ->
      start_scroll = scroll_position.current()
      scroll_handler = scrollHandler scope
      angular.element($window).on 'scroll', scroll_handler
    detach: () ->
      angular.element($window).unbind 'scroll', scroll_handler
  }
]
