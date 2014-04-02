Rockcloud.RecordingNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recording')

  deactivate: ->
    @get('currentModel').deleteRecord() if @get('currentModel.isNew')

  actions:
    save: (recording) ->
      recording.get('errors').clear()
      recording.save().then (=> @handleSuccess(recording)), ((e)=> @handleError(e))

  handleSuccess: (recording) ->
    @transitionTo "recordings.show", recording

  handleError: (error) ->
    if error.status?
      @controllerFor('recordingNew').set("hasError", true)
