# Social Câmara
## A rede social preferida dos deputados da cârama!

## Frontend

Esse repositório consiste no frontend do projeto,([caso esteja interessado no API](https://github.com/dukex/socialcamara-api)), é responsabilidade desse frontend buscar os dados na API e construir as views do projeto.

Esse projeto é feito com Backbone e um [pequeno proxy](https://github.com/dukex/socialcamara-site/blob/master/api.rb) para api em ruby.


### Instalação

```
  $ git clone https://github.com/dukex/socialcamara-site
  $ cd socialcamara-site
  $ bundle install
```

### Rodando

Para rodar esse projeto é necessario que o servidor da API esteja funcionando, [veja como subir a api](https://github.com/dukex/socialcamara-api), **vamos partir do presuposto que a api esteja rodando na porta 5001**, então rode:

```
  $ bundle exec API_URL=http://127.0.0.1:5001 rackup -p 5000
```

Acesse [http://127.0.0.1:5000](http://127.0.0.1:5000).

### Contribua

1. Fork o projeto
2. Crie um feature-branch ($ git checkout -b myfeaturebranch master)
3. Trabalhe com commits pequenos e objetivos
4. Atualiza esse branch no github ($ git push origin myfeaturebranch)
5. Mande um pull-request
