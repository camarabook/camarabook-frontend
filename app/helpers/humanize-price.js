import Ember from 'ember';

var formatMoney = function(n, _c,_d, _t){
  var c = isNaN(_c = Math.abs(_c) ) ? 2 : _c,
      d = (_d === undefined) ? "," : _d,
      t = (_t === undefined) ? "." : _t,
      s = n < 0 ? "-" : "",
      i = parseInt(n = Math.abs(+n || 0).toFixed(c), 10) + "",
      j = (j = i.length) > 3 ? j % 3 : 0;

  return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};


export default Ember.Handlebars.makeBoundHelper(function(value) {
  return value && "R$ " + formatMoney(value, 2, ',', '.') + "";
});
