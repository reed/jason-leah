bound = false

$ ->
  initPage()
  $(document).on 'page:load', initPage

initPage = ->
  if pageIs 'pages', 'home'
    initLandingPageHeight()
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
  windowHeight = $(window).height()
  contentHeight = $('body').height()
  console.log "window height: ", windowHeight
  console.log 'content height: ', contentHeight
  if windowHeight > contentHeight
    $('#banner').css 'minHeight', windowHeight
