define ['backbone'], (Backbone) ->
  class ProjectModel extends Backbone.Model
    defaults:
      name: ''
      image: ''