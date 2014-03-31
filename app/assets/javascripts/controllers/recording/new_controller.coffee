Rockcloud.RecordingNewController = Ember.ObjectController.extend
  recordingPrice: (->
    switch @get('level')
      when 'Audio and Video'
        return 150
      when 'Audio Only'
        return 100
  ).property('level')

  discPrice: (->
    (@get('cds') + @get('dvds')) * 15
  ).property('cds', 'dvds')

  totalPrice: (->
    @get('discPrice') + @get('recordingPrice')
  ).property('discPrice', 'recordingPrice')
