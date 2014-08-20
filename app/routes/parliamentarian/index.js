import Ember from 'ember';

export default Ember.Route.extend({
  model: function(_, transition) {
    var parliamentarian_id = transition.params.parliamentarian.parliamentarian_id;
    return this.store.findQuery('activity', {parliamentarian_id: parliamentarian_id});
  }
});
