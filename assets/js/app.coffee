$(document).ready ->

  # init
  $('.content.contact').addClass 'active'
  $('.mobile-subheader').text 'contact'
  $slideshow = $('.cycle-slideshow').cycle 'pause'
  $ -> FastClick.attach document.body

  # helpers
  navigate = (selector) ->
    $slider = $ '.slider'
    $slider.removeClass('contact work about').addClass selector

    # activate content from navigation
    $main = $ '.main'
    $main.find('.active.content').removeClass 'active'
    $main.find(".#{selector}").addClass 'active'
    
    # spin to selector
    spinners = 'about contact work'
    $main.find('.spinner').removeClass(spinners).addClass selector

    # mobile
    $('.navigation.open').removeClass 'open'
    $('.overlay').removeClass 'open'
    $('.mobile-subheader').text selector
  
  # events
  $('.navigation > ul > li').on 'mouseenter click', (e) ->
    selector = $(e.currentTarget).data 'selector'
    navigate selector

  $('.spinner > .button > .info').on 'click', (e) ->
    selector = $(e.currentTarget).parent().data 'selector'
    navigate selector

  $('.work > .cycle-controls > .button').on 'click', (e) ->
    $btn = $ e.currentTarget
    if $btn.hasClass 'left' then $slideshow.cycle 'prev'
    else if $btn.hasClass 'right' then $slideshow.cycle 'next'

  
  # mobile
  $('.mobile').on 'click', (e) ->
    $('.navigation > ul > li').off 'mouseenter'
    $('.navigation').toggleClass 'open'
    $('.overlay').toggleClass 'open'
