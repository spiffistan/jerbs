# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  new_user_registration_path = '/users/sign_up'

  $('.tabs').tab('show')

  $('#modal-sign-up').on('show', ->
    $('#modal-sign-up .modal-body').load(new_user_registration_path)
  )

