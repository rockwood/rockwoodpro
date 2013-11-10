Rockcloud.RecordingRoute = Ember.Route.extend
  actions:
    play: (piece) ->
      @controllerFor('currentlyPlaying').set('model', piece)