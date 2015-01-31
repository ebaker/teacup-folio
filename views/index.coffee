teacup = require 'teacup'
{renderable, raw, js, css, html, head, link, script, title} = teacup
{body, div, ul, li, span, img, a} = teacup

module.exports = renderable ({data}) ->

  html ->
    return unless data

    # head
    head ->
      title data.name
      
      fonts = [
        'http://fonts.googleapis.com/css?family=Open+Sans:600'
        'http://fonts.googleapis.com/css?family=Lato:400,300italic'
      ]
      for font in fonts
        link {href: font, rel: 'stylesheet', type: 'text/css'}

      script src: "//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"
      js 'app'
      css 'app'

    # body
    body ->
      
      # header
      div '.name', -> data.name

      # navigation
      div '.left', ->
        ul ->
          span '.current'
          for item of data
            continue if item is 'name'
            li 'data-sel': item, -> item

      # content
      div '.right', ->
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



