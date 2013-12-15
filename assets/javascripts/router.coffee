class Router extends Support.SwappingRouter
  el: "#main"

  routes:
    "deputados"                                                  : "deputadosIndex"
    ":id"                                                        : "deputadosShow"
    ":id/:page"                                                  : "deputadosShow"
    ".*"                                                         : "deputadosIndex"

  deputadosIndex: ->
    view = new DeputadosView.Index
    @swap(view)

  deputadosShow: (id, page)->
    view = new DeputadosView.Show(id: id, page: page)
    @swap(view)

window.Router = Router
