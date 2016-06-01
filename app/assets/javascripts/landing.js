// Rails Frameworks
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks

// PlugIns
//= require materialize-sprockets

// My JS
//= require app/partners
//= require concerns/fast_fix

$(document).ready(function(){
    $('.parallax').parallax();

    setup();
    setup_tabs();
    fix_error_field();
    setup_bg_error_img();

    $('.tooltipped').tooltip({delay: 50});
});


$(document).on('page:load', function(){
    setup_tabs();
    $('.parallax').parallax();
});


function setup_tabs() {
    var tabs = $('ul.tabs');
    if(tabs.length == 0) return;
    var anchors = tabs.children('.tab').children('a');
    var first_anchor = $(anchors[0]);
    window.anchor = first_anchor;
    first_anchor.trigger('click');
}

function fix_error_field() {
    var error_fields = $('.field_with_errors');
    if(error_fields.length == 0) return;

    for(i in error_fields) {
        var error_field = $(error_fields[i]);
        error_field.parent().html(error_fields.html());
    }

    $([0]).html();
}

$(setup);
$(document).on('page:load', setup);