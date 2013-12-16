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
  document.createElement('video');document.createElement('audio');
  $("a:not(.nofollow)").live('click', function(event){
    href = $(event.currentTarget).attr("href");
    router.navigate(href, {trigger: true});
    loading = new Loading();
    event.preventDefault();
  });
});

Number.prototype.formatMoney = function(c, d, t){
  var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
  return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};

Handlebars.registerHelper('hummanize_month', function(){
  months = [0, "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
  return months[this.month];
});


Handlebars.registerHelper('post_time', function(){
  return new Date(this.published_at);
});

Handlebars.registerHelper('preposition', function(){
  switch(this.type){
    case 'money':
      return " com ";
    case 'video':
      return " um ";
    default:
      return "";
  }
});

Handlebars.registerHelper('value', function(){
  return this.value && "R$ " + this.value.formatMoney(2, ',', '.') + "";
});

Handlebars.registerHelper('ifvalue', function (a, b, options) {
  if (a === b) {
    return options.fn(this);
  } else {
   return options.inverse(this);
  }
});

Handlebars.registerHelper('object', function(){
  if(this.type === "video"){
    return "Video";
  } else {
    return this.object;
  }
});

$(".ellipsis").live("click", function() { $(this).toggleClass(".ellipsis"); });


