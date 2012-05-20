# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->
    jQuery.expr[":"].Contains = (a, i, m) ->
        (a.textContent or a.innerText or "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0

    $('input[name="search"]').focus(() ->
        if $(this).val() == 'Search'
            $(this).removeClass('start')
                .val ''
    ).blur(() ->
        if $(this).val() == ''
            $(this).addClass('start')
                .val 'Search'
    ).keyup(() ->
        filter = $(this).val()
        if filter
            $('#chatrooms ul').find('h3:not(:Contains(' + filter + '))').parent().slideUp(250)
            $('#chatrooms ul').find('h3:Contains(' + filter + ')').parent().slideDown(250)
        else
            $('#chatrooms ul').find('li').slideDown(250)
    )

    $('.mousescroll').slimscroll {
        color: '#333',
        size: '5px',
        width: '300px',
        height: '460px'
    }

    new CityGrid.Ads 'sidebar_ad_slot', {
        collection_id: 'web-001-630x100',
        publisher: 'citysearch',
        what: 'sushi',
        lat: 34.088188,
        lon: -118.37205,
        width: 630,
        height: 100
    }
