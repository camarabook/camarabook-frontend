class DeputadoItemFeed extends Backbone.Model

class DeputadoFeed extends Backbone.Collection
  url: => "http://api.#{window.location.host}/deputados/#{@id}/feed"
  model: DeputadoItemFeed
  initialize: (id) => @id = id

window.DeputadoFeed = DeputadoFeed
