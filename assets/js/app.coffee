$(document).ready ->

  # init
  $('.content.contact').addClass 'active'

  $('.navigation > ul > li').on 'mouseenter', (e) ->

    # left navigation selection
    $el = $ e.currentTarget
    selector = $el.data 'selector'
    $slider = $ '.slider'
    $slider.removeClass('contact projects about').addClass selector

    # activate content from navigation
    $main = $ '.main'
    $main.find('.active.content').removeClass 'active'
    $main.find(".#{selector}").addClass 'active'

