teacup = require 'teacup'
{renderable, raw, js, css, html, head, meta, link, script, title} = teacup
{body, h1, h3, div, ul, li, span, img, a, i} = teacup

module.exports = renderable ({data, fonts, scripts}) ->

  html ->
    return unless data

    # head
    head ->
      title data.name
      meta name: 'viewport', content: 'width=device-width, initial-scale=1.0'
      
      fonts ?= []
      for url in fonts
        link href: url, rel: 'stylesheet', type: 'text/css'

      scripts ?= []
      for url in scripts
        script src: url

      script src: '/app.js'
      link rel: 'stylesheet', type: 'text/css', href: '/app.css'

    # body
    body ->
      
      # header
      h1 -> data.name

      div '.mobile', ->
        div '.button', -> '>'
        div '.name', ->
          data.name
        div '.active'

      div '#app', ->

        # navigation
        div '.navigation', ->
          ul ->
            span '.slider'
            for item of data
              continue if item is 'name'
              li 'data-selector': item, ->
                item

        # content
        div '.main', ->
          div '.circle'
          div '.spinner', ->
            for item of data
              continue if item is 'name'
              div ".button .#{item}", 'data-selector': item, ->
                div '.info', ->
                  div -> item
          div '.wrapper', ->
            div '.contents', ->
              for item of data
                continue if item is 'name'
                div ".content #{item}", ->
                  switch item

                    when 'contact'
                      for contact in data.contact
                        a href: contact.url, target: '_blank', ->
                          img src: contact.img

                    when 'projects'
                      div '.cycle-controls', ->
                        div '.button.left', ->
                          i '.icon-left-open'
                        div '.button.right', ->
                          i '.icon-right-open'
                      div '.cycle-slideshow', data: {
                        'cycle-fx': 'scrollHorz'
                        'cycle-timeout': '2000'
                        'cycle-slides': '> div'
                        'cycle-swipe': 'true'
                      }, ->
                        for project in data.projects
                          div '.slide', ->
                            div '.project', ->
                             img src: project.image if project.image
                             div '.info', ->
                               h3 -> project.title
                               div -> project.subtitle
                               a href: project.url, -> 'View' if project.url
                               if project.github
                                 a href: project.github, -> 'Github'


                    when 'about'
                      img src: data.about.img
                      div -> data.about.bio
