Rockcloud.RecordingRoute = Ember.Route.extend
  actions:
    play: (piece) ->
      return unless piece.get('isPlayable')
      @controllerFor('currentlyPlaying').set('model', piece)

    videoDidEnd: ->
      @controllerFor('currentlyPlaying').next()

  setupController: (controller, model) ->
    @controller.set('model', model)
    @controllerFor('currentlyPlaying').set('model', model.get('firstPiece'))