define [
  'marionette'
  'app/views/ProjectView'
], (Marionette, ProjectView) ->
  class ProjectCollectionView extends Marionette.CollectionView
    itemView: ProjectView