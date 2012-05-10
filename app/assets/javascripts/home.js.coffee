# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

fetchResults = (query) ->

  $('.carousel-inner').empty()
  $('#search-info').empty()

  $('#header-search-results').slideDown ->

    $('#search-spinner').spin( { 'preset': 'medium', speed: 2 }, 'white')

    $.getJSON '/jobs/find/' + query + '.json', (data) ->

      $('#search-spinner').spin(false)

      if data.length == 0
        $('#search-info').html('Ingen resultater.') # TODO i18n
        return

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

  timer = 0

  $('#header-search input').keyup ->

      clearTimeout(timer);
      query = $(this).val()

      if query?.length
        timer = setTimeout(fetchResults, 500, query);
