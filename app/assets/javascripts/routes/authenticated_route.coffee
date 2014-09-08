Rockcloud.AuthenticatedRoute = Ember.Route.extend
  redirect: ->
    unless @get('currentUser')
      window.location = encodeURI("/?error=Please sign in")

