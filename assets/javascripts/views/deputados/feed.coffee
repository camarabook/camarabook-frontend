window.DeputadosView ||= {}

class DeputadosView.Feed extends Support.CompositeView
  template: JST["deputados/feed"]

  initialize: ->
    @feed = new DeputadoFeed @id
    @feed.fetch()
    @bindTo @feed, "reset change", @render_data

  render: =>
    return this

  render_data: =>
    $(@el).html @template(activities: @feed.toJSON())
