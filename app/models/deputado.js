import DS from 'ember-data';

export default DS.Model.extend({
  cadastro_id: DS.attr(),
  parlamentar_id: DS.attr(),
  nome: DS.attr(),
  nome_parlamentar: DS.attr(),
  sexo: DS.attr(),
  uf: DS.attr(),
  gabinete: DS.attr(),
  anexo: DS.attr(),
  fone: DS.attr(),
  email: DS.attr(),
  uri: DS.attr(),
  image_url: DS.attr(),
});
