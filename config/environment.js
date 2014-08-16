/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
      }
    },

    APP: {
    }
  };

  if (environment === 'development') {
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    ENV.APP.LOG_TRANSITIONS = true;
    ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.API_URL = 'http://127.0.0.1:5001';
  }

  if (environment === 'test') {
  }

  if (environment === 'production') {
    ENV.API_URL = 'http://camarabook-api.herokuapp.com';
  }

  return ENV;
};
