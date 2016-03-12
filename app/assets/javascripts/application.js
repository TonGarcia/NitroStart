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
//= require lib/redactor/langs/pt_br

// My JS
//= require concerns/fast_fix
//= require concerns/helpers.js.erb
//= require_tree ./app

$(setup);
$(document).on('page:load', setup);