loaded = ->
    console.log "HERE"

run = (jQuery) ->
    jQuery('#coffeeName').autocomplete
	    target: jQuery('#coffeeList') #// the listview to receive results
	    source: '/coffee/list' #// URL return JSON data
	    #link: 'target.html?term=', // link to be attached to each result
	    minLength: 0 #// minimum length of search string
	    transition: 'fade' #// page transition, default is fade
	    callback: loaded #// optional callback function fires upon result selection

run $