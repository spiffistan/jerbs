# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  $('header').blurjs({
    source: 'body',
    radius: 5,
    overlay: 'rgba(255,255,255,0.1)'
  });

  $('#frontpage-tabs a:first').tab('show')

  $('#login-button').click ->
    $('#login-box').slideToggle()

  $('#close-login').click ->
    $('#login-box').slideUp()
    $('#login-button').button('toggle')
