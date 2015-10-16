describe 'Service "fullpage"', ->
  fullpage = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_fullpage_) ->
    fullpage = _fullpage_
  it 'makes an element occupy the whole viewport', ->
    expect(fullpage).toBeDefined()
    a_div = angular.element '<div></div>'
    fullpage a_div
    expect(a_div.css 'width').toEqual '100vw'
    expect(a_div.css 'height').toEqual '100vh'
