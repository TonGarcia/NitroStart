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
//= require jquery.mask.min
//= require redactor-rails
//= require redactor-rails/plugins
//= require lib/redactor/video
//= require lib/redactor/config

// My JS
//= require concerns/fast_fix
//= require_tree

$(function(){
    config_redactor();
    $('.slider').slider();
    $(".button-collapse").sideNav();
    $('.nav_actions a').scrollTo({
        speed: 500
    });
});