dom = {}

select = ->
    dom.coffeeName = jQuery '#coffeeName' 
    dom.coffeeList = jQuery '#coffeeList'
    dom.stars = jQuery '.stars'

bind = ->
    dom.coffeeName.autocomplete
        target: dom.coffeeList
        link: '/view/'
        source: '/coffee/list' #// URL return JSON data
        minLength: 1 #// minimum length of search string
        transition: 'fade' #// page transition, default is fade

    dom.stars.rating()

run = ->
    select()
    bind()

jQuery('div:jqmData(role="page")').live('pagebeforeshow', run);
