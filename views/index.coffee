{renderable, raw, js, css, html, head, title, body, div} = require 'teacup'

module.exports = renderable ({}) ->
  html ->
    head ->
      title 'boiler plate'
      js 'app'
      css 'app'
    body ->
      div -> 'hello'
