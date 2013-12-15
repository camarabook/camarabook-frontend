class Deputado extends Backbone.Model
  url: => "http://#{window.location.host}/api/deputados/#{@get('uri')}"

class Deputados extends Backbone.Collection
  model: Deputado
  url: "http://#{window.location.host}/api/deputados"

window.Deputado = Deputado
window.Deputados = Deputados
