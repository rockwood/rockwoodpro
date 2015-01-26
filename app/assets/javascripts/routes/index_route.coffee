Rockcloud.IndexRoute = Ember.Route.extend
  redirect: ->
    @replaceWith('recordings')
