requirejs.config
  baseUrl: './js'
  shim:
    'underscore':
      exports: '_'
    'jquery':
      exports: '$'
    'backbone':
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    'bootstrap-modal':
      deps: ['jquery']
      exports: '$'
    'bootstrap-transition':
      deps: ['jquery']
      exports: '$'
    'modernizr':
      exports: 'Modernizr'

  paths:
    'underscore': '../components/underscore/underscore'
    'backbone': '../components/backbone/backbone'
    'bootstrap-modal': '../components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/modal'
    'bootstrap-transition': '../components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/transition'
    'jquery': '../components/jquery/jquery'
    'text': '../components/requirejs-text/text'
    'domReady': '../components/requirejs-domready/domReady'
    'modernizr': '../components/modernizr/modernizr'
    'templates': '../templates'
    'config': 'app/config/config_base'

require ['app/vendors'], ->

  require ['app/app', 'jquery'], (App, $) ->
    App.initialize()

    if window.is_test
      mocha_div = $('<div />', { id: 'mocha', class: 'mocha' })
      $('body').prepend(mocha_div)

      $('head').append('<link rel="stylesheet" href="components/mocha/mocha.css">')
      $('head').append('<link rel="stylesheet" href="runner/test.css">')

      require [
        '../components/chai/chai'
        '../components/chai-backbone/chai-backbone'
        '../components/chai-jquery/chai-jquery'
        '../components/sinon-chai/lib/sinon-chai'
      ], (chai, chaiBackbone, chaiJQuery, sinonChai) ->

        unless window.PHANTOMJS
          mocha.setup
            ui: 'bdd'
            bail: false
            ignoreLeaks: true
            timeout: 5000

        expect = window.expect = chai.expect

        chai.should()
        chai.use chaiBackbone
        chai.use chaiJQuery
        chai.use sinonChai

        require [
          'spec/all_tests'
          '../runner/bridge'
        ], (runner) ->
          mocha.run()
