Rockcloud.RecordingNewController = Ember.ObjectController.extend
  recordingPrice: (->
    switch @get('level')
      when 'Audio and Video'
        return 150
      when 'Audio Only'
        return 100
  ).property('level')

  liveStreamPrice: (->
    if @get('liveStream') then 50 else 0
  ).property('liveStream')

  discPrice: (->
    (@get('cds') + @get('dvds')) * 15
  ).property('cds', 'dvds')

  totalPrice: (->
    @get('discPrice') + @get('recordingPrice') + @get('liveStreamPrice')
  ).property('discPrice', 'recordingPrice', 'liveStreamPrice')
