window.DeputadosView ||= {}

class DeputadosView.Show extends Support.CompositeView
  template: JST["deputados/show"]
  initialize: (options)->
    {page: @page} = options
    @page = {"sobre": "about"}[@page]
    @deputado = new Deputado uri: @id
    @deputado.fetch()
    @bindTo @deputado, "reset change", @renderData

  events:
    'click #top_menu a': 'openFragment'

  openFragment: (e)->
    e.preventDefault()
    page = e.currentTarget.id
    @openDeputadoPage(page)

  openDeputadoPage: (page)->
    @_leaveChildren()
    page = 'feed' unless page
    view = @pageView(page, @deputado)
    el = @$("[data-page-id=#{page}]")
    @$('.current').removeClass('current')
    @$("##{page}").parent().addClass('current')
    @renderChildInto(view, el)

  render: =>
    $(@el).attr('id', "deputado-#{@id}")
    @loading = new Loading()
    return this

  renderData: =>
    $(@el).html @template(deputado: @deputado.toJSON())
    @$('.fragment').hide()
    @openDeputadoPage(@page)
    @loading.stop()


  pageView: (page, params)->
    classView = page.toLowerCase().replace /(?:^|\s|-)\S/g, (c)-> c.toUpperCase()
    new DeputadosView[classView](params)

