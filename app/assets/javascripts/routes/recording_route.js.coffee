Rockcloud.RecordingRoute = Ember.Route.extend
  actions:
    play: (piece) ->
      return unless piece.get('isPlayable')
      @controllerFor('currentlyPlaying').set('model', piece)

    willTransition: ->
      @controllerFor('currentlyPlaying').set('model', null)