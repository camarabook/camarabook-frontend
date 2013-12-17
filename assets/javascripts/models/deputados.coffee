class Deputado extends Backbone.Model
  url: => "http://#{window.location.host}/api/deputados/#{@get('uri')}"

class About extends Backbone.Model
  initialize: ->
    switch @get('section_key')
      when "aeafc8f34732641553799fb8ca590b9f", "96fe59d4857f07b3a2a996168029eb37", "bc16af5126991cfd262aae5b58da37e0", "d928cebb408327c4f1b57ffd107864bb", "f7fa4c0548d3459a9debadfac3180220"
        @as_table()
      when "f24596b67f7291982ec060bbef51c9d3", "1a2763438aaac7df5a0ad75a0ba33b5a"
        @as_list()
      when "15831589ecda20d8bdf7a5f6eb3e42a8", "1969e86f7d90e8847bd27ddf83e3d4f3", "b6dd4de4c13b612ce37967ac933bcfb3", "3e586eade204caddfe4ba259547e1e5a"
        @as_text("\n")
      else
        @set("texts", ["Processando... em breve"])

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

  as_text: (delimiter)-> @set("texts", @get("body").split(delimiter))

  as_list: ->
    list = []
    body = @get('body').split("\n")
    for row in body
      title = row.split(":")[0]
      if title.indexOf(" - ") != -1
        list.push({title: title, itens: []})
      else
        if list.length == 0
          return @as_table()
          break
        _row = row.split(":")
        _l = list.splice(-1)[0]
        row_title = _row.shift()
        text = _row.join(":")
        texts = _.map(text.split(";"), (text)=> @clean(text))
        _l.itens.push({title: row_title, texts: texts})
        list.push(_l)
    @set("list", list)

  as_table: (row_delimiter = ";", line_delimiter = ",")->
    table = []
    for row in @get('body').split(row_delimiter)
      _row = row.split(line_delimiter)
      label = _row.shift()
      text = _row.join(line_delimiter).replace(/^ /, "").replace(/^(da|do) /, "")
      table.push({label: label, text: @clean(text)})
    @set("table", table)

  clean: (text)->
    text.replace(/-.$|-$|- .$| $| - $/, "")

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
