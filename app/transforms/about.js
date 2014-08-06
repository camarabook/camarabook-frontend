/* global Ember */

import DS from 'ember-data';

var AboutProcess = Ember.Object.extend({
  init: function() {
    switch (this.get('section_key')) {
      case "aeafc8f34732641553799fb8ca590b9f":
      case "96fe59d4857f07b3a2a996168029eb37":
      case "bc16af5126991cfd262aae5b58da37e0":
      case "d928cebb408327c4f1b57ffd107864bb":
      case "f7fa4c0548d3459a9debadfac3180220":
        this.asTable();
        break;
      case "f24596b67f7291982ec060bbef51c9d3":
      case "1a2763438aaac7df5a0ad75a0ba33b5a":
        this.asList();
        break;
      case "15831589ecda20d8bdf7a5f6eb3e42a8":
      case "1969e86f7d90e8847bd27ddf83e3d4f3":
      case "b6dd4de4c13b612ce37967ac933bcfb3":
      case "3e586eade204caddfe4ba259547e1e5a":
        this.asText("\n");
        break;
      default:
        this.set("texts", ["Processando... em breve"]);
    }
    this.setType();
  },

  setType: function() {
    switch (this.get('section_key')) {
      case "f24596b67f7291982ec060bbef51c9d3":
      case "1a2763438aaac7df5a0ad75a0ba33b5a":
      case "bc16af5126991cfd262aae5b58da37e0":
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
    var body, list, row, row_title, text, texts, title, _i, _l, _len, _row;
    list = [];
    body = this.get('body').split("\n");
    for (_i = 0, _len = body.length; _i < _len; _i++) {
      row = body[_i];
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
        _row = row.split(":");
        _l = list.splice(-1)[0];
        row_title = _row.shift();
        text = _row.join(":");
        texts = _.map(text.split(";"), (function(_this) {
          return function(text) {
            return _this.clean(text);
          };
        })(this));

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
    var label, row, table, text, _i, _len, _ref, _row;
    if (row_delimiter == null) {
      row_delimiter = ";";
    }
    if (line_delimiter == null) {
      line_delimiter = ",";
    }
    table = [];
    _ref = this.get('body').split(row_delimiter);
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      row = _ref[_i];
      _row = row.split(line_delimiter);
      label = _row.shift();
      text = _row.join(line_delimiter).replace(/^ /, "").replace(/^(da|do) /, "");
      table.push({
        label: label,
        text: this.clean(text)
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
    var _i, _len, data = [];
    for (_i = 0, _len =serialized.length; _i < _len; _i++) {
      data.push(AboutProcess.create(serialized[_i]));
    }

    return data;
  },

  serialize: function(deserialized) {
    return deserialized;
  }
});
