window.DeputadosView ||= {}

class DeputadosView.Index extends Support.CompositeView
  template: JST["deputados/index"]
  id: 'deputados_index'

  initialize: ->
    @deputados = new Deputados
    @deputados.fetch()
    @bindTo @deputados, "reset change", @renderData

  render: =>
    @loading = new Loading()
    return this

  renderData: =>
    @loading.stop()
    $(@el).html @template(deputados: @deputados.toJSON())

    searchOptions =
      valueNames: ['name']
    deputadoSearch = new List('deputados_index', searchOptions);
