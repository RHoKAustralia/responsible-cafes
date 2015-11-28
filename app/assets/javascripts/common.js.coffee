# Put general javascript here. i.e. it's used site wide.
$ ->
	# This is document ready
	$.localScroll() 

	$('[data-validate]').parsley 'addListener', onFormSubmit: ( isFormValid ) ->
    if isFormValid
    	$('[type=submit]').attr('disabled', 'disabled')