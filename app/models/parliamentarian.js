import DS from 'ember-data';
var attr = DS.attr;

export default DS.Model.extend({
  name: attr('string'),
  other_names: attr(),
  image: attr('string'),
  biography: attr('about'),

  real_name: function(){
    return this.get('other_names')[0].name;
  }.property('other_names'),

  parliamenratian_name: function() {
   return "Deputado " + this.get('name');
  }.property("name")
});
