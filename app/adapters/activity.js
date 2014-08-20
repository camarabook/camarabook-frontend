import Application from 'camarabook/adapters/application';

export default Application.extend({
  buildURL: function(_, parliamentarian_id) {
    var url = [this.urlPrefix()];
    url.push('parliamentarians');
    url.push(parliamentarian_id);
    url.push('activities');
    return url.join("/");
  },

  findQuery: function(store, type, query) {
    return this.ajax(this.buildURL(type.typeKey, query.parliamentarian_id), 'GET', {  });
  }
});
