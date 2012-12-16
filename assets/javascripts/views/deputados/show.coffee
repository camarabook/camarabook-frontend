window.DeputadosView ||= {}

class DeputadosView.Show extends Support.CompositeView
  template: JST["deputados/show"]

  initialize: ->
    @model = new Deputado id: @id
    @model.fetch()
    @bindTo @model, "reset change", @render

  render: =>
    $(@el).html @template(deputado: @model.toJSON())
    return this

