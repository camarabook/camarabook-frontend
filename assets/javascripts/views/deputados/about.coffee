window.DeputadosView ||= {}

class DeputadosView.About extends Support.CompositeView
  template: JST["deputados/about"]

  initialize: (@deputado)->


  render: =>
    $(@el).html @template(deputado: @deputado.toJSON())
