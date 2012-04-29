dom = {}

itemSelected = (e) ->
    console.log e

select = ->
    dom.coffeeName = jQuery('#coffeeName')
    dom.coffeeList = jQuery('#coffeeList')

bind = ->
    dom.coffeeName.autocomplete
        target: dom.coffeeList
        source: '/coffee/list' #// URL return JSON data
        minLength: 1 #// minimum length of search string
        transition: 'fade' #// page transition, default is fade
        callback: itemSelected #// optional callback function fires upon result selection

run = ->
    select()
    bind()

jQuery(document).ready( run )