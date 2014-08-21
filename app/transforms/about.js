/* global Ember,_ */

import DS from 'ember-data';

var AboutProcess = Ember.Object.extend({
  init: function() {
    "use strict";
    var title = this.get('title').trim();
    if(title === "") {
      return;
    }
    switch (title) {
      case "Missões Oficiais - Outros Órgãos":
      case "Condecorações":
      case "Seminários e Congressos":
      case "Missões Oficiais":
      case "Atividades Profissionais e Cargos Públicos":
      case "Mandatos (na Câmara dos Deputados)":
      case "Estudos e Cursos Diversos":
      case "Filiações Partidárias":
      case "Atividades Partidárias":
        this.asTable();
        break;
      case "Atividades Parlamentares":
        this.asList();
        break;
      case "15831589ecda20d8bdf7a5f6eb3e42a8":
      case "1969e86f7d90e8847bd27ddf83e3d4f3":
      case "b6dd4de4c13b612ce37967ac933bcfb3":
      case "Conselhos":
      case "Obras Publicadas":
        this.asText("\n");
        break;
      default:
        this.set("texts", ["Processando... em breve"]);
    }
    this.setType();
  },

  setType: function() {
    "use strict";

    switch (this.get('title').trim()) {
      case "Atividades Parlamentares":
      case "Atividades Partidárias":
      case "Mandatos (na Câmara dos Deputados)":
        this.setMain();
        break;
      default:
        this.setSecondary();
    }
  },

  setSecondary: function() {
    this.set("secondary", true);
    this.set("main", false);
  },

  setMain: function() {
    this.set("secondary", false);
    this.set("main", true);
  },

  asText: function(delimiter) {
    this.set("texts", this.get("body").split(delimiter));
  },

  asList: function() {
    "use strict";

    var list = [],
        body = this.get('body').split("\n");

    var clearTexts = function(_this) {
          return function(text) {
            return _this.clean(text);
          };
        };

    for (var i = 0, len = body.length; i < len; i++) {
      var row = body[i],
          title = row.split(":")[0];

      if (title.indexOf(" - ") !== -1) {
        list.push({
          title: title,
          itens: []
        });
      } else {
        if (list.length === 0) {
          this.asTable();
          break;
        }

        var _row = row.split(":"),
            _l = list.splice(-1)[0],
            row_title = _row.shift(),
            text = _row.join(":"),
            texts = _.map(text.split(";"), clearTexts(this));

        _l.itens.push({
          title: row_title,
          texts: texts
        });

        list.push(_l);
      }
    }
    return this.set("list", list);
  },

  asTable: function(row_delimiter, line_delimiter) {
    "use strict";

    if (row_delimiter == null) {
      row_delimiter = ";";
    }
    if (line_delimiter == null) {
      line_delimiter = ",";
    }
    var table = [],
        body = this.get('body'),
        withTitle = body.split("\n");

    if (withTitle.length > 1) {
      table.push({
        label: withTitle[0],
        isTitle: true
      });
      body = withTitle[1];
    }

    var ref = body.split(row_delimiter);

    for (var i = 0, len = ref.length; i < len; i++) {
      var row = ref[i],
          _row = row.split(line_delimiter),
          label = _row.shift();
          var text = _row.join(line_delimiter).replace(/^ /, "").replace(/^(da|do) /, "");

      if (text === "") {
        text = label;
        label = "";
      }

      table.push({
        label: label,
        text: this.clean(text),
        isTitle: false
      });
    }
    return this.set("table", table);
  },

  clean: function(text) {
    return text.replace(/-.$|-$|- .$| $| - $/, "");
  },
});

export default DS.Transform.extend({
  deserialize: function(serialized) {
    var items = serialized.split("\n\n"), data = [];

    for (var i = 0, len = items.length; i < len; i++) {
      var item = items[i],
          body = item.split("\n"),
          title = body.shift();
      data.push(AboutProcess.create({title: title, body: body.join("\n")}));
    }

    return data;
  },

  serialize: function(deserialized) {
    return deserialized;
  }
});
