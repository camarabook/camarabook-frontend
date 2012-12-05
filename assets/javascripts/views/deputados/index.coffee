window.DeputadosView ||= {}

class DeputadosView.Index extends Backbone.View
  template: JST["deputados/index"]

  initialize: ->
    @collection = new Deputados
    @bindTo @collection, "reset change", @render

  render: =>
    #$(@el).html @template(deputados: @collection.toJSON())
    return this
