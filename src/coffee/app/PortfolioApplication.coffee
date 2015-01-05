define [
  'marionette'
  'app/collections/ProjectCollection'
  'app/views/ProjectCollectionView'
], (Marionette, ProjectCollection, ProjectCollectionView) ->
  class PortfolioApplication extends Marionette.Application

    # PUBLIC CONSTANTS

    # PRIVATE PROPERTIES

    _projectCollection: null

    _projectCollectionView: null

    # PUBLIC METHODS

    initialize: () ->
      @addRegions projects: '#projects-container'
      @_initProjects()

    # PRIVATE METHODS

    _initProjects: () ->
      @_projectCollection = new ProjectCollection()
      @_projectCollection.fetch url: 'projects.json'

      @_projectCollectionView = new ProjectCollectionView collection: @_projectCollection
      @projects.show @_projectCollectionView