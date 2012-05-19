# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('#technology-search').typeahead({ source: $('#technology-search').data('source') })

  $('.datepicker').datepicker()

  $('#add-technology-button').click ->
    tech = $('#technology-search').val()
    # TODO sanity
    if tech != ''
      $('#technology-list').append('<span class="label">' + tech)

  $('#necessary-skills-link').click ->
    $('#necessary-skills').slideDown()
    $('#necessary-skills-link').fadeOut('fast')

  $('#desired-qualities-link').click ->
    $('#desired-qualities').slideDown()
    $('#desired-qualities-link').fadeOut('fast')
