window.DeputadosView ||= {}

class DeputadosView.Feed extends Support.CompositeView
  template: JST["deputados/feed"]

  initialize: ->
    @feed = new DeputadoFeed @id
    @feed.fetch()
    @bindTo @feed, "reset change", @renderData

  render: =>
    return this

  renderData: =>
    $(@el).html @template(activities: @feed.toJSON())
