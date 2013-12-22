class DeputadoItemFeed extends Backbone.Model

class DeputadoFeed extends Backbone.Collection
  url: => "http://#{window.location.host}/api/deputados/#{@uri}/feed"
  model: DeputadoItemFeed
  initialize: (uri) => @uri = uri

window.DeputadoFeed = DeputadoFeed
