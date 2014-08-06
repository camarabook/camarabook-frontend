import Ember from 'ember';

var Router = Ember.Router.extend({
  location: CamarabookENV.locationType
});

Router.map(function() {
  this.resource('deputado', { path: ':deputado_id' });
});

export default Router;
