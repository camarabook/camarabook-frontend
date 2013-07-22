class Loading
  spin_options:
    lines: 13
    length: 11
    width: 3
    radius: 1
    corners: 1
    rotate: 44
    direction: 1
    color: '#444'
    speed: 0.9
    trail: 71
    shadow: true
    hwaccel: false
    className: 'spinner'
    zIndex: 2e9
    top: 'auto'
    left: 'auto'

  constructor: (options)->
    loading = $("<div id='loading'></div>")
    @spinner = new Spinner(@spin_options).spin()
    loading[0].appendChild(@spinner.el);
    $(options.root).append(loading)

  stop: =>
    @spinner.stop()

window.Loading = Loading
