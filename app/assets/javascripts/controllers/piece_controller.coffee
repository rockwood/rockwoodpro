Rockcloud.PieceController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']

  playing: (->
    @get('controllers.currentlyPlaying.model') is @get('model')
  ).property('controllers.currentlyPlaying.model')

  actions:
    savePiece: ->
      @get('model').save()
