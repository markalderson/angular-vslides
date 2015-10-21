describe 'Service "easing_functions"', ->
  easing_functions = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_easing_functions_) ->
    easing_functions = _easing_functions_
  it 'contains a linear easing function', ->
    l = easing_functions.linear
    expect(l 100, 200, 0).toEqual 100
    expect(l 100, 200, 0.1).toEqual 110
    expect(l 100, 200, 0.2).toEqual 120
    expect(l 100, 200, 0.3).toEqual 130
    expect(l 100, 200, 0.4).toEqual 140
    expect(l 100, 200, 0.5).toEqual 150
    expect(l 100, 200, 0.6).toEqual 160
    expect(l 100, 200, 0.7).toEqual 170
    expect(l 100, 200, 0.8).toEqual 180
    expect(l 100, 200, 0.9).toEqual 190
    expect(l 100, 200, 1).toEqual 200
