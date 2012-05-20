# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->
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
            $('#chatrooms ul').find('h3:not(:contains(' + filter + '))').parent().slideUp(250)
            $('#chatrooms ul').find('h3:contains(' + filter + ')').parent().slideDown(250)
        else
            $('#chatrooms ul').find('li').slideDown(250)
    )

    $('.mousescroll').slimscroll {
        color: '#333',
        size: '5px',
        width: '300px',
        height: '461px'
    }

