Rockcloud.RecordingNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recording')

  deactivate: ->
    @get('currentModel').deleteRecord() if @get('currentModel.isNew')

  actions:
    save: (recording) ->
      recording.get('errors').clear()
      recording.save().then (=> @handleSuccess(recording)), (=> @handleError(recording))

  handleSuccess: (recording) ->
    @transitionTo "recordings.show", recording

  handleError: (recording) ->
    @controller.set("hasError", true)
