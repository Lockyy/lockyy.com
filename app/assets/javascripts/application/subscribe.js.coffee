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

$(document).ready(ready)
$(document).on('page:load', ready)