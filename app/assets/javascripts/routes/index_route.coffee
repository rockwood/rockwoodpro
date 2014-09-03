Rockcloud.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('recordings')