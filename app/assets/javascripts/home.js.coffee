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



  $('#header-search input').change ->
    query = $(this).val()
    $('#header-search-results').slideDown ->
      $.getJSON '/jobs/find/' + query + '.json', (data) ->
        $.each data, (i, job) ->
          if i % 4 == 0
            $('#results-carousel .carousel-inner').append('<div class="item">')
            $('.carousel-inner div.item:last-child')
              .append('<div class="job-box result-box small"><h4 class="top"> <a href="/jobs/' + job.id + '">' + job.title)

          else
            $('.carousel-inner div.item:last-child')
              .append('<div class="job-box result-box small"><h4 class="top"> <a href="/jobs/' + job.id + '">' + job.title)

        $('#results-carousel').carousel()
        $('.carousel-inner div.item:first-child').addClass('active')

