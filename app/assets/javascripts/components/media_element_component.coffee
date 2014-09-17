Rockcloud.MediaElementComponent = Ember.Component.extend
  classNames: ['media-element']

  defaultSrc: "http://cdn.rockwoodpro.com/RockwoodProductions-Intro.mp4"

  playerOptions:
    pluginPath: Rockcloud.ENV.PLUGIN_URL
    enableAutosize: false

  didInsertElement: ->
    @createPlayer()

  willDestroyElement: ->
    @player.remove()

  createPlayer: ->
    @$('video').attr('src', @get('defaultSrc')) unless @get('src')?
    @player = new MediaElementPlayer @$('video'), @playerOptions
    @$('video').on "ended", =>
      @sendAction("didEnd")

  loadVideo: ->
    return unless @player && @get('src')?
    @player.setSrc(@get('src'))
    @player.setPoster(@get('poster'))
    @player.load()
    @player.play()

  srcDidChange: (->
    Ember.run.scheduleOnce('afterRender', this, 'loadVideo');
  ).observes('src')
