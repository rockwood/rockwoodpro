Rockcloud.MediaElementComponent = Ember.Component.extend
  classNames: ['player']

  playerOptions:
    pluginPath: '/assets/'

  didInsertElement: ->
    @createPlayer()

  createPlayer: ->
    @playerOptions.videoWidth = @$().width()
    @playerOptions.videoHeight = @$().width() * (9/16)
    @player = new MediaElementPlayer @$('video'), @playerOptions

  loadVideo: ( ->
    return unless @player? && @get('src')?
    @player.setSrc(@get('src'))
    @player.load()
    @player.play()
  ).observes('src')