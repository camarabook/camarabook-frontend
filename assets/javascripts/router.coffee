class Router extends Support.SwappingRouter
  el: "#content"

  routes:
    "deputados"                                                  : "deputadosIndex"
    "deputados/:id"                                              : "deputadosShow"
    ".*"                                                         : "deputadosIndex"

  deputadosIndex: ->
    view = new DeputadosView.Index
    @swap(view)

  deputadosShow: (id)->
    view = new DeputadosView.Show(id: id)
    @swap(view)

window.Router = Router
