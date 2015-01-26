Rockcloud.AuthenticatedRoute = Ember.Route.extend
  beforeModel: ->
    unless @get('currentUser')
      window.location = encodeURI("/?error=Please sign in")

