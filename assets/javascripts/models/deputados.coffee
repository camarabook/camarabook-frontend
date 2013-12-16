class Deputado extends Backbone.Model
  url: => "http://#{window.location.host}/api/deputados/#{@get('uri')}"

class About extends Backbone.Model
  initialize: ->
    switch @get('section_key')
      when "aeafc8f34732641553799fb8ca590b9f", "96fe59d4857f07b3a2a996168029eb37", "aeafc8f34732641553799fb8ca590b9f", "bc16af5126991cfd262aae5b58da37e0"
        table = []
        for row in @get('body').split(";")
          _row = row.split(",")
          label = _row.shift()
          text = _row.join(",").replace(/^ /, "").replace(/^(da|do) /, "")
          table.push({label: label, text: text})
      when "f24596b67f7291982ec060bbef51c9d3", "1a2763438aaac7df5a0ad75a0ba33b5a"
        list = []
        body = @get('body').split("\n")
        for row in body
          _title = row.split(":")[0]
          if _title.indexOf(" - ") != -1
            list.push({title: _title, itens: []})
          else
            _row = row.split(":")
            _l = list.splice(-1)[0]
            title = _row.shift()
            text = _row.join(":")
            _l.itens.push({title: title, texts: text.split(";")})
            list.push(_l)
      when "15831589ecda20d8bdf7a5f6eb3e42a8", "1969e86f7d90e8847bd27ddf83e3d4f3", "b6dd4de4c13b612ce37967ac933bcfb3"
        @set("texts", @get("body").split("\n"))
      else
        @set("texts", ["Processando... em breve"])


    @set("table", table) if table
    @set("list", list) if list
    @set_type()

  set_type: ->
    switch @get('section_key')
      when "f24596b67f7291982ec060bbef51c9d3", "1a2763438aaac7df5a0ad75a0ba33b5a", "bc16af5126991cfd262aae5b58da37e0"
        @set_main()
      else
        @set_secondary()

  set_secondary: ->
    @set("secondary", true)
    @set("main", false)
  set_main: ->
    @set("secondary", false)
    @set("main", true)



class DeputadoAbout extends Backbone.Collection
  url: => "http://#{window.location.host}/api/deputados/#{@uri}/about"
  model: About
  initialize: (options)=>
    @uri = options.uri



class Deputados extends Backbone.Collection
  model: Deputado
  url: "http://#{window.location.host}/api/deputados"

window.Deputado = Deputado
window.Deputados = Deputados
window.DeputadoAbout = DeputadoAbout
