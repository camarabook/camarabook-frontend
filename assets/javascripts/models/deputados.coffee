class Deputado extends Backbone.Model
  a:=>"dds"

class Deputados extends Backbone.Collections
  model: Deputado
  url: "/deputados"

window.Deputado = Deputado
window.Deputados = Deputados
