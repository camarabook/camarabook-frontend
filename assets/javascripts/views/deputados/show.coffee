window.DeputadosView ||= {}

class DeputadosView.Show extends Support.CompositeView
  template: JST["deputados/show"]
  initialize: ->
    @deputado = new Deputado id: @id
    @deputado.fetch()
    @bindTo @deputado, "reset change", @render_data

    @feed_view = new DeputadosView.Feed id: @id

  render: =>
    $(@el).attr('id', "deputado-#{@id}")
    return this

  render_data: =>
    $(@el).html @template(deputado: @deputado.toJSON())
    @renderChildInto(@feed_view, @$('#feed'))
