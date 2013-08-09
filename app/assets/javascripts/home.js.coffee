root = exports ? this

root.user = () ->
	username = $('#username').val()
	window.location = '/' + username if username
	false

$('#username').keyup((event) ->
  $('#find').click() if event.keyCode == 13
 )