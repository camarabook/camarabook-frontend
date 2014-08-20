/* global moment */
import Ember from 'ember';

moment.locale('pt-br');

export default Ember.Handlebars.makeBoundHelper(function(value) {
  return moment(value).fromNow(); // "dddd, D MMMM YYYY", "pt-br");
});
