Ember.Application.initializer
  name: "currentUser"

  initialize: (container, application) ->
    if Rockcloud.ENV.CURRENT_USER_ATTRIBUTES
      store = container.lookup('store:main')
      user = store.push(Rockcloud.User, Rockcloud.ENV.CURRENT_USER_ATTRIBUTES)
      container.optionsForType('user', { instantiate: false, singleton: true })
      container.register('user:current', user)
      container.injection('controller:application', 'currentUser', 'user:current')
      container.typeInjection('route', 'currentUser', 'user:current')
