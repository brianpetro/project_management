# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$('#project-content-nav').sortable
		axis: 'y'
		update: ->
			$.post($(this).data('update-url'), $(this).sortable('serialize'))

	$('#hideBrowseTags').click ->
		$('#browseTags').toggle 400
		
	$('#hideContents').click ->
		$('#contents').toggle 400
		
	$('#hideInfo').click ->
		$('#info').toggle 400
		
	$('#hideProjectBox').click ->
		$('#projectBox').toggle 400
