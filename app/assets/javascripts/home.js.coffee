# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->


  $('.container#main').blurjs({
    overlay: 'rgba(255,255,255,0.9)',
    source: 'body'
  });

  $('#frontpage-tabs a:first').tab('show')
