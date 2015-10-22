describe 'Service "slide_switcher"', ->
  slide_switcher = null
  $document = null
  $window = null
  $interval = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_slide_switcher_) ->
    slide_switcher = _slide_switcher_
  beforeEach inject (_$document_, _$window_, _$interval_) ->
    $document = _$document_
    $window = _$window_
    $interval = _$interval_
  it 'allows switching to a particular slide', (done) ->
    body = angular.element $document.prop 'body'
    a_div = angular.element '<div></div>'
    a_div.css 'height', '100px'
    body.append a_div
    another_div = angular.element '<div></div>'
    another_div.css 'height', '100px'
    body.append another_div
    slide_switcher.switchTo(another_div).then ->
      expect($window.scrollY).toEqual 100
      done()
    $interval.flush 40 for [1..25]
