Rockcloud.RecordingsRoute = Ember.Route.extend
  queryParams: ['demo']

  model: (params) ->
    @store.findQuery('recording', params)

  redirect: (recordings, transition) ->
    if recordings.get('firstObject')?
      @replaceWith('recordings.show', recordings.get('firstObject.id'), queryParams: transition.queryParams)
