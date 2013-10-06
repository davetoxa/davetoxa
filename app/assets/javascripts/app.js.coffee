###
  = require ultimate/backbone/lib/backbone
  = require ultimate/backbone/view
  = require ultimate/backbone/app

  = require_self
  = require views/app-view
  = require_tree ./views
###

class AppClass extends Ultimate.Backbone.App

window.App = new AppClass('davetoxa')
