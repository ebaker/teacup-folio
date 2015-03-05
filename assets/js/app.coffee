$(document).ready ->

  # init
  $('.content.contact').addClass 'active'
  $slideshow = $('.cycle-slideshow').cycle 'pause'

  # helpers
  navigate = (selector) ->
    $slider = $ '.slider'
    $slider.removeClass('contact projects about').addClass selector

    # activate content from navigation
    $main = $ '.main'
    $main.find('.active.content').removeClass 'active'
    $main.find(".#{selector}").addClass 'active'
    
    # spin to selector
    spinners = 'about contact projects'
    $main.find('.spinner').removeClass(spinners).addClass selector

    $('.navigation.open').removeClass 'open'
  
  # events
  $('.navigation > ul > li').on 'mouseenter mouseup', (e) ->
    selector = $(e.currentTarget).data 'selector'
    navigate selector

  $('.spinner > .button > .info').on 'mouseup', (e) ->
    selector = $(e.currentTarget).parent().data 'selector'
    navigate selector

  $('.projects > .cycle-controls > .button').on 'mouseup', (e) ->
    $btn = $ e.currentTarget
    if $btn.hasClass 'left' then $slideshow.cycle 'prev'
    else if $btn.hasClass 'right' then $slideshow.cycle 'next'

  
  # mobile
  $('.mobile .button').on 'mouseup', (e) ->
    $('.navigation > ul > li').off 'mouseenter'
    $('.navigation').toggleClass 'open'
