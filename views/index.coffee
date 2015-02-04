teacup = require 'teacup'
{renderable, raw, js, css, html, head, meta, link, script, title} = teacup
{body, h1, div, ul, li, span, img, a} = teacup

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

      js 'app'
      css 'app'

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
          div '.spinner', ->
            div '.circle'
            for item of data
              continue if item is 'name'
              div ".button .#{item}", 'data-selector': item, ->
                div '.info', ->
                  div -> item
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
                    div '.cycle-slideshow', data: {
                      'cycle-fx': 'scrollHorz'
                      'cycle-timeout': '2000'
                      'cycle-slides': '> div'
                    }, ->
                      for project in data.projects
                        div '.slide', ->
                          div '.project', ->
                           img src: project.image if project.image
                           div -> project.title
                           div -> project.subtitle
                           a href: project.url, -> 'View' if project.url
                           a href: project.github, -> 'Github' if project.github


                  when 'about'
                    img src: data.about.img
                    div -> data.about.bio
