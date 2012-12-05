//= require vendor/jquery
//= require handlebars
//= require handlebars.runtime
//= require vendor/underscore
//= require vendor/backbone
//= require backbone-support
//= require_tree .
//= require_self

$(document).ready(function(){
  window.router = new Router;
  Backbone.history.start({pushState: true});
  $("a").live('click', function(event){
    href = $(event.currentTarget).attr("href")
    router.navigate(href, {trigger: true})
    event.preventDefault();
  });
});
