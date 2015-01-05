define [
  'jquery'
  'modernizr'
  'app/helpers/underscore_mixin'
  'app/helpers/modernizr_test'
], ($) ->
  class SpecRunner

    run: () ->
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