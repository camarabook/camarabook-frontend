class Loading
  constructor: (el)->
    $(el).html "Carregando... "
    NProgress.start()
  stop: -> NProgress.done();

window.Loading = Loading
