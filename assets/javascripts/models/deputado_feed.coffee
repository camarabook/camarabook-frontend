class DeputadoItemFeed extends Backbone.Model

class DeputadoFeed extends Backbone.Collection
  url: => "http://api.#{window.location.host}/deputados/#{@uri}/feed"
  model: DeputadoItemFeed
  initialize: (uri) => @uri = uri

window.DeputadoFeed = DeputadoFeed
