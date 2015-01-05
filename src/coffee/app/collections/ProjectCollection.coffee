define [
  'backbone'
  'app/models/ProjectModel'
], (Backbone, ProjectModel) ->
  class ProjectCollection extends Backbone.Collection
    model: ProjectModel