Rockcloud.RecordingsIndexRoute = Ember.Route.extend
  setupController: ->
    if @controllerFor('recordings').get('firstObject')?
      @replaceWith 'recordings.show', @controllerFor('recordings').get('firstObject')
