window.DeputadosView ||= {}

class DeputadosView.Show extends Support.CompositeView
  template: JST["deputados/show"]
  initialize: ->
    @deputado = new Deputado uri: @id
    @deputado.fetch()
    @bindTo @deputado, "reset change", @renderData


  render: =>
    $(@el).attr('id', "deputado-#{@id}")
    @loading = new Loading()
    return this

  renderData: =>
    $(@el).html @template(deputado: @deputado.toJSON())
    @feed_view = new DeputadosView.Feed @deputado
    @renderChildInto(@feed_view, @$('#feed'))
    @loading.stop()
