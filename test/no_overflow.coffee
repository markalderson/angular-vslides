describe 'Service "no_overflow"', ->
  no_overflow = null
  beforeEach module 'msl.vslides'
  beforeEach inject (_no_overflow_) ->
    no_overflow = _no_overflow_
  it 'hides overflowing content on x-axis', ->
    expect(no_overflow).toBeDefined()
    a_div = angular.element '<div></div>'
    no_overflow.onXAxis a_div
    expect(a_div.css 'overflow-x').toEqual 'hidden'
  it 'hides overflowing content', ->
    expect(no_overflow).toBeDefined()
    a_div = angular.element '<div></div>'
    no_overflow.atAll a_div
    expect(a_div.css 'overflow').toEqual 'hidden'
