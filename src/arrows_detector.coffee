angular.module('msl.vslides').factory 'arrows_detector', ['$window',
'$document', ($window, $document) ->
  arrows_handler = null
  arrowsHandler = (scope) ->
    (event) ->
      if event.which is 40 then scope.$emit 'next_slide'
      if event.which is 38 then scope.$emit 'prev_slide'
  return {
    attach: (scope) ->
      arrows_handler = arrowsHandler scope
      angular.element($window).on 'keydown', arrows_handler
    detach: () ->
      angular.element($window).unbind 'keydown', arrows_handler
  }
]
