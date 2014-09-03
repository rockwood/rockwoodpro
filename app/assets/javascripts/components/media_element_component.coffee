Rockcloud.MediaElementComponent = Ember.Component.extend
  classNames: ['media-element']

  defaultSrc: "http://cdn.rockwoodpro.com/RockwoodPro.m4v"

  playerOptions:
    pluginPath: 'http://cdn.rockwoodpro.com/mediaelement-plugins/'
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
