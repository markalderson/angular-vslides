describe 'Service "slide_master"', ->
  slide_master = null
  slide_switcher = null
  $compile = null
  $rootScope = null
  $document = null
  $window = null
  spy_for_handle_next_slide_event = null
  spy_for_handle_prev_slide_event = null
  spy_for_switch_to = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_slide_master_, _slide_switcher_) ->
    slide_master = _slide_master_
    slide_switcher = _slide_switcher_
  beforeEach inject (_$interval_, _$compile_, _$rootScope_, _$window_, _$document_) ->
    $compile = _$compile_
    $rootScope = _$rootScope_
    $window = _$window_
    $document = _$document_
  beforeEach ->
    spy_for_handle_next_slide_event = spyOn slide_master, 'handleNextSlideEvent'
    spy_for_handle_prev_slide_event = spyOn slide_master, 'handlePrevSlideEvent'
    spy_for_switch_to = spyOn slide_switcher, 'switchTo'
  it 'handles "next_slide" events', ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    another_div = $compile('<div></div>')($rootScope)
    body.append another_div
    slide_master.setUp $rootScope, [a_div, another_div]
    expect(slide_master.current).toBe a_div
    $rootScope.$emit 'next_slide'
    expect(slide_master.handleNextSlideEvent).toHaveBeenCalled()
    a_div.remove()
    another_div.remove()
  it 'tracks current slide', (done) ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    another_div = $compile('<div></div>')($rootScope)
    body.append another_div
    spy_for_handle_next_slide_event.and.callThrough()
    spy_for_switch_to.and.callFake ->
      then: (callback) ->
        callback()
    slide_master.setUp $rootScope, [a_div, another_div]
    # expect(slide_master.current).toBe a_div
    $rootScope.$on 'slide_changed', ->
      done()
    $rootScope.$emit 'next_slide'
    console.log $rootScope.$id
    a_div.remove()
    another_div.remove()
  it 'tracks current slide', (done) ->
    body = angular.element $document.prop 'body'
    a_div = $compile('<div></div>')($rootScope)
    body.append a_div
    another_div = $compile('<div></div>')($rootScope)
    body.append another_div
    spy_for_handle_next_slide_event.and.callThrough()
    slide_master.setUp $rootScope, [a_div, another_div]
    expect(slide_master.current).toBe a_div
    #$rootScope.$on 'slide_changed', ->
    #  console.log 'Yez'
    $rootScope.$emit 'next_slide'
    a_div.remove()
    another_div.remove()
    done()
