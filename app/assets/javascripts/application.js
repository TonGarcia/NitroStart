// Rails Frameworks
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks

// PlugIns
//= require nprogress
//= require nprogress-turbolinks
//= require materialize-sprockets
//= require admin_materialize

// My JS
//= require concerns/fast_fix

$(function(){
    $('.slider').slider();
    $(".button-collapse").sideNav();
    $('.nav_actions a').scrollTo({
        speed: 500
    });
});