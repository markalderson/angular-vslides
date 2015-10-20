describe 'Service "arrows_detector"', ->
  arrows_detector = null
  $compile = null
  $rootScope = null
  $document = null
  $window = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_arrows_detector_) ->
    arrows_detector = _arrows_detector_
  beforeEach inject (_$compile_, _$rootScope_, _$window_, _$document_) ->
    $compile = _$compile_
    $rootScope = _$rootScope_
    $window = _$window_
    $document = _$document_
  it 'detects arrow down press', ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    a_spy = jasmine.createSpy 'a_spy'
    $rootScope.$on 'next_slide', a_spy
    arrows_detector.attach $rootScope
    arrow_down_event = new Event('keydown')
    arrow_down_event.which = 40
    $window.dispatchEvent arrow_down_event
    expect(a_spy).toHaveBeenCalled()
    arrows_detector.detach()
    a_div.remove()
  it 'detects arrow up press', ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    a_spy = jasmine.createSpy 'a_spy'
    $rootScope.$on 'prev_slide', a_spy
    arrows_detector.attach $rootScope
    arrow_up_event = new Event('keydown')
    arrow_up_event.which = 38
    $window.dispatchEvent arrow_up_event
    expect(a_spy).toHaveBeenCalled()
    arrows_detector.detach()
    a_div.remove()
  it 'allows you to disable it anytime', ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    a_spy = jasmine.createSpy 'a_spy'
    $rootScope.$on 'next_slide', a_spy
    arrows_detector.attach $rootScope
    arrow_up_event = new Event('keydown')
    arrow_up_event.which = 38
    arrows_detector.detach()
    $window.dispatchEvent arrow_up_event
    expect(a_spy).not.toHaveBeenCalled()
    a_div.remove()
