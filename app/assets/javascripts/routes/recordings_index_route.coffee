Rockcloud.RecordingsIndexRoute = Ember.Route.extend
  setupController: ->
    if @controllerFor('recordings').get('firstObject')?
      @replaceWith 'recording', @controllerFor('recordings').get('firstObject')