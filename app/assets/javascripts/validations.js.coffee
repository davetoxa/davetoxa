$ ->
  errorHandler = (errors, event) ->
    $.each errors, (i, error) ->
      $('#' + error.id).addClass('error')

  new FormValidator('new_post', [
    {
      name: 'post[title]',
      rules: 'required'
    },
    {
      name: 'post[content]',
      rules: 'required'
    }
  ], errorHandler)

  new FormValidator('new_comment', [
    {
      name: 'comment[body]',
      rules: 'required'
    }
  ], errorHandler)
