class Router extends Support.SwappingRouter
  el: "#content"
  routes:
    "deputados"                                                  : "deputadosIndex"
    ".*"                                                         : "deputadosIndex"

  deputadosIndex: ->
    view = new DeputadosView.Index
    @swap(view)


window.Router = Router
