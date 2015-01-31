$(document).ready ->
  $('.content.contact').addClass 'active'

  $('.left > ul > li').on 'mouseenter', (e) ->

    # left navigation selection
    $el = $ e.currentTarget
    selector = $el.data 'sel'
    $current = $ '.current'
    $current.removeClass('contact projects about').addClass selector

    # active content from navigation
    $content = $ '.right'
    $content.find('.active.content').removeClass 'active'
    $content.find(".#{selector}").addClass 'active'

