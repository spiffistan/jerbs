# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  $('#frontpage-tabs a:first').tab('show')

  $("input:password").chromaHash({bars: 3, salt:"7be82b35cb0199120eea35a4507c9acf", minimum:6, height: 20});
  

