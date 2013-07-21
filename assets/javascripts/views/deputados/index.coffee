window.DeputadosView ||= {}

class DeputadosView.Index extends Support.CompositeView
  template: JST["deputados/index"]

  initialize: ->
    @deputados = new Deputados
    @deputados.fetch()
    @bindTo @deputados, "reset change", @renderData

  render: =>
    return this

  renderData: =>
    $(@el).html @template(deputados: @deputados.toJSON())
    @render()
