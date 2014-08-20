import DS from 'ember-data';
var attr = DS.attr;

export default DS.Model.extend({
  author: attr(),
  content: attr(),
  location: attr(),
  published_at: attr(),
});
