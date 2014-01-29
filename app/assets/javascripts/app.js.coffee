###
  = require ultimate/backbone/lib/backbone
  = require ultimate/backbone/app
  = require ultimate/backbone/view

  = require_self
  = require_tree ./views
###

class AppClass extends Ultimate.Backbone.App
window.App = new AppClass('davetoxa')
class App.View extends Ultimate.Backbone.View
