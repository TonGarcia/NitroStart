// Rails Frameworks
//= require creative-tim/jquery-1.10.2
//= require creative-tim/jquery-ui-1.10.4.custom.min
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks

// PlugIns
//= require jquery.mask.min
//= require jquery.sticky.js
//= require nprogress
//= require nprogress-turbolinks
//= require creative-tim/bootstrap
//= require creative-tim/awesome-landing-page

$(window).load(function() {
    // Set on scroll fix navbar
    if($("#sticker").length > 0) {
        $("#sticker").sticky({topSpacing:0});        
    }

    // ScrollTo
    $("a[href^='#']").click(function(e) {
        e.preventDefault();
        var dest = $(this).attr('href');
        if(dest) $('html,body').animate({ scrollTop: $(dest).offset().top }, 'slow');
    });
});