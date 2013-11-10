Rockcloud.RecordingsRoute = Ember.Route.extend
  model: ->
    @store.findAll('recording')

  afterModel: (recordings, transition) ->
    if recordings.get('firstObject')?
      this.replaceWith 'recording', recordings.get('firstObject')