class Deputado extends Backbone.Model
  url: => "http://#{window.location.host}/api/deputados/#{@get('uri')}"

class About extends Backbone.Model
  initialize: ->
    @set("secondary", true)
    switch @get('section_key')
      when "aeafc8f34732641553799fb8ca590b9f", "96fe59d4857f07b3a2a996168029eb37"
        table = []
        for row in @get('body').split(";")
          _row = row.split(",")
          label = _row.shift()
          text = _row.join(",").replace(/^ /, "").replace(/^(da|do) /, "")
          table.push({label: label, text: text})
      when "f24596b67f7291982ec060bbef51c9d3"
        @set("secondary", false)
        @set("main", true)
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



    @set("table", table) if table
    @set("list", list) if list


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
