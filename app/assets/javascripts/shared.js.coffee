@page = ->
  $body = $('body')
  document.body.page ||= 
    controller: $body.data('controller')
    action: $body.data('action')
    to_a: -> [@controller, @action]
    to_s: -> "#{@controller}##{@action}"

@pageIs = (controller, action) ->
  controller = [controller] unless $.isArray controller
  return false unless @page().controller in controller
  return true unless action
  action = [action] unless $.isArray action
  @page().action in action