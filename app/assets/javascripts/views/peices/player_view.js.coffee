Rockcloud.PlayerView = Ember.View.extend

  playerOptions:
    pluginPath: '/assets/'

  didInsertElement: ->
    @createPlayer()

  createPlayer: ->
    @playerOptions.videoWidth = @$('video').width()
    @playerOptions.videoHeight = @$('video').width() * (9/16)
    @player = new MediaElementPlayer @$('video'), @playerOptions

  loadVideo: ( ->
    return unless @player
    @player.setSrc(@get('controller.fileUrl'))
    @player.load()
    @player.play()
  ).observes('controller.content.fileUrl')