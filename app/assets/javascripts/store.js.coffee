Rockcloud.Store = DS.Store.extend
  adapter: DS.RESTAdapter.create
    namespace: 'api'