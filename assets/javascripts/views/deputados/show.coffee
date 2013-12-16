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
    'click #top_menu a, .profilelink': 'openFragment'

  openFragment: (e)->
    e.preventDefault()
    page = e.currentTarget.id
    $(".fragment").hide()
    @$("[data-page-id=#{page}]").show()
    @openDeputadoPage(page)

  openDeputadoPage: (page)->
    console.log(this)
    @_leaveChildren()
    page = 'feed' unless page
    view = @pageView(page, @deputado)
    @$('.current').removeClass('current')
    @$("##{page}").parent().addClass('current')
    @renderChildInto(view, @$("[data-page-id=#{page}]"))

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
    href = @$("[data-page-id=#{page}]").data("page-url")
    router = new Router()
    router.navigate(href, {trigger: false});
    classView = page.toLowerCase().replace /(?:^|\s|-)\S/g, (c)-> c.toUpperCase()
    new DeputadosView[classView](params)

