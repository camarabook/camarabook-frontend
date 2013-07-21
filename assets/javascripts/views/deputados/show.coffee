window.DeputadosView ||= {}

class DeputadosView.Show extends Support.CompositeView
  template: JST["deputados/show"]
  initialize: ->
    @deputado = new Deputado uri: @id
    @deputado.fetch()
    @bindTo @deputado, "reset change", @render_data


  render: =>
    $(@el).attr('id', "deputado-#{@id}")
    return this

  render_data: =>
    $(@el).html @template(deputado: @deputado.toJSON())
    @feed_view = new DeputadosView.Feed @deputado
    @renderChildInto(@feed_view, @$('#feed'))
