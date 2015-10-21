describe 'Service "scroll_position"', ->
  scroll_position = null
  $document = null
  $window = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_scroll_position_, _$document_, _$window_) ->
    scroll_position = _scroll_position_
    $document = _$document_
    $window = _$window_
  it 'tells you the current scroll position', ->
    body = angular.element $document.prop 'body'
    body.css 'height', '10000px'
    $window.scroll 0, 10
    expect(scroll_position.current()).toEqual 10
    $window.scroll 0, 20
    expect(scroll_position.current()).toEqual 20
    $window.scroll 0, 10
    expect(scroll_position.current()).toEqual 10
    $window.scroll 0, 30
    expect(scroll_position.current()).toEqual 30
    $window.scroll 0, 0
  it 'tells you the scroll position of an element', ->
    body = angular.element $document.prop 'body'
    body.css 'margin', '0'
    body.css 'padding', '0'
    a_div = angular.element '<div></div>'
    a_div.css 'height', '100px'
    body.append a_div
    expect(scroll_position.of a_div).toEqual 0
    another_div = angular.element '<div></div>'
    another_div.css 'height', '100px'
    body.append another_div
    expect(scroll_position.of another_div).toEqual 100
    a_div.remove()
    expect(scroll_position.of another_div).toEqual 0
    another_div.remove()
