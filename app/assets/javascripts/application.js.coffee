###
  = require jquery
  = require jquery_ujs
  = require turbolinks

  = require ultimate/underscore/underscore
  = require ultimate/helpers
  = require app

  = require_tree .
###

$ ->
  App.start()