ready = ->
  $('#sub-button').on('click', ->
    container = $(this).parent()

    if(!container.hasClass('visible'))
      $(this).html('Hide');
      setTimeout((-> $('#email').focus()), 200)
    else
      $(this).html('Subscribe');

    container.toggleClass('visible')
  )

  setTimeout((->
    container = $('.sub-container')
    if(window.location.href.includes('posts') && !container.hasClass('visible'))
      $('.sub-container').addClass('visible')
      setTimeout((-> $('#email').focus()), 200)
      $(this).html('Hide');
  ), 10000)

$(document).ready(ready)
$(document).on('page:load', ready)