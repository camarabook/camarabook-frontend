import DS from 'ember-data';

export default DS.RESTAdapter.extend({
  host: 'http://127.0.0.1:5001'
});
