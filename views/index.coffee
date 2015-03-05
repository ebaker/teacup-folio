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
        div '.button', ->
          i '.icon-menu'
        div '.name', ->
          data.name

      div '#app', ->

        # overlay
        div '.overlay'

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
          div '.mobile-subheader'
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
                        div ->
                          a ".#{contact.icon}", {
                            href: contact.url
                            target: '_blank'
                          }, ->
                            i ".icon-#{contact.icon}"
                            if contact.icon is 'file-pdf'
                              div '.resume', -> 'Resume'

                    when 'work'
                      div '.cycle-slideshow', data: {
                        'cycle-fx': 'scrollHorz'
                        'cycle-timeout': '2000'
                        'cycle-slides': '> div'
                        'cycle-swipe': 'true'
                      }, ->
                        for project in data.work
                          div '.slide', ->
                            div '.project', ->
                             img src: project.image if project.image
                             div '.info', ->
                               h3 -> project.title
                               div -> project.subtitle
                               if project.url
                                 a {
                                   href: project.url
                                   target: '_blank'
                                 }, ->
                                   span -> 'View'
                                   i '.icon-export'
                               if project.github
                                 a '.github', href: project.github, ->
                                   span -> 'Github'
                                   i '.icon-github-circled'
                      div '.cycle-controls', ->
                        div '.button.left', ->
                          i '.icon-left-open'
                        div '.button.right', ->
                          i '.icon-right-open'

                    when 'about'
                      img src: data.about.img
                      div -> data.about.bio
