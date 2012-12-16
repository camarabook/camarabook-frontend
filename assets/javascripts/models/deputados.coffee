class Deputado extends Backbone.Model
  url: => "http://localhost:3000/deputados/#{@get('id')}"

class Deputados extends Backbone.Collection
  model: Deputado
  url: "http://localhost:3000/deputados"

window.Deputado = Deputado
window.Deputados = Deputados
