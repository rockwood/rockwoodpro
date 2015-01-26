Rockcloud.RecordingsController = Ember.ArrayController.extend
  sortProperties: ['datetime']
  sortAscending: false
  hasRecordings: Ember.computed.notEmpty('model')
