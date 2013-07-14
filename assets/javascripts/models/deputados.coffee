class Deputado extends Backbone.Model
  url: => "http://api.#{window.location.host}/deputados/#{@get('id')}"

class Deputados extends Backbone.Collection
  model: Deputado
  url: "http://api.#{window.location.host}/deputados"

window.Deputado = Deputado
window.Deputados = Deputados
