# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  $('.job-box').blurjs({
    source: 'body',
    radius: 15,
    overlay: 'rgba(255,255,255,0.7)',
    offset: { x: -5, y: -5 },
    draggable: true
  });

  $('#frontpage-tabs a:first').tab('show')
