Rockcloud.MediaElementComponent = Ember.Component.extend
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
    @player.setSrc(@get('src'))
    @player.load()
    @player.play()
  ).observes('src')