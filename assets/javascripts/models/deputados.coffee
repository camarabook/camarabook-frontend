class Deputado extends Backbone.Model
  url: => "http://api.#{window.location.host}/deputados/#{@get('uri')}"

class Deputados extends Backbone.Collection
  model: Deputado
  url: "http://api.#{window.location.host}/deputados"

window.Deputado = Deputado
window.Deputados = Deputados
