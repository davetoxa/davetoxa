class App.Views.Post extends App.View
  el: '.js-posts'

  events: ->
    'click': 'hello'

  initialize: ->
    cout 'Main initialized'

  hello: ->
    cout 'info', 'Information'