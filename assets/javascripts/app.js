//= require vendor/jquery
//= require vendor/nprogress
//= require vendor/list
//= require vendor/handlebars
//= require vendor/underscore
//= require vendor/backbone
//= require vendor/backbone-support
//= require loading
//= require_tree .
//= require_self

$(document).ready(function(){
  window.router = new Router();
  Backbone.history.start({pushState: true});
  $("a").live('click', function(event){
    href = $(event.currentTarget).attr("href");
    router.navigate(href, {trigger: true});
    loading = new Loading()
    event.preventDefault();
  });
});
