$(document).ready ->

  # init
  $('.content.contact').addClass 'active'
  $('.cycle-slideshow').cycle() # dont 'pause'

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
  
  # mobile
  $('.mobile .button').on 'mouseup', (e) ->
    $('.navigation > ul > li').off 'mouseenter'
    $('.navigation').toggleClass 'open'
