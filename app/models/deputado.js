import DS from 'ember-data';
var attr = DS.attr;

export default DS.Model.extend({
  cadastro_id: attr('number'),
  parlamentar_id: attr('number'),
  nome: attr('string'),
  nome_parlamentar: attr('string'),
  sexo: attr('string'),
  uf: attr('string'),
  gabinete: attr('number'),
  anexo: attr('number'),
  fone: attr('string'),
  email: attr('string'),
  uri: attr('string'),
  image_url: attr('string'),
  sobre: attr('about'),
});
