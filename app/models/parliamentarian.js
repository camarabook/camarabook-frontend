import DS from 'ember-data';
var attr = DS.attr;

export default DS.Model.extend({
  name: attr('string'),
  real_name:  attr('string'),
  about: attr('about'),
  haveNick: function(){
    return this.get('name') !== this.get('real_name');
  }.property('name', 'real_name'),
  image_url: attr('string'),
});
