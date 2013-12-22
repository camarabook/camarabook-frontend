class Proposition extends Backbone.Model

class DeputadoPropositions extends Backbone.Collection
  url: => "http://#{window.location.host}/api/deputados/#{@uri}/propositions"
  model: Proposition
  initialize: (options)=> @uri = options.uri

window.DeputadoPropositions = DeputadoPropositions
