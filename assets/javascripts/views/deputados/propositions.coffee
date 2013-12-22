window.DeputadosView ||= {}

class DeputadosView.Propositions extends Support.CompositeView
  template: JST["deputados/propositions"]

  initialize: (@deputado)->
    @propositions = new DeputadoPropositions uri: @deputado.get('uri')
    @propositions.fetch()
    @bindTo @propositions, "reset change", @renderData

  render: =>
    @loading = new Loading()
    return this

  renderData: =>
    @loading.stop()
    $(@el).html @template(propositions: @propositions.toJSON(), deputado: @deputado.toJSON())

