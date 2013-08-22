Rockcloud.RecordingRoute = Ember.Route.extend
  events:
    play: (piece) ->
      @controllerFor('currentlyPlaying').set('model', piece)