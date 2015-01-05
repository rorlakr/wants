# Rails 4: how to use $(document).ready() with turbo-links
# http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links

# $(document).on 'ready page:load', ->
$(document).on "keypress", ".comment_text", (e) ->
  if e.keyCode is 13 and not e.shiftKey
    e.preventDefault()
    frm = @form
    $.ajax
      url: $(frm).attr("action")
      data: $(frm).serialize()
      type: "POST"
      dataType: "script"
  return



