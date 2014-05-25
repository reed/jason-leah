$ ->
  initPage()
  $(document).on 'page:load', initPage

initPage = ->
  if pageIs 'rsvp'
    initTokenField()

initTokenField = ->
  $('#rsvp_guest_list').tokenfield
    createTokensOnBlur: true