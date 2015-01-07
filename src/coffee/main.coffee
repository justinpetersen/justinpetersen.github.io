require.config

  baseUrl: './js'

  paths:
    'backbone': '../components/backbone/backbone'
    'backbone-babysitter': '../components/backbone.babysitter/lib/backbone.babysitter'
    'bootstrap-modal': '../components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/modal'
    'bootstrap-transition': '../components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/transition'
    'config': 'app/config/config_base'
    'domReady': '../components/requirejs-domready/domReady'
    'jquery': '../components/jquery/jquery'
    'marionette': '../components/marionette/lib/backbone.marionette'
    'modernizr': '../components/modernizr/modernizr'
    'templates': '../templates'
    'text': '../components/requirejs-text/text'
    'underscore': '../components/underscore/underscore'

  shim:
    'backbone':
      deps: ['jquery', 'underscore']
      exports: 'Backbone'
    'bootstrap-modal':
      deps: ['jquery']
      exports: '$'
    'bootstrap-transition':
      deps: ['jquery']
      exports: '$'
    'marionette':
      deps: ['backbone']
      exports: 'Backbone.Marionette'
    'modernizr':
      exports: 'Modernizr'
    'underscore':
      exports: '_'

require [
  'app/VideoPlayer'
  # 'app/PortfolioApplication'
  'spec/SpecRunner'
], (VideoPlayer, SpecRunner) ->

  videoPlayer = new VideoPlayer()
  videoPlayer.initialize()

  # app = new PortfolioApplication()
  # app.initialize()

  specRunner = new SpecRunner()
  specRunner.run()