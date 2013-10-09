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
    loading = new Loading();
    event.preventDefault();
  });
});

Handlebars.registerHelper('hummanize_month', function(){
  months = [0, "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
  return months[this.month];
});

Handlebars.registerHelper('post_time', function(){
  return new Date(this.data_emissao);
});
