import DS from 'ember-data';

export default DS.RESTAdapter.extend({
  host: window.CamarabookENV.API_URL,
  namespace: "v1"
});
