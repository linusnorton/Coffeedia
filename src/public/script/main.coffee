dom = {}

select = ->
    dom.head = jQuery 'head'
    dom.coffeeName = jQuery '#coffeeName' 
    dom.coffeeList = jQuery '#coffeeList'
    dom.stars = jQuery '.stars'

load = ->
    dom.head.append '<script type="text/javascript" src="/script/vendor/jquery.MetaData.js"></script>'
    dom.head.append '<script type="text/javascript" src="/script/vendor/jquery.rating.pack.js"></script>'

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
    load()
    bind()

jQuery('div:jqmData(role="page")').live('pagebeforeshow', run);
