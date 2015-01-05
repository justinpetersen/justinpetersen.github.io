define [
  'marionette'
  'underscore'
  'text!templates/project.html'
], (Marionette, _, tpl) ->
  class ProjectView extends Marionette.ItemView
    template: _.template tpl