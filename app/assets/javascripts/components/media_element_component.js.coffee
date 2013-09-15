Rockcloud.MediaElementComponent = Ember.Component.extend
  classNames: ['player']

  defaultSrc: "http://cdn.rockwoodpro.com/RockwoodPro.m4v"

  playerOptions:
    pluginPath: '/assets/'
    enableAutosize: false

  didInsertElement: ->
    @createPlayer()

  createPlayer: ->
    @$('video').attr('src', @get('defaultSrc')) unless @get('src')?
    @player = new MediaElementPlayer @$('video'), @playerOptions

  loadVideo: ( ->
    @player.setSrc(@get('src'))
    @player.setPoster(@get('poster'))
    @player.load()
  ).observes('src')