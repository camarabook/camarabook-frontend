/* global $ */
import Ember from 'ember';

export default Ember.View.extend({
 didInsertElement : function(){
    this._super();
    this.afterRenderEvent();
  },
  afterRenderEvent : function(){
    $(".js-menu__item").removeClass("current");
    $(".js-menu__about").addClass("current");
  }
});
