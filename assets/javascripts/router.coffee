class Router extends Support.SwappingRouter
  el: "#main"

  routes:
    "deputados"                                                  : "deputadosIndex"
    ":id"                                                        : "deputadosShow"
    ".*"                                                         : "deputadosIndex"

  deputadosIndex: ->
    view = new DeputadosView.Index
    @swap(view)

  deputadosShow: (id)->
    view = new DeputadosView.Show(id: id)
    @swap(view)

window.Router = Router
