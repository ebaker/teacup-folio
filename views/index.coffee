teacup = require 'teacup'
{renderable, raw, js, css, html, head, link, script, title} = teacup
{body, h1, div, ul, li, span, img, a} = teacup

module.exports = renderable ({data, fonts, scripts}) ->

  html ->
    return unless data

    # head
    head ->
      title data.name
      
      fonts ?= []
      for url in fonts
        link {href: url, rel: 'stylesheet', type: 'text/css'}

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
        for item of data
          continue if item is 'name'
          div ".content #{item}", ->
            switch item

              when 'contact'
                for contact in data.contact
                  a href: contact.url, target: '_blank', ->
                    img src: contact.img

              when 'projects'
                data.projects

              when 'about'
                img src: data.about.img
                div -> data.about.bio
