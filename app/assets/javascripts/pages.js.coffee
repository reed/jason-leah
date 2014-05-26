bound = false

$ ->
  initPage()
  $(document).on 'page:load', initPage

initPage = ->
  $(window).off('resize', initLandingPageHeight)
  if pageIs 'pages', 'home'
    initLandingPageHeight()
    $(window).on 'resize', initLandingPageHeight
  else
    initMenuColorChanger() unless bound

initMenuColorChanger = ->
  contentPosition = $('#content').position().top
  menuHeight = $('#menu').height()
  currentState = 'navbar-default'

  $(window).on 'scroll', ->
    correctState = if window.pageYOffset + menuHeight > contentPosition then 'navbar-inverse' else 'navbar-default'
    if currentState isnt correctState
      $('#menu').removeClass(currentState).addClass correctState
      currentState = correctState

  bound = true

initLandingPageHeight = ->
  $('#landing-banner').css 'minHeight', 'auto'
  windowHeight = $(window).height()
  contentHeight = $('body').height()
  if windowHeight > contentHeight
    $('#landing-banner').css 'minHeight', windowHeight
