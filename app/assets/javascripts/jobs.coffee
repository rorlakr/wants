# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # convert bootstrap-datepicker value to rails date format (yyyy-mm-dd) on our hidden field
  $(document).on 'changeDate', '.bootstrap-datepicker', (evt) ->
    rails_date = evt.date.getFullYear() + '-' + ('0' + (evt.date.getMonth() + 1)).slice(-2) + '-' + ('0' + evt.date.getDate()).slice(-2)
    $(this).next("input[type=hidden]").val(rails_date)