//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  return $(document).on('ajax:beforeSend', '#new_comment', function(e, xhr, settings) {
    return $('#new_comment textarea').val() !== ''
  }).on('ajax:success', '#new_comment', function(e, data, status, xhr) {
    $(this).find('textarea').val('')
    return $(xhr.responseText).appendTo('.comments')
  }).on('ajax:success', '#comment-destroy', function(e, data, status, xhr) {
    return $("#" + data.id).slideUp()
  })
})
