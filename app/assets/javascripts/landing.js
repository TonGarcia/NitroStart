// Rails Frameworks
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks

// PlugIns
//= require nprogress
//= require nprogress-turbolinks
//= require materialize-sprockets
//= require prettyphoto-rails

// My JS
//= require app/partners
//= require concerns/fast_fix
//= require concerns/accounting

$(document).ready(function(){
    setup_tabs();
    fix_error_field();

    $('.parallax').parallax();
    $('.tooltipped').tooltip({delay: 50});

    $("a[rel^='prettyPhoto']").prettyPhoto({
        show_title: false,
        allow_resize: true
    });

    $('.nav-wrapper a[href*="#"]').on('click', function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });
});


$(document).on('page:load', function(){
    setup_tabs();
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