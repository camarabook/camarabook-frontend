window.DeputadosView ||= {}

class DeputadosView.About extends Support.CompositeView
  template: JST["deputados/about"]

  initialize: (@deputado)->
    @about = new DeputadoAbout uri: @deputado.get('uri')
    @about.fetch()
    @bindTo @about, "reset change", @renderData

  render: =>
    @loading = new Loading()
    return this

  renderData: =>
    @loading.stop()
    $(@el).html @template(deputado: @deputado.toJSON(), about: @about.toJSON())
    truncateText(@$("ul.list li"), 20)
