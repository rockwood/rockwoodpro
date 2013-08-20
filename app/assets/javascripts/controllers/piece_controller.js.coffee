Rockcloud.PieceController = Ember.ObjectController.extend
  needs: ['player']

  playing: (->
    @get('controllers.player.content') is @get('content')
  ).property('controllers.player.content')

  play: ->
    @set('controllers.player.content', @get('content'))