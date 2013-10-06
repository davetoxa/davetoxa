class App.Views.Main extends App.View
  el: '.center'

  events: ->
    'click': 'hello'

  initialize: ->
    cout 'Main initialized'

  hello: ->
    cout 'info', 'Information'
    cout 'error', 'Error'
    todo 'Wanna eat!'
