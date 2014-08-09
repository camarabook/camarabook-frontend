import Ember from 'ember';

var Router = Ember.Router.extend({
  location: CamarabookENV.locationType
});

Router.map(function() {
  this.resource('parliamentarian', { path: ':parliamentarian_id' }, function(){
    this.route("about");
  });
});

export default Router;
