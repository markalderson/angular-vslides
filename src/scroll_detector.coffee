angular.module('msl.vslides').factory 'scroll_detector', ['$window',
'$document', ($window, $document) ->
  currentScroll = ->
    doc = $document.prop('documentElement')
    ($window.pageYOffset or doc.scrollTop) - (doc.clientTop or 0)
  start_scroll = currentScroll()
  scroll_handler = null
  scrollHandler = (scope) ->
    ->
      if currentScroll() > start_scroll then scope.$emit 'next_slide'
      if currentScroll() < start_scroll then scope.$emit 'prev_slide'
      start_scroll = currentScroll()
  return {
    attach: (scope) ->
      scroll_handler = scrollHandler scope
      angular.element($window).on 'scroll', scroll_handler
    detach: () ->
      angular.element($window).unbind 'scroll', scroll_handler
  }
]
