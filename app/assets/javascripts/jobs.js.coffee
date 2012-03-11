# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  $('#search-controls .search-query').change ->
    $.getJSON '/jobs/find/' + $(this).val() + '.json', (data) ->
      console.log(data)

  $('#search-controls .btn-group').button('toggle')
