###
  = require jquery
  = require jquery_ujs
  = require validate
  = require_tree .
###

$ ->
  $ document
    .on 'ajax:beforeSend', '#new_comment', (e, xhr, settings) ->
      return $('#new_comment textarea').val() != ''

    .on 'ajax:success', '#new_comment', (e, data, status, xhr) ->
      $(this).find('textarea').val('')
      $(xhr.responseText).appendTo('.comments')

    .on 'ajax:success', '#comment-destroy', (e, data, status, xhr) ->
      $("##{data.id}").slideUp()
