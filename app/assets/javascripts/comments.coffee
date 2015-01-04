# $ ->
#   $(".comment_text").keypress (e) ->
#     if e.keyCode is 13 and not e.shiftKey
#       e.preventDefault()
#       frm = @form # don't submit the form yet
#       $.ajax
#         url: $(frm).attr("action") # remember to specify which attribute you want
#         data: $(frm).serialize()
#         type: "POST"
#         # dataType: "json"
#         success: -> # submit the form when the ajax request is complete
#           frm.submit()
#           return
#     return
#   return

