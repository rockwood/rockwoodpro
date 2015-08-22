Rockcloud.RecordingNewController = Ember.ObjectController.extend
  recordingPrice: (->
    switch @get('model.level')
      when 'Multi Camera Audio and Video'
        return 225 * @get('model.duration')
      when 'Audio and Video'
        return 150 * @get('model.duration')
      when 'Audio Only'
        return 100 * @get('model.duration')
  ).property('model.level', 'model.duration')

  liveStreamPrice: (->
    if @get('liveStream') then 50 else 0
  ).property('liveStream')

  discPrice: (->
    (@get('cds') + @get('dvds')) * 20
  ).property('cds', 'dvds')

  totalPrice: (->
    @get('discPrice') + @get('recordingPrice') + @get('liveStreamPrice')
  ).property('discPrice', 'recordingPrice', 'liveStreamPrice')
