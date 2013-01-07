# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#participant_user_id').autocomplete
    source: $('#participant_user_id').data('autocomplete-source')
