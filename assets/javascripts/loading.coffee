class Loading
  constructor: (el)->
    $(el).html "Carregando... " if el
    NProgress.start()
  stop: -> NProgress.done();

window.Loading = Loading
