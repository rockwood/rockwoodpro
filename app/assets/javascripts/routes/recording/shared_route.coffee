Rockcloud.RecordingSharedRoute = Ember.Route.extend
  afterModel: (recording) ->
    @transitionTo('recordings.show', recording)
