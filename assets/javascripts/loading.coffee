class Loading
  constructor: -> NProgress.start()
  stop: -> NProgress.done();

window.Loading = Loading
