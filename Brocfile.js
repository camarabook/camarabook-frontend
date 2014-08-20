/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var compileSass = require('broccoli-sass');

var app = new EmberApp();

app.import("vendor/underscore/underscore.js");
app.import("vendor/bourbon/dist/_bourbon.scss");
app.import('vendor/moment/min/moment-with-locales.js');

var tree = app.toTree();
module.exports = tree;

compileSass([tree], 'assets/app.sass', 'assets/app.css');
