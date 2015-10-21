describe 'Service "animated_scroller"', ->
  animated_scroller = null
  easing_functions = null
  scroll_position = null
  $document = null
  $window = null
  $interval = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_animated_scroller_, _easing_functions_,
  _scroll_position_) ->
    animated_scroller = _animated_scroller_
    easing_functions = _easing_functions_
    scroll_position = _scroll_position_
  beforeEach inject (_$document_, _$window_, _$interval_) ->
    $document = _$document_
    $window = _$window_
    $interval = _$interval_
  it 'scrolls from A to B based on an animation configuration', (done) ->
    body = angular.element $document.prop 'body'
    body.css 'height', '10000px'
    $window.scroll 0, 100
    expect(scroll_position.current()).toEqual 100
    config =
      duration: 1000
      frequency: 25
      easing: easing_functions.linear
    animated_scroller.scroll(100, 200, config).then ->
      expect(scroll_position.current()).toEqual 200
      done()
    $interval.flush 40 for [1..25]
