Rockcloud.RecordingsController = Ember.ArrayController.extend
  queryParams: ['demo']
  demo: null
  sortProperties: ['datetime']
  sortAscending: false
  hasRecordings: Ember.computed.notEmpty('model')
