window.DeputadosView ||= {}

class DeputadosView.Index extends Support.CompositeView
  template: JST["deputados/index"]

  initialize: ->
    @collection = new Deputados
    @collection.fetch()
    @bindTo @collection, "reset change", @render

  render: =>
    $(@el).html @template(deputados: @collection.toJSON())
    return this
