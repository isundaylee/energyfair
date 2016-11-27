# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  if $('body#pages_past_events').length > 0
    # Galleria.loadNamedTheme('classic')
    Galleria.configure({
        imageCrop: true,
        transition: 'fade',
        log: true,
    })
    Galleria.run('.galleria')

$(document).ready(ready)
$(document).on('page:load', ready)