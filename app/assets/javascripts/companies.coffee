# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  update_questions = ->
    gigawatts = (parseInt($('select#company_level').val()) == 2)
    if gigawatts then $('[data-hide=gigawatt]').show() else $('[data-hide=gigawatt]').hide()

    attendances = parseInt($('select#company_attendances').val())
    for i in [0...attendances]
      console.log('[data-attendee=' + i.toString() + ']')
      $('[data-attendee=' + i.toString() + ']').show()
    for i in [attendances...5]
      $('[data-attendee=' + i.toString() + ']').hide()

    additional_needed = $('input#company_additional_needed').is(':checked')
    if additional_needed then $('[data-hide=additional]').show() else $('[data-hide=additional]').hide()

  $('select#company_level').change update_questions
  $('select#company_attendances').change update_questions
  $('input#company_additional_needed').change update_questions

  update_questions()

$(document).ready(ready)
$(document).on('page:load', ready)