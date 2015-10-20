describe 'Service "scroll_detector"', ->
  scroll_detector = null
  $compile = null
  $rootScope = null
  $document = null
  $window = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_scroll_detector_) ->
    scroll_detector = _scroll_detector_
  beforeEach inject (_$compile_, _$rootScope_, _$window_, _$document_) ->
    $compile = _$compile_
    $rootScope = _$rootScope_
    $window = _$window_
    $document = _$document_
  it 'detects scroll down', ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    a_spy = jasmine.createSpy 'a_spy'
    $rootScope.$on 'next_slide', a_spy
    scroll_detector.attach $rootScope
    body.css 'height', '10000px'
    $window.scroll 0, 10
    angular.element($window).triggerHandler 'scroll'
    expect(a_spy).toHaveBeenCalled()
    scroll_detector.detach()
    a_div.remove()
    $window.scroll 0, 0
  it 'detects scroll up', ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    a_spy = jasmine.createSpy 'a_spy'
    $rootScope.$on 'prev_slide', a_spy
    body.css 'height', '10000px'
    $window.scroll 0, 500
    angular.element($window).triggerHandler 'scroll'
    scroll_detector.attach $rootScope
    $window.scroll 0, -10
    angular.element($window).triggerHandler 'scroll'
    expect(a_spy).toHaveBeenCalled()
    scroll_detector.detach()
    a_div.remove()
    $window.scroll 0, 0
  it 'allows you to disable it anytime', ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    a_spy = jasmine.createSpy 'a_spy'
    $rootScope.$on 'next_slide', a_spy
    scroll_detector.attach $rootScope
    body.css 'height', '10000px'
    $window.scroll 0, 10
    scroll_detector.detach()
    angular.element($window).triggerHandler 'scroll'
    expect(a_spy).not.toHaveBeenCalled()
    a_div.remove()
    $window.scroll 0, 0
