Rockcloud.RecordingNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recording')

  actions:
    save: (recording) ->
      recording.get('errors').clear()
      recording.save().then (=> @handleSuccess(recording)), (=> @handleError(recording))

  handleSuccess: (recording) ->
    @transitionTo "recordings.show", recording

  handleError: (recording) ->
    @controller.set("hasError", true)
