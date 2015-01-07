define [
  'jquery'
  'bootstrap-modal'
  'bootstrap-transition'
], ($) ->
  class VideoPlayer

    # PUBLIC STATIC PROPERTIES

    @DEFAULT_VIDEO_ID: '84931542'

    # PRIVATE PROPERTIES

    _videoSource: ''

    _autoplay: true

    _projectCollection: null

    _projectCollectionView: null

    # PUBLIC EVENT HANDLERS

    onResize: (e) ->
      @_centerVideoPlayer()

    onShowModal: (e) ->
      @_enableVideo($(e.relatedTarget).attr('video-id'))

    onHideModal: (e) ->
      @_disableVideo()

    onCloseVideo: (e) ->
      $('#videoModal').modal('hide')

    # PUBLIC METHODS

    initialize: () ->
      @_initVideoSource()

      $(window).on 'resize', (@e) =>
        @onResize()
      $('#videoModal').on 'show.bs.modal', (@e) =>
        @onShowModal(e)
      $('#videoModal').on 'hide.bs.modal', (@e) =>
        @onHideModal()
      $('.close-video-modal-button').on 'click', (@e) =>
        @onCloseVideo()

      @_centerVideoPlayer()

    # PRIVATE METHODS

    _initVideoSource: () ->
      @_videoSource = @_getVideoSource(VideoPlayer.DEFAULT_VIDEO_ID)
      $('.vimeo-player').attr 'src', ''

    _centerVideoPlayer: () ->
      top = ($(window).innerHeight() - $('.vimeo-player').height()) / 2
      $('.video-player-container').css 'margin-top', top + 'px'

    _enableVideo: (videoId) ->
      if videoId?
        @_videoSource = @_getVideoSource(videoId)
        console.log(@_videoSource)
      $('.vimeo-player').attr 'src', @_videoSource

    _getVideoSource: (videoId) ->
      videoSource = '//player.vimeo.com/video/' + videoId + '?title=0&byline=0&portrait=0&color=ef3f3d'
      if @_autoplay
        videoSource = videoSource + '&autoplay=1'
      videoSource

    _disableVideo: () ->
      $('.vimeo-player').attr 'src', ''