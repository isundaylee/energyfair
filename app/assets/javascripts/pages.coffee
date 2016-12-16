# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  if $('body#pages_past_events').length > 0
    Galleria.configure({
        imageCrop: true,
        thumbnails: false
    })

    Galleria.loadTheme('https://cdnjs.cloudflare.com/ajax/libs/galleria/1.4.5/themes/classic/galleria.classic.min.js')
    Galleria.run('.galleria')

$(document).ready(ready)
$(document).on('page:load', ready)