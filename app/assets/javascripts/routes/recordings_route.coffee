Rockcloud.RecordingsRoute = Ember.Route.extend
  model: ->
    @store.findAll('recording')

  afterModel: (recordings) ->
    if recordings.get('firstObject')?
      @replaceWith 'recordings.show', recordings.get('firstObject')
