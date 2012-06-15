# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->

  $('#technology-select').select2({
    multiple: true,
    ajax: {
      url: "/technologies/find.json",
      dataType: 'jsonp',
      quietMillis: 100,
      data: (term, page) ->
        return { query: term }
      results: (data, page) ->
        return { results: data }
    }

    formatResult: (technology) ->
      return technology.name

    formatSelection: (technology) ->
      return technology.name

  });

  $('.datepicker').datepicker()

  $('#necessary-skills-link').click ->
    $('#necessary-skills').slideDown()
    $('#necessary-skills-link').fadeOut('fast')

  $('#desired-qualities-link').click ->
    $('#desired-qualities').slideDown()
    $('#desired-qualities-link').fadeOut('fast')
