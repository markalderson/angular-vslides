angular.module('msl.vslides').factory 'slide_master', ['slide_switcher',
(slide_switcher) ->
  setUp: (scope, slides) ->
    @scope = scope
    @slides = slides
    @current = slides[0]
    scope.$on 'prev_slide', @handlePrevSlideEvent.call @
    scope.$on 'next_slide', @handleNextSlideEvent.call @
  positionOf: (slide) ->
    @slides.indexOf slide
  slideNumber: ->
    @slides.length
  handleNextSlideEvent: ->
    i = @positionOf @current
    j = i + 1
    if j < @slideNumber() then @changeSlide @slides[j]
  handlePrevSlideEvent: ->
    i = @positionOf @current
    j = i - 1
    if j >= 0 then @changeSlide @slides[j]
  changeSlide: (slide) ->
    master = @
    slide_switcher.switchTo(slide).then ->
      master.current = slide
      master.scope.$emit 'slide_changed'
    return
]
